<%
class HomeController
	Dim ModelUser
	Dim ModelRole
  Dim ModelProposteTeam
  Dim ModelProposte
  Dim ModelProposteFirmate
  Dim ModelScadenzeBudget
  Dim ModelError
	Dim ViewData

	private sub Class_Initialize()
		Set ViewData = Server.CreateObject("Scripting.Dictionary")
	end sub

	private sub Class_Terminate()
	end sub

	public Sub Index()
		Set ModelUser = new User
		%>   <!--#include file="../views/Home/Index.asp" --> <%
	End Sub

	public Sub Login()
        if Session("Authenticated") = 1 then
            %>   <!--#include file="../Views/Home/Dashboard.asp" --> <%
        else
            Dim user, userHelper, roleHelper, log, logHelper, userIpAddress
            Set user = new User
            Set userHelper = new UserHelper
            Set log = new LogAccessi
            Set logHelper = new LogAccessiHelper

            userIpAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
            If (userIpAddress = "") Then
                userIpAddress = Request.ServerVariables("REMOTE_ADDR")
            End If

            user.Username = Request.Form("username")
            user.Password = MD5(salt+Request.Form("password"))

            Set ModelUser = userHelper.SelectLogin(user)

            'Se NON esiste nessun utente con le credenziali fornite
            If IsNothing(ModelUser) Then
                Session("Authenticated") = -1026548
                Set ModelUser = Nothing
                Set ModelRole = Nothing
                ' Popolo la tabella per tracciare l'accesso
                log.NomeUtente = Request.Form("username")
                log.Data  = Now()
                log.Stato = "Autenticazione fallita!"
                log.Ip = userIpAddress
                logHelper.Insert(log)
                Set log = nothing
                Response.Redirect("?Controller=Home&Action=IndexError")
            Else
                ' Se esiste l'utente con le credenziali fornite recupero il ruolo associato
                Set roleHelper = new RoleHelper
                Set Modelrole = roleHelper.SelectById(ModelUser.Ruolo_id)

                ' Recupero le date di scadenze e le metto nessa Session successivamente per averle a disposizione durante il ciclo di vita dell'applicazione
                Set ModelScadenzeBudget = new ScadenzeBudgetHelper.SelectByCurrentYear()

                ' Popolo la tabella per tracciare l'accesso
                log.NomeUtente = user.Username
                log.Data = Replace(Now(), ".", ":")
                log.Stato = "Login Riuscito!"
                log.Ip = userIpAddress
                    logHelper.Insert(log)

                ' Setto le variabili in sessione
                Session("Authenticated") = 1
                Session("session.id") = Session.SessionID
                Session("username") = ModelUser.Username
                Session("utente") = ModelUser.Nome & " " & ModelUser.Cognome
                Session("user_id") = ModelUser.Id
                Session("userMail") = ModelUser.Email
                Session("ruolo") = ModelRole.Ruolo
                Session("ruolo.ID") = ModelRole.Id
                Session("ruolo.Codice") = Cstr(ModelRole.Codice)
                Session("ruolo.Descrizione") = ModelRole.Descrizione
                Session("id_utente") = ModelUser.Id
								if Not IsNothing(ModelScadenzeBudget) then
	                Session("lpp") = ModelScadenzeBudget.Limite_presentazione_proposte
	                Session("gb") = ModelScadenzeBudget.Generazione_budget
	                Session("gf") = ModelScadenzeBudget.Generazione_forecast
								end if
                ' nav
                Session("nav") =  "Views/Shared/Nav/"&Cstr(ModelRole.Codice)&".asp"
                '\nav
                Session("countInboxElementUnread") = new MessaggiHelper.SelectCountInboxUnread(Session("id_utente"))
                Response.Redirect("?Controller=Home&Action=Dashboard")
            End If
        End if
    End Sub

	public Sub IndexError()
		Set ModelUser = new User
		%>   <!--#include file="../views/Home/IndexError.asp" --> <%
	End Sub

    public Sub Dashboard()
        Dim count, countFirmate, countFirmateValutate, countFirmateValutateCommessa, checkScadenze
        count = new SapiHelper.SelectAllCount()
        countFirmate = new SapiHelper.SelectFirmateCount()
        countFirmateValutate = new SapiHelper.SelectFirmateValutateCount()
        countFirmateValutateCommessa = new SapiHelper.SelectFirmateValutateCommessaCount()
        checkScadenze = new ScadenzeBudgetHelper.CheckScadenze()
        If (checkScadenze = false) Then
            Set ModelError = new Error
            ModelError.Messaggio = "Attenzione, impostare le scadenze per la definizione del budget. Si consiglia di farlo quanto prima dal menu Settings. Questo messaggio verrà visualizzato finché non saranno inserire le scadenze per l'anno in corso e per quello sucessivo."
						ModelError.Tipologia = "alert-warning"
        End If
		%>   <!--#include file="../views/Home/Dashboard.asp" --> <%
	End Sub

	public Sub About()
		if Session("sessionCounter")="" then
			Session("sessionCounter") = 1
		Else
			Session("sessionCounter") = Session("sessionCounter") + 1
		End If
		Model = Session("sessionCounter")
		%>   <!--#include file="../views/Home/About.asp" --> <%
	End Sub

    Public Sub Logout()
      Session.Contents.RemoveAll()
      Session("Authenticated") = -1026548
      Session.Abandon()
      Response.Redirect("?controller=Home&action=Index")
    End Sub


End Class
%>
