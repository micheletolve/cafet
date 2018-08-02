<!-- Fixed Navbar -->
<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
    <% If (Session("ruolo.Codice") = "{1AAE19DF-9B98-E711-97A0-54EE7553F044}") Then %>
        <a class="navbar-brand" href="?controller=Home&Action=Dashboard"><%=Html.Encode(Session("ruolo"))%> |</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
                <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-tachometer-alt fa-2x pull-left", "Home", "Home", "Dashboard" , "") %></li>                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-book fa-2x pull-left"></i>Logging<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="nav-item"><%=Html.ActionLinkFa("fa fa-dot-circle-o", "Log accessi", "LogAccessi", "List" , "") %></li>
                        <li class="nav-item"><%=Html.ActionLinkFa("fa fa-circle", "Log notifiche", "LogNotifiche", "List" , "") %></li>
                        <li class="nav-item"><%=Html.ActionLinkFa("fa fa-dot-circle-o", "Log sistema", "LogSistema", "List" , "") %></li>
                        <li class="nav-item"><%=Html.ActionLinkFa("fa fa-circle", "Log settings", "LogSettings", "List" , "") %></li>
                    </ul>
                </li>           
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-file-alt fa-2x pull-left"></i>Proposte investimento<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fa fa-bullhorn", "Tutte le proposte", "Proposte", "List" , "") %></li>
                        <div class="dropdown-divider"></div>                  
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-paper-plane", " Inviate", "Proposte", "ListUser" , "") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pencil-alt", " Da firmare", "ProposteTeam", "ListUser" , "spec=unsigned") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pen-square", " Firmate", "ProposteTeam", "ListUser" , "spec=signed") %></li>
                    </ul>
                </li>
                
                <li class="nav-item dropdown"><%=Html.ActionLinkFa("fab fa-product-hunt fa-2x pull-left", "Protocollo", "Protocols", "List" , "") %></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cogs fa-2x pull-left"></i>Settings<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <h6 class="dropdown-header">Utenti</h6>                        
                            <li class="nav-item"><%=Html.ActionLinkFa("fa fa-puzzle-piece", "Ruoli", "Role", "List", "") %></li>
                            <li class="nav-item"><%=Html.ActionLinkFa("fa fa-user", "Utenti", "User", "List" , "") %></li>                            
                            <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header">Team interno</h6>                        
                            <li class="nav-item"><%=Html.ActionLinkFa("fa fa-puzzle-piece", "Ruoli", "RoleTeamInterno", "List", "") %></li>
                            <li class="nav-item"><%=Html.ActionLinkFa("fa fa-users", "Utenti", "TeamInterno", "List", "") %></li>
                        <div class="dropdown-divider"></div>                 
                        <li class="nav-item"><%=Html.ActionLinkFa("fa fa-cog", "Aree", "Aree", "List" , "") %></li>
                        <li class="nav-item"><%=Html.ActionLinkFa("fa fa-cog", "SottoAree", "Sottoaree", "List", "") %></li>
                        <div class="dropdown-divider"></div>
                        <li class="nav-item"><%=Html.ActionLinkFa("fa fa-cog", "Status investimento", "Status", "List" , "") %></li>
                        <li class="nav-item"><%=Html.ActionLinkFa("fa fa-cog", "Rilevanza investimento", "Rilevanze", "List" , "") %></li>
                        <li class="nav-item"><%=Html.ActionLinkFa("fa fa-cog", "Voci di Budget", "VociBudget", "List" , "") %></li>
                        <div class="dropdown-divider"></div>
                        <li class="nav-item"><%=Html.ActionLinkFa("fa fa-cog", "Server smtp", "Smtp", "List" , "") %></li>
                        <li class="nav-item"><%=Html.ActionLinkFa("fa fa-cog", "Notifiche", "Notifiche", "List" , "") %></li>
                        
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item"><%=Html.ActionLinkFa("fas fa-sign-out-alt fa-2x pull-left", "", "Home", "Logout" , "") %></li>
            </ul>        
        </div>
<!--DM Delivery Manager-->
    <% ElseIf (Session("ruolo.Codice") = "{912185FF-9B98-E711-97A0-54EE7553F044}") Then %>
        <a class="navbar-brand" href="?controller=Home&Action=Dashboard"><%=Html.Encode(Session("ruolo"))%> |</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
                <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-tachometer-alt fa-2x pull-left", "Home", "Home", "Dashboard" , "") %></li>                                            
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-file-alt fa-2x pull-left"></i>Proposte investimento<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-paper-plane", " Inviate", "Proposte", "ListUser" , "") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pencil-alt", " Da firmare", "ProposteTeam", "ListUser" , "spec=unsigned") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pen-square", " Firmate", "ProposteTeam", "ListUser" , "spec=signed") %></li>
                        <div class="dropdown-divider"></div>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fa fa-bullhorn", "Altro...", "", "" , "") %></li>
                    </ul>
                </li>                
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item"><%=Html.ActionLinkFa("fas fa-sign-out-alt fa-2x pull-left", "", "Home", "Logout" , "") %></li>
            </ul>        
        </div>
