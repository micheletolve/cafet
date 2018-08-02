<% 

class NotificheController
 Dim ModelNotifiche
 Dim ViewData
   
 private sub Class_Initialize()
    Set ViewData = Server.CreateObject("Scripting.Dictionary")
 end sub

 private sub Class_Terminate()
 end sub
 
    public Sub List()
        Dim ce
        set ce = new NotificheHelper
        set ModelNotifiche = ce.SelectAll()
        %>   <!--#include file="../Views/Settings/Notifiche/List.asp" --> <%
    End Sub

    public Sub Edit(vars)
        Dim cee
        set cee = new NotificheHelper
        set ModelNotifiche = cee.SelectById(vars("id"))    
        %>   <!--#include file="../Views/Settings/Notifiche/Edit.asp" --> <%
    End Sub

    public Sub EditPost(argouments)
        Dim obj, objh
        set objh = new NotificheHelper
        set obj = new Notifiche
        set obj = objh.SelectById(argouments("id"))
            obj.Oggetto = Sanitize(argouments("oggetto"))
            obj.Messaggio = argouments("messaggio")
            obj.Destinatari = Sanitize(argouments("destinatari"))
            obj.Abilitato = (argouments("abilitato") = "on")
            obj.Updated_at = Replace(Now, ".", ":")               
        objh.Update(obj)
        ' LogSettings
            Dim log, logHelper
            set log = new LogSettings                        
                log.User_id = Session("user_id")
                log.Logging = Replace("<span class='badge badge-info'><i class='fas fa-pencil-alt' aria-hidden='true'></i> Modificato record in Notifiche: <strong>" & obj.Nome & "</strong></span>", "'", "''")
                log.Created_at = Replace(Now, ".", ":")
            set logHelper = new LogSettingsHelper
                logHelper.Insert(log)
        ' \LogSettings
        Response.Redirect("?controller=Notifiche&action=list")
    End Sub

End Class
%>
