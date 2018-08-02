<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

<!--#include file="../../Shared/Sub-Header.asp" -->

<script type="text/javascript">
    $(document).ready(function() {
		$('#tableOrdered').DataTable( {
			paging: true,
			ordering: false,
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
	<% if  IsNothing(ModelLogAccessi) then %>
		<div class="alert alert-warning" role="alert">
			<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Whoops! Nessun dato da mostrare.</p>
		</div>
	<% else %>
	<div>
		<table id="tableOrdered" class="table table-sm table-hover display responsive nowrap">
			<thead>
				<tr>
					<th>Utente</th>
					<th>Data</th>
					<th>Stato</th>
          <th>Indirizzo IP</th>
				</tr>
			</thead>
			<tbody>
			<% Dim obj
			For each obj in ModelLogAccessi.Items
			%>
            	<tr>
					<td><%=Html.Encode(obj.NomeUtente) %></td>
					<td><%=Html.EncodeFormatDateIT(obj.Data,1) %></td>
					<td>
						<% If (obj.Stato = "Autenticazione fallita!") Then %>
							<span class="badge badge-warning"><%=Html.Encode(obj.Stato) %></span>
						<% Else %>
							<span class="badge badge-success"><%=Html.Encode(obj.Stato) %></span>
						<% End If %>
					</td>
          <td><%=Html.Encode(obj.Ip) %></td>
				</tr>
				<% Next
				End If %>
			</tbody>
		</table>
		<div class="action-before">
			<button type="button" class="btn btn-danger btn-action">
				<i class="fas fa-trash fa-lg"></i><%=Html.ActionLink("Reset Log", "LogAccessi", "Reset" , "") %>
			</button>
		</div>			
	</div>
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->
