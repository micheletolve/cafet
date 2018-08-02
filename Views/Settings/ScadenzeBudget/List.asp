<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

<!--#include file="../../Shared/Sub-Header.asp" -->

<script type="text/javascript">
    $(document).ready(function() {		
		$('#tableOrdered').DataTable( {
			paging: true,
			ordering: true,
			searching: true,
			colReorder: true,
			responsive: {
				details: {
					display: $.fn.dataTable.Responsive.display.modal( {
						header: function ( row ) {
							var data = row.data();
							return 'Details for '+data[0];
						}
					} ),
					renderer: $.fn.dataTable.Responsive.renderer.tableAll( {
						tableClass: 'table'
					} )
				}
			},
			"language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Italian.json"
        	},
			"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Tutti"]]			
		});
	} );
</script>

<div class="container">

<blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Configurazione scadenze <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

	<nav class="navbar navbar-expand-md navbar-light  bg-light">
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-list-ul fa-2x pull-left", "Elenco scadenze", "ScadenzeBudget", "List" , "") %></li>
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-plus-circle fa-2x pull-left", "Aggiungi scadenze budget", "ScadenzeBudget", "Create" , "") %></li>
            </ul>      
        </div>
	</nav>

	<hr/>
	
	<% if IsNothing(ModelScadenzeBudget) then %>
		<div class="alert alert-warning" role="alert">
			<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Whoops! Nessun dato da mostrare. </p>
		</div>
	<% else %>		
	<div>
		<table id="tableOrdered" class="table table-sm table-hover display responsive nowrap">
			<thead>
				<tr>
					<th>Anno di riferimento</th>
					<th>Budget</th>
					<th>Termine presentazione proposte</th>
					<th>Data chiusura budget</th>
					<th>Data generazione forecast</th>
					<th></th>
					<th class="text-muted">Inserito il</th>
					<th class="text-muted">Modificato il</th>					
				</tr>
			</thead>
			<tbody>
			<% Dim obj
			For each obj in ModelScadenzeBudget.Items
			%>
            	<tr>
					<td><%=Html.Encode(obj.Anno_riferimento) %></td>
					<td><span class="badge badge-success"><%=Html.Encode(obj.Anno_riferimento+1) %></span></td>
					<td><%=Html.EncodeFormatDateIT(obj.Limite_presentazione_proposte, 1) %></td>
					<td><%=Html.EncodeFormatDateIT(obj.Generazione_budget, 1) %></td>
					<td><%=Html.EncodeFormatDateIT(obj.Generazione_forecast, 1) %></td>
					<td class="btn-group open">							
						<a class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-cog fa-fw"></i> Option </a>
						<ul class="dropdown-menu">
							<li ><%=Html.ActionLinkFa("fas fa-pencil-alt fa-fw"," Modifica", "ScadenzeBudget", "Edit" , "id=" + CStr(obj.Id)) %></li>
							<li ><%=Html.ActionLinkFa("fa fa-eraser fa-fw"," Elimina", "ScadenzeBudget", "Erase" , "id=" + CStr(obj.Id)) %></li>
						</ul>
					</td>
					<td class="text-muted"><%=Html.Encode(obj.Created_at) %></td>
					<td class="text-muted"><%=Html.Encode(obj.Updated_at) %></td>					
				</tr>
				<% Next
				End If %>	
			</tbody>
		</table>					
	</div>
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->