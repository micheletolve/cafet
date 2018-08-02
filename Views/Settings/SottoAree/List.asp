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
							return 'Details for '+data[0]+' '+data[1];
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

<blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Configurazione Sottoaree di investimento <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

	<nav class="navbar navbar-expand-md navbar-light  bg-light">
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-list-ul fa-2x pull-left", "SottoAree", "Sottoaree", "List" , "") %></li>
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-plus-circle fa-2x pull-left", "Aggiungi sottoarea", "Sottoaree", "Create" , "") %></li>
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-trash fa-2x pull-left", "Cestino", "Sottoaree", "Bucket" , "") %></li>
            </ul>      
        </div>
	</nav>

	<hr/>
	
	<% if  IsNothing(ModelSottoaree) then %>
		<div class="alert alert-warning" role="alert">
			<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Whoops! Nessun dato da mostrare. </p>
		</div>
	<% else %>		
	<div>
		<table id="tableOrdered" class="table table-sm table-hover display responsive nowrap">
			<thead>
				<tr>
					<th>Area</th>
					<th>Sottoarea</th>
					<th>Descrizione</th>
					<th></th>
					<th class="text-muted">Inserito il</th>
					<th class="text-muted">Modificato il</th>
				</tr>
			</thead>
			<tbody>
			<% Dim obj, a, ah
			set ah = new AreeHelper
			For each obj in ModelSottoaree.Items
			set a = ah.SelectById(obj.Area_Id)
			%>
            	<tr>
					<td><%=Html.Encode(a.Area) %></td>
					<td><%=Html.Encode(obj.Sottoarea) %></td>
					<td><%=Html.Encode(obj.Descrizione) %></td>
					<td class="btn-group open">							
						<a class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-cog fa-fw"></i> Option </a>
						<ul class="dropdown-menu">
							<li ><%=Html.ActionLinkFa("fas fa-pencil-alt fa-fw"," Modifica", "Sottoaree", "Edit" , "id=" + CStr(obj.Id)) %></li>
							<% If (obj.Cancellato = False) Then %>							
								<li ><%=Html.ActionLinkFa("fa fa-trash fa-fw"," Cestina", "Sottoaree", "Delete" , "id=" + CStr(obj.Id)) %></li>
							<% ElseIf (obj.Cancellato = True) Then %>
								<li ><%=Html.ActionLinkFa("fa fa-recycle fa-fw"," Ripristina", "Sottoaree", "UnDelete" , "id=" + CStr(obj.Id)) %></li>
								<li ><%=Html.ActionLinkFa("fa fa-eraser fa-fw"," Elimina definitivamente", "Sottoaree", "Erase" , "id=" + CStr(obj.Id)) %></li>
							<% End If %>
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