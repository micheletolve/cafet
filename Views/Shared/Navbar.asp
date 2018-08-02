<!-- Fixed Navbar -->
    <nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
        <a class="navbar-brand" href="?controller=Home&Action=Dashboard"><%=(Session("ruolo"))%> |</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
              <%
              Set nav = new Menu
              Set helper = new MenuHelper
              Set nav = helper.SelectActive(CInt(Session("ruolo.ID")))
              if not isNothing(nav) then
                for each item in nav.Items
                  if (item.Link = "") then
                %>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="<%=item.Fa_icon%>"></i><%=item.Label%><span class="caret"></span></a>
                      <ul class="dropdown-menu">
                        <%
                        'Ciclare cercando gli elementi figlio dalla tabella menuChild
                          Set child = new MenuChild
                          Set childHelper = new MenuChildHelper
                          Set child = childHelper.SelectActiveByParentId(item.id, CInt(Session("ruolo.ID")))
                          if not isNothing (child) then
                            for each obj in child.Items
                              if (obj.Link <> "") then
                              %>
                                <li class="nav-item"><%=Html.ActionLinkFa(obj.Fa_icon, obj.Label, obj.Controller, obj.Action, obj.Vars) %></li>
                              <%
                              elseif ((obj.Link = "") AND (obj.Label = "")) then
                              %>
                                <li class="dropdown-divider"></li>
                              <%
                              else
                              %>
                                <h6 class="dropdown-header"><i class="<%=obj.Fa_icon%>"></i>|<%=obj.Label%></h6>
                              <%
                              end if
                            next
                          end if
                        %>
                      </ul>
                  </li>
                <%
                  else
                %>
                  <li class="nav-item dropdown"><%=Html.ActionLinkFa(item.Fa_icon, item.Label, item.Controller, item.Action, item.Vars) %></li>
                <%
                  end if
                next
              end if
              %>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item"><%=Html.ActionLinkFaPills("fas fa-envelope fa-2x", "", "Messaggi", "Inbox" , "", Session("countInboxElementUnread")) %> </li>
                <li class="nav-item"><%=Html.ActionLinkFaPills("fas fa-sign-out-alt fa-2x pull-left", "", "Home", "Logout" , "", "") %></li>
            </ul>
        </div>
    </nav>

<!-- /Fixed Navbar -->
