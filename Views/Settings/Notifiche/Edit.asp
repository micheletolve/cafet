<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

	

<!--#include file="../../Shared/Sub-Header.asp" -->

<script>
    tinymce.init({
        selector: '#messaggio',
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
</script>

<div class="container">

	<hr/>

    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Modifica notifica <%=Html.Encode(ModelNotifiche.Nome) %> <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <form action="?controller=Notifiche&action=EditPost" method="POST" id="EditPost">
        
        <%=Html.Hidden("Id", ModelNotifiche.Id) %>

         <div class="form-row">            
            <div class="form-group col-md-12">
                <label for="oggetto" class="col-form-label">Oggetto della notifica</label>
                <%=Html.TextBoxReq("oggetto", ModelNotifiche.Oggetto, "Oggetto")%>
            </div>
        </div>

        <div class="form-row">            
            <div class="form-group col-md-12">
                <label for="messaggio" class="col-form-label">Messaggio della notifica</label>
                <%=Html.TextAreaReq("messaggio", ModelNotifiche.Messaggio, 5, 10)%>
            </div>
        </div>

        <div class="form-row">            
            <div class="form-group col-md-12">
                <label for="destinatari" class="col-form-label">Elenco destinatari</label>
                <%=Html.TextArea("destinatari", ModelNotifiche.Destinatari, 5, 10)%>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-12">
                <p class="r-25 text-muted">Specifica l'elenco dei destinatari sepando ognugno con un &quot;<strong>;</strong>&quot;(es. tizio@biomasseitalia.it; caio@biomasseitalia.it) oppure lascia vuoto nel caso sia definito un indirizzo di inoltro predefinito.</p>
            </div>             
        </div>

        <div class="form-row">
            <div class="form-check col-md-12">
                <label for="abilitato" class="form-check-label">Abilita questa notifica </label>
                <%=Html.CheckBox("abilitato", ModelNotifiche.Abilitato)%>
            </div>                            
        </div>

        <div class="action-before">
            <button type="submit" class="btn btn-success"><i class="fa fa-floppy-o fa-lg" aria-hidden="true"></i>Conferna modifiche</button>
            <button type="button" class="btn btn-secondary btn-action">		
                <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
            </button>
        </div>
    </form>   
   
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->
