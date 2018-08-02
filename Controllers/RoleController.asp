<% 

class RoleController
    Dim ModelRole
    Dim ViewData

    private sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    end sub

    private sub Class_Terminate()
    end sub

    public Sub List()
        Dim roleHelper
        set roleHelper = new RoleHelper
        set ModelRole = roleHelper.SelectAll
        %>   <!--#include file="../Views/Role/List.asp" --> <%
    End Sub

    public Sub Edit(vars)
        Dim roleHelper
        set roleHelper = new RoleHelper
        set ModelRole = roleHelper.SelectById(vars("id")) 
        %>   <!--#include file="../Views/Role/Edit.asp" --> <%
    End Sub

    public Sub EditRolePost(arg)
        Dim role, roleHelper
        set roleHelper = new RoleHelper
        set role = new Role
        set role = roleHelper.SelectById(arg("id"))
            role.Codice = arg("codice")
            role.Ruolo = arg("ruolo")
            role.Descrizione = arg("descrizione")
            role.Updated_at = arg("updated_at")
        roleHelper.Update(role)
        ' LogSettings
            Dim log, logHelper
            set log = new LogSistema                       
                log.User_id = Session("user_id")
                log.Logging = Replace("<span class='badge badge-info'><i class='fas fa-pencil-alt' aria-hidden='true'></i> Modificato record in Ruoli: <strong>" & role.Ruolo & "</strong></span>", "'", "''")
                log.Created_at = Replace(Now, ".", ":")
            set logHelper = new LogSistemaHelper
                logHelper.Insert(log)
        ' \LogSettings
        Response.Redirect("?controller=Role&action=list")
    End Sub
 
 End Class
%>
