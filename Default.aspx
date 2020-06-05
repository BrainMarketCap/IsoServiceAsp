<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IsoService.Default" %>

<!DOCTYPE HTML>
<html>
	<head id="cabecalho" runat="server">
		<title>Iso Service Empreendimentos</title>
		<!--<meta charset="utf-8" />-->
		<meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="shortcut icon" href="images/favicon.png" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <link href="assets/css/caroussel.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/modal.css" rel="stylesheet" type="text/css" />
	</head>
	<body class="landing" onkeydown="return (event.keyCode!=13)">

    <!-- Piwik -->
    <script type="text/javascript">
        var _paq = _paq || [];
        _paq.push(['trackPageView']);
        _paq.push(['enableLinkTracking']);
        (function () {
            var u = "http://cluster-piwik.locaweb.com.br/";
            _paq.push(['setTrackerUrl', u + 'piwik.php']);
            _paq.push(['setSiteId', 17358]);
            var d = document, g = d.createElement('script'), s = d.getElementsByTagName('script')[0];
            g.type = 'text/javascript'; g.async = true; g.defer = true; g.src = u + 'piwik.js'; s.parentNode.insertBefore(g, s);
        })();
    </script>
    <!-- End Piwik Code -->

    <form id="site" runat="server">
        <div id="page-wrapper">

            <!-- Botão "Voltar ao topo" -->
            <a href="#" id="subir-topo"><img src="images/topo.png" alt="" /></a>

            <!-- Modal -->
            <div class="modal fade" id="ModalInformacao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
		        <div class="modal-dialog" role="document">
		        	<div class="modal-content">
		        		<div class="modal-header">
		        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        			<center><img src="images/Logo_ISOSERVICE.png" class="img-responsive" width="70%" alt="Translima"/></center>
		        			<br/><h4 class="modal-title" id="myModalLabel">Mensagem enviada</h4>
		        		</div>
		        		<div class="modal-body">
                            <asp:Label id="lblMensagem" Text="" runat="server"></asp:Label>
		        		</div>
		        		<div class="modal-footer">
                            <asp:Button ID="btnModalConfirmar" runat="server" CssClass="btn btn-default" Text="OK" ToolTip="OK" style="margin-right:5px; margin-left:5px;" CausesValidation="False" formnovalidate onclick="btnModalConfirmar_Click" />
		        		</div>
		        	</div>
		        </div>
	        </div>
            <!-- /.modal -->

			<!--Header-->
			<header id="header" class="alt">
				<h1><a href="Inicio">Iso Service Empreendimentos</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="Inicio" onclick="window.location.href = 'Inicio';">Ínicio</a></li>
                        <li>
							<a href="#" class="icon fa-angle-down">A Empresa</a>
							<ul>
								<li><a href="Sobre-Nos">Sobre Nós</a></li>
								<li><a href="#onde-estamos">Onde Estamos</a></li>
							</ul>
						</li>
						<li>
							<a href="#" class="icon fa-angle-down">Obras</a>
							<ul>
								<li><a href="Obras-realizadas">Realizadas</a></li>
								<li><a href="Obras-em-andamento">Em Andamento</a></li>
							</ul>
						</li>
                        <li>
							<a href="#" class="icon fa-angle-down">Vendas</a>
							<ul>
								<li><a href="Venda-de-imoveis" title="Venda de imóveis">Imóveis</a></li>
								<li><a href="Venda-de-veiculos" title="Venda de Veículos">Veículos</a></li>
                                <li><a href="Venda-de-veiculos-pesados" title="Venda de Veículos Pesados">Veículos pesados</a></li>
							</ul>
						</li>
                        <li><a href="Principais-Clientes" onclick="window.location.href = 'Principais-Clientes';">Principais Clientes</a></li>
						<li><a href="#fale-conosco" class="button">Fale Conosco</a></li>
					</ul>
				</nav>
			</header>
            <!--//Header-->

			<!--Banner/Logo -->
			<section id="banner">
                <div id="banner-logo" class="fadeIn fadeIn"><asp:Image ID="imgLogo" runat="server" /></div>
			</section>
            <!--//Banner/Logo-->

			<!--Main/Carousel/Obras/Qualidade/Vendas-->
			<section id="main" class="container">

                <!--Carousel-->
				<section class="box special" style="padding-top:1em;">
					<header class="major">
						<h3>A ISO SERVICE tem como principal compromisso buscar a plena satisfação de seus clientes, assegurando-lhes a qualidade das obras por ela executada.</h3>
						<!--<p>Texto.</p>-->
					</header>
					<!--<span class="image featured" style="margin-top:0;"><img src="images/loteamento_01.jpg" alt="" style="height:400px;" /></span>-->
                    <div id="carousel" class="hidden-sm">
                        <div id="carousel-banner" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators" style="top:5px">
                                <asp:Repeater ID="rptBannerIndicators" runat="server">
                                    <ItemTemplate>
                                        <li data-target="#carousel-banner" data-slide-to="<%# Container.ItemIndex %>"></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ol>
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <asp:Repeater ID="rptBannerItens" runat="server">
                                <ItemTemplate>
                                    <div class="<%# DataBinder.Eval(Container.DataItem,"_Classe") %>">
                                        <a href="<%# DataBinder.Eval(Container.DataItem,"_Link") %>" onclick="return false;" target="_blank"><img src="<%# DataBinder.Eval(Container.DataItem,"_Imagem") %>" alt="..."/></a>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            </div>
                            <!-- Controls -->
                            <a class="left carousel-control" href="#carousel-banner" role="button" data-slide="prev">
                              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-banner" role="button" data-slide="next">
                              <span style="margin-right:5px;" class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            </a>
                        </div>
                    </div>
				</section>
                <!--//Carousel-->

                <!--Obras-->
				<div class="row">
                    <asp:Repeater ID="rptObras" runat="server">
                        <ItemTemplate>
					        <div class="4u 12u(narrower)">
					        	<section class="box main special" style="height: 600px;">
					        		<span class="image featured main" style="margin-bottom: 1em;">
                                        <%--<img src="<%# DataBinder.Eval(Container.DataItem,"_Imagem") %>" alt="" />--%>
                                        <asp:HyperLink ID="hlVerObraImagem" runat="server" NavigateUrl='<%# GetUrl(Eval("_Id"),Eval("_Titulo")) %>' ToolTip="Clique para ver detalhes da obra.">
                                            <img src='<%# DataBinder.Eval(Container.DataItem,"_Imagem") %>' alt="..." />
                                        </asp:HyperLink>
                                    </span>
					        		<h3><%# DataBinder.Eval(Container.DataItem,"_Titulo") %></h3>
					        		<p><%# DataBinder.Eval(Container.DataItem,"_Descricao") %></p>
					        		<ul class="actions">
					        			<%--<li><a href="#" class="button alt">Saiba Mais</a></li>--%>
                                        <li><asp:HyperLink ID="hlVerObraTitulo" runat="server" CssClass="button alt" style="z-index: 10001;" Text="Saiba Mais" NavigateUrl='<%# GetUrl(Eval("_Id"),Eval("_Titulo")) %>' ToolTip="Clique para ver detalhes da obra."></asp:HyperLink></li>
					        		</ul>
					        	</section>
					        </div>
                        </ItemTemplate>
                    </asp:Repeater>
				</div>
                <!--//Obras-->

                <!--Vendas-->
                <div class="row">
					<div class="4u 12u(narrower)">
						<section class="box main special">
							<span class="image featured main" style="margin-bottom:1em;"><img src="images/Venda-Imoveis.jpg" alt="" /></span>
							<h3>Venda de<br />Imóveis</h3>
							<%--<p>Texto descritivo para venda de imóveis.</p>--%>
							<ul class="actions">
								<li><a href="Venda-de-imoveis" class="button alt">Saiba Mais</a></li>
							</ul>
						</section>
					</div>
					<div class="4u 12u(narrower)">
						<section class="box main special">
							<span class="image featured main" style="margin-bottom:1em;"><img src="images/VendaVeiculo.jpg" alt="" /></span>
							<h3>Venda de<br />Veículos</h3>
							<%--<p>Texto descritivo para venda de veículos.</p>--%>
							<ul class="actions">
								<li><a href="Venda-de-veiculos" class="button alt">Saiba Mais</a></li>
							</ul>
						</section>
					</div>
                    <div class="4u 12u(narrower)">
						<section class="box main special">
							<span class="image featured main" style="margin-bottom:1em;"><img src="images/VendaVeiculoPesado.jpg" alt="" /></span>
							<h3>Venda de<br />Veículos Pesados</h3>
							<%--<p>Texto para venda de veículos pesados.</p>--%>
							<ul class="actions">
								<li><a href="Venda-de-veiculos-pesados" class="button alt">Saiba Mais</a></li>
							</ul>
						</section>
					</div>
				</div>
                <!--//Vendas-->

                <!--Qualidade-->
				<section class="box special features">
					<div class="features-row">
						<section>
							<!--<span class="icon major fa-bolt accent2"></span>-->
                            <img src="images/selo-qualidade.png" alt="" style="width:250px; height:188px;" />
							<h3>Politica de qualidade</h3>
							<p>A ISO SERVICE zela por uma gestão empresarial personalizada, onde os clientes são atendidos diretamente pela diretoria, o que gera segurança para investir em um patrimônio ainda na planta.</p>
						</section>
                        <section>
							<!--<span class="icon major fa-lock accent5"></span>-->
							<img src="images/Selo-ISO9001.png" alt="" />
                            <h3>ISO 9001</h3>
							<p>Aprimorando-se a cada dia, a Iso Service está implementando duas importantes certificações: PBQP-H (NÍVEL A) e a ISO 9001.</p>
						</section>
					</div>
					<div class="features-row">
						<section>
							<!--<span class="icon major fa-cloud accent4"></span>-->
                            <img src="images/Selo-Geric.png" alt="" />
							<h3>GERIC CAIXA</h3>
							<p>O GERIC é o processo de análise de crédito da Caixa, que é a principal instituição financeira do programa Minha Casa Minha Vida. Como a Caixa foi a primeira instituição a conceder crédito para construção, ela sabe onde e como os problemas acontecem e seleciona muito bem seus candidatos.</p>
						</section>
						<section>
							<!--<span class="icon major fa-area-chart accent3"></span>-->
                            <img src="images/Selo-PBQP-H.png" alt="" />
							<h3>PBQP-H (NÍVEL A)</h3>
							<p>Aprimorando-se a cada dia, a Iso Service está implementando duas importantes certificações: PBQP-H (NÍVEL A) e a ISO 9001.</p>
						</section>
					</div>
				</section>
                <!--//Qualidade-->

			</section>
            <!--//Main/Carousel/Obras/Qualidade/Vendas-->

			<!--CTA/Contato-->
            <div id="fale-conosco"></div>
			<section id="cta">

					<h2 style="font-weight:400;">Fale conosco</h2>
					<p style="font-weight:400;letter-spacing:0.5px;">Utilize o formulário abaixo para nos enviar uma mensagem, estamos à disposição para atendê-lo.</p>

                        <div class="form">
						    <div class="row uniform 50%">
                                <div class="12u">
						    		<asp:RequiredFieldValidator ID="rfvInputNome" runat="server" ErrorMessage="Por favor, verifique o campo abaixo." ControlToValidate="inputNome" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="Email"></asp:RequiredFieldValidator>
                                    <input type="text" id="inputNome" name="inputNome" placeholder="Seu nome" maxlength="100" runat="server" ValidationGroup="Email" required title="Por favor, informe seu nome" onkeypress="BlocED(this, mED);" />
						    	</div>
                                <div class="6u 12u(mobilep)">
						    		<asp:RequiredFieldValidator ID="rfvInputTelefone" runat="server" ErrorMessage="Por favor, verifique o campo abaixo." ControlToValidate="inputTelefone" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="Email"></asp:RequiredFieldValidator>
                                    <input type="text" id="inputTelefone" name="inputTelefone" placeholder="Seu Telefone" maxlength="15" runat="server" ValidationGroup="Email" required title="Por favor, informe um telefone para contato" />
						    	</div>
						    	<div class="6u 12u(mobilep)">
						    		<asp:RequiredFieldValidator ID="rfvInputEmail" runat="server" ErrorMessage="Por favor, verifique o campo abaixo." ControlToValidate="inputEmail" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="Email"></asp:RequiredFieldValidator>
                                    <input type="text" id="inputEmail" name="inputEmail" placeholder="Seu Email" maxlength="100" runat="server" required title="Por favor, informe um email para contato" ValidationGroup="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" onkeypress="BlocES(this, mES);" />
						    	</div>
                                <div class="12u 12u(mobilep)">
						    		<asp:RequiredFieldValidator ID="rfvInputAssunto" runat="server" ErrorMessage="Por favor, verifique o campo abaixo." ControlToValidate="inputAsssunto" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="Email"></asp:RequiredFieldValidator>
                                    <input type="text" id="inputAsssunto" name="inputAsssunto" placeholder="Assunto" maxlength="100" runat="server" ValidationGroup="Email" required title="Por favor, informe o assunto da mensagem" onkeypress="BlocED(this, mED);" />
						    	</div>
                                <div class="12u 12u(mobilep)">
						    		<asp:RequiredFieldValidator ID="rfvIinputMensagem" runat="server" ErrorMessage="Por favor, verifique o campo abaixo." ControlToValidate="inputMensagem" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="Email"></asp:RequiredFieldValidator>
									<textarea name="inputMensagem" id="inputMensagem" runat="server" ValidationGroup="Email" placeholder="Mensagem" rows="5" style="resize:vertical;" required title="Por favor, digite a mensagem" onkeypress="BlocED(this, mED);"></textarea>
						    	</div>
						    	<div class="12u 12u(mobilep)">						    		
                                    <asp:Button id="btnEnviarEmail" style="margin-bottom:10px;" runat="server" Text="Enviar mensagem" ValidationGroup="Email" CssClass="fit" onclick="btnEnviarEmail_Click"/>
                                    <br /><asp:Label ID="lblInformacaoEmail" runat="server" ForeColor="Red"></asp:Label>
						    	</div>
						    </div>
                        </div>

				</section>
            <!--//CTA/Contato-->

			<!-- Footer -->
            <div id="onde-estamos"></div>
			<footer id="footer">
                <h3>ISO SERVICE Empreendimentos</h3>
                <div class="row" style="margin-bottom:40px;">
                    <div class="6u 12u(mobile) contato">
						<i class="icon fa-home"></i> <b>Onde Estamos</b><br />
                        <!--Endereço-->
                        <asp:Label ID="lblEndereco" runat="server"></asp:Label><br /><br />						
                        <!--Telefone-->
                        <span id="spTelefonePrincipal" runat="server"><i class="icon fa-phone"></i>&nbsp<asp:Label ID="lblTelefonePrincipal" runat="server"></asp:Label></span>
                        <span id="spTelefoneAlternativo" runat="server" visible="false"><asp:Label ID="lblTelefoneAlternativo" runat="server"></asp:Label></span>
                        <!--Celular-->
                        <span id="spCelularPrincipal" runat="server" visible="false"><br /><i class="icon fa-phone-square"></i>&nbsp<asp:Label ID="lblCelularPrincipal" runat="server"></asp:Label></span>
                        <span id="spCelularAlternativo" runat="server" visible="false"><asp:Label ID="lblCelularAlternativo" runat="server"></asp:Label></span>
                        <!--WhatsApp-->
                        <span id="spWhatsappPrincipal" runat="server" visible="false"><br /><i class="icon fa-whatsapp"></i>&nbsp<asp:Label ID="lblWhatsappPrincipal" runat="server"></asp:Label></span>
                        <span id="spWhatsappAlternativo" runat="server" visible="false"><asp:Label ID="lblWhatsappAlternativo" runat="server"></asp:Label></span>
						<br />
                        <!--Email-->
                        <span id="spEmailPrincipal" runat="server"><i class="icon fa-envelope"></i>&nbsp<asp:Label ID="lblEmailPrincipal" runat="server"></asp:Label></span>
                        <span id="spEmailAlternativo" runat="server" visible="false"><br /><i class="icon fa-envelope"></i>&nbsp<asp:Label ID="lblEmailAlternativo" runat="server"></asp:Label></span>
					</div>
                    <div class="6u 12u(mobile) localizacao">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7523.206425423727!2d-42.556746!3d-19.472667!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xafffe7247287a5%3A0x62616ce59cb46a3d!2sAv.+Brasil%2C+1045+-+Igua%C3%A7u%2C+Ipatinga+-+MG%2C+35162-036%2C+Brasil!5e0!3m2!1spt-BR!2sus!4v1496756714719" width="100%" height="350px" frameborder="0" style="border:0" allowfullscreen></iframe>
                    </div>
                </div>
                <!--Redes Sociais-->
                <ul class="icons">
	        		<li id="spTwitter" runat="server" visible="false"><a id="lblTwitter" runat="server" href="" target="_blank" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
	        		<li id="spFacebook" runat="server" visible="false"><a id="lblFacebook" runat="server" href="" target="_blank" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
	        		<li id="spInstagram" runat="server" visible="false"><a id="lblInstagram" runat="server" href="" target="_blank" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
	        		<li id="spGooglePlus" runat="server" visible="false"><a id="lblGoogleplus" runat="server" href="" target="_blank" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
                    <li id="spYoutube" runat="server" visible="false"><a id="lblYoutube" runat="server" href="" target="_blank" class="icon fa-youtube"><span class="label">Youtube</span></a></li>
	        	</ul>
				<ul class="copyright">
					<li>&copy; ISO SERVICE. Todos os direitos reservados.</li><li><a href="http://www.sasweb.com.br">SASWEB</a></li>
				</ul>
			</footer>

		</div>
    </form>

    <!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollgress.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
    <script src="assets/js/bootstrap.js" type="text/javascript"></script>
    <script src="assets/js/modal.js" type="text/javascript"></script>
    <script src="assets/js/VoltarTopo.js" type="text/javascript"></script>
    <script src="assets/js/BloqueiaEspacos.js" type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/MascaraTelefone.js")%>' type="text/javascript"></script>

    <%--ScrollSpy--%>
    <script type="text/javascript">
        $(document).ready(function () {
            // Add scrollspy to <body>
            $('body').scrollspy({ target: ".navbar", offset: -50 });

            // Add smooth scrolling on all links inside the navbar
            $("#nav a").on('click', function (event) {

                // Prevent default anchor click behavior
                event.preventDefault();

                // Store hash
                var hash = this.hash;

                // Using jQuery's animate() method to add smooth page scroll
                // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
                $('html, body').animate({
                    scrollTop: $(hash).offset().top
                }, 800, function () {

                    //Add hash (#) to URL when done scrolling (default click behavior)
                    //window.location.hash = hash;
                });
            });
        });
    </script>

	</body>
</html>