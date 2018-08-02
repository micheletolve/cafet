<%

class RbacController
    Dim ModelRole
    Dim ModelMenu
    Dim ModelMenuChild
    Dim ModelMenuPermission
    Dim ViewData

    private sub Class_Initialize()
      Set ViewData = Server.CreateObject("Scripting.Dictionary")
    end sub

    private sub Class_Terminate()
    end sub

    public Sub Permitted(vars)
      Set ModelMenu = new menuHelper.SelectById(vars("id"))
      if isNothing(ModelMenu) then
        Set ModelMenu = new menuChildHelper.SelectById(vars("id"))
      end if
      set ModelMenuPermission = new MenuPermissionHelper.SelectByField("menu_id", vars("id"))
      %>   <!--#include file="../Views/Settings/Rbac/ListPermitted.asp" --> <%
    End Sub

    public Sub Create(vars)
      Set ModelRole = new roleHelper.SelectAllExceptPermitted(vars("id"))
      Set ModelMenu = new menuHelper.SelectById(vars("id"))
      if isNothing(ModelMenu) then
        Set ModelMenu = new menuChildHelper.SelectById(vars("id"))
      end if
      %>   <!--#include file="../Views/Settings/Rbac/Create.asp" --> <%
    End Sub

    public Sub CreatePost(args)
      Dim obj, objh
      Set objh = new MenuPermissionHelper
      For each item in args("role_id")
        Set obj = new MenuPermission
          obj.Menu_id = args("menu_id")
          obj.Ruolo_id = item
          obj.Role_code = new roleHelper.SelectById(item).Codice
          obj.Created_at = Replace(Now, ".", ":")
          obj.Updated_at = Replace(Now, ".", ":")
        objh.Insert(obj)
        ' LogSistema
            Dim log, logHelper
            set log = new LogSistema
                log.User_id = Session("user_id")
                log.Logging = Replace("<span class='badge badge-info'><i class='fa fa-success' aria-hidden='true'></i> Settati permessi menu per il ruolo "+ obj.Role_code + " </span>", "'", "''")
                log.Created_at = Replace(Now, ".", ":")
            set logHelper = new LogSistemaHelper
                logHelper.Insert(log)
        ' \LogSistema
        Next
        Response.Redirect("?controller=Rbac&action=Permitted&id=" + obj.Menu_id)
     End Sub

     public Sub Delete(vars)
       Dim menuPermissionHelper
       Set menuPermissionHelper = new MenuPermissionHelper
       menuPermissionHelper.Delete(vars("id"))
       Response.Redirect("?controller=Rbac&action=Permitted&id=" + vars("mn"))
     End Sub

     public Sub Reset(vars)
       Dim menuPermissionHelper
       Set menuPermissionHelper = new MenuPermissionHelper
       menuPermissionHelper.Reset(vars("id"))
       Response.Redirect("?controller=Menu&action=List")
     End Sub

 End Class
%>
