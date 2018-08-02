<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->	

<!--#include file="../../Shared/Sub-Header.asp" -->

<div class="container">
    
    <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Associa uno o pi&ugrave; utenti all'area <%=Html.Encode(ModelAree.Area) %> (<%=Html.Encode(ModelAree.Descrizione) %>)  <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>       

    <hr class="style3"> 

    <% If IsNothing(ModelUser) Then%>
        <div class="alert alert-warning">
            <p><i class="fa fa-info-circle fa-3x pull-left" aria-hidden="true"></i> &nbsp; <strong>ATTENZIONE!</strong> Non ci sono pi&ugrave; utenti da poter associare a questa area di investimento. Controlla che non ci siano record cestinati, se cos&igrave; fosse baster&agrave; <i class="fa fa-recycle fa-fw">Ripristinarli</i>.</p>
        </div>

        <div class="action-before">
                <button type="button" class="btn btn-secondary btn-action">		
                    <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
                </button>
            </div>
    <% Else %>
        <form action="?controller=UtentiAree&action=CreatePost" method="POST" id="CreatePost">                

            <%=Html.Hidden("Id", 0) %>
            <%=Html.Hidden("area_id", ModelAree.Id) %>

            <%  Dim obj, role
                For each obj in ModelUser.Items 
                    set role = new RoleHelper.SelectById(obj.Ruolo_id)                    
            %>               		
                    <div class="form-row">
                        <div class="form-group col-md">
                            <label for="" class="col-form-label pull-right"><%=Html.Encode(obj.Nome) %>&nbsp;<%=Html.Encode(obj.Cognome) %>&nbsp;(<strong><%=Html.Encode(role.Descrizione) %></strong>)</label>
                        </div>
                        <div class="form-check col-md">
                            <%=Html.CheckBoxMulti("user_id", CStr(obj.id), ModelUtentiAree.Utente_id)%>
                        </div>
                    </div>
                    <% Next %>

            <div class="action-before">
                <button type="submit" class="btn btn-success"><i class="fa fa-floppy-o fa-lg" aria-hidden="true"></i>Conferna inserimento</button>
                <button type="button" class="btn btn-secondary btn-action">		
                    <i class="fa fa-undo fa-lg"></i><%=Html.ActionlinkReferer("Indietro", Request.ServerVariables("HTTP_REFERER")) %>
                </button>
            </div>
            
        </form>
    <% End If %>  
   
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->