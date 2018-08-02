<!--#include file="../Shared/Header.asp" -->

<div class="container">

	<br />

	<div class="alert alert-danger" role="alert">
		<i class="fa fa-exclamation-circle fa-3x pull-left"></i>Whoops! Username o password errati, inserire i dati corretti e riprovare. <br />In caso di errore contattare l'amministratore di sistema.
	</div>

	<form action="?controller=Home&action=Login" method="post" class="form-signin">

		<img src="./Resource/image/logo-it.png" alt="Biomasse Italia" title="Biomasse Italia">

		<br/><br/>
		
		<label for="username" class="sr-only">Username</label>
			<%=Html.TextBoxReq("Username", ModelUser.Username, "Username")%>
		<label for="inputPassword" class="sr-only">Password</label>
			<%=Html.PasswordReq("Password", ModelUser.Password, "Password")%>
		<button class="btn btn-lg btn-primary btn-block" type="submit"><i class="fa fa-sign-in fa-lg" aria-hidden="true"></i>Accedi</button>
	</form>

	</div> <!-- /container -->

<!--#include file="../Shared/Footer.asp" -->