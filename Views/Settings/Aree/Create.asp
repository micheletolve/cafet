<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->	

<!--#include file="../../Shared/Sub-Header.asp" -->

<script type="text/javascript">
    $.charsLeft = function( element ) {
        var max = 3;
        $( element ).after( '<span id="chars-left" class="r-25"></span>' );
        $( element ).keyup(function() {
           var textLength = $( this ).val().length;
           var remaining = max - textLength;
           $( "#chars-left" ).text( 'Rimangono ' + remaining + ' caratteri di ' + max);
           if( textLength > max ) {
               $( "#chars-left" ).text( 'Attenzione, gli ultimi ' + remaining + ' caratteri potrebbero essere troncati').addClass( "text-danger" );
           } else {
               $( "#chars-left" ).removeClass( "text-danger" );
           }
        });
    };

    $(document).ready(function() {
        $.charsLeft( "#Area" );
    });
</script>

<div class="container">
    <nav class="navbar navbar-expand-md navbar-light  bg-light">
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-list-ul fa-2x pull-left", "Aree", "Aree", "List" , "") %></li>
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-plus-circle fa-2x pull-left", "Aggiungi area", "Aree", "Create" , "") %></li>
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-trash fa-2x pull-left", "Cestino", "Aree", "Bucket" , "") %></li>
            </ul>      
        </div>
	</nav>
    
	<hr/>

    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Inserimento nuova area. <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <form action="?controller=Aree&action=CreatePost" method="POST" id="CreatePost">
        
        <%=Html.Hidden("Id", ModelAree.Id) %>

        <div class="form-row">
            <div class="form-group col-md-10">
                <label for="area" class="col-form-label">Area</label>
                <%=Html.TextBoxReq("Area", ModelAree.Area, "Area (massimo 3 caratteri)")%>
            </div>
        </div>

        <div class="form-row">            
            <div class="form-group col-md-10">
                <label for="descrizione" class="col-form-label">Descrizione area</label>
                <%=Html.TextBoxReq("Descrizione", ModelAree.Descrizione, "Descrizione area")%>
            </div>
        </div>

        <div class="action-before">
            <button type="submit" class="btn btn-success"><i class="fa fa-floppy-o fa-lg" aria-hidden="true"></i>Conferna inserimento</button>
            <button type="button" class="btn btn-secondary btn-action">		
                <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
            </button>
        </div>
    </form>   
   
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->
