<!--#include file="../../utils/check.inc" -->

<!--#include file="../Shared/Header.asp" -->

<!--#include file="../Shared/Sub-Header.asp" -->

<%
	If (Request.QueryString("Action") = "CreatePost") Then %>
			<!--#include file="../Shared/Header.asp" -->
			<script>
			$(window).on('load', function(){
					$('#composeMessage').modal('show');
			});
			</script> <%
	End If
%>

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
	});
</script>

<div class="container">
  <section class="content">
		<div class="row">
			<div class="col-sm-3 col-md-2">
				<a href="#composeMessage" data-toggle="modal" data-whatever="@mdo" class="btn btn-primary btn-block margin-bottom">Scrivi <i class="fas fa-pencil-alt"></i></a>
				<div class="box box-solid">
					<div class="box-body no-padding">
						<ul class="nav nav-pills flex-column">
							<li class="active"><a href="?Controller=Messaggi&Action=Inbox"><i class="fa fa-inbox"></i> Posta in arrivo <span class="badge badge-primary pull-right"><% If (countElementUnread > 0) Then Response.Write(countElementUnread) End If %></span></a></li>
							<li><a href="?Controller=Messaggi&Action=Sent"><i class="fas fa-envelope"></i> Posta inviata</a></li>
							<li><a href="?Controller=Messaggi&Action=Bucket"><i class="fas fa-trash"></i> Cestino <span class="badge badge-primary pull-right"><% If (countElementTrash > 0) Then Response.Write(countElementTrash) End If %></span></a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-sm-9 col-md-10">
				<% if Not IsNothing (ModelError) then %>
					<div class="row">
							<div class="col-sm alert alert-danger" role="alert">
								<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Si &egrave; verificato un errore processando la richiesta.<br/> <p class="r-15"><i class="fa fa-circle"></i><%=Html.Encode(ModelError.Messaggio)%></p>
							</div>
					</div>
				<% end if %>
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Posta in arrivo</h3>
							<div class="table-responsive">
							<% if IsNothing(ModelMessaggi) then %>
								<div class="alert alert-warning" role="alert">
									<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Whoops! Nessun messaggio da mostrare.</p>
								</div>
							<% else %>
								<table id="tableOrdered" class="table table-sm table-hover display nowrap">
									<thead>
										<tr>
											<th>Mittente</th>
											<th>Oggetto</th>
											<th></th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<% Dim obj, mittente
										For each obj in ModelMessaggi.Items
											Set mittente = new UserHelper.SelectById(obj.Mittente)
										%>
										<tr>
                      <% if (obj.Letto = False) then %>
                        <td class="mittente"><strong><%=Html.Encode(mittente.NomeCompleto)%></strong></td>
                        <td class="oggetto"><strong><%=Html.Encode(obj.Oggetto)%></strong></td>
												<td class="">
													<% if ((obj.Link_file <> "") AND (obj.Nome_file <> "")) then %>
														<strong><i class="fa fa-paperclip"></i></strong>
													<% end if %>
												</td>
                        <td class=""><strong>
                          <% if (DateDiff("d", Now(), obj.Data_invio) = 0) then %>
                            <%=Html.EncodeFormatDateIT(obj.Data_invio,4) %>
                          <% else %>
                            <%=Html.EncodeFormatDateIT(obj.Data_invio, 2)%>
                          <% end if %></strong>
                        </td>
                      <% else %>
  											<td class="mittente"><%=Html.Encode(mittente.NomeCompleto)%></td>
  											<td class="oggetto"><%=Html.Encode(obj.Oggetto)%></td>
												<td class="">
													<% if ((obj.Link_file <> "") AND (obj.Nome_file <> "")) then %>
														<i class="fa fa-paperclip"></i>
													<% end if %>
												</td>
  											<td class="">
  												<% if (DateDiff("d", Now(), obj.Data_invio) = 0) then %>
  													<%=Html.EncodeFormatDateIT(obj.Data_invio,4) %>
  												<% else %>
  													<%=Html.EncodeFormatDateIT(obj.Data_invio, 2)%>
  												<% end if %>
  											</td>
                      <% end if %>
                      <td class="btn-group open">
            						<a class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-cog fa-fw"></i> Option </a>
            						<ul class="dropdown-menu">
            								<li ><%=Html.ActionLinkFa("fas fa-envelope fa-fw"," Apri messaggio", "Messaggi", "Open" , "id=" + CStr(obj.Id)) %></li>
                            <li ><%=Html.ActionLinkFa("fa fa-trash fa-fw"," Cestina messaggio", "Messaggi", "Delete" , "id=" + CStr(obj.Id)) %></li>
            						</ul>
            					</td>
										</tr>
										<% Next %>
									</tbody>
								</table>
							<% End If %>
							</div>
						</div>
					</div>
				</div>
			</div>
      </div> <!-- /.row -->
  </section>
</div> <!-- /.container -->

<!--#include file="../Shared/Footer.asp" -->
<!-- Modal -->
	<!--#include file="./Create.asp" -->
<!-- /Modal -->
