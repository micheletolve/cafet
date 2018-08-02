<!--#include file="../../utils/check.inc" -->

<!--#include file="../Shared/Header.asp" -->	

<!--#include file="../Shared/Sub-Header.asp" -->

<div class="container">
    
    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Modifica descrizione ruolo  <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <form action="?controller=Role&action=EditRolePost" method="POST" id="EditRolePost">
        <%=Html.Hidden("Id", ModelRole.Id) %>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="codice" class="col-form-label">Codice</label>
                <b><%=Html.Encode(ModelRole.Codice) %></b>
            </div>
            <div class="form-group col-md-6">
                <label for="ruolo" class="col-form-label">Ruolo</label>
                <b><%=Html.Encode(ModelRole.Ruolo) %></b>
            </div>
        </div>

        <div class="form-group">
            <label for="Descrizione" class="col-form-label">Descrizione Ruolo:</label>
            <%=Html.TextBoxReq("Descrizione", ModelRole.Descrizione, "Descrizione Ruolo")%>
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