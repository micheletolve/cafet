<%

class MenuController
	Dim ModelMenu
  Dim ModelError
	Dim ViewData

	private sub Class_Initialize()
		Set ViewData = Server.CreateObject("Scripting.Dictionary")
	end sub

	private sub Class_Terminate()
	end sub

  Public Sub List()
	  If (Session("ruolo.Codice") = "{1AAE19DF-9B98-E711-97A0-54EE7553F044}") Then
	    Dim helper
	    set helper = new MenuHelper
	    set ModelMenu = helper.SelectAll()

	  else
	    Set ModelError = new Error
	    ModelError.Messaggio = "Attenzione, non hai i permessi per accedere a questa risorsa."
			ModelError.Tipologia = "alert-danger"

	  end if
		%>   <!--#include file="../Views/Settings/Menu/List.asp" --> <%
  End Sub

	public Sub Create()
	  set ModelMenu = new Menu
	  %> <!--#include file="../views/Settings/Menu/Create.asp" --> <%
	End Sub

	public Sub CreatePost(argouments)
		If (Session("ruolo.Codice") = "{1AAE19DF-9B98-E711-97A0-54EE7553F044}") Then
			Dim obj, objh
			set objh = new MenuHelper
			set obj = new Menu
				obj.Id = argouments("id")
				if (argouments("ordine") <> "") then
					obj.Ordine = argouments("ordine")
				else
					obj.Ordine = 0
				end if
				obj.Fa_icon = argouments("fa_icon")
				obj.Label = argouments("label")
				obj.Controller = argouments("controller")
				obj.Action = argouments("action")
				obj.Vars = argouments("vars")
				if ((obj.Controller = "") AND (obj.Action = "")) then
					obj.Link = ""
				elseif (obj.Vars <> "") then
					obj.Link = "?controller=" & obj.Controller & "&action=" & obj.Action & obj.Vars
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
					log.Logging = Replace("<span class='badge badge-success'><i class='fa fa-plus' aria-hidden='true'></i> Inserito nuovo Menu di primo livello: <strong>" & obj.Label & "</strong></span>", "'", "''")
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
			Set ModelMenu = new MenuHelper.SelectById(vars("id"))
			%>   <!--#include file="../Views/Settings/Menu/Edit.asp" --> <%
		else
			Set ModelError = new Error
			ModelError.Messaggio = "Attenzione, non hai i permessi per accedere a questa risorsa."
			ModelError.Tipologia = "alert-danger"
			%>   <!--#include file="../Views/Home/Dashboard.asp" --> <%
		end if
	End Sub

	public Sub EditPost(argouments)
			Dim obj, objh, ack
			set objh = new MenuHelper
			set obj = new Menu
			set obj = objh.SelectById(argouments("id"))
			obj.Id = argouments("id")
			if (argouments("ordine") <> "") then
				obj.Ordine = argouments("ordine")
			else
				obj.Ordine = 0
			end if
			obj.Ordine = argouments("ordine")
			obj.Fa_icon = argouments("fa_icon")
			obj.Label = argouments("label")
			obj.Controller = argouments("controller")
			obj.Action = argouments("action")
			obj.Vars = argouments("vars")
			if ((obj.Controller = "") AND (obj.Action = "")) then
				obj.Link = ""
			elseif (obj.Vars <> "") then
				obj.Link = "?controller=" & obj.Controller & "&action=" & obj.Action & obj.Vars
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
		Set helper = new MenuHelper
		Set ModelMenu = helper.SelectById(vars("id"))
		ModelMenu.Active = False
		helper.ToggleMenu(ModelMenu)
		Response.Redirect("?controller=Menu&action=List")
	End Sub

	Public Sub Enable(vars)
		Dim helper
		Set helper = new MenuHelper
		Set ModelMenu = helper.SelectById(vars("id"))
		ModelMenu.Active = True
		helper.ToggleMenu(ModelMenu)
		Response.Redirect("?controller=Menu&action=List")
	End Sub

	Public Sub Order(vars)
		Dim logHelper
		Set helper = new MenuHelper
		Set ModelMenu = helper.SelectById(vars("id"))
		if (vars("target") = "up") then
			ModelMenu.Ordine = ModelMenu.Ordine - 1
		else
			ModelMenu.Ordine = ModelMenu.Ordine + 1
		end if
		helper.ReorderMenu(ModelMenu)
		Response.Redirect("?controller=Menu&action=List")
	End Sub

 Public Sub SendError(errore)
    Set ModelError = new Error
    ModelError.Menuo = errore
    %>   <!--#include file="../Views/Settings/Menu/List.asp" --> <%
 End Sub

End Class

%>
