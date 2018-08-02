  <footer class="footer">
    <div class="container">
      <span class="text-muted">Copyright 2018 &copy; Biomasse Italia S.p.A.
      <br/><i class="fa fa-code" aria-hidden="true"></i>Developed and Designed by <a href="http://ictm.it/">ICTM Digital Agency</a></span>
      <br/><span class="text-muted"><strong>versione 0.4 alpha release</strong></span>

      <% if (environment = "development") then %>
      <hr/>

      <div class="serve-dev-info">
        <span class="text-muted">
          <%Response.Write("This machine => [ ")%>
          <br/>
          <span class="r-25">
            <%Response.Write("You are browsing this site with => ")%>
            <%Response.Write(Request.ServerVariables("http_user_agent"))%>,
          </span>
          <br/>
          <span class="r-25">
            <%Response.Write("Your IP address is => ")%>
            <%Response.Write(Request.ServerVariables("remote_addr"))%>,
          </span>
          <br/>
          <%Response.Write(" ] ")%>
          <br/>
          <%Response.Write("Application => [ ")%>
          <br/>
          <span class="r-25">
            <%Response.Write("The method used to call the page => ")%>
            <%Response.Write(Request.ServerVariables("request_method"))%>,
          </span>
          <br/>
          <span class="r-25">
            <%Response.Write("Query information stored in the string in the HTTP request => ")%>
            <%Response.Write(Request.ServerVariables("QUERY_STRING"))%>,
          </span>
          <br/>
          <span class="r-25">
            <%Response.Write("Http referer => ")%>
            <%Response.Write(Request.ServerVariables("HTTP_REFERER"))%>,
          </span>
          <br/>
          <span class="r-25">
            <%Response.Write("Path => [ ")%>
          </span>
          <br/>
          <span class="r-50">
            <%Response.Write("Physical path => ")%>
            <%Response.Write(Request.ServerVariables("APPL_PHYSICAL_PATH"))%>,
          </span>
          <br/>
          <span class="r-50">
            <%Response.Write("Path => ")%>
            <%Response.Write(Request.ServerVariables("PATH_INFO"))%>,
          </span>
          <br/>
          <span class="r-50">
            <%Response.Write("Path => ")%>
            <%Response.Write(Request.ServerVariables("PATH_TRANSLATED"))%>,
          </span>
          <br/>
          <span class="r-50">
            <%Response.Write(" ], ")%>
          </span>
          <br/>
          <%Response.Write(" ] ")%>
          <br/>
          <%Response.Write("Server => [ ")%>
          <br/>
            <span class="r-25">
              <%Response.Write("The server's domain name => ")%>
              <%Response.Write(Request.ServerVariables("server_name"))%>,
            </span>
            <br/>
            <span class="r-25">
              <%Response.Write("The server's port => ")%>
              <%Response.Write(Request.ServerVariables("server_port"))%>,
            </span>
            </br>
            <span class="r-25">
              <%Response.Write("The server's software => ")%>
              <%Response.Write(Request.ServerVariables("server_software"))%>
            </span>
            </br>
            <%Response.Write(" ] ")%>
            <br>
        </span>
      </div>
      <% end if %>
    </div>
  </footer>

  </body>
</html>
