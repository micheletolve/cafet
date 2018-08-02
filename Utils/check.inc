<%
	If Session("Authenticated") <> 1 or Session.SessionID = "" Then
		Response.Redirect("Default.asp")
		Response.End
	End If
%>
