using System;
using System.Web;
using System.Web.Services;

namespace ManipularSession
{
	public partial class Default : System.Web.UI.Page
	{
		public static bool SessaoTeste
		{
			get
			{
				var resultado = false;


				if (HttpContext.Current.Session["BotaoHabilitado"] != null)
				{
					resultado = Convert.ToBoolean(HttpContext.Current.Session["BotaoHabilitado"]);
				}

				return resultado;
			}
			set
			{
				HttpContext.Current.Session["BotaoHabilitado"] = value;
			}
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			var botaoHabilitado = SessaoTeste;

			if (botaoHabilitado)
			{
				MensagemLabel.Text = "Parabéns formulário enviado com sucesso";
			}
			else
			{
				MensagemLabel.Text = "Formulário não pode ser enviado sem validação";

			}

			SessaoTeste = false;
		}

		[WebMethod]
		public static void AlterarSession(string habilitado)
		{
			SessaoTeste = habilitado == "1";
		}
	}
}