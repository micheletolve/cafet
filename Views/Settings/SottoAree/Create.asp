<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

	

<!--#include file="../../Shared/Sub-Header.asp" -->

<div class="container">
   <nav class="navbar navbar-expand-md navbar-light  bg-light">
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-list-ul fa-2x pull-left", "SottoAree", "Sottoaree", "List" , "") %></li>
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-plus-circle fa-2x pull-left", "Aggiungi sottoarea", "Sottoaree", "Create" , "") %></li>
				<li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-trash fa-2x pull-left", "Cestino", "Sottoaree", "Bucket" , "") %></li>
            </ul>      
        </div>
	</nav>
    
	<hr/>

    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Inserimento nuova sottoarea. <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <form action="?controller=Sottoaree&action=CreatePost" method="POST" id="CreatePost">
        
        <%=Html.Hidden("Id", ModelSottoaree.Id) %>

        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="area" class="col-form-label">Area di appartenenza</label>
                <%=Html.DropDownList("Area_id", ModelAree.Id, new AreeHelper.SelectAll().Items, "Id", "Area")%>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-10">
                <label for="sorttoarea" class="col-form-label">Area</label>
                <%=Html.TextBoxReq("Sottoarea", ModelSottoaree.Sottoarea, "Sottoarea")%>
            </div>
        </div>

        <div class="form-row">            
            <div class="form-group col-md-10">
                <label for="descrizione" class="col-form-label">Descrizione area</label>
                <%=Html.TextBox("Descrizione", ModelAree.Descrizione, "Descrizione sottoarea")%>
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
