<!--#include file="../../utils/check.inc" -->

<!--#include file="../Shared/Header.asp" -->

<!--#include file="../Shared/Sub-Header.asp" -->

<script type="text/javascript">
jQuery(document).ready(function () {
  "use strict";
  var options = {};
  options.ui = {
    bootstrap4: true,
    container: "#pwd-container",
    viewports: {
      progress: ".pwstrength_viewport_progress"
    },
    showVerdicts: true,
    showVerdictsInsideProgressBar: true,
    progressBarEmptyPercentage: 0,
    progressBarMinPercentage: 1
  };
  $('#Password').pwstrength(options);
});
</script>

<div class="container">

  <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Aggiungi nuovo utente  <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

  <% if Not IsNothing (ModelError) then %>
  <div class="row">
    <div class="col-sm-9 col-md-4"></div>
    <div class="col-sm-9 col-md-8">
      <div class="col-sm alert alert-danger" role="alert">
        <i class="fa fa-exclamation-circle fa-3x pull-left"></i>Si &egrave; verificato un errore processando la richiesta.<br/> <p class="r-15"><i class="fa fa-circle"></i><%=Html.Encode(ModelError.Messaggio)%></p>
      </div>
    </div>
  </div>
  <% end if %>

  <form action="?controller=User&action=CreatePost" method="POST" id="CreatePost">

    <%=Html.Hidden("Id",0) %>

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
        <%=Html.TextBoxReq("Username", ModelUser.Username, "Username")%>
        <%If (Request.QueryString("err") = "usn") Then %>
        <hr/><span class="badge badge-danger">Per convenzione la username &grave; nome.cognome (es. mario.rossi).</span>
        <% End If %>
      </div>
      <div class="form-group col-md-6">
        <label for="email" class="col-form-label">Email</label>
        <%=Html.TextBoxReq("Email", ModelUser.Email, "Email")%>
        <%If (Request.QueryString("err") = "eml") Then %>
        <hr/><span class="badge badge-danger">L'indirizzo email deve essere univoco.</span>
        <% End If %>
      </div>
    </div>

    <div class="form-row" id="pwd-container">
      <div class="form-group col-md-12">
        <label for="password" class="col-form-label">Password</label>
        <%=Html.PasswordReq("Password", ModelUser.Password, "Password")%>
        <div class="pwstrength_viewport_progress t-5 r-25 l-25"></div>
      </div>
    </div>

    <div class="form-row">
      <div class="form-group col-md-12">
        <label for="Ruolo" class="col-form-label">Ruolo</label>
        <%=Html.DropDownList("Ruolo_id", ModelRole.Id, new RoleHelper.SelectAll().Items, "Id", "Descrizione")%>
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

<!--#include file="../Shared/Footer.asp" -->
