<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

<!--#include file="../../Shared/Sub-Header.asp" -->

<div class="container">

    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Inserimento nuova voce menu di secondo livello sotto il menu <i class="<%=ModelMenu.Fa_icon%>"></i><%=ModelMenu.Label%> <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <form action="?controller=MenuChild&action=CreatePost" method="POST" id="CreatePost">

        <%=Html.Hidden("Id", ModelMenuChild.Id) %>
        <%=Html.Hidden("Parent_id", ModelMenu.Id) %>

        <div class="form-row">
          <div class="form-group col-md-1">
              <label for="ordine" class="col-form-label">Ordine</label>
              <%=Html.Number("ordine", ModelMenuChild.Ordine)%>
          </div>
          <div class="form-group col-md-11">
              <label for="fa" class="col-form-label">Font-Awesome (ver.5)</label>
              <%=Html.TextBox("fa_icon", ModelMenuChild.Fa_icon, "")%>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
              <label for="label" class="col-form-label">Label</label>
              <%=Html.TextBox("label", ModelMenuChild.Label, "")%>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
              <label for="controlle" class="col-form-label">Controller</label>
              <%=Html.TextBox("controller", ModelMenuChild.Controller, "")%>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
              <label for="fa" class="col-form-label">Action</label>
              <%=Html.TextBox("action", ModelMenuChild.Action, "")%>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
              <label for="fa" class="col-form-label">Vars</label>
              <%=Html.TextBox("vars", ModelMenuChild.Vars, "")%>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
              <label for="fa" class="col-form-label">Pills</label>
              <%=Html.TextBox("pills", ModelMenuChild.Pills, "")%>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
              <label for="active" class="col-form-label pull-right">Voce di menu attiva </label>
              <%=Html.CheckBox("active", ModelMenuChild.Active)%>
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
