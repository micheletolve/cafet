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
	<% if  IsNothing(ModelLogSettings) then %>
		<div class="alert alert-warning" role="alert">
			<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Whoops! Nessun dato da mostrare.</p>
		</div>
	<% else %>
	<div>
		<table id="tableOrdered" class="table table-sm table-hover display responsive nowrap">
			<thead>
				<tr>
					<th>Utente</th>
					<th>Logging</th>
					<th>Data</th>
				</tr>
			</thead>
			<tbody>
			<% Dim obj, user, userHelper			
			For each obj in ModelLogSettings.Items
			Set userHelper = new UserHelper
            Set user = userHelper.SelectById(obj.User_id)
			%>
            	<tr>
					<td><%=Html.Encode(user.Nome) %>&nbsp;<%=Html.Encode(user.Cognome) %></td>
					<td><%=Html.NoEncode(obj.Logging) %></td>
					<td><%=Html.EncodeFormatDateIT(obj.Created_at,1) %></td>							
				</tr>
				<% Next
				End If %>	
			</tbody>
		</table>
		<div class="action-before">
			<button type="button" class="btn btn-danger btn-action">		
				<i class="fas fa-trash fa-lg"></i><%=Html.ActionLink("Reset Log", "LogSettings", "Reset" , "") %>
			</button>
		</div>			
	</div>
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->