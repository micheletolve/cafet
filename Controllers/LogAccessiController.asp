<% 

class LogAccessiController
    Dim ModelLogAccessi
    Dim ViewData

    private sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
    end sub

    private sub Class_Terminate()
    end sub

    public Sub List()
        Dim logAccessiHelper
        set logAccessiHelper = new LogAccessiHelper
        set ModelLogAccessi = logAccessiHelper.SelectAll()
        %>   <!--#include file="../Views/Log/Accessi/List.asp" --> <%
    End Sub

    public Sub Reset()
        Dim logAccessiHelper
        set logAccessiHelper = new LogAccessiHelper
        logAccessiHelper.Delete()
        %>   <!--#include file="../Views/Log/Accessi/List.asp" --> <%
    end Sub
 
End Class
%>
