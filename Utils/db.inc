<%

dim oConn
set oConn = Nothing

public function DbOpenConnection()
   if oConn is nothing then
      set oConn = CreateObject("ADODB.Connection")
      oConn.Mode = 3
      oConn.ConnectionString = connectionString
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
  'Next line is only for debug, comment this in production
  if (sqlDebug = "true") then
    Response.write("<span class='badge badge-warning r-5 debug-p'><strong>SQL DEBUG:</strong> <i>" & sql & "</i></span><br/>")
  end if
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



%>
