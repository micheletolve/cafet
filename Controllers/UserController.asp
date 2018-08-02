<%

class UserController
 Dim ModelUser
 Dim ModelRole
 Dim ModelTeamInterno
 Dim ModelError
 Dim ViewData

 private sub Class_Initialize()
  Set ViewData = Server.CreateObject("Scripting.Dictionary")
 end sub

 private sub Class_Terminate()
 end sub

 public Sub List()
    Dim userHelper
    set userHelper = new UserHelper
    set ModelUser = userHelper.SelectAll
    %>   <!--#include file="../views/User/List.asp" --> <%
 End Sub

public Sub Create()
    set ModelUser = new User
    set ModelRole = new Role
    %>   <!--#include file="../views/User/Create.asp" --> <%
End Sub

public Sub CreateErr(vars)
    set ModelUser = new User
    set ModelRole = new Role
    %>   <!--#include file="../views/User/Create.asp" --> <%
End Sub

public Sub CreatePost(args)
    Dim user, userHelper, validation
    set userHelper = new UserHelper
    set user = new User
        user.Nome = Sanitize(args("nome"))
        user.Cognome = Sanitize(args("cognome"))
        user.NomeCompleto = user.Nome & " " &user.Cognome
        user.Username = Sanitize(args("username"))
        user.Email = Sanitize(args("email"))
        user.Password = Sanitize(MD5(salt+args("password")))
        user.Ruolo_id = Sanitize(args("ruolo_id"))
        user.Created_at = Replace(Now, ".", ":")
        user.Updated_at = Replace(Now, ".", ":")
    validation = userHelper.Validate(user)
    If(validation = "") Then
        user.Id = userHelper.Insert(user)
        ' LogSistema
            Dim log, logHelper
            set log = new LogSistema
                log.User_id = Session("user_id")
                log.Logging = Replace("<span class='badge badge-success'><i class='fa fa-plus' aria-hidden='true'></i> Inserito record in Utenti: <strong>" & user.Username & "</strong></span>", "'", "''")
                log.Created_at = Replace(Now, ".", ":")
            set logHelper = new LogSistemaHelper
                logHelper.Insert(log)
        ' \LogSistema
        Response.Redirect("?controller=User&action=list")
    ElseIf (validation = "usn") Then
      Set ModelUser = user
      set ModelRole = new Role
      Set ModelError = new Error
        ModelError.Messaggio = "Whoops! Username già in uso, sceglierne uno diverso."
        %>   <!--#include file="../views/User/Create.asp" --> <%
    ElseIf (validation = "eml") Then
      Set ModelUser = user
      set ModelRole = new Role
      Set ModelError = new Error
      ModelError.Messaggio = "Whoops! Email già in uso, sceglierne una diversa."
      %>   <!--#include file="../views/User/Create.asp" --> <%
    End If
 End Sub

 public Sub Edit(vars)
    Dim userHelper
    set userHelper = new UserHelper
    set ModelRole = new Role
    set ModelUser = userHelper.SelectById(vars("id"))
    %>   <!--#include file="../views/User/Edit.asp" --> <%
 End Sub

 public Sub EditPost(args)
    Dim user, userHelper
    set userHelper = new UserHelper
    set user = userHelper.SelectById(args("id"))
        user.Nome = Sanitize(args("nome"))
        user.Cognome = Sanitize(args("cognome"))
        user.NomeCompleto = user.Nome & " " &user.Cognome
        user.Email = Sanitize(args("email"))
        user.Ruolo_id = args("ruolo_id")
        user.Updated_at = Replace(Now, ".", ":")
        userHelper.Update(user)
        ' LogSistema
            Dim log, logHelper
            set log = new LogSistema
                log.User_id = Session("user_id")
                log.Logging = Replace("<span class='badge badge-info'><i class='fas fa-pencil-alt' aria-hidden='true'></i> Modificato record in Utenti: <strong>" & user.Username & "</strong></span>", "'", "''")
                log.Created_at = Replace(Now, ".", ":")
            set logHelper = new LogSistemaHelper
                logHelper.Insert(log)
        ' \LogSistema
     Response.Redirect("?controller=User&action=list")
 End Sub

 Public Sub EditPassword(vars)
    Dim userHelper
    Set userHelper = new UserHelper
    Set ModelUser = userHelper.SelectById(vars("id"))
    %>   <!--#include file="../views/User/EditPassword.asp" --> <%
 End Sub

 public sub EditPasswordPost(args)
    Dim user, userHelper
    Set userHelper = new UserHelper
    Set user = userHelper.SelectById(args("id"))
        If (user.password = Sanitize(MD5(salt+args("oldPassword"))) ) then
            user.password = Sanitize(MD5(salt+args("password")))
            user.Updated_at = Replace(Now, ".", ":")
            userHelper.UpdatePassword(user)
            ' LogSistema
            Dim log, logHelper
            set log = new LogSistema
                log.User_id = Session("user_id")
                log.Logging = Replace("<span class='badge badge-info'><i class='fas fa-pencil-alt' aria-hidden='true'></i> Modificata password per l'utente: <strong>" & user.Username & "</strong></span>", "'", "''")
                log.Created_at = Replace(Now, ".", ":")
            set logHelper = new LogSistemaHelper
                logHelper.Insert(log)
        ' \LogSistema
            Response.Redirect("?controller=User&action=list")
        Else
            Response.Redirect("?controller=User&action=EditPassword&id="&user.id&"&err=edp78")
        End If
 end Sub


 public Sub Delete(vars)
    Dim userHelper, roleHelper
    set userHelper = new UserHelper
    set roleHelper = new RoleHelper
    set ModelUser = userHelper.SelectById(vars("id"))
    Set ModelRole = roleHelper.SelectById(ModelUser.Ruolo_id)
   %>   <!--#include file="../views/User/Delete.asp" --> <%
 End Sub


  public Sub DeletePost(args)
    Dim res, userHelper
    set userHelper = new UserHelper
    set ModelUser = userHelper.SelectById(args("id"))
    userHelper.Delete(args("id"))
    ' LogSettings
            Dim log, logHelper
            set log = new LogSettings
                log.User_id = Session("user_id")
                log.Logging = Replace("<span class='badge badge-danger'><i class='fa fa-ban' aria-hidden='true'></i> Eliminato record in Utenti: <strong>" & ModelUser.Username & "</strong></span>", "'", "''")
                log.Created_at = Replace(Now, ".", ":")
            set logHelper = new LogSettingsHelper
                logHelper.Insert(log)
        ' \LogSettings
 End Sub


 public Sub Details(vars)
    Dim userHelper, roleHelper
    set userHelper = new UserHelper
    set roleHelper = new RoleHelper
    set ModelUser = userHelper.SelectById(vars("id"))
    Set ModelRole = roleHelper.SelectById(ModelUser.Ruolo_id)
    Set ModelTeamInterno = new TeamInternoHelper.SelectByUser(Session("user_id"))
   %>   <!--#include file="../views/User/Details.asp" --> <%
 End Sub

 End Class
%>
