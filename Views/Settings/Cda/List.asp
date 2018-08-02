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

<blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Configurazione membri del Consiglio di Amministrazione <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>
<p class="text-muted r-25">Utenti appartenenti al Consiglio di Amministrazione che saranno coinvolti nella gestione dell'investimento proposto per il raggiungimento dgli obiettivi previsti.</p>

	<nav class="navbar navbar-expand-md navbar-light  bg-light">
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-list-ul fa-2x pull-left", "Consiglio di Amministrazione", "Cda", "List" , "") %></li>
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-plus-circle fa-2x pull-left", "Aggiungi membro al Consiglio di Amministrazione", "Cda", "Create" , "") %></li>
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-trash fa-2x pull-left", "Cestino", "Cda", "Bucket" , "") %></li>
            </ul>      
        </div>
	</nav>

	<hr/>
	
	<% if  IsNothing(ModelCda) then %>
		<div class="alert alert-warning" role="alert">
			<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Whoops! Nessun dato da mostrare. </p>
		</div>
	<% else %>		
	<div>
		<table id="tableOrdered" class="table table-sm table-hover display responsive nowrap">
			<thead>
				<tr>
					<th>Utente</th>
					<th>Ruolo</th>
					<th></th>
					<th class="text-muted">Inserito il</th>
					<th class="text-muted">Aggiornato il</th>					
				</tr>
			</thead>
			<tbody>
			<% Dim obj, role, rolh, user, userh
				set roleh = new RoleHelper
				set userh = new UserHelper 
			For each obj in ModelCda.Items				
				set user = userh.SelectById(obj.Utente_id)  
				set role = roleh.SelectById(user.Ruolo_id)
			%>
            	<tr>
					<td><%=Html.Encode(user.Nome) %>&nbsp;<%=Html.Encode(user.Cognome) %>&nbsp;(<%=Html.Encode(user.email) %>)</td>
					<td><%=Html.Encode(role.Descrizione) %>&nbsp;(<%=Html.Encode(role.Ruolo) %>)</td>
					<td class="btn-group open">							
						<a class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-cog fa-fw"></i> Option </a>
						<ul class="dropdown-menu">							
							<% If (obj.Cancellato = False) Then %>							
								<li ><%=Html.ActionLinkFa("fa fa-trash fa-fw"," Cestina", "Cda", "Delete" , "id=" + CStr(obj.Id)) %></li>
							<% ElseIf (obj.Cancellato = True) Then %>
								<li ><%=Html.ActionLinkFa("fa fa-recycle fa-fw"," Ripristina", "Cda", "UnDelete" , "id=" + CStr(obj.Id)) %></li>
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