<!--\Delivery Manager-->
<!--SSAQ Responsabile del Sistema di Gestione Sicurezza, Salute Ambiente e Qualita-->
    <% ElseIf (Session("ruolo.Codice") = "{0D140D92-9D98-E711-97A0-54EE7553F044}") Then %>
        <a class="navbar-brand" href="?controller=Home&Action=Dashboard"><%=Html.Encode(Session("ruolo"))%> |</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
                <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-tachometer-alt fa-2x pull-left", "Home", "Home", "Dashboard" , "") %></li>                                            
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-file-alt fa-2x pull-left"></i>Proposte investimento<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-paper-plane", " Inviate", "Proposte", "ListUser" , "") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pencil-alt", " Da firmare", "ProposteTeam", "ListUser" , "spec=unsigned") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pen-square", " Firmate", "ProposteTeam", "ListUser" , "spec=signed") %></li>
                        <div class="dropdown-divider"></div>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fa fa-bullhorn", "Altro...", "", "" , "") %></li>
                    </ul>
                </li>                
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item"><%=Html.ActionLinkFa("fas fa-sign-out-alt fa-2x pull-left", "", "Home", "Logout" , "") %></li>
            </ul>        
        </div>
<!--\SSAQ Responsabile del Sistema di Gestione Sicurezza, Salute Ambiente e Qualita-->
<!--RU Responsabile Risorse Umane-->
    <% ElseIf (Session("ruolo.Codice") = "{0064605E-9D98-E711-97A0-54EE7553F044}") Then %>
        <a class="navbar-brand" href="?controller=Home&Action=Dashboard"><%=Html.Encode(Session("ruolo"))%> |</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
                <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-tachometer-alt fa-2x pull-left", "Home", "Home", "Dashboard" , "") %></li>                                            
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-file-alt fa-2x pull-left"></i>Proposte investimento<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-paper-plane", " Inviate", "Proposte", "ListUser" , "") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pencil-alt", " Da firmare", "ProposteTeam", "ListUser" , "spec=unsigned") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pen-square", " Firmate", "ProposteTeam", "ListUser" , "spec=signed") %></li>
                        <div class="dropdown-divider"></div>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fa fa-bullhorn", "Altro...", "", "" , "") %></li>
                    </ul>
                </li>                
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item"><%=Html.ActionLinkFa("fas fa-sign-out-alt fa-2x pull-left", "", "Home", "Logout" , "") %></li>
            </ul>        
        </div>
<!--\SSAQ Responsabile Risorse Umane-->
<!--RSG Responsabile Servizi Generali-->
    <% ElseIf (Session("ruolo.Codice") = "{8A379F3A-9D98-E711-97A0-54EE7553F044}") Then %>
        <a class="navbar-brand" href="?controller=Home&Action=Dashboard"><%=Html.Encode(Session("ruolo"))%> |</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
                <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-tachometer-alt fa-2x pull-left", "Home", "Home", "Dashboard" , "") %></li>                                            
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-file-alt fa-2x pull-left"></i>Proposte investimento<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-paper-plane", " Inviate", "Proposte", "ListUser" , "") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pencil-alt", " Da firmare", "ProposteTeam", "ListUser" , "spec=unsigned") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pen-square", " Firmate", "ProposteTeam", "ListUser" , "spec=signed") %></li>
                        <div class="dropdown-divider"></div>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fa fa-bullhorn", "Altro...", "", "" , "") %></li>
                    </ul>
                </li>                
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item"><%=Html.ActionLinkFa("fas fa-sign-out-alt fa-2x pull-left", "", "Home", "Logout" , "") %></li>
            </ul>        
        </div>
<!--\RSG Responsabile Servizi Generali-->
<!--PM Project Manager-->
    <% ElseIf (Session("ruolo.Codice") = "{3DB7B663-9C98-E711-97A0-54EE7553F044}") Then %>
        <a class="navbar-brand" href="?controller=Home&Action=Dashboard"><%=Html.Encode(Session("ruolo"))%> |</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav mr-auto">
                <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-tachometer-alt fa-2x pull-left", "Home", "Home", "Dashboard" , "") %></li>                                            
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-file-alt fa-2x pull-left"></i>Proposte investimento<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-paper-plane", " Inviate", "Proposte", "ListUser" , "") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pencil-alt", " Da firmare", "ProposteTeam", "ListUser" , "spec=unsigned") %></li>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pen-square", " Firmate", "ProposteTeam", "ListUser" , "spec=signed") %></li>
                        <div class="dropdown-divider"></div>
                        <li class="nav-item dropdown"><%=Html.ActionLinkFa("fa fa-bullhorn", "Altro...", "", "" , "") %></li>
                    </ul>
                </li>                
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item"><%=Html.ActionLinkFa("fas fa-sign-out-alt fa-2x pull-left", "", "Home", "Logout" , "") %></li>
            </ul>        
        </div>
<!--\PM Project Manager-->
    <% Else %>
        <a class="navbar-brand" href="#">SiGEMI.</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">            
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><%=Html.ActionLinkFa("fa fa-home", "Esci", "Home", "Logout" , "") %></li>
            </ul>        
        </div>
    <% End If %>
</nav>
<!-- /Fixed Navbar -->