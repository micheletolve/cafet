<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

	

<!--#include file="../../Shared/Sub-Header.asp" -->

<div class="container">
    
    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Sposta nel cestino <%=Html.Encode(ModelVociBudget.VoceBudget) %>  <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

    <div class="alert alert-danger" role="alert">
		<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Attenzione! Si sta spostando questo record nel cestino quindi &egrave; possibile recuperarlo in un secondo momento.
	</div>

    <div class="row">
        <table class="table table-hover">
            <tr>
                <th class="detail"><label for="VoceBudget" class="col-form-label">VoceBudget investimento</label></th>
                <td class="detail"><%=Html.Encode(ModelVociBudget.VoceBudget) %></td>
            </tr>            
        </table>
    </div>

    <form action="?controller=VociBudget&action=DeletePost" method="POST" id="DeletePost">
        <%=Html.Hidden("Id", ModelVociBudget.Id) %>

        <button type="submit" class="btn btn-warning"><i class="fas fa-trash fa-lg" aria-hidden="true"></i>Cestina</button>
        <button type="button" class="btn btn-secondary btn-action">		
            <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
        </button>
    </form> 
   
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->