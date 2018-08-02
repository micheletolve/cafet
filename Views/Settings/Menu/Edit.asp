<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

<!--#include file="../../Shared/Sub-Header.asp" -->

<div class="container">

  <nav class="navbar navbar-expand-md navbar-light  bg-light">
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="nav navbar-nav mr-auto">
        <li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-list-ul fa-2x pull-left", "Voci di menu", "MenuItems", "List" , "") %></li>
        <li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-plus-circle fa-2x pull-left", "Aggiungi voce di menu", "MenuItems", "Create" , "") %></li>
        <li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-plus-circle fa-2x pull-left", "Permessi", "MenuPermission", "List" , "") %></li>
        <li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-plus-circle fa-2x pull-left", "Definisci Permessi menu", "MenuPermission", "Create" , "") %></li>
      </ul>
    </div>
  </nav>

  <hr/>

  <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Modifica voce menu di primo livello. <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

  <% if Not IsNothing (ModelError) then %>
    <div class="row">
      <div class="col-sm alert alert-danger" role="alert">
          <i class="fa fa-exclamation-circle fa-3x pull-left"></i>Si &egrave; verificato un errore processando la richiesta.<br/> <p class="r-15"><i class="fa fa-circle"></i><%=Html.Encode(ModelError.Messaggio)%></p>
      </div>
    </div>
  <% end if %>

  <form action="?controller=Menu&action=EditPost" method="POST" id="EditPost">

      <%=Html.Hidden("Id", ModelMenu.Id) %>

      <div class="form-row">
        <div class="form-group col-md-1">
            <label for="ordine" class="col-form-label">Ordine</label>
            <%=Html.Number("ordine", ModelMenu.Ordine)%>
        </div>
        <div class="form-group col-md-11">
            <label for="fa" class="col-form-label">Font-Awesome (ver.4)</label>
            <%=Html.TextBox("fa_icon", ModelMenu.Fa_icon, "")%>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group col-md-12">
            <label for="label" class="col-form-label">Label</label>
            <%=Html.TextBox("label", ModelMenu.Label, "")%>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group col-md-12">
            <label for="controlle" class="col-form-label">Controller</label>
            <%=Html.TextBox("controller", ModelMenu.Controller, "")%>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group col-md-12">
            <label for="fa" class="col-form-label">Action</label>
            <%=Html.TextBox("action", ModelMenu.Action, "")%>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group col-md-12">
            <label for="fa" class="col-form-label">Vars</label>
            <%=Html.TextBox("vars", ModelMenu.Vars, "")%>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group col-md-12">
            <label for="fa" class="col-form-label">Pills</label>
            <%=Html.TextBox("pills", ModelMenu.Pills, "")%>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group col-md-12">
            <label for="active" class="col-form-label pull-right">Voce di menu attiva </label>
            <%=Html.CheckBox("active", ModelMenu.Active)%>
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
