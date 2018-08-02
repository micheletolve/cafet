<!--#include file="../../utils/check.inc" -->

<!--#include file="../Shared/Header.asp" -->

<!--#include file="../Shared/Sub-Header.asp" -->

<script type="text/javascript">
	$('.counter-count').each(function () {
        $(this).prop('Counter',0).animate({
            Counter: $(this).text()
        }, {
            duration: 5000,
            easing: 'swing',
            step: function (now) {
                $(this).text(Math.ceil(now));
            }
        });
    });
</script>

	<div class="container theme-showcase" role="main">

		<div class="alert alert-dark alert-dismissible fade show" role="alert">
	    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	      <span aria-hidden="true">&times;</span>
	    </button>
	    <h4 class="alert-heading"><i class="fa fa-info-circle fa-2x pull-left"></i>Informazioni di sistema</h4>
	    <hr>
			<p class="r-25">Per una corretta visualizzazione ed utilizzo del <strong>date picker</strong> si raccomanda la visualizzazione con browser <a href="https://www.google.com/chrome/browser/desktop/"><i class="fab fa-chrome fa-3x"></i> Google Chrome</a>.
			<br/>Sarebbe buona pratica cambiare la password al primo accesso e di rinnovarla periodicamente per questioni di sicurezza.</p>
		</div>

		<% if Not IsNothing (ModelError) then %>
			<div class="col-sm alert <%Response.Write(ModelError.Tipologia)%> alert-dismissible fade show" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="alert-heading"><i class="fa fa-exclamation-circle fa-2x pull-left"></i>Warning</h4>
				<hr>
				<p class="r-15"><b>Dettagli errore:</b> <%=Html.Encode(ModelError.Messaggio)%></p>
			</div>
		<% end if %>

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">

			<div class="counter">
				<div class="container">

				  <div class="row">
				    <div class="col">
							<div class="item">
								<p class="counter-count bg-info"><%=Html.Encode(count) %></p>
								<p class="statistic-p">Proposta di investimento <strong>caricate</strong> nel sistema </p>
							</div>
				    </div>
				    <div class="col">
							<div class="item">
								<p class="counter-count bg-info"><%=Html.Encode(countFirmate) %></p>
								<p class="statistic-p">Proposte <strong>firmate</strong> dal team interno ed in <strong>attesa di valutazione</strong> da parte di <strong>DIG</strong></p>
							</div>
				    </div>
				    <div class="col">
							<div class="item">
								<p class="counter-count bg-warning"><%=Html.Encode(countFirmateValutate)%></p>
								<p class="statistic-p">Proposte <strong>valutate</strong> da <strong>DIG</strong> ed in <strong>attesa di valutazione</strong> da parte del <strong>CDA</strong> </p>
							</div>
				    </div>
				  </div>

				<div class="row">
					<div class="col">
						<div class="item">
							<p class="counter-count bg-warning"><%=Html.Encode(countFirmateValutate)%></p>
							<p class="statistic-p">Proposte <strong>valutate</strong> ed in <strong>attesa di assegnazione del numero di commessa </strong> da parte di <strong>CTR</strong> </p>
						</div>
					</div>
					<div class="col">
						<div class="item">
							<p class="counter-count bg-success"><%=Html.Encode(countFirmateValutateCommessa)%></p>
							<p class="statistic-p">Proposte <strong>approvate</strong> e con <strong>numero di commessa assegnato</strong> da parte di <strong>CTR</strong></p>
						</div>
					</div>
					<div class="col">
						<div class="item">
							<p class="counter-count bg-danger"><%=Html.Encode(countFirmateValutateCommessa)%></p>
							<p class="statistic-p">Proposte <strong>valuate</strong> con <strong>numero di commessa assegnato</strong> da parte di <strong>CTR</strong></p>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
</div>

<!--#include file="../Shared/Footer.asp" -->
