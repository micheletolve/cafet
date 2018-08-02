<%

class MessaggiController
	Dim ModelMessaggi
    Dim ModelError
	Dim ViewData

	private sub Class_Initialize()
		Set ViewData = Server.CreateObject("Scripting.Dictionary")
	end sub

	private sub Class_Terminate()
	end sub

    Public Sub Inbox()
        if (Session("id_utente") <> "") Then
            Dim helper, countElementUnread, countElementTrash
            set helper = new MessaggiHelper
            countElementUnread = helper.SelectCountInboxUnread(Session("id_utente"))
            countElementTrash = helper.SelectCestinoCount(Session("id_utente"))
            set ModelMessaggi = helper.SelectReceived(Session("id_utente"))
            %>   <!--#include file="../Views/Messaggi/Inbox.asp" --> <%
        else
            %>   <!--#include file="../Views/Home/Index.asp" --> <%
        end if
    End Sub

    Public Sub Sent()
        if (Session("id_utente") <> "") Then
            Dim helper, countElementUnread, countElementTrash
            set helper = new MessaggiHelper
            countElementUnread = helper.SelectCountInboxUnread(Session("id_utente"))
            countElementTrash = helper.SelectCestinoCount(Session("id_utente"))
            set ModelMessaggi = helper.SelectSended(Session("id_utente"))
            %>   <!--#include file="../Views/Messaggi/Sent.asp" --> <%
        else
            %>   <!--#include file="../Views/Home/Index.asp" --> <%
        end if
    End Sub

    Public Sub Bucket()
        if (Session("id_utente") <> "") Then
            Dim helper, countElementUnread, countElementTrash
            set helper = new MessaggiHelper
            countElementUnread = helper.SelectCountInboxUnread(Session("id_utente"))
            countElementTrash = helper.SelectCestinoCount(Session("id_utente"))
            set ModelMessaggi = helper.SelectDeleted(Session("id_utente"))
            %>   <!--#include file="../Views/Messaggi/Bucket.asp" --> <%
        else
            %>   <!--#include file="../Views/Home/Index.asp" --> <%
        end if
    End Sub

    Public Sub Open(vars)
        Dim helper
        set helper = new MessaggiHelper
        set ModelMessaggi = helper.SelectById(vars("id"))
        if (ModelMessaggi.Letto = False) then
            ModelMessaggi.letto = True
            ModelMessaggi.Data_lettura = Replace(Now, ".", ":")
            helper.SignAsRead(ModelMessaggi)
        end if
        %>   <!--#include file="../Views/Messaggi/Message.asp" --> <%
    End Sub

public Sub Delete(vars)
    Dim obj, helper
    set helper = new MessaggiHelper
    Set obj = helper.SelectById(vars("id"))
        obj.Cancellato = True
    helper.LogicDelete(obj)
    Set mittente = new UserHelper.SelectById(obj.Mittente)
    Set destinatario = new UserHelper.SelectById(obj.Destinatario)
    ' LogSistema
        Dim log, logHelper
        set log = new LogSistema
            log.User_id = Session("user_id")
            log.Logging = Replace("<span class='badge badge-warning'><i class='fa fa-trash' aria-hidden='true'></i> E&grave; stato cestinato il messaggio "& obj.Oggetto &_
            " inviato da: <strong>" & mittente.NomeCompleto &_
            " a " & destinatario.NomeCompleto &_
            " il " & obj.Data_invio & "</strong></span>", "'", "''")
            log.Created_at = Replace(Now, ".", ":")
        set logHelper = new LogSistemaHelper
            logHelper.Insert(log)
    ' \LogSistema
    Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
End Sub

Public Sub UnDelete(vars)
    Dim obj, helper
    set helper = new MessaggiHelper
    Set obj = helper.SelectById(vars("id"))
        obj.Cancellato = False
    helper.LogicUnDelete(obj)
    Set mittente = new UserHelper.SelectById(obj.Mittente)
    Set destinatario = new UserHelper.SelectById(obj.Destinatario)
    ' LogSistema
        Dim log, logHelper
        set log = new LogSistema
            log.User_id = Session("user_id")
            log.Logging = Replace("<span class='badge badge-info'><i class='fa fa-recycle' aria-hidden='true'></i> E&grave; stato ripristinato dal cestino il messaggio "& obj.Oggetto &_
            " inviato da: <strong>" & mittente.NomeCompleto &_
            " a " & destinatario.NomeCompleto &_
            " il " & obj.Data_invio & "</strong></span>", "'", "''")
            log.Created_at = Replace(Now, ".", ":")
        set logHelper = new LogSistemaHelper
            logHelper.Insert(log)
    ' \LogSistema
    Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
End Sub

