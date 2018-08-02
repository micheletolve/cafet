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
    
    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Modifica password utente <%=Html.Encode(ModelUser.Cognome) %> <%=Html.Encode(ModelUser.Nome) %>  <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <% If (Request.QueryString("err") = "edp78") Then %>
        <div class="alert alert-danger" role="alert">
		    <i class="fa fa-exclamation-circle fa-3x pull-left"></i>Whoops! La vecchia password non coincide con quella presente nel database. Riprova inserendo i dati corretti oppure in caso di errore contatta l'amministratore di sistema.
	    </div>
    <% End If %>

    <form action="?controller=User&action=EditPasswordPost" method="POST" id="EditPasswordPost">
        <%=Html.Hidden("Id", ModelUser.Id) %>

        <div class="form-row" id="">
            <div class="form-group col-md-12">
                <label for="oldPassword" class="col-form-label">Vecchia Password</label>
                <%=Html.PasswordReq("OldPassword", "", "Vecchia Password")%>
            </div>
        </div>
        <div class="form-row" id="pwd-container">
            <div class="form-group col-md-12">
                <label for="password" class="col-form-label">Nuova Password</label>
                <%=Html.PasswordReq("Password", "", "Password")%>
                <div class="pwstrength_viewport_progress t-5 r-25 l-25"></div>              
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