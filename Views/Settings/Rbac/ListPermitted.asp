<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

<!--#include file="../../Shared/Sub-Header.asp" -->


<script type="text/javascript" class="init">
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

  <div class="alert alert-dark alert-dismissible fade show" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
    <h4 class="alert-heading"><i class="fa fa-info-circle fa-2x pull-left"></i>Informazioni di sistema</h4>
    <hr>
		<p>Attenzione, la revoca di un permesso è un'operazione irreversibile e immediata. Se non si &egrave; sicuri non revocare alcun permesso.</p>
	</div>

<blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Role based control permission - permessi concessi al menu <i class="<%=Html.Encode(ModelMenu.Fa_icon)%>"></i> <%=Html.Encode(ModelMenu.Label)%>  <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

<% if  IsNothing(ModelMenuPermission) then %>
	<div class="alert alert-warning" role="alert">
		<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Whoops! Nessun dato da mostrare.</p>
	</div>
<% else %>
	<div>
		<table id="tableOrdered" class="table table-sm table-hover display responsive nowrap">
			<thead>
				<tr>
					<th>Ruolo</th>
					<th></th>
          <th class="text-muted">Autorizzato il</th>
				</tr>
			</thead>
			<tbody>
			<% Dim obj, roleItem
			For each obj in ModelMenuPermission.Items
        Set roleItem = new roleHelper.SelectById(obj.ruolo_id)%>
				<tr>
					<td><span class="badge badge-success"><%=Html.Encode(roleItem.Ruolo) %></span> (<%=Html.Encode(roleItem.Descrizione) %>)</td>
          <td class="btn-group open">
						<a class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-cog fa-fw"></i> Option </a>
						<ul class="dropdown-menu">
							<li><%=Html.ActionLinkFa("fas fa-trash"," Revoca permesso", "Rbac", "Delete" , "id=" + CStr(obj.Permission) + "&rl=" +CStr(roleItem.Id) + "&mn=" +CStr(obj.Menu_id)) %></li>
						</ul>
					</td>
          <td class="text-muted"><%=Html.Encode(roleItem.Updated_at) %></td>
				</tr>
				<% Next
				End If %>
			</tbody>
		</table>

    <div class="action-before">
			<button type="button" class="btn btn-danger btn-action">
				<i class="fas fa-trash fa-lg"></i><%=Html.ActionLink("Revoca tutti i permessi per questa voce di menu", "Rbac", "Reset" , "id=" + CStr(ModelMenu.Id)) %>
			</button>
      <button type="button" class="btn btn-secondary btn-action">
        <i class="fa fa-undo fa-lg"></i><%=Html.ActionLink("Indietro", "Menu", "List" , "") %>
      </button>
		</div>
	</div>
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->
