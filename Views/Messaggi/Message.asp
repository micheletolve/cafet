<!--#include file="../../utils/check.inc" -->

<!--#include file="../Shared/Header.asp" -->

<!--#include file="../Shared/Sub-Header.asp" -->

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
  <section class="content">
		<div class="row">

			<div class="col-sm-3 col-md-2">
				<a href="compose.html" class="btn btn-primary btn-block margin-bottom">Scrivi <i class="fas fa-pencil-alt"></i></a>
				<div class="box box-solid">

					<div class="box-body no-padding">
						<ul class="nav nav-pills flex-column">
							<li><a href="?Controller=Messaggi&Action=Inbox"><i class="fa fa-inbox"></i> Posta in arrivo <span class="badge badge-primary pull-right"><% If (countElementUnread > 0) Then Response.Write(countElementUnread) End If %></span></a></li>
							<li><a href="?Controller=Messaggi&Action=Sent"><i class="fas fa-envelope"></i> Posta inviata</a></li>
							<li><a href="?Controller=Messaggi&Action=Bucket"><i class="fas fa-trash"></i> Cestino <span class="badge badge-primary pull-right"><% If (countElementTrash > 0) Then Response.Write(countElementTrash) End If %></span></a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-sm-9 col-md-10">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title"><%=Html.Encode(ModelMessaggi.Oggetto)%></h3>
							<div class="table-responsive">
								<div class="row">
									<div class="col-md-9">
										<span class=""><i class="fas fa-user-circle fa-2x pull-left"></i> <%=Html.Encode(new UserHelper.SelectById(ModelMessaggi.Mittente).NomeCompleto)%> <i>&lt;<%=Html.Encode(new UserHelper.SelectById(ModelMessaggi.Mittente).Email)%>&gt;</i></span><br/>
										<span class="r-5"><strong>a me </strong> <%=Html.Encode(new UserHelper.SelectById(ModelMessaggi.Destinatario).NomeCompleto)%> <i>&lt;<%=Html.Encode(new UserHelper.SelectById(ModelMessaggi.Destinatario).Email)%>&gt; </i> </span>
									</div>
									<div class="col-md-3">
										<% if (DateDiff("d", Now(), ModelMessaggi.Data_invio) = 0) then %>
											<%=Html.EncodeFormatDateIT(ModelMessaggi.Data_invio,4) %>
										<% else %>
											<%=Html.EncodeFormatDateIT(ModelMessaggi.Data_invio, 1)%>&nbsp;<%=Html.EncodeFormatDateIT(ModelMessaggi.Data_invio,4) %>
										<% end if %>
									</div>
								</div>
								<hr class="style3" />
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-10">
										<%=Html.NoEncode(ModelMessaggi.Corpo)%>
									</div>
									<div class="col-md-1"></div>
								</div>
								<div class="row t-25">
									<div class="col-md-1"></div>
									<div class="col-md-10">
										<% if ((ModelMessaggi.Link_file <> "") AND (ModelMessaggi.Nome_file <> "")) then %>
											<i class="fa fa-paperclip fa-2x"></i> Allegati: <a href="<%=Html.Encode(ModelMessaggi.Link_file) %>"><%=Html.Encode(ModelMessaggi.Nome_file)%></a>
										<% else %>
											<div class="alert alert-warning" role="alert">
												<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Non sono presenti allegati.</p>
											</div>
										<% end if %>
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
      </div> <!-- /.row -->
  </section>
</div> <!-- /.container -->

  <!--#include file="../Shared/Footer.asp" -->
