<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sobre-Nos.aspx.cs" Inherits="IsoService.Sobre_Nos" %>

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
	<body onkeydown="return (event.keyCode!=13)">
    <form id="site" runat="server">
        <div id="page-wrapper">

            <!-- Botão "Voltar ao topo" -->
            <a href="#" id="subir-topo"><img src="images/topo.png" alt="" /></a>

            <!--Header-->
			<header id="header" class="revel">
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
						<li><a href="Inicio#fale-conosco" class="button" onclick="window.location.href = 'Inicio#fale-conosco';">Fale Conosco</a></li>
					</ul>
				</nav>
			</header>
            <!--//Header-->

            <!-- Main -->
			<section id="main" class="container">
				<header>
                    <div class="fadeIn fadeIn logo-topo"><asp:Image ID="imgLogo" runat="server" Width="100%" /></div>
					<h2>Sobre Nós</h2>
					<p style="margin:0; padding:0;">Conheça nossa história.</p>
				</header>
				<div class="box SobreNos">
					<div class="row">
						<div class="12u" style="margin-bottom:2em;">
							<h3>Quem Somos</h3>
							<asp:Label ID="lblSobreNos" runat="server"></asp:Label>
						</div>
                        <div class="4u 12u(narrower)" style="text-align:center; margin-bottom:2em;">
                            <img src="images/Selo-PBQP-H.png" alt="" />
                        </div>
                        <div class="4u 12u(narrower)" style="text-align:center; margin-bottom:2em;">
                            <img src="images/Selo-ISO9001.png" alt="" />
                        </div>
                        <div class="4u 12u(narrower)" style="text-align:center; margin-bottom:2em;">
                            <img src="images/Selo-Geric.png" alt="" />
                        </div>
					</div>
				</div>
			</section>
            <!--//Main-->

            <!-- Footer-->
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
            <!--//Footer-->

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
    <script src="assets/js/VoltarTopo.js" type="text/javascript"></script>

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
