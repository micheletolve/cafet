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

<blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Configurazione server smtp <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

	<nav class="navbar navbar-expand-md navbar-light  bg-light">
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-list-ul fa-2x pull-left", "Server Smtp", "Smtp", "List" , "") %></li>
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-plus-circle fa-2x pull-left", "Aggiungi server Smtp", "Smtp", "Create" , "") %></li>
                
            </ul>      
        </div>
	</nav>

	<hr/>
	
	<% if  IsNothing(ModelSmtp) then %>
		<div class="alert alert-warning" role="alert">
			<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Whoops! Nessun dato da mostrare. Creare almeno un record di configurazione per il server SMTP. </p>
		</div>
	<% else %>		
	<div>
		<table id="tableOrdered" class="table table-sm table-hover display responsive nowrap">
			<thead>
				<tr>
					<th>Nome</th>
					<th>SMTP Server</th>
					<th>Porta SMTP</th>
					<th>Send Email Address</th>
					<th>Username</th>
					<th>Password</th>
					<th>Predefinito</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<% Dim obj
			For each obj in ModelSmtp.Items
			%>
            	<tr>
					<td><%=Html.Encode(obj.Nome) %></td>
					<td><%=Html.Encode(obj.Smtpserver) %></td>
					<td><%=Html.Encode(obj.Smtpserverport) %></td>
					<td><%=Html.Encode(obj.Sendemailaddress) %></td>
					<td><%=Html.Encode(obj.Sendusername) %></td>
					<td><%=Html.Encode(obj.Sendpassword) %></td>
					<td><%=Html.CheckBoxReader("Predefinito", obj.Predefinito) %></td>
					<td class="btn-group open">							
						<a class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-cog fa-fw"></i> Option </a>
						<ul class="dropdown-menu">
							<li ><%=Html.ActionLinkFa("fa fa-info-circle fa-fw"," Dettagli", "Smtp", "Details" , "id=" + CStr(obj.Id)) %></li>
							<li ><%=Html.ActionLinkFa("fas fa-pencil-alt fa-fw"," Modifica", "Smtp", "Edit" , "id=" + CStr(obj.Id)) %></li>							
							<li ><%=Html.ActionLinkFa("fa fa-trash fa-fw"," Cancella", "Smtp", "Delete" , "id=" + CStr(obj.Id)) %></li>
						</ul>
					</td>
				</tr>
				<% Next
				End If %>	
			</tbody>
		</table>					
	</div>
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->