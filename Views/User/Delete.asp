<!--#include file="../../utils/check.inc" -->

<!--#include file="../Shared/Header.asp" -->

<!--#include file="../Shared/Sub-Header.asp" -->

<div class="container">
    
    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Eliminazione utente <%=Html.Encode(ModelUser.Nome) %> <%=Html.Encode(ModelUser.Cognome) %>  <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <div class="alert alert-danger" role="alert">
		<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Attenzione! L'eliminazione di un record &egrave; un operazione irreveribile. Se non si &egrave; sicuri non proseguire oltre.
	</div>
    <div class="row">
        <table class="table table-hover">
            <tr>
                <th class="detail"><label for="nome" class="col-form-label">Nome</label></th>
                <td class="detail"><%=Html.Encode(ModelUser.Nome) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="cognome" class="col-form-label">Cognome</label></th>
                <td class="detail"><%=Html.Encode(ModelUser.Cognome) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="username" class="col-form-label">Username</label></th>
                <td class="detail"><strong><%=Html.Encode(ModelUser.Username) %></strong></td>
            </tr>
            <tr>
                <th class="detail"><label for="email" class="col-form-label">Indirizzo email</label></th>
                <td class="detail"><%=Html.Encode(ModelUser.Email) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="password" class="col-form-label">Password</label></th>
                <td class="detail"><%=Html.ActionLink("[Cambia Password]", "User", "EditPassword" , "id=" + CStr(Session("user_id"))) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="ruolo_id" class="col-form-label">Ruolo utente</label></th>
                <td class="detail"><%=Html.Encode(ModelRole.Descrizione) %></td>
            </tr>
        </table>       
    </div> 
    <form action="?controller=User&action=DeletePost" method="POST" id="DeletePost">
        <%=Html.Hidden("Id", ModelUser.Id) %>

        <button type="submit" class="btn btn-warning"><i class="fas fa-trash fa-lg" aria-hidden="true"></i>Conferna eliminazione</button>
        <button type="button" class="btn btn-secondary btn-action">		
            <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
        </button>
    </form>
   
</div> <!-- /container -->

<!--#include file="../Shared/Footer.asp" -->