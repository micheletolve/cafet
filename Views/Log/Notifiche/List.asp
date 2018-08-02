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
			responsive: true,
			"language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Italian.json"
        	},
			"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Tutti"]]			
		});
	} );
</script>

<div class="container">
	<% if  IsNothing(ModelLogNotifiche) then %>
		<div class="alert alert-warning" role="alert">
			<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Whoops! Nessun dato da mostrare.</p>
		</div>
	<% else %>
	<div>
		<table id="tableOrdered" class="table table-sm table-hover display responsive nowrap">
			<thead>
				<tr>
					<th>Utente</th>
					<th>Inviata il</th>				
					<th>Oggetto</th>
					<th>Messaggio</th>
					<th>Destinatari</th>					                    
				</tr>
			</thead>
			<tbody>
			<% Dim obj
			For each obj in ModelLogNotifiche.Items
			%>
            	<tr>
					<td><%=Html.Encode(obj.NomeUtente) %></td>
					<td><%=Html.EncodeFormatDateIT(obj.Created_at,1) %></td>					
					<td><%=Html.Encode(obj.Oggetto) %></td>
					<td><%=Html.NoEncode(obj.Messaggio) %></td>
					<td><%=Html.Encode(obj.Destinatari) %>	
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