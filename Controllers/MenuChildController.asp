<%

class MenuChildController
	Dim ModelMenuChild
	Dim ModelMenu
  Dim ModelError
	Dim ViewData

	private sub Class_Initialize()
		Set ViewData = Server.CreateObject("Scripting.Dictionary")
	end sub

	private sub Class_Terminate()
	end sub

	public Sub Create(vars)
	  set ModelMenuChild = new MenuChild
		set ModelMenu = new MenuHelper.SelectById(vars("id"))
	  %> <!--#include file="../views/Settings/MenuChild/Create.asp" --> <%
	End Sub

	public Sub CreatePost(argouments)
		If (Session("ruolo.Codice") = "{1AAE19DF-9B98-E711-97A0-54EE7553F044}") Then
			Dim obj, objh
			set objh = new MenuChildHelper
			set obj = new MenuChild
				obj.Id = argouments("id")
				if (argouments("ordine") <> "") then
					obj.Ordine = argouments("ordine")
				else
					obj.Ordine = 0
				end if
				obj.Parent_id = argouments("parent_id")
				obj.Fa_icon = argouments("fa_icon")
				obj.Label = argouments("label")
				obj.Controller = argouments("controller")
				obj.Action = argouments("action")
				obj.Vars = argouments("vars")
				if ((obj.Controller = "") AND (obj.Action = "")) then
					obj.Link = ""
				elseif (obj.Vars <> "") then
					obj.Link = "?controller=" & obj.Controller & "&action=" & obj.Action & "&" & obj.Vars
				else
					obj.Link = "?controller=" & obj.Controller & "&action=" & obj.Action
				end if
				obj.Pills = argouments("pills")
				obj.Active = argouments("active")= "on"
				obj.Created_at = Replace(Now, ".", ":")
				obj.Updated_at = Replace(Now, ".", ":")
			obj.Id = objh.Insert(obj)
			' LogSettings
				Dim log, logHelper
				set log = new LogSettings
					log.User_id = Session("user_id")
					log.Logging = Replace("<span class='badge badge-success'><i class='fa fa-plus' aria-hidden='true'></i> Inserito nuovo Menu di secondo livello: <strong>" & obj.Label & "</strong></span>", "'", "''")
					log.Created_at = Replace(Now, ".", ":")
				set logHelper = new LogSettingsHelper
						logHelper.Insert(log)
			' \LogSettings
		else
			Set ModelError = new Error
			ModelError.Messaggio = "Attenzione, non hai i permessi per accedere a questa risorsa."
			ModelError.Tipologia = "alert-danger"
		end if
		Response.Redirect("?controller=Menu&action=List")
	End Sub

	Public Sub Edit(vars)
		If (Session("ruolo.Codice") = "{1AAE19DF-9B98-E711-97A0-54EE7553F044}") Then
			Set ModelMenuChild = new MenuChildHelper.SelectById(vars("id"))
			Set ModelMenu = new MenuHelper.SelectById(ModelMenuChild.Parent_id)
			%>   <!--#include file="../Views/Settings/MenuChild/Edit.asp" --> <%
		else
			Set ModelError = new Error
			ModelError.Messaggio = "Attenzione, non hai i permessi per accedere a questa risorsa."
			ModelError.Tipologia = "alert-danger"
			%>   <!--#include file="../Views/Settings/Menu/List.asp" --> <%
		end if
	End Sub

	public Sub EditPost(argouments)
			Dim obj, objh, ack
			set objh = new MenuChildHelper
			set obj = new MenuChild
			set obj = objh.SelectById(argouments("id"))
			obj.Id = argouments("id")
			if (argouments("ordine") <> "") then
				obj.Ordine = argouments("ordine")
			else
				obj.Ordine = 0
			end if
			obj.Parent_id = argouments("parent_id")
			obj.Fa_icon = argouments("fa_icon")
			obj.Label = argouments("label")
			obj.Controller = argouments("controller")
			obj.Action = argouments("action")
			obj.Vars = argouments("vars")
			if ((obj.Controller = "") AND (obj.Action = "")) then
				obj.Link = ""
			elseif (obj.Vars <> "") then
				obj.Link = "?controller=" & obj.Controller & "&action=" & obj.Action & "&" & obj.Vars
			else
				obj.Link = "?controller=" & obj.Controller & "&action=" & obj.Action
			end if
			obj.Pills = argouments("pills")
			obj.Active = argouments("active")= "on"
			obj.Updated_at = Replace(Now, ".", ":")
			ack = objh.Update(obj)
			If (ack = true) then
			' LogSettings
					Dim log, logHelper
					set log = new LogSettings
							log.User_id = Session("user_id")
							log.Logging = Replace("<span class='badge badge-info'><i class='fas fa-pencil-alt' aria-hidden='true'></i> Modificato record in Menu: <strong>" & obj.Label & "</strong></span>", "'", "''")
							log.Created_at = Replace(Now, ".", ":")
					set logHelper = new LogSettingsHelper
							logHelper.Insert(log)
			' \LogSettings
			Else
				Set ModelError = new Error
				ModelError.Messaggio = "Attenzione, si e&grave; verificato un errore, modifiche non salvate correttamente."
				ModelError.Tipologia = "alert-danger"
			End If
			Response.Redirect("?controller=Menu&action=List")
	End Sub

	Public Sub Disable(vars)
		Dim helper
		Set helper = new MenuChildHelper
		Set ModelMenuChild = helper.SelectById(vars("id"))
		ModelMenuChild.Active = False
		helper.ToggleMenu(ModelMenuChild)
		Response.Redirect("?controller=Menu&action=List")
	End Sub

	Public Sub Enable(vars)
		Dim helper
		Set helper = new MenuChildHelper
		Set ModelMenuChild = helper.SelectById(vars("id"))
		ModelMenuChild.Active = True
		helper.ToggleMenu(ModelMenuChild)
		Response.Redirect("?controller=Menu&action=List")
	End Sub

 Public Sub SendError(errore)
    Set ModelError = new Error
    ModelError.Menuo = errore
    %>   <!--#include file="../Views/Settings/Menu/List.asp" --> <%
 End Sub

End Class

%>
