<% 

class SmtpController
	Dim ModelSmtp
	Dim ViewData
   
	private sub Class_Initialize()
		Set ViewData = Server.CreateObject("Scripting.Dictionary")
	end sub

	private sub Class_Terminate()
	end sub
 
    public Sub List()
        Dim ssHelper
        set ssHelper = new SmtpHelper
        set ModelSmtp = ssHelper.SelectAll()
        %>   <!--#include file="../Views/Settings/Smtp/List.asp" --> <%
    End Sub

    public Sub Create()
        set ModelSmtp = new Smtp
        %>   <!--#include file="../Views/Settings/Smtp/Create.asp" --> <%
    End Sub

    public Sub CreatePost(argouments)
        Dim obj, objh
        set objh = new SmtpHelper
        set obj = new Smtp
            obj.Id = argouments("id")
            obj.Nome = Sanitize(argouments("nome"))
            obj.Smtpauthenticate = Sanitize(argouments("smtpauthenticate"))
            obj.Sendusing = Sanitize(argouments("sendusing"))
            obj.Smtpusessl = argouments("smtpusessl") = "on"
            obj.Smtpserver = Sanitize(argouments("Smtpserver"))
            obj.Smtpserverport = Sanitize(argouments("Smtpserverport"))
            obj.Sendemailaddress = Sanitize(argouments("sendemailaddress"))
            obj.Sendusername = Sanitize(argouments("sendusername"))
            obj.Sendpassword = Sanitize(argouments("sendpassword"))
            obj.Predefinito = argouments("predefinito")= "on"
            obj.Created_at = Replace(Now, ".", ":")
            obj.Updated_at = Replace(Now, ".", ":")
        obj.Id = objh.Insert(obj)
        ' LogSettings
            Dim log, logHelper
            set log = new LogSettings                        
                log.User_id = Session("user_id")
                log.Logging = Replace("<span class='badge badge-success'><i class='fa fa-plus' aria-hidden='true'></i> Inserito record in SMTP Server: <strong>" & obj.Nome & "</strong></span>", "'", "''")
                log.Created_at = Replace(Now, ".", ":")
            set logHelper = new LogSettingsHelper
                logHelper.Insert(log)
        ' \LogSettings
        Response.Redirect("?controller=Smtp&action=list")
    End Sub

    public Sub Edit(vars)
        Dim cee
        set cee = new SmtpHelper
        set ModelSmtp = cee.SelectById(vars("id"))    
        %>   <!--#include file="../Views/Settings/Smtp/Edit.asp" --> <%
    End Sub

    public Sub EditPost(argouments)
        Dim obj, objh
        set objh = new SmtpHelper
        set obj = new Smtp
        set obj = objh.SelectById(argouments("id"))
            obj.Id = argouments("id")
            obj.Nome = Sanitize(argouments("nome"))
            obj.Smtpauthenticate = Sanitize(argouments("smtpauthenticate"))
            obj.Sendusing = Sanitize(argouments("sendusing"))
            obj.Smtpusessl = argouments("smtpusessl") = "on"
            obj.Smtpserver = Sanitize(argouments("Smtpserver"))
            obj.Smtpserverport = Sanitize(argouments("Smtpserverport"))
            obj.Sendemailaddress = Sanitize(argouments("sendemailaddress"))
            obj.Sendusername = Sanitize(argouments("sendusername"))
            obj.Sendpassword = Sanitize(argouments("sendpassword"))
            obj.Predefinito = argouments("predefinito")= "on"
            obj.Updated_at = Replace(Now, ".", ":")
        objh.Update(obj)
        ' LogSettings
            Dim log, logHelper
            set log = new LogSettings                        
                log.User_id = Session("user_id")
                log.Logging = Replace("<span class='badge badge-info'><i class='fas fa-pencil-alt' aria-hidden='true'></i> Modificato record in SMTP Server: <strong>" & obj.Nome & "</strong></span>", "'", "''")
                log.Created_at = Replace(Now, ".", ":")
            set logHelper = new LogSettingsHelper
                logHelper.Insert(log)
        ' \LogSettings
        Response.Redirect("?controller=Smtp&action=list")
    End Sub

    public Sub Details(vars)
        Dim smtpHelper
        set smtpHelper = new SmtpHelper
        set ModelSmtp = smtpHelper.SelectById(vars("id"))
    %>   <!--#include file="../views/Settings/Smtp/Details.asp" --> <%
    End Sub
 
    public Sub Delete(vars)
        Dim smtpHelper
        set smtpHelper = new SmtpHelper
        set ModelSmtp = smtpHelper.SelectById(vars("id"))
    %>   <!--#include file="../views/Settings/Smtp/Delete.asp" --> <%
    End Sub

    public Sub DeletePost(args)
        Dim res, smtpHelper
        set smtpHelper = new SmtpHelper
        set ModelSmtp = smtpHelper.SelectById(vars("id"))
        smtpHelper.Delete(args("id"))
        ' LogSettings
            Dim log, logHelper
            set log = new LogSettings                        
                log.User_id = Session("user_id")
                log.Logging = Replace("<span class='badge badge-danger'><i class='fa fa-ban' aria-hidden='true'></i> Eliminato record in SMTP Server: <strong>" & ModelSmtp.Nome & "</strong></span>", "'", "''")
                log.Created_at = Replace(Now, ".", ":")
            set logHelper = new LogSettingsHelper
                logHelper.Insert(log)
        ' \LogSettings
        Response.Redirect("?controller=Smtp&action=list")

    End Sub



End Class
%>
