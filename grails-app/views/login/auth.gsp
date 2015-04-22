<html>
	<head>
		<meta name='layout' content='main' />
		<title><g:message code="website.nome" /></title>
		<asset:stylesheet href="auth.css"/>
		<asset:stylesheet href="login.css"/>
		<asset:javascript src="http://jquery-airport.googlecode.com/files/jquery.airport-1.1.source.js"/>
				<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<sec:ifNotLoggedIn>
	<style type="text/css">
		body{
			background-image: url('https://northmantrader.files.wordpress.com/2014/09/bottle.jpg') !important;
			background-repeat: no-repeat !important;
			background-size: cover !important;
		}
		p{
			font-weight: bold;
		}
	</style>
	</sec:ifNotLoggedIn>
	</head>
	
	
<body>
<sec:ifNotLoggedIn>
<div class="powermessage" style="font-size: 50px; font-family: monospace; font-variant: small-caps; font-weight: 600; text-align:center;"></div>
	</sec:ifNotLoggedIn>
	<div id="page-body" role="main">
	<sec:ifNotLoggedIn>
		<div class="login-card">
			<h1>Log-in</h1>
			<br>
			<g:if test='${flash.message}'>
				<div class='login_message'>
					${flash.message}
				</div>
			</g:if>
			<form action='${request.contextPath}/j_spring_security_check' method='POST' id='loginForm' class='cssform' autocomplete='off'>
				<input type="text" placeholder="Usuário" name='j_username' id='username'>  
				<input type="password" placeholder="Senha" name='j_password' id='password'>
				<p id="remember_me_holder">
					<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if> />
					<label for='remember_me'>Lembre-me</label>
				</p>
				<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}' class="login login-submit" />
			</form>
		</div>

		<!-- <div id="error"><img src="https://dl.dropboxusercontent.com/u/23299152/Delete-icon.png" /> Your caps-lock is on.</div> -->

		<script
			src='http://codepen.io/assets/libs/fullpage/jquery_and_jqueryui.js'></script>
	</sec:ifNotLoggedIn>
		<sec:ifNotLoggedIn>
			<p style="text-align:center; text-align: center; padding-left: 20%; padding-right: 20%; padding-top: 2%; font-size: 15px;">Seja bem-vindo(a) ao PowerMessage, o sistema de envio de
				mensagens desenvolvido pela Acception Tecnologia.</p>
				
		</sec:ifNotLoggedIn>
		<sec:ifAnyGranted roles="ROLE_ADMIN">				
			<p style="text-align:center; text-align: center; padding-left: 20%; padding-right: 20%; padding-top: 2%; font-size: 15px;">Seja bem-vindo(a), Super Administrador, ao sistema de envio de
				mensagens desenvolvido pela Acception Tecnologia.</p>
				<img style=" display: block; margin-left: auto; margin-right: auto; width: 85px; height: 85px; " src="https://cdn4.iconfinder.com/data/icons/jolly-icons-social-media-and-communication/120/1302-speech-bubbles-256.png"/>
		
		</sec:ifAnyGranted>
		<sec:ifAnyGranted roles="ROLE_ASSOCIACAO">
			<p style="text-align:center; text-align: center; padding-left: 20%; padding-right: 20%; padding-top: 2%; font-size: 15px;">Seja bem-vindo(a), <sec:username/>, ao sistema de envio de
				mensagens desenvolvido pela Acception Tecnologia.</p>		
			<img style=" display: block; margin-left: auto; margin-right: auto; width: 85px; height: 85px; " src="https://cdn4.iconfinder.com/data/icons/jolly-icons-social-media-and-communication/120/1302-speech-bubbles-256.png"/>
		</sec:ifAnyGranted>

	</div>
	
	<script>

	$(document).ready(function(){
		$('.powermessage').airport([ 'Power Message', 'Acception Tecnologia']);
	});

	(function($){ 
	     $.fn.extend({  
	         airport: function(array) {
				
				var self = $(this);
				var chars = ['a','b','c','d','e','f','g',' ','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','-'];
				var longest = 0;
				var items = items2 = array.length;

				function pad(a,b) { return a + new Array(b - a.length + 1).join(' '); }
				
				$(this).empty();
				
				while(items--)
					if(array[items].length > longest) longest = array[items].length;

				while(items2--)
					array[items2] = pad(array[items2],longest);
					
				spans = longest;
				while(spans--)
					$(this).prepend("<span class='c" + spans + "'></span>");
					
				
				function testChar(a,b,c,d){
					if(c >= array.length)
						setTimeout(function() { testChar(0,0,0,0); }, 1000);				
					else if(d >= longest)
						setTimeout(function() { testChar(0,0,c+1,0); }, 1000);
					else {
						$(self).find('.c'+a).html((chars[b]==" ")?"&nbsp;":chars[b]);
						setTimeout(function() {
							if(b > chars.length)
								testChar(a+1,0,c,d+1);
							else if(chars[b] != array[c].substring(d,d+1).toLowerCase())
								testChar(a,b+1,c,d);
							else
								testChar(a+1,0,c,d+1);
						}, 20);
					}
				}
				
				testChar(0,0,0,0);
	        } 
	    }); 
	})(jQuery);
	</script>
</body>
</html>