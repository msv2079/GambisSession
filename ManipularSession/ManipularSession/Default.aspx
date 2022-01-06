<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ManipularSession.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			Nome:<input type="text" id="Nome" />
			<br />
			<input type="button" value="clique aqui" id="ButtonCliqueMe" onclick="Validar()" />
			<input type="submit" value="Enviar" id="ButtonEnviar" disabled onclick="Enviar()" />
			<hr />
			<asp:Label runat="server" ID="MensagemLabel" />
		</div>
	</form>
	<script>
		function Validar() {
			var inputNome = document.getElementById("Nome");
			var inputEnviar = document.getElementById("ButtonEnviar");
			var enviarHabilitado = "0";

			inputEnviar.disabled = true;
			

			if (inputNome.value == "") {
				alert("não validou");
			} else {
				inputEnviar.disabled = false;
				enviarHabilitado = "1";
			}

			var data = { "habilitado": "1" };

			jQuery.ajax({
				url: 'Default.aspx/AlterarSession',
				type: "POST",
				data: JSON.stringify(data),
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				//beforeSend: function () {
				//	alert("Start!!! ");
				//},
				//success: function (data) {
				//	alert("a");
				//},
				//failure: function (msg) { alert("Sorry!!! "); }
			});
		}

		function Enviar() {
			document.getElementById("form1").submit();
		}
	</script>
</body>
</html>
