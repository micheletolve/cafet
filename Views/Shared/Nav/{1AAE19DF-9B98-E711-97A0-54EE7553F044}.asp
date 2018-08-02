<!-- Fixed Navbar -->
    <nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
        <a class="navbar-brand" href="?controller=Home&Action=Dashboard"><%=(Session("ruolo"))%> |</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
                <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-tachometer-alt fa-2x pull-left", "Home", "Home", "Dashboard" , "") %></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-book fa-2x pull-left"></i>Log<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="nav-item"><%=Html.ActionLinkFa("fas fa-bookmark", "Log accessi", "LogAccessi", "List" , "") %></li>
                        <li class="nav-item"><%=Html.ActionLinkFa("fas fa-bookmark", "Log notifiche", "LogNotifiche", "List" , "") %></li>
                        <li class="nav-item"><%=Html.ActionLinkFa("fas fa-bookmark", "Log sistema", "LogSistema", "List" , "") %></li>
                        <li class="nav-item"><%=Html.ActionLinkFa("fas fa-bookmark", "Log settings", "LogSettings", "List" , "") %></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-chart-pie fa-2x pull-left"></i>Report investimenti<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-euro-sign", "Report proposte", "ReportInvestimenti", "Index" , "") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-euro-sign", "Budget", "Budget", "Index" , "") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-euro-sign", "Forecast", "Forecast", "Index" , "") %></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-file-alt fa-2x pull-left"></i>Proposte investimento<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-bullhorn", "Tutte le proposte", "Proposte", "List" , "") %></li>
                        <div class="dropdown-divider"></div>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-paper-plane", " Le mie proposte", "Proposte", "ListUser" , "") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pencil-alt", " Proposte da firmare", "ProposteTeam", "ListUser" , "spec=unsigned") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pen-square", " Proposte firmate", "ProposteTeam", "ListUser" , "spec=signed") %></li>
                    </ul>
                </li>

                <li class="nav-item dropdown"><%=Html.ActionLinkFa("fa fa-tasks fa-2x pull-left", "SAPI", "Sapi", "List" , "") %></li>
                <li class="nav-item dropdown"><%=Html.ActionLinkFa("fab fa-product-hunt fa-2x pull-left", "Protocollo", "Protocols", "List" , "") %></li>

                <% ' Controllo se il ruolo è abilitato o meno a vedere il menu settings' %>
                <% if (true) then %>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-cogs fa-2x pull-left"></i>Settings<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <h6 class="dropdown-header"><i class="fas fa-user"></i>|Gestione utenti e ruoli</h6>
                          <li class="nav-item"><%=Html.ActionLinkFa("", "Ruoli", "Role", "List", "") %></li>
                          <li class="nav-item"><%=Html.ActionLinkFa("", "Utenti", "User", "List" , "") %></li>
                          <li class="nav-item"><%=Html.ActionLinkFa("", "Role-based ctrl permission", "Rbac", "List" , "") %></li>
                        <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header"><i class="fas fa-users"></i>|Gestione team interno</h6>
                          <li class="nav-item"><%=Html.ActionLinkFa("", "Ruoli team interno", "RoleTeamInterno", "List", "") %></li>
                          <li class="nav-item"><%=Html.ActionLinkFa("", "Membri team interno", "TeamInterno", "List", "") %></li>
                        <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header"><i class="fas fa-audio-description"></i>|Gestione CdA</h6>
                          <li class="nav-item"><%=Html.ActionLinkFa("", "Membri CdA", "Cda", "List", "") %></li>
                        <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header"><i class="fas fa-cog"></i>|Application settings</h6>
                          <li class="nav-item"><%=Html.ActionLinkFa("", "Aree", "Aree", "List" , "") %></li>
                          <li class="nav-item"><%=Html.ActionLinkFa("", "SottoAree", "Sottoaree", "List", "") %></li>

                          <li class="nav-item"><%=Html.ActionLinkFa("", "Status investimento", "Status", "List" , "") %></li>
                          <li class="nav-item"><%=Html.ActionLinkFa("", "Rilevanza investimento", "Rilevanze", "List" , "") %></li>
                          <li class="nav-item"><%=Html.ActionLinkFa("", "Voci di Budget", "VociBudget", "List" , "") %></li>

                          <li class="nav-item"><%=Html.ActionLinkFa("", "Server smtp", "Smtp", "List" , "") %></li>
                          <li class="nav-item"><%=Html.ActionLinkFa("", "Notifiche", "Notifiche", "List" , "") %></li>

                          <li class="nav-item"><%=Html.ActionLinkFaPills("", "Settaggi scadenze", "ScadenzeBudget", "List", "", "") %></li>

                          <li class="nav-item"><%=Html.ActionLinkFaPills("", "Gestione menu", "Menu", "List", "", "") %></li>

                    </ul>
                </li>
                <% end if %>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item"><%=Html.ActionLinkFaPills("fas fa-envelope fa-2x", "", "Messaggi", "Inbox" , "", Session("countInboxElementUnread")) %> </li>
                <li class="nav-item"><%=Html.ActionLinkFaPills("fas fa-sign-out-alt fa-2x pull-left", "", "Home", "Logout" , "", "") %></li>
            </ul>
        </div>
    </nav>

<!-- /Fixed Navbar -->
