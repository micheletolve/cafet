
<%
    If (Request.QueryString("Action") = "CreatePost") Then %>
        <!--#include file="../Shared/Header.asp" -->
        <script>
        $(window).on('load', function(){
            $('#composeMessage').modal('show');
        });
        </script> <%
    End If

    If Not IsNUll (ModelMessaggi) Then
        set ModelMessaggi = new Messaggi
    End If
%>

<script>
    function initMCEexact(e){
        tinymce.init({
            selector : e,
            required: true,
            height: 300,
            resize: false,
            menubar: false,
            skin: 'lightgray',
            plugins: [
                "advlist autolink lists link image charmap print preview anchor",
                "searchreplace visualblocks code fullscreen",
                "insertdatetime media table contextmenu paste imagetools"
            ],
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
                // imagetools_cors_hosts: ['www.tinymce.com', 'codepen.io']
        });
    }
    initMCEexact("#corpo");
</script>

<script>
  $(function() {
    $('input[id=destinatario]').on('input',function() {
      var selectedOption = $('option[value="'+$(this).val()+'"]');
      var dataValue = selectedOption.attr('data-value');
      var x = document.getElementById("destinatario-hidden");
      x.value = dataValue;
    });
  });
</script>

<div class="modal fade" id="composeMessage" tabindex="-1" role="dialog" aria-labelledby="composeMessageLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="composeMessageLabel">Nuovo Messaggio</h4>
      </div>
      <div class="modal-body">
        <% if Not IsNothing (ModelError) then %>
            <div class="row">
                <div class="col-sm alert alert-danger" role="alert">
                    <i class="fa fa-exclamation-circle fa-3x pull-left"></i>Si &egrave; verificato un errore processando la richiesta.<br/> <p class="r-15"><i class="fa fa-circle"></i><%=Html.Encode(ModelError.Messaggio)%></p>
                </div>
            </div>
        <% end if %>
        <form action="?Controller=Messaggi&Action=CreatePost" method="POST" id="CreatePost" enctype="multipart/form-data">

          <%=Html.Hidden("Id", ModelMessaggi.Id) %>
          <%=Html.Hidden("destinatario-hidden", ModelMessaggi.Destinatario) %>
          <%=Html.Hidden("mittente", Session("user_id")) %>

          <div class="form-row">
              <div class="form-group col-md-6">
                  <label for="oggetto" class="col-form-label">Mittente</label>
                  <%=Html.TextBoxReader("mittente", new UserHelper.SelectById(Session("user_id")).NomeCompleto, "mittente")%>
              </div>
              <div class="form-group col-md-6">
                  <label for="oggetto" class="col-form-label">Destinatario</label>
                  <%=Html.DataListReq("destinatario", new UserHelper.SelectAll(), "nomeCompleto", "id")%>
              </div>
          </div>
          <div class="form-row">
              <div class="form-group col-md-12">
                  <label for="oggetto" class="col-form-label">Oggetto</label>
                  <%=Html.TextBoxReq("oggetto", ModelMessaggi.Oggetto, "oggetto")%>
              </div>
          </div>
          <div class="form-row">
              <div class="form-group col-md-12">
                  <label for="corpo" class="col-form-label">Messaggio</label>
                  <%=Html.TextArea("corpo", ModelMessaggi.Corpo, 5,10)%>
              </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-12">
                <label for="link_file" class="col-form-label">Allega file</label>
                <%=Html.UploadFile("link_file")%>
                <p class="r-25 t-5 no-margin"><span class="badge badge-warning"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Per ragioni di sicurezza &egrave; possibile caricare soltanto file con estensione *.doc, *.docx, *.pdf, *.jpg e *.zip con una grandezza massima di 5 Megabyte.</span></p>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success"><i class="fa fa-send-o fa-lg" aria-hidden="true"></i>Invia messaggio</button>
          <button type="button" class="btn btn-secondary btn-action">
              <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
          </button>
        </div>
      </form>
    </div>
  </div>
</div>
