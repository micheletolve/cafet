<!--#include file="../Shared/Header.asp" -->

<div class="container">	

	<form action="?controller=Home&action=Login" method="POST" class="form-signin">

		<img src="./Resource/image/logo-it.png" alt="Biomasse Italia" title="Biomasse Italia">

		<br/><br/>
		
		<label for="username" class="sr-only">Username</label>
			<%=Html.TextBoxReq("Username", ModelUser.Username, "Username")%>
		<label for="inputPassword" class="sr-only">Password</label>
			<%=Html.PasswordReq("Password", ModelUser.Password, "Password")%>		
		<button class="btn btn-lg btn-primary btn-block" type="submit"><i class="fas fa-sign-in-alt fa-lg" aria-hidden="true"></i>Accedi</button>
				
	</form>

</div> <!-- /container -->

<!--#include file="../Shared/Footer.asp" -->