<!-- Controllo se l'utente è autenticato e visualizzo la barra dei menu-->
<%	If Session("Authenticated") = 1 or Session.SessionID <> "" then
		%> <!--#include file="../Shared/Navbar.asp" --> <%
end if %>

<% Session("countInboxElementUnread") = new MessaggiHelper.SelectCountInboxUnread(Session("id_utente")) %>
<div class="row">
    <!-- /.col-sm-1 -->
    <div class="col-sm-1">
        <div class="list-group">

        </div>
    </div>
    <div class="col-sm-4">
        <ul class="list-group">
            <a class="list-group" href="?controller=Home&Action=Dashboard">
                <img src="./Resource/image/logo-it.png" alt="Biomasse Italia" title="Biomasse Italia">
            </a>
        </ul>
    </div>
    <!-- /.col-sm-4 -->
    <div class="col-sm-3">
        <div class="list-group">

        </div>
    </div>
    <!-- /.col-sm-4 -->
    <div class="col-sm-4">
        <div class="list-group">
            <a href="?controller=User&action=Details&id=<%Response.Write(Session("user_id"))%>" class="list-group">
                <p class="list-group-item-heading">Benvenuto <strong><%Response.Write(Session("utente"))%></strong> - <strong><%=WeekDayName(weekday(date()),true)%> - <%Response.Write(Date())%></strong></p>
                <p class="list-group-item-text-user r-25">Username: <strong><%Response.Write(Session("username"))%></strong></p>
								<% if (environment = "development") then %>
									<p class="list-group-item-text-user r-25">RoleCode: <strong><%Response.Write(CStr(Session("ruolo.Codice")))%></strong></p>
								<% end if %>
                <p class="list-group-item-text-user r-25">Ruolo: <strong><%Response.Write(Session("ruolo"))%></strong> - <strong><%Response.Write(Session("ruolo.descrizione"))%></strong></p>
                <p class="list-group-item-text-user r-25">E-Mail: <strong><%Response.Write(Session("userMail"))%></strong></p>
                <p class="list-group-item-text-user-link r-25">[Gestisci Profilo Utente]</p>
            </a>
        </div>
    </div>
    <!-- /.col-sm-4 -->
</div>
<hr class="style3">
