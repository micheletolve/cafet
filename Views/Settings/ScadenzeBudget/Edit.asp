<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

<!--#include file="../../Shared/Sub-Header.asp" -->

<div class="container">

    <% if Not IsNothing(ModelError) then %>
        <div class="alert alert-warning" role="alert">
            <i class="fa fa-exclamation-circle fa-3x pull-left"></i><%=Html.Encode(ModelError.Messaggio)%> </p>
        </div>
    <% end if %>

	<nav class="navbar navbar-expand-md navbar-light  bg-light">
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-list-ul fa-2x pull-left", "Elenco scadenze", "ScadenzeBudget", "List" , "") %></li>
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-plus-circle fa-2x pull-left", "Aggiungi scadenze budget", "ScadenzeBudget", "Create" , "") %></li>
            </ul>
        </div>
	</nav>

	<hr/>

    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Definisci le date di scadenza per l'anno in corso qualora non siano state ancora definite. <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <form action="?controller=ScadenzeBudget&action=EditPost" method="POST" id="EditPost">

        <%=Html.Hidden("Id", ModelScadenzeBudget.Id) %>

        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="anno_riferimento" class="col-form-label">Anno di riferimento</label>
                <%=Html.TextBoxReader("anno_riferimento", ModelScadenzeBudget.Anno_riferimento, "Anno di riferimento")%>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="limite_presentazione_proposte" class="col-form-label">Termine ultimo di presentazione delle proposte di investimento</label>
                <%=Html.DataReq("limite_presentazione_proposte", ModelScadenzeBudget.Limite_presentazione_proposte)%>
                <p class="r-25 t-5"><span class="badge badge-primary"><i class="fa fa-info-circle" aria-hidden="true"></i>Oltre questa data le proposte andranno in Extra Budget o nel budget dell'anno successivo. Generalmente il 31 agosto dell'anno di riferimento.</span></p>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="generazione_budget" class="col-form-label">Data di chiusura budget</label>
                <%=Html.DataReq("generazione_budget", ModelScadenzeBudget.Generazione_budget)%>
                <p class="r-25 t-5"><span class="badge badge-primary"><i class="fa fa-info-circle" aria-hidden="true"></i>Data di chiusura e generazione del budget. Generalmente il 15 settembre dell'anno di riferimento.</span></p>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="generazione_forecast" class="col-form-label">Data di trasformazione del budget in forecast</label>
                <%=Html.DataReq("generazione_forecast", ModelScadenzeBudget.Generazione_forecast)%>
                <p class="r-25 t-5"><span class="badge badge-primary"><i class="fa fa-info-circle" aria-hidden="true"></i>Generalmente il primo gennaio dell'anno successivo a quello di riferimento. </span></p>
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

<!--#include file="../../Shared/Footer.asp" -->
