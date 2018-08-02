<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

	

<!--#include file="../../Shared/Sub-Header.asp" -->

<div class="container">
    
    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Eliminazione definitiva area <%=Html.Encode(ModelAree.Area) %>  <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <div class="alert alert-danger" role="alert">
		<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Attenzione! Si sta eliminando irreversibimente questo record per cui non sar&agrave; possibile recuperarlo e potrebbe avere ripercussioni sulle sottoaree ad essa collegate. Se non si &egrave; sicuri non proseguire oltre.
	</div>

    <div class="row">
        <table class="table table-hover">
            <tr>
                <th class="detail"><label for="Area" class="col-form-label">Nome area</label></th>
                <td class="detail"><%=Html.Encode(ModelAree.Area) %></td>
            </tr>
            <tr>
                <th class="detail"><label for="Descrizione" class="col-form-label">Descrizione</label></th>
                <td class="detail"><%=Html.Encode(ModelAree.Descrizione) %></td>
            </tr>
        </table>
    </div>
    <form action="?controller=Aree&action=ErasePost" method="POST" id="ErasePost">
        <%=Html.Hidden("Id", ModelAree.Id) %>

        <button type="submit" class="btn btn-warning"><i class="fas fa-trash fa-lg" aria-hidden="true"></i>Conferma eliminazione</button>
        <button type="button" class="btn btn-secondary btn-action">		
            <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
        </button>
    </form> 
   
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->