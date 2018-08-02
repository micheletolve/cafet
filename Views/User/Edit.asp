<!--#include file="../../utils/check.inc" -->

<!--#include file="../Shared/Header.asp" -->

<!--#include file="../Shared/Sub-Header.asp" -->

<div class="container">
    
    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Modifica profilo utente  <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <div class="alert alert-danger" role="alert">
		<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Attenzione! per modificare la password dell'utente &egrave; necessario farlo dal menu &quot;Cambia Password&quot;.
	</div>

    <form action="?controller=User&action=EditPost" method="POST" id="EditPost">
        <%=Html.Hidden("Id", ModelUser.Id) %>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="nome" class="col-form-label">Nome</label>
                <%=Html.TextBoxReq("Nome", ModelUser.Nome, "Nome")%>
            </div>
            <div class="form-group col-md-6">
                <label for="cognome" class="col-form-label">Cognome</label>
                <%=Html.TextBoxReq("Cognome", ModelUser.Cognome, "Cognome")%>
            </div>
        </div>

		<div class="form-row">
            <div class="form-group col-md-6">
                <label for="username" class="col-form-label">Username</label>
                <%=Html.TextBoxReader("Username", ModelUser.Username, "Username")%>
            </div>
            <div class="form-group col-md-6">
                <label for="email" class="col-form-label">Email</label>
                <%=Html.TextBoxReq("Email", ModelUser.Email, "Email")%>
            </div>
        </div>
		<div class="form-row">
            <div class="form-group col-md-12">
                <label for="Ruolo" class="col-form-label">Ruolo</label>
                <%=Html.DropDownList("ruolo_id", ModelUser.Ruolo_id, new RoleHelper.SelectAll().Items, "Id", "Descrizione")%>
            </div>
        </div>

        <div class="action-before">
            <button type="submit" class="btn btn-success"><i class="fa fa-floppy-o fa-lg" aria-hidden="true"></i>Conferna modifiche</button>
            <button type="button" class="btn btn-secondary btn-action">		
                <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
            </button>
        </div>
    </form>   
   
</div> <!-- /container -->

<!--#include file="../Shared/Footer.asp" -->