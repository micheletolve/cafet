<!--DIG Direttore Generale -->
        <nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
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
                            <li class="nav-item dropdown"><%=Html.ActionLinkFa("fa fa-bullhorn", "Tutte le proposte", "Proposte", "List" , "") %></li>
                            <div class="dropdown-divider"></div>
                            <li class="nav-item dropdown"><%=Html.ActionLinkFa("fa fa-check", "Proposte da valutare", "Proposte", "Lists" , "spec=firmata") %></li>
                            <li class="nav-item dropdown"><%=Html.ActionLinkFa("fa fa-check", "Proposte valutate", "Proposte", "Lists" , "spec=valutata") %></li>
                            <li class="nav-item dropdown"><%=Html.ActionLinkFa("fa fa-check", "Proposte con commessa", "Proposte", "Lists" , "spec=commessa") %></li>
                            <div class="dropdown-divider"></div>              
                            <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-paper-plane", " Inviate", "Proposte", "ListUser" , "") %></li>
                            <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pencil-alt", " Da firmare", "ProposteTeam", "ListUser" , "spec=unsigned") %></li>
                            <li class="nav-item dropdown"><%=Html.ActionLinkFa("fas fa-pen-square", " Firmate", "ProposteTeam", "ListUser" , "spec=signed") %></li>
                        </ul>
                    </li>              
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="nav-item"><%=Html.ActionLinkFa("fas fa-sign-out-alt fa-2x pull-left", "", "Home", "Logout" , "") %></li>
                </ul>        
            </div>
        </nav>
<!--\DIG Direttore Generale -->