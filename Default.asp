<!--#include file="utils/utils.inc" -->
<!--#include file="models/models.inc" -->
<!--#include file="controllers/controllers.inc" -->

<%
Const defaultController = "Home"
Const defaultAction = "Index"

  If not Route () then
      result = RouteDebug ()
  End If

Function ContentPlaceHolder()
    If not Route () then
        result = RouteDebug ()
    End If
End Function

Function Route ()
  Dim controller, action , vars
    controller = Request.QueryString("controller")
    action = Request.QueryString("action")
    set vars = CollectVariables()
  Route = False

  If IsEmpty(controller) or IsNull(controller) then
      controller = defaultController
  End If

  If IsEmpty(action) or IsNull(action) then
      action = defaultAction
  End If

  Dim controllerName
  controllerName = controller + "Controller"
  Dim controllerInstance
  Set controllerInstance = Eval ( " new " +  controllerName)
  Dim actionCallString
  If (Instr(1,action,"Post",1)>0) then
      actionCallString = " controllerInstance." + action + "(Request.Form)"
  ElseIf Not (IsNothing(vars)) then
      actionCallString = " controllerInstance." + action + "(vars)"
  Else
      actionCallString = " controllerInstance." + action + "()"
  End If
  Eval (actionCallString)
  Route = true
End Function

Function RouteDebug ()
  Dim controller, action , vars
  controller = Request.QueryString("controller")
  action = Request.QueryString("action")

  Response.Write(controller)
  Response.Write(action)

  dim key, keyValue
  for each key in Request.Querystring
      keyValue = Request.Querystring(key)
      'ignore service keys
      if InStr(1,"controller, action, partial",key,1)=0 Then
          Response.Write( key + " = " + keyValue )
      End If
  next
End Function

Function CollectVariables
    dim key, keyValue
    Set results = Server.CreateObject("Scripting.Dictionary")
    for each key in Request.Querystring
        keyValue = Request.Querystring(key)
        'ignore service keys
        if InStr(1,"controller, action, partial",key,1)=0 Then
            results.Add key,keyValue
        End If
    next
    if results.Count=0 Then
        Set CollectVariables = Nothing
    else
        Set CollectVariables = results
    End If
End Function

%>
