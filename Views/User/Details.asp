<!--#include file="../../utils/check.inc" -->

<!--#include file="../Shared/Header.asp" -->

<!--#include file="../Shared/Sub-Header.asp" -->

<div class="container">
    
    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Profilo Utente  <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

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
        <% if not IsNothing(ModelTeamInterno) then %>

            <br/>        
            <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Ruoli assegnati all'utente come membro del team interno  <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

            <table class="table table-sm table-hover display responsive nowrap">
                <thead>
                    <th class="detail-ti">Ruolo</th>
                    <th class="detail-ti">Descrizione</th>
                    <th class="detail-ti">Inserito il</th>
					<th class="detail-ti">Modificato il</th>                    
                </thead>
                <tbody>
                <% Dim obj, role
                For each obj in ModelTeamInterno.Items                    
                    set role = new RoleTeamInternoHelper.SelectById(obj.Ruoloti_id)
                    %>
                    <tr>					
                        <td><%=Html.Encode(role.Ruolo) %></td>
                        <td><%=Html.Encode(role.Descrizione) %></td>
                        <td><%=Html.Encode(role.Created_at) %></td>
                        <td><%=Html.Encode(role.Updated_at) %></td>
                    </tr>
                <% Next %>	
                </tbody>
            </table>
            <% end if %> 
        <div class="action-before">
            <button type="button" class="btn btn-secondary btn-action">		
                <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
            </button>
        </div>
    </div> 
   
</div> <!-- /container -->

<!--#include file="../Shared/Footer.asp" -->