<!--#include file="../../../utils/check.inc" -->

<!--#include file="../../Shared/Header.asp" -->

<!--#include file="../../Shared/Sub-Header.asp" -->

<div class="container">

  <blockquote class="blockquote"><i class="fa fa-quote-left fa-1x" aria-hidden="true"></i> Configurazione menu dell'applicazione <i class="fa fa-quote-right fa-1x" aria-hidden="true"></i></blockquote>

  <% if Not IsNothing (ModelError) then %>
    <div class="col-sm alert <%Response.Write(ModelError.Tipologia)%> alert-dismissible fade show" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
      <h4 class="alert-heading"><i class="fa fa-exclamation-circle fa-2x pull-left"></i>Si &egrave; verificato un errore processando la richiesta</h4>
      <hr>
      <p class="r-15"><b>Dettagli errore:</b> <%=Html.Encode(ModelError.Messaggio)%></p>
    </div>
  <% else %>

  <nav class="navbar navbar-expand-md navbar-light  bg-light">
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="nav navbar-nav mr-auto">
        <li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-list-ul fa-2x pull-left", "Voci di menu", "Menu", "List" , "") %></li>
        <li class="btn btn-default btn-sm"><%=Html.ActionLinkFa("fa fa-plus-circle fa-2x pull-left", "Aggiungi menu", "Menu", "Create" , "") %></li>
      </ul>
    </div>
  </nav>

  <hr/>

    <% if IsNothing(ModelMenu) then %>
    <div class="alert alert-warning" role="alert">
      <i class="fa fa-exclamation-circle fa-3x pull-left"></i>Whoops! Nessun dato da mostrare.</p>
    </div>
    <% else %>
    <div>
      <table id="" class="table table-sm table-hover display responsive nowrap">
        <thead>
          <tr>
            <th>Ordine</th>
            <th>Icona</th>
            <th>Label</th>
            <th>Link</th>
            <th>Abilitato</th>
            <th></th>
            <th class="text-muted">Inserito il</th>
            <th class="text-muted">Modificato il</th>
          </tr>
        </thead>
        <tbody>
          <% Dim obj, child
          For each obj in ModelMenu.Items
            Set child = new MenuChildHelper.SelectByParentId(obj.id)
          %>
          <tr>
            <td>
              <%=Html.Encode(obj.Ordine) %>
              &nbsp;
              <%=Html.ActionLinkFa("fas fa-caret-up", "", "Menu", "Order" , "id=" + CStr(obj.Id) + "&target=up") %>
              <%=Html.ActionLinkFa("fas fa-caret-down", "", "Menu", "Order" , "id=" + CStr(obj.Id) + "&target=down") %>
            </td>
            <td><i class="<%=Html.Encode(obj.Fa_icon) %>"></i></td>
            <td>
              <% if (obj.Link <> "") then %>
                <%=Html.Encode(obj.Label) %>
              <% else %>
                <%=Html.Encode(obj.Label) %> <i class="fas fa-caret-down"></i>
              <% end if %>
            </td>
            <td>
              <% if (obj.Link <> "") then %>
                <%=Html.Encode(obj.Link) %>

              <% end if %>
            </td>
            <td><%=Html.CheckBoxReader("", obj.Active) %></td>
            <td class="btn-group open">
              <a class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-cog fa-fw"></i> Option </a>
              <ul class="dropdown-menu">
                <li ><%=Html.ActionLinkFa("fas fa-plus-circle"," Aggiungi menu figlio", "MenuChild", "Create" , "id=" + CStr(obj.Id)) %></li>
                <li ><%=Html.ActionLinkFa("fas fa-pencil-alt"," Modifica", "Menu", "Edit" , "id=" + CStr(obj.Id)) %></li>
                <% if (obj.Active = True) then %>
                <li ><%=Html.ActionLinkFa("fas fa-toggle-off"," Disabilita", "Menu", "Disable" , "id=" + CStr(obj.Id))%></li>
                <% else %>
                <li ><%=Html.ActionLinkFa("fas fa-toggle-on"," Abilita", "Menu", "Enable" , "id=" + CStr(obj.Id)) %></li>
                <% end if %>
                <div class="dropdown-divider"></div>
                <li><%=Html.ActionLinkFa("fas fa-lock"," Setta permessi", "Rbac", "Create" , "id=" + CStr(obj.Id)) %></li>
                <li><%=Html.ActionLinkFa("fas fa-eye"," Vedi permessi", "Rbac", "Permitted" , "id=" + CStr(obj.Id)) %></li>
              </ul>
            </td>
            <td class="text-muted"><%=Html.Encode(obj.Created_at) %></td>
            <td class="text-muted"><%=Html.Encode(obj.Updated_at) %></td>
          </tr>
          <%
            if not isNothing (child) then
          %>
          <tr><td colspan="8">
          <table id="" class="table table-sm table-hover display responsive nowrap child">
            <tr>
              <th>Ordine</th>
              <th>Icona</th>
              <th>Label</th>
              <th>Link</th>
              <th>Abilitato</th>
              <th></th>
              <th class="text-muted">Inserito il</th>
              <th class="text-muted">Modificato il</th>
            </tr>
            <%
              For each item in child.Items
          %>
              <tr>
                <td>
                  <%=Html.Encode(item.Ordine) %>
                  &nbsp;
                  <%=Html.ActionLinkFa("fas fa-caret-up", "", "MenuChild", "OrderUp" , "id=" + CStr(item.Id)) %>
                  <%=Html.ActionLinkFa("fas fa-caret-down", "", "MenuChild", "OrderDown" , "id=" + CStr(item.Id)) %>
                </td>
                <td><i class="<%=Html.Encode(item.Fa_icon) %>"></i></td>
                <td>
                  <% if (item.Label <> "") then %>
                    <%=Html.Encode(item.Label) %>
                  <% else %>
                    <span class="badge badge-secondary"><i>divider element</i></span>
                  <% end if %>
                </td>
                <td>
                  <% if (item.Link <> "") then %>
                    <%=Html.Encode(item.Link) %>

                  <% end if %>
                </td>
                <td><%=Html.CheckBoxReader("", item.Active) %></td>
                <td class="btn-group open">
                  <a class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-cog fa-fw"></i> Option </a>
                  <ul class="dropdown-menu">
                    <li ><%=Html.ActionLinkFa("fas fa-pencil-alt"," Modifica", "MenuChild", "Edit" , "id=" + CStr(item.Id)) %></li>
                    <% if (item.Active = True) then %>
                    <li ><%=Html.ActionLinkFa("fas fa-toggle-off"," Disabilita", "MenuChild", "Disable" , "id=" + CStr(item.Id)) %></li>
                    <% else %>
                    <li ><%=Html.ActionLinkFa("fas fa-toggle-on"," Abilita", "MenuChild", "Enable" , "id=" + CStr(item.Id)) %></li>
                    <% end if %>
                    <div class="dropdown-divider"></div>
                    <li><%=Html.ActionLinkFa("fas fa-lock"," Setta permessi", "Rbac", "Create" , "id=" + CStr(item.Id)) %></li>
                    <li><%=Html.ActionLinkFa("fas fa-eye"," Vedi permessi", "Rbac", "Permitted" , "id=" + CStr(item.Id)) %></li>
                  </ul>
                </td>
                <td class="text-muted"><%=Html.Encode(obj.Created_at) %></td>
                <td class="text-muted"><%=Html.Encode(item.Updated_at) %></td>
              </tr>
            <%
              next
            %>
          </table>
        </td></tr>
            <%
            end if
          %>
          <% Next
          End If %>
        </tbody>
      </table>
    </div>
  <% end if %>
</div> <!-- /container -->

<!--#include file="../../Shared/Footer.asp" -->
