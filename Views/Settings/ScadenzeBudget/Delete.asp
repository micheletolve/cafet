<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

<!--#include file="../../Shared/Sub-Header.asp" -->

<div class="container">
    
    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Cancella definitivamente recod in riferimento all'anno <%=Html.Encode(ModelScadenzeBudget.Anno_riferimento) %>  <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <div class="alert alert-danger" role="alert">
		<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Attenzione! L'eliminazione definitiva di un record è un'operazione non reversibile, se non si &egrave; sicuri non procedere oltre.
	</div>

    <div class="row">
        <table class="table table-hover">
            <tr>
                <th class="detail"><label for="anno_riferimento" class="col-form-label">Anno di riferimento</label></th>
                <td class="detail"><%=Html.Encode(ModelScadenzeBudget.Anno_riferimento) %></td>
            </tr>  

            <tr>
                <th class="detail"><label for="limite_presentazione_proposte" class="col-form-label">Termine ultimo di presentazione delle proposte di investimento</label></th>
                <td class="detail"><%=Html.EncodeFormatDateIT(ModelScadenzeBudget.Limite_presentazione_proposte, 1) %></td>
            </tr>   

            <tr>
                <th class="detail"><label for="generazione_budget" class="col-form-label">Data di chiusura budget</label></th>
                <td class="detail"><%=Html.EncodeFormatDateIT(ModelScadenzeBudget.Generazione_budget, 1) %></td>
            </tr> 

            <tr>
                <th class="detail"><label for="generazione_forecast" class="col-form-label">Data di trasformazione del budget in forecast</label></th>
                <td class="detail"><%=Html.EncodeFormatDateIT(ModelScadenzeBudget.Generazione_forecast, 1) %></td>
            </tr>        
        </table>
    </div>

    <form action="?controller=ScadenzeBudget&action=ErasePost" method="POST" id="DeletePost">
        <%=Html.Hidden("Id", ModelScadenzeBudget.Id) %>

        <button type="submit" class="btn btn-warning"><i class="fas fa-trash fa-lg" aria-hidden="true"></i>Conferma eliminazione</button>
        <button type="button" class="btn btn-secondary btn-action">		
            <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
        </button>
    </form> 
   
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->