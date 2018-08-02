<%
class cHTMLHelper

	Public Function Encode (elValue)
	    if Not IsNothing(elValue) Then
			Encode = Server.HTMLEncode(elValue)
		End If
	End Function

	Public Function EncodeCur (elValue)
	    if Not IsNothing(elValue) Then
			EncodeCur = FormatCurrency(elValue)
		End If
	End Function

	Public Function NoEncode (elValue)
	    if Not IsNothing(elValue) Then
			NoEncode = elValue
		End If
	End Function

	Public Function EncodeFormatDate (elValue)
		Dim aaaa, mm, gg
	    if Not IsNothing(elValue) Then
			aaaa = DatePart("yyyy", elValue)
			mm = DatePart("m", elValue)
			gg = DatePart("d", elValue)
			EncodeFormatDate = aaaa & "/" & mm & "/" & gg
		End If
	End Function

	Public Function EncodeFormatDateIT (elValue, format)
	    if Not IsNothing(elValue) Then
			EncodeFormatDateIT = FormatDateTime(elValue, format)
		End If
	End Function

	Public Function Label (elValue, objfor)
		Label = "<label for='" + objfor + "'>" + Encode(elValue) + "</label>"
	End Function

	Public Function Hidden ( elID, elValue)
	    Hidden =  "<input id='" + elID + "' name='" + elID + "' type='hidden' value='" + Encode(elValue) + "' />"
	End Function

	Public Function TextBox (elId, elValue, elPlaceHolder)
		TextBox = "<input class='form-control' id='" + elID + "' name='" + elID + "' type='text' value='" + Encode(elValue) + "' placeholder='" + elPlaceHolder + "' />"
	End Function

	Public Function TextBoxReq (elId, elValue, elPlaceHolder)
		TextBoxReq = "<input class='form-control' id='" + elID + "' name='" + elID + "' type='text' value='" + Encode(elValue) + "' placeholder='" + elPlaceHolder + "' required  />"
	End Function

	Public Function TextBoxReqAjax (elId, elValue, elPlaceHolder, elOnKeyUp)
		TextBoxReqAjax = "<input class='form-control' id='" + elID + "' name='" + elID + "' type='text' value='" + Encode(elValue) + "' placeholder='" + elPlaceHolder + "' + "' onkeyup='" + elOnKeyUp + "'required  />"
	End Function

	Public Function TextBoxReader (elId, elValue, elPlaceHolder)
		TextBoxReader = "<input class='form-control' id='" + elID + "' name='" + elID + "' type='text' value='" + Encode(elValue) + "' placeholder='" + elPlaceHolder + "' disabled  />"
	End Function

	Public Function Data (elId, elValue)
		Data = "<input id='" + elID + "' name='" + elID + "' type='date' value='" + Encode(elValue) + "' />"
	End Function

	Public Function DataReq (elId, elValue)
		DataReq = "<input class='form-control' id='" + elID + "' name='" + elID + "' type='date' value='" + Encode(elValue) + "' required  />"
	End Function

	Public Function Number (elId, elValue)
		Number = "<input class='form-control' id='" + elID + "' name='" + elID + "' type='number' value='" + Encode(elValue) + "' />"
	End Function

	Public Function NumberReq (elId, elValue)
		NumberReq = "<input class='form-control' id='" + elID + "' name='" + elID + "' type='number' value='" + Encode(elValue) + "' required  />"
	End Function

    Public Function Password (elId, elValue, elPlaceHolder)
		Password = "<input class='form-control' id='" + elID + "' name='" + elID + "' type='password' value='" + Encode(elValue) + "' placeholder='" + elPlaceHolder + "'/>"
	End Function

	Public Function PasswordReq (elId, elValue, elPlaceHolder)
		PasswordReq = "<input class='form-control' id='" + elID + "' name='" + elID + "' type='password' value='" + Encode(elValue) + "' placeholder='" + elPlaceHolder + "' required/>"
	End Function

	Public Function TextArea (elId, elValue, cols, rows)
		TextArea = "<textarea class='form-control' id='" + elID + "' name='" + elID + "' cols='" + Encode(cols) + "' rows='" + Encode(rows) + "'>" + Encode(elValue) + "</textarea>"
	End Function

	Public Function TextAreaReq (elId, elValue, cols, rows)
		TextAreaReq = "<textarea class='form-control' id='" + elID + "' name='" + elID + "' cols='" + Encode(cols) + "' rows='" + Encode(rows) + "' required>" + Encode(elValue) + "</textarea>"
	End Function

	Public Function TextAreaReader (elId, elValue, cols, rows)
		TextAreaReader = "<textarea class='form-control' id='" + elID + "' name='" + elID + "' cols='" + Encode(cols) + "' rows='" + Encode(rows) + "' disabled>" + Encode(elValue) + "</textarea>"
	End Function

	Public Function RadioBox( elId, elValue)
		RadioBox = "<input class='form-check-input' type='radio' id='" + elID + "' name='" + elID + "' value='" + Encode(elValue) + "' />"
	End Function

	Public Function RadioBoxReq( elId, elValue)
		RadioBoxReq = "<input class='form-check-input' type='radio' id='" + elID + "' name='" + elID + "' value='" + Encode(elValue) + "' required />"
	End Function

	Public Function RadioBoxChecked( elId, elValue)
		RadioBoxChecked = "<input class='form-check-input' type='radio' id='" + elID + "' name='" + elID + "' value='" + Encode(elValue) + "' checked />"
	End Function

	Public Function UploadFile (elId)
		UploadFile = "<input id='" + elID + "' name='" + elId + "' type='file' />"
	End Function

	Public Function UploadFileReq (elId)
		UploadFileReq = "<input id='" + elID + "' name='" + elId + "' type='file' required/>"
	End Function

	Public Function DataList(elId, listObj, idName, ValueName)
		Dim resStr, listItem
		resStr = "<input class='form-control' type='text' list='" + elId + "_list' name='" + elId + "' id='" + elId + "'> <datalist id='" + elId + "_list'>"
		For Each listItem in listObj.Items
			Dim optValue, optDataValue
		    optValue = Eval("listItem." + idName)
		    optDataValue  = Eval("listItem." + valueName)
			resStr = resStr + "<option value='"+Encode(optValue)+"' data-value='"+Encode(optDataValue)+"'>"
		Next
		resStr = resStr & "</datalist>"
		DataList = resStr
	End Function

	Public Function DataListReq(elId, listObj, idName, ValueName)
		Dim resStr, listItem
		resStr = "<input class='form-control' type='text' list='" + elId + "_list' name='" + elId + "' id='" + elId + "' required> <datalist id='" + elId + "_list'>"
		For Each listItem in listObj.Items
			Dim optValue, optDataValue
		    optValue = Eval("listItem." + idName)
		    optDataValue  = Eval("listItem." + valueName)
			resStr = resStr + "<option value='"+Encode(optValue)+"' data-value='"+Encode(optDataValue)+"'>"
		Next
		resStr = resStr & "</datalist>"
		DataListReq = resStr
	End Function

	Public Function DropDownListArray(elId, elValue, listArray, idName, ValueName)
		Dim resStr, itemArray, items, item
		resStr = "<select class='form-control' required id='" + elId + "' name='" + elId + "'>"
		If isArray(listArray) Then
			items = UBound(listArray)
			For item = 0 to items
			Dim optValue, optText
				optValue = listArray(item)
				optText  = listArray(item)
				If optText = "" Then
					optText = "---Selezionare un valore---"
				End If
				if elValue = optValue Then
					resStr = resStr + "<option selected='selected' value='" + Encode(optValue) + "'>" + Encode(optText) + "</option>"
				else
					resStr = resStr + "<option value='" + Encode(optValue) + "'>" + Encode(optText) + "</option>"
				End If
			Next
		End If
		resStr = resStr & "</select>"
		DropDownListArray = resStr
	End Function

	Public Function DropDownList (elId, elValue, list , idName, valueName)
		Dim resStr, listItem
		resStr= "<select class='form-control' id='" + elID + "' name='" + elID + "'><option></option>"
		For Each listItem in List
		    Dim optValue, optText
		    optValue = Eval("listItem." + idName)
		    optText  = Eval("listItem." + valueName)
			If optText = "" Then
					optText = "---Selezionare un valore---"
				End If
			if elValue = optValue Then
				resStr = resStr + "<option selected='selected' value='" + Encode(optValue) + "'>" + Encode(optText) + "</option>"
			else
				resStr = resStr + "<option value='" + Encode(optValue) + "'>" + Encode(optText) + "</option>"
			End If
		Next
		resStr = resStr & "</select>"
		DropDownList = resStr
	End Function

	Public Function ActionlinkReferer (linkText, refererHttp)
		'Stop
		Dim strVars

		if IsEmpty(refererHttp) or IsNull(refererHttp) then
			strVars = ""
		else
			if IsArray(refererHttp) then
				for each varPair in refererHttp
					strVars = refererHttp + "&" + varPair
				next
			else
				strVars = refererHttp
			End if
		End if

		if (strVars<>"") then
			strVars = "&" + strVars
		End if

		ActionlinkReferer = "<a href='" + Encode(refererHttp) + "'>" + Encode(linkText) + "</a>"

	End Function

    Public Function ActionLink(linkText, linkController, linkAction, linkVars)
		'Stop
		Dim strVars

		If IsEmpty(linkVars) or IsNull(linkVars) then
			strVars = ""
		else
			if IsArray(linkVars) then
				for each varPair in linkVars
					strVars  = strVars + "&" + varPair
				next
			else
				strVars = linkVars
			end if
		end if

		if (strVars<>"") then
			strVars = "&" + strVars
		End if

		ActionLink = "<a href='?controller=" + Encode(linkController)+ "&action=" + Encode(linkAction)  +   Encode(strVars) + "'>" + Encode(linkText) + "</a>"
	End Function

	Public Function ActionLinkImage(ImageTitle, linkController, linkAction, linkVars)
		'Stop
		Dim strVars

		If IsEmpty(linkVars) or IsNull(linkVars) then
			strVars = ""
		else
			if IsArray(linkVars) then
				for each varPair in linkVars
					strVars  = strVars + "&" + varPair
				next
			else
				strVars = linkVars
			end if
		end if

		if (strVars<>"") then
			strVars = "&" + strVars
		End if

		ActionLinkImage = "<a href='?controller=" + Encode(linkController)+ "&action=" + Encode(linkAction)  +   Encode(strVars) + "'>" + "<img src='./Resource/image/" + Encode(ImageTitle) + ".png' alt='" + Encode(ImageTitle) + "'/>" + "</a>"
	End Function

	Public Function ActionLinkFa(fa, linkText, linkController, linkAction, linkVars)
		'Stop
		Dim strVars

		If IsEmpty(linkVars) or IsNull(linkVars) then
			strVars = ""
		else
			if IsArray(linkVars) then
				for each varPair in linkVars
					strVars  = strVars + "&" + varPair
				next
			else
				strVars = linkVars
			end if
		end if

		if (strVars<>"") then
			strVars = "&" + strVars
		End if

		ActionLinkFa = "<a href='?controller=" + Encode(linkController)+ "&action=" + Encode(linkAction)  +   Encode(strVars) + "'><i class='" + Encode(fa) + "'></i>" + Encode(linkText) + "</a>"
	End Function

	Public Function ActionLinkFaPills(fa, linkText, linkController, linkAction, linkVars, num)
		'Stop
		Dim strVars

		If IsEmpty(linkVars) or IsNull(linkVars) then
			strVars = ""
		else
			if IsArray(linkVars) then
				for each varPair in linkVars
					strVars  = strVars + "&" + varPair
				next
			else
				strVars = linkVars
			end if
		end if

		if (strVars <> "") then
			strVars = "&" + strVars
		End if

		if (num <> "") then
			ActionLinkFaPills = "<a href='?controller=" + Encode(linkController)+ "&action=" + Encode(linkAction)  +   Encode(strVars) + "'><i class='" + Encode(fa) + "'></i>" + Encode(linkText) + " <span class='badge badge-success'>"+ Encode(num) +"</span></a>"
		else
			ActionLinkFaPills = "<a href='?controller=" + Encode(linkController)+ "&action=" + Encode(linkAction)  +   Encode(strVars) + "'><i class='" + Encode(fa) + "'></i>" + Encode(linkText) + "</a>"
		end if
	End Function

	Public Function ActionLinkFaModal(fa, linkText, linkController, linkAction, linkVars, target)
		'Stop
		Dim strVars

		If IsEmpty(linkVars) or IsNull(linkVars) then
			strVars = ""
		else
			if IsArray(linkVars) then
				for each varPair in linkVars
					strVars  = strVars + "&" + varPair
				next
			else
				strVars = linkVars
			end if
		end if

		if (strVars<>"") then
			strVars = "&" + strVars
		End if

		ActionLinkFaModal = "<a data-toggle='modal' href='?controller=" + Encode(linkController)+ "&action=" + Encode(linkAction)  +   Encode(strVars) + "' data-target='#" + Encode(target) + "'><i class='" + Encode(fa) + "'></i>" + Encode(linkText) + "</a>"
	End Function

	Public Function CheckBox( elId, elValue)
	    Dim checked
	    if (elValue = 1) or (elValue = true) or (LCase(elValue) = "true")  or (LCase(elValue) = "on") Then
			checked = "CHECKED"
		else
			checked = ""
		end If
		CheckBox = "<input class='form-check-input' type='checkbox' id='" + elID + "' name='" + elID + "' " + checked + " />"
		Encode(elValue)
	End Function

	Public Function CheckBoxMulti( elId, elName, elValue)
	    Dim checked
	    if (elValue = 1) or (elValue = true) or (LCase(elValue) = "true") Then
			checked = "CHECKED"
		else
			checked = ""
		end If
		CheckBoxMulti = "<input class='form-check-input' type='checkbox' id='" + elID + "' name='" + elID + "' value='" + elName + "' " + checked + " />"
		Encode(elValue)
	End Function

	Public Function CheckBoxReq( elId, elValue)
	    Dim checked
	    if (elValue = 1) or (elValue = true) or (LCase(elValue) = "true") Then
			checked = "CHECKED"
		else
			checked = ""
		end If
		CheckBoxReq = "<input class='form-check-input' type='checkbox' id='" + elID + "' name='" + elID + "' " + checked + " />"
		Encode(elValue)
	End Function

	Public Function CheckBoxReader( elId, elValue)
	    Dim checked
	    if (elValue = 1) or (elValue = true) or (LCase(elValue) = "true") Then
			checked = "CHECKED"
		else
			checked = ""
		end If
		CheckBoxReader = "<input class='form-check-input' type='checkbox' id='" + elID + "' name='" + elID + "' " + checked + " disabled/>"
		Encode(elValue)
	End Function

	Public Function CheckBoxReader2Image(elValue)
	    Dim checked
	    if (elValue = 1) or (elValue = true) or (LCase(elValue) = "true") Then
			checked = "<img src='../Resource/image/checked.png' />"
		else
			checked = "<img src='../Resource/image/unchecked.png' />"
		end If
		CheckBoxReader2Image = checked
		Encode(elValue)
	End Function

	Public Sub RenderControllerAction(controller,action,vars)
		Dim controllerName
        controllerName = controller + "Controller"
        Dim controllerInstance
        Set controllerInstance = Eval ( " new " +  controllerName)
        Dim actionCallString
		If Not (IsNothing(vars)) then
                actionCallString = " controllerInstance." + action + "(vars)"
            Else
                actionCallString = " controllerInstance." + action + "()"
            End If
            Eval (actionCallString)
	End Sub


end class

public Html
set Html = new cHTMLHelper
%>
