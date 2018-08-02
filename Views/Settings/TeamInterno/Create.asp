<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

	

<!--#include file="../../Shared/Sub-Header.asp" -->

<div class="container">
    
    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Inserimento membro nel team interno <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <form action="?controller=TeamInterno&action=CreatePost" method="POST" id="CreatePost">
        
        <%=Html.Hidden("Id", ModelTeamInterno.Id) %>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="utente_id" class="col-form-label">Utente</label>
                <%=Html.DropDownList("utente_id", ModelUser.Id, new UserHelper.SelectAll().Items, "Id", "NomeCompleto")%>
            </div>

            <div class="form-group col-md-6">
                <label for="ruoloti_id" class="col-form-label">Ruolo team interno</label>
                <%=Html.DropDownList("ruoloti_id", ModelRoleTeamInterno.Id, new RoleTeamInternoHelper.SelectAll().Items, "Id", "Descrizione")%>
            </div>
        </div>      

        <div class="action-before">
            <button type="submit" class="btn btn-success"><i class="fa fa-floppy-o fa-lg" aria-hidden="true"></i>Conferna inserimento</button>
            <button type="button" class="btn btn-secondary btn-action">		
                <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
            </button>
        </div>
    </form>   
   
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->
