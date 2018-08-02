<%

dim oConn
set oConn = Nothing

public function DbOpenConnection()
   if oConn is nothing then
      set oConn = CreateObject("ADODB.Connection")
      oConn.Mode = 3
      oConn.ConnectionString = "Provider=SQLOLEDB.1;PersistSecurity Info=False;Data Source=WEBSRV;initial catalog=simiDB;user id=sa;password=ICTm123"
      oConn.Open
   end if
   set DbOpenConnection = oConn
end function

public function DbCloseConnection()
   if not oConn is nothing Then
      oConn.Close                     
      set oConn = nothing
   End If
   set DbCloseConnection = oConn
end function

public function DbExecute(sql)
   dim oConnection
   set oConnection = DbOpenConnection()
   on error resume next
        set DbExecute = oConnection.execute(sql)
   if err.description <> "" Then
        Response.write(sql)
        Response.write("<br/>SQL Error description: " & err.description)
        Response.write("<br/>SQL Error source: " & err.source)
        Response.write("<br/>SQL Error number: " & err.number)
        Response.end
  end if
end function

getArea_id = request.QueryString("id")

Dim result, txtSQL

txtSQL = "SELECT * FROM [Sottoaree] WHERE area_id = " + getArea_id
set records = DbExecute(txtSQL)
if not records.eof then %>
    <label for="sottoarea_id" class="col-form-label">Sotto Area</label>
    <select class="form-control" id="sottoarea_id" name="sottoarea_id">
        <%
            while not records.eof
                sottoarea_id = records("id")
                sottoarea = records("sottoarea")
                %><option selected="selected" value="<%=sottoarea_id%>"><%=sottoarea%></option><%
                records.movenext
            wend
            records.Close
        %>
    </select>
<% else %>
    <label for="sottoarea_id" class="col-form-label">Sotto Area</label>
    <p class="form-control">Non sono presenti sottoaree per l'area selezionata</p>
<% end if %>