public Sub CreatePost(args)
  Dim obj, objh, FSO, myUpload, directory, mittente, destinatario, errore
  set obj = new Messaggi
  set objh = new MessaggiHelper
  Set FSO = CreateObject("Scripting.FileSystemObject")
  Set myUpload = Server.CreateObject("aspSmartUpload.SmartUpload")
      myUpload.AllowedFilesList = "doc,docx,pdf,txt,rtf,xls"
      myUpload.DeniedFilesList = "exe,bat,asp,com,zip,js,php,dll"
      myUpload.DenyPhysicalPath = True
      'limit the file size to 5 MB
      myUpload.MaxFileSize = 5000000
      myUpload.Upload
  For each file in myUpload.Files
    If Not file.IsMissing Then
        Anno = CStr(Year(Date))
        Mese = CStr(Month(Date)): If Len(Mese) < 2 Then Mese = "0" & Mese
        Giorno = CStr(Day(Date)): If Len(Giorno) < 2 Then Giorno = "0" & Giorno
        Ora = CStr(Hour(Time)): If Len(Ora) < 2 Then Ora = "0" & Ora
        Minuto = CStr(Minute(Time)): If Len(Minuto) < 2 Then Minuto = "0" & Minuto
        Secondo = CStr(Second(Time)): If Len(Secondo) < 2 Then Secondo = "0" & Secondo
        CurrDT = Anno & Mese & Giorno & Ora & Minuto & Secondo
        strFileSave = CurrDT & "_" & CStr(file.FileName)
        'Controllo se esiste la cartella relativa alla proposta (Prop_propostaID), se non esiste la creo
        directory = "Upload/Messaggi/M" & myUpload.Form("mittente").Values & "_D" & myUpload.Form("destinatario").Values & "/"
        If Not FSO.FolderExists(Server.Mappath(directory)) Then
            FSO.CreateFolder(Server.Mappath(directory))
            If err.Number <> 0 then
                errore = CStr("<p>Si &egrave; verificato un errore nel tentativo di creazione della cartella sul server: " & err.description &_
                    " </p><p>Verificare i permessi di scrittura sul server.</p>")
                SendError(errore)
                Response.End
            End If
        End If
        'Salvo il file nella directory con nome Prop_propostaID
        strPathSave = directory & strFileSave
        file.SaveAs(strPathSave)
    End If

	If Not IsNothing(myUpload.Form("mittente")) Then
        obj.Mittente = myUpload.Form("mittente").Values
    End If

	If  Not IsNull (myUpload.Form("destinatario-hidden")) Then
        obj.Destinatario = myUpload.Form("destinatario-hidden").Values
        If (obj.Destinatario = obj.Mittente) Then
        errore = CStr("Non è possibile inviare un messaggio a se stessi.")
        SendError(errore)
        Response.End
        End if
    End If

    If Not IsNull(myUpload.Form("oggetto")) Then
        obj.Oggetto = myUpload.Form("oggetto").Values
    End If

    If Not IsNull (myUpload.Form("corpo"))Then
        obj.Corpo = myUpload.Form("corpo").Values
        If (obj.Corpo = "") Then
            errore = CStr("Non è possibile inviare un messaggio senza testo")
            SendError(errore)
            Response.End
        End if
    End If

    If (myUpload.Form("link_file") <> "") Then
        obj.Link_file = CStr(strPathSave)
        obj.Nome_file = CStr(strFileSave)
    End If
    obj.Data_invio = Replace(Now, ".", ":")
    obj.Data_lettura = ""
	obj.Id = objh.Insert(obj)

	if (obj.Id) then
        Set mittente = new UserHelper.SelectById(obj.Mittente)
        set destinatario = new UserHelper.SelectById(obj.Destinatario)

      ' LogSistema
      Dim log, logHelper
      set log = new LogSistema
        log.user_id = Session("user_id")
        log.Logging = Replace("<span class='badge badge-success'><i class='fa fa-plus' aria-hidden='true'></i> Inviato messaggio privato da <strong>" & mittente.NomeCompleto & "</strong> a <strong>" & destinatario.NomeCompleto & "</strong></span>", "'", "''")
        log.Created_at = Replace(Now, ".", ":")
      set logHelper = new LogSistemaHelper
        logHelper.Insert(log)
      ' /LogSistema
      'Invio notifica
      Dim notifica, smtp, msg, nh
      Set nh = new NotificheHelper
      Set notifica = nh.SelectByNome(Request.QueryString("Controller")&Request.QueryString("Action"))
				if (obj.Nome_file <> "") Then
					notifica.Messaggio = notifica.Messaggio &_
						"<p>Mittente: " & mittente.NomeCompleto &_
						"<br/>Destinatario: " & destinatario.NomeCompleto &_
						"<br/>Oggetto: " & obj.Oggetto &_
						"<br/>Messaggio: " & Left(obj.Corpo, 50) & "...(accedi per leggere tutto)" &_
						"<br/>Nome file allegato: " & obj.Nome_file &_
						"<br/>Messaggio ricevuto il : " & obj.Data_invio & "</p>"
				else
					notifica.Messaggio = notifica.Messaggio &_
						"<p>Mittente: " & mittente.NomeCompleto &_
						"<br/>Destinatario: " & destinatario.NomeCompleto &_
						"<br/>Oggetto: " & obj.Oggetto &_
						"<br/>Messaggio: " & Left(obj.Corpo, 50) & "...(accedi per leggere tutto)" &_
						"<br/>Nome file allegato:  Non sono presenti allegati. " &_
						"<br/>Messaggio ricevuto il : " & obj.Data_invio & "</p>"
				end if
        notifica.Destinatari = notifica.Destinatari &"; "& destinatario.Email
      Set smtp = new smtpHelper.SelectByPredefinito()
      	nh.Invia smtp, notifica.oggetto, notifica.destinatari, notifica.messaggio
      ' /Invio notifica di inserimento
      ' LogNotifica
        Dim logn, lognHelper
        set logn = new LogNotifiche
          logn.NomeUtente = new UserHelper.SelectById(Session("user_id")).NomeCompleto
          logn.Oggetto = notifica.Oggetto
          logn.Messaggio = Replace(notifica.Messaggio, "'", "''" )
          logn.Destinatari = notifica.Destinatari
          logn.Created_at = Replace(Now, ".", ":")
        set lognHelper = new LogNotificheHelper
          lognHelper.Insert(logn)
      ' /LogNotifica
		end if
	Next
  Set FSO = Nothing
  Set myUpload = Nothing
  Set mittente = Nothing
  set destinatario = Nothing
  Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
 End Sub

 Public Sub SendError(errore)
    Set ModelError = new Error
    ModelError.Messaggio = errore
    %>   <!--#include file="../Views/Messaggi/Inbox.asp" --> <%
 End Sub

End Class

%>
