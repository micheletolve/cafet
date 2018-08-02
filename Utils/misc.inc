<%

  Public Function iif(psdStr, trueStr, falseStr)
    if psdStr then
      iif = trueStr
    else 
      iif = falseStr
    end if
  End Function

  Public Function if_then_else(psdStr, trueStr, falseStr)
    if_then_else = iif(psdStr, trueStr, falseStr)
  End Function

  Public Function IsNothing(var)
    if(IsObject(var)) then
        IsNothing = (var is nothing) or IsEmpty(var) or IsNull(var)
    else
        IsNothing = IsEmpty(var) or IsNull(var)
    end if
  End Function

  Public Function StringFormat(ByVal SourceString , Arguments() ) 
   Dim objRegEx 'As RegExp  ' regular expression object
   Dim objMatch 'As Match   ' regular expression match object
   Dim strReturn 'As String ' the string that will be returned

   Set objRegEx = New RegExp
   objRegEx.Global = True
   objRegEx.Pattern = "(\{)(\d{0,50})(\})"

   strReturn = SourceString
   For Each objMatch In objRegEx.Execute(SourceString)
      strReturn = Replace(strReturn, objMatch.Value, Arguments(CInt(objMatch.SubMatches(1))))
   Next 
   StringFormat = strReturn
End Function

%>