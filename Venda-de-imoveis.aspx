<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Venda-de-imoveis.aspx.cs" Inherits="IsoService.Venda_de_imoveis" %>

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
        <link href='<%=ResolveUrl("assets/css/paginacao.css")%>' rel="stylesheet" type="text/css" />
	</head>
	<body onkeydown="return (event.keyCode!=13)">
    <form id="site" runat="server">
        <div id="page-wrapper">

            <!-- Botão "Voltar ao topo" -->
            <a href="#" id="subir-topo"><img src="images/topo.png" alt="" /></a>

            <!--Header-->
			<header id="header" class="revel">
				<h1><a href="../../Inicio">Iso Service Empreendimentos</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="../../Inicio" onclick="window.location.href = '../../Inicio';">Ínicio</a></li>
                        <li>
							<a href="#" class="icon fa-angle-down">A Empresa</a>
							<ul>
								<li><a href="../../Sobre-Nos">Sobre Nós</a></li>
								<li><a href="#onde-estamos">Onde Estamos</a></li>
							</ul>
						</li>
						<li>
							<a href="#" class="icon fa-angle-down">Obras</a>
							<ul>
								<li><a href="../../Obras-realizadas">Realizadas</a></li>
								<li><a href="../../Obras-em-andamento">Em Andamento</a></li>
							</ul>
						</li>
                        <li>
							<a href="#" class="icon fa-angle-down">Vendas</a>
							<ul>
								<li><a href="../../Venda-de-imoveis" title="Venda de imóveis">Imóveis</a></li>
								<li><a href="../../Venda-de-veiculos" title="Venda de Veículos">Veículos</a></li>
                                <li><a href="../../Venda-de-veiculos-pesados" title="Venda de Veículos Pesados">Veículos pesados</a></li>
							</ul>
						</li>
                        <li><a href="../../Principais-Clientes" onclick="window.location.href = '../../Principais-Clientes';">Principais Clientes</a></li>
						<li><a href="../../Inicio#fale-conosco" class="button" onclick="window.location.href = '../../Inicio#fale-conosco';">Fale Conosco</a></li>
					</ul>
				</nav>
			</header>
            <!--//Header-->

            <!-- Main -->
			<section id="main" class="container">
				<header>
                    <div class="fadeIn fadeIn logo-topo"><asp:Image ID="imgLogo" runat="server" Width="100%" /></div>
					<h2>Venda de Imóveis</h2>
					<%--<p style="margin:0; padding:0;">Texto.</p>--%>
				</header>
				<div class="box informacoes">
                    <div class="row">
                        
                        <div class="12u" style="background:beige; padding:1em; margin-bottom:2em;">
                            <asp:Repeater ID="rptRegistros" runat="server">
                                <ItemTemplate>
                                    <div class="row" style="margin-bottom:2em;">
                                        <div class="4u 12u(mobilep)" style="text-align:center;">
                                            <%--<img src='<%# DataBinder.Eval(Container.DataItem,"_Imagem") %>' alt="..." class="acompanhamento-fotos"/>--%>
                                            <asp:HyperLink ID="hlVerObraImagem" runat="server" NavigateUrl='<%# GetUrl(Eval("_Id"),Eval("_Titulo")) %>' ToolTip="Clique para ver detalhes da obra." style="border:none;">
                                                <span style="margin:0 0 0.5em 0; width:100%;"><asp:Image ID="imgObra" runat="server" CssClass="acompanhamento-fotos" src='<%# DataBinder.Eval(Container.DataItem,"_Imagem") %>' alt="..." /></span>
                                            </asp:HyperLink>
                                        </div>
                                        <div class="8u 12u(mobilep)">
                                            <h3><asp:HyperLink ID="hlVerRegistro" runat="server" style="z-index: 10001; text-decoration:none; border:none;" Text='<%# DataBinder.Eval(Container.DataItem,"_Titulo") %>' NavigateUrl='<%# GetUrl(Eval("_Id"),Eval("_Titulo")) %>' ToolTip="Clique para ver detalhes do imóvel."></asp:HyperLink></h3>
                                            <span><%# DataBinder.Eval(Container.DataItem,"_Descricao") %></span>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <%-- Botões de Paginação --%>
                        <asp:HiddenField ID="lblNumeroPagina" runat="server" />
                        <asp:HiddenField ID="lblFiltro" runat="server" />
                        <asp:HiddenField ID="lblParametro" runat="server" />
                        <asp:Label ID="lblControlePaginacao" runat="server" Text="0" CssClass="hidden" ForeColor="#ffffff" style="padding:0;"/>
                        <div id="htmlDivPaginador" runat="server" visible="false" class="col-md-12 col-sm-12 col-xs-12" style="padding:0px;">
                            <center>
                                <div class="col-md-12 col-sm-12 col-xs-12" style="float:left; padding:0px;">
                                    <asp:Button ID="btnPaginaAnterior" formnovalidate="formnovalidate" Visible="false" runat="server" ToolTip="Retorna para a página anterior" CssClass="btnPaginacaoAnterior" Text="<<" onclick="btnPaginaAnterior_Click" style="background-color:rgb(102,102,102); color:#ffffff; min-width:2em; height:2.5em; line-height:0; padding:0px; border-radius: 10px; border:none; display:inline-block;" />
                                    <asp:Button ID="btnPrimeiraPagina" formnovalidate="formnovalidate" runat="server" ToolTip="Ir para a primeira página" CssClass="btnPaginacao" CommandArgument="1" OnClick="btnPagina_Click" style="background-color:rgb(102,102,102); display:inline; color:#ffffff; min-width:2em; height:2.5em; line-height:0; padding:0px; border-radius: 10px; border: none;" />
                                    <asp:Repeater ID="rptPaginacao" runat="server">
                                        <ItemTemplate>
                                            <asp:Button ID="btnPagina" formnovalidate="formnovalidate" runat="server" CssClass="btnPaginacao" Text='<%# Container.DataItem %>' CommandArgument='<%# Container.DataItem %>' OnClick="btnPagina_Click" style="background-color:rgb(102,102,102); display:inline; color:#ffffff; border: none; min-width:2em; height:2.5em; line-height:0; padding:0px; border-radius: 10px;" />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:Button ID="btnUltimaPagina" formnovalidate="formnovalidate" runat="server" ToolTip="Ir para a última página" CssClass="btnPaginacao" OnClick="btnPagina_Click" style="background-color:rgb(102,102,102); display:inline; color:#ffffff; border: none; min-width:2em; height:2.5em; line-height:0; padding:0px; border-radius: 10px;" />
                                    <asp:Button ID="btnProximaPagina" runat="server" Visible="false" Text=">>" ToolTip="Avança para a próxima página" onclick="btnProximaPagina_Click" style="background:rgb(102,102,102); color:#ffffff; min-width:2em; height:2.5em; line-height:0; padding:0px; border-radius: 10px; display:inline-block; border: none;" />
                                </div>
                            </center>
                            <br />
                        </div>

                    </div>
				</div>
			</section>
            <!--//Main-->

            <!--Footer-->
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

    <%--Paginação - Destacar página atual--%>
    <script type="text/javascript">
        $(document).ready(function DestacaPaginacao() {
            var numeroPagina = $("#lblNumeroPagina").val();

            //Destaca o botão da primeira página quando não existirem mais de 5 páginas
            if (numeroPagina == "PrimeiraPagina") {
                var btn = "#rptPaginacao_btnPagina_0";
                $(btn).css("background-color", "#b1e63e");

                return;
            }

            //Destaca o botão da primeira página "1"
            if (numeroPagina == "0") {
                var btn = "#btnPrimeiraPagina";
                $(btn).css("background-color", "#b1e63e");

                return;
            }

            //Destaca o botão da última página "n"
            if (numeroPagina == "UltimaPagina") {
                var btn = "#btnUltimaPagina";
                $(btn).css("background-color", "#b1e63e");
                return;
            }

            var contador = 0;
            for (contador = 0; contador < numeroPagina; contador++) {

                var btn = "#rptPaginacao_btnPagina_" + contador;

                var texto = $(btn).val();
                var verifica = numeroPagina;
                verifica++;

                if (texto == verifica) {
                    $(btn).css("background-color", "#b1e63e");
                    return;
                }
            }

            var btn = "#rptPaginacao_btnPagina_" + numeroPagina;
            $(btn).css("background-color", "#b1e63e");

        });    
    </script>

</body>
</html>
