<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

<!--#include file="../../Shared/Sub-Header.asp" -->

<div class="container">

    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Definizione permessi per il menu <i class="<%=Html.Encode(ModelMenu.Fa_icon)%>"></i> <%=Html.Encode(ModelMenu.Label)%> <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <% if isNothing (ModelRole) then %>
      <div class="alert alert-warning" role="alert">
        <i class="fa fa-exclamation-circle fa-3x pull-left"></i>Whoops! tutti i ruoli sono già stati autorizzati a visualizzare questo menu.</p>
      </div>
    <% else %>

    <form action="?controller=Rbac&action=CreatePost" method="POST" id="CreatePost">

        <%=Html.Hidden("menu_id", ModelMenu.Id) %>

        <% Dim obj
            For each obj in ModelRole.Items
            %>

            <%=Html.Hidden("role_code", obj.Codice) %>

            <div class="form-row">
              <div class="form-group col-md-1"> </div>
                <div class="form-group col-md-10">
                    <%=Html.CheckBoxMulti("role_id", CStr(obj.id), 0)%>
                    <label for="" class="col-form-label pull-right"><span class="badge badge-success"><%=Html.Encode(obj.Ruolo) %></span> (<%=Html.Encode(obj.Descrizione) %>)</label>
                    <hr/>
                </div>
            </div>
        <% Next %>

        <div class="action-before">
            <button type="submit" class="btn btn-success"><i class="fa fa-floppy-o fa-lg" aria-hidden="true"></i>Conferma inserimento</button>
            <button type="button" class="btn btn-secondary btn-action">
                <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
            </button>
        </div>
    </form>

    <% end if %>

</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->
