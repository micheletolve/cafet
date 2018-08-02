<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

	

<!--#include file="../../Shared/Sub-Header.asp" -->

<div class="container">
    
    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Dettagli server smtp <%=Html.Encode(ModelSmtp.Nome) %>  <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <div class="row">
        <table class="table table-hover">
            <tr>
                <th class="detail"><label for="nome" class="col-form-label">Nome server</label></th>
                <td class="detail"><%=Html.Encode(ModelSmtp.Nome) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="smtpauthenticate" class="col-form-label">SMTP Authenticate</label></th>
                <td class="detail">
                    <% if (ModelSmtp.Smtpauthenticate = "0") Then %>
                        <i class="fa fa-check-square-o r-10" aria-hidden="true"> CdoAnonymous </i>, senza autenticazione.<br />
                    <% elseif (ModelSmtp.Smtpauthenticate = "1") Then %>
                        <i class="fa fa-check-square-o r-10" aria-hidden="true"> <b>CdoBasic</b> </i>, il server utilizza l'autenticazione in chiaro di base</i> ed &Egrave; richiesto che siano specificati username e password.<br />
                    <% elseif (ModelSmtp.Smtpauthenticate = "2") Then %>
                        <i class="fa fa-check-square-o r-10" aria-hidden="true"> CdoBasicCdoNTLM </i>, il server utilizza il <i>current process security context</i> per autenticarsi al sistema</i>.
                    <% end if %>
                </td>
            </tr>
            <tr>
                <th class="detail"><label for="sendusing" class="col-form-label">Invia con</label></th>
                <td class="detail">
                    <% if (ModelSmtp.Sendusing = "1") Then %>
                        <i class="fa fa-check-square-o r-10" aria-hidden="true"> cdoSendUsingPickup </i>, il servizio SMTP &egrave; installato sul computer locale</i>.<br />
                    <% elseif (ModelSmtp.Sendusing = "2") Then %>
                        <i class="fa fa-check-square-o r-10" aria-hidden="true"> <b>cdoSendUsingPort</b> </i>, il servizio SMTP non &egrave; installato sul computer locale e quindi si utilizza la rete (SMTP over the network)</i>.<br />
                    <% end if %>
                </td>
            </tr>
            <tr>
                <th class="detail"><label for="smtpserver" class="col-form-label">Server smtp</label></th>
                <td class="detail"><%=Html.Encode(ModelSmtp.Smtpserver) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="smtpserverport" class="col-form-label">Porta server Smtp</label></th>
                <td class="detail"><%=Html.Encode(ModelSmtp.Smtpserverport) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="sendemailaddress" class="col-form-label">Email di invio</label></th>
                <td class="detail"><%=Html.Encode(ModelSmtp.Sendemailaddress) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="sendusername" class="col-form-label">Username di autenticazione</label></th>
                <td class="detail"><%=Html.Encode(ModelSmtp.Sendusername) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="sendpassword" class="col-form-label">Password di autenticazione</label></th>
                <td class="detail"><%=Html.Encode(ModelSmtp.Sendpassword) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="smtpusessl" class="col-form-label">Utilizzo protocollo SSL</label></th>
                <td class="detail"><%=Html.CheckBoxReader("smtpusessl", ModelSmtp.Smtpusessl) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="predefinito" class="col-form-label">Server SMTP predefinito</label></th>
                <td class="detail"><%=Html.CheckBoxReader("predefinito", ModelSmtp.Predefinito) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="created_at" class="col-form-label">Iserito il</label></th>
                <td class="detail"><%=Html.Encode(ModelSmtp.Created_at) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="updated_at" class="col-form-label">Modificato il</label></th>
                <td class="detail"><%=Html.Encode(ModelSmtp.Updated_at) %></td>
            </tr>
        </table>
        <div class="action-before">
            <button type="button" class="btn btn-secondary btn-action">		
                <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
            </button>
        </div>
    </div>
   
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->