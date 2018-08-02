<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

	

<!--#include file="../../Shared/Sub-Header.asp" -->

<div class="container">
    <nav class="navbar navbar-expand-md navbar-light  bg-light">
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-list-ul fa-2x pull-left", "Server Smtp", "Smtp", "List" , "") %></li>
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-plus-circle fa-2x pull-left", "Aggiungi server Smtp", "Smtp", "Create" , "") %></li>
                
            </ul>      
        </div>
	</nav>

	<hr/>

    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Aggiungi server smtp per l'invio delle notifiche. <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <form action="?controller=Smtp&action=CreatePost" method="POST" id="CreatePost">
        
        <%=Html.Hidden("Id", 0) %>

        <div class="form-row">
            <div class="form-group col-md-10">
                <label for="nome" class="col-form-label">Nome</label>
                <%=Html.TextBoxReq("Nome", ModelSmtp.Nome, "Nome del server smtp (es. Google SMTP)")%>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-10">
                <label for="smtpauthentication" class="col-form-label">Meccanismo di autenticazione</label>
                <%=Html.TextBoxReq("Smtpauthenticate", ModelSmtp.Smtpauthenticate, "Come valore di default inserire 1")%>   
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-10">
                <p class="r-25 text-muted">Specifica il meccanismo da utilizzare quando si esegue l'autenticazione al servizio SMTP.<br />                  
                    <i class="fa fa-square-o r-10" aria-hidden="true"> CdoAnonymous </i>, il valore da impostare &egrave; su <b>0</b>.<i> Non autenticare</i>.<br />
                    <i class="fa fa-check-square-o r-10" aria-hidden="true"> <b>CdoBasic</b> </i>, il valore da impostare &egrave; su <b>1</b><i> e utilizza l'autenticazione in chiaro di base</i>. &Egrave; richiesto che siano specificati username e password.<br />
                    <i class="fa fa-square-o r-10" aria-hidden="true"> CdoBasicCdoNTLM </i>, il valore da impostare &egrave; su <b>2</b><i>, si utilizza il current process security context per autenticarsi al sistema</i>.
                </p>
            </div>             
        </div>

        <div class="form-row">
            <div class="form-group col-md-10">
                <label for="sendusing" class="col-form-label">Invia con</label>
                <%=Html.TextBoxReq("Sendusing", ModelSmtp.Sendusing, "Come valore di default inserire 2")%>   
            </div>
        </div>        
        <div class="form-row">
            <div class="form-group col-md-10">
                <p class="r-25 text-muted">Specifica il metodo da utilizzare per l&quot;invio del messaggio.<br />                  
                    <i class="fa fa-square-o r-10" aria-hidden="true"> cdoSendUsingPickup </i>, il valore da impostare &egrave; su <b>1</b><i> se il servizio SMTP &egrave; installato sul computer locale</i>.<br />
                    <i class="fa fa-check-square-o r-10" aria-hidden="true"> <b>cdoSendUsingPort</b> </i>, il valore da impostare &egrave; su <b>2</b><i> se il servizio SMTP non &egrave; installato sul computer locale e quindi si utilizza la rete (SMTP over the network)</i>.<br />
                </p>
            </div>             
        </div>

        <div class="form-row">            
            <div class="form-group col-md-7">
                <label for="Smtpserver" class="col-form-label">Server smtp</label>
                <%=Html.TextBoxReq("Smtpserver", ModelSmtp.Smtpserver, "Nome Server SMTP (es. smtp-relay.gmail.com)")%>
            </div>
            <div class="form-group col-md-3">
                <label for="Smtpserverport" class="col-form-label">Porta server smtp</label>
                <%=Html.TextBoxReq("Smtpserverport", ModelSmtp.Smtpserverport, "Come valore di default inserire 25")%>
            </div>
        </div>

         <div class="form-row">         
            <div class="form-group col-md-10">
                <label for="Sendemailaddress" class="col-form-label">Email di invio</label>
                <%=Html.TextBoxReq("Sendemailaddress", ModelSmtp.Sendemailaddress, "es. mario.rossi@gmail.com")%>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-5">
                <label for="Sendusername" class="col-form-label">Username</label>
                <%=Html.TextBoxReq("Sendusername", ModelSmtp.Sendusername, "Username di autenticazione")%>
            </div>
            <div class="form-group col-md-5">
                <label for="Sendpassword" class="col-form-label">Password</label>
                <%=Html.TextBoxReq("Sendpassword", ModelSmtp.Sendpassword, "Password di autenticazione")%>
                <span class="badge badge-warning">Attenzione la password viene memorizzata in chiaro.</span>
            </div>
        </div>

        <div class="form-row">
            <div class="form-check col-md-5">
                <label for="Smtpusessl" class="form-check-label">Utilizza protocollo SSL </label>
                <%=Html.CheckBox("Smtpusessl", ModelSmtp.Smtpusessl)%>
            </div>
            <div class="form-check col-md-5">
                <label for="Smtpusessl" class="form-check-label">Assegna come server smtp predefinito </label>
                <%=Html.CheckBox("Predefinito", ModelSmtp.Predefinito)%>
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
