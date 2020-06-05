<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformacoesEmpresa.aspx.cs" Inherits="ArteFesta.Administracao.InformacoesEmpresa" %>

<!DOCTYPE HTML>
<html>
<head id="cabecalho" runat="server">
    <title>Administracao - ISO SERVICE</title>
    <link rel="shortcut icon" href="images/favicon.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" /> 
    <link href="assets/css/gerenciar.css" rel="stylesheet" type="text/css" /> 
    <%--DataTable--%>
    <%--CSS--%><link href="assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body onkeydown="return (event.keyCode!=13)">
    <form id="gerenciar" runat="server" style="min-height: calc(100% - 95px);">

        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        
        <%--Menu de navegação--%>
        <nav class="navbar navbar-default">
          <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href='<%=ResolveUrl("~/Administracao") %>'><img src='<%=ResolveUrl("images/Logo.png")%>' alt="Logo" height="50px" /></a>
            </div>
        
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li class="active"><a href='<%=ResolveUrl("~/Administracao") %>'>Ínicio <span class="sr-only">(current)</span></a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gerenciamento - ISO SERVICE<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href='<%=ResolveUrl("~/Administracao/Pagina-Inicial") %>' style="color:Black;">Página Inicial</a></li>
                    <li><a href='<%=ResolveUrl("~/Administracao/Empresas") %>' style="color:Black;">Informações da empresa</a></li>
                    <li><a href='<%=ResolveUrl("~/Administracao/Sobre-Nos") %>' style="color:Black;">Sobre Nós</a></li>
                    <li><a href='<%=ResolveUrl("~/Administracao/Banner-Principal") %>' style="color:Black;">Banner Principal</a></li>
                    <li><a href='<%=ResolveUrl("~/Administracao/Clientes") %>' style="color:Black;">Principal Clientes</a></li>
                    <li><a href='<%=ResolveUrl("~/Administracao/Obras") %>' style="color:Black;">Obras</a></li>
                    <li><a href='<%=ResolveUrl("~/Administracao/Imoveis") %>' style="color:Black;">Imóveis</a></li>
                    <li><a href='<%=ResolveUrl("~/Administracao/Veiculos") %>' style="color:Black;">Veículos</a></li>
                  </ul>
                </li>
                <li><asp:LoginStatus ID="LoginStatus" runat="server" style="border:none;" LoginText="Acessar" LogoutText="Sair" LogoutAction="Redirect" LogoutPageUrl="~/Inicio" /></li>
              </ul>
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
        <%--//Menu de navegação--%>

        <!-- Breadcrump -->
        <div class="container">
            <div class="row">
                <div class="col-md-12" style="padding:10px 0px 20px 0px;">
                    <span class="adm-breadcrumb"><i class="glyphicon glyphicon-home" aria-hidden="true"></i><a style="border:none;" href='<%=ResolveUrl("~/Administracao") %>'> ÍNICIO > </a> <a style="border:none;" href='<%=ResolveUrl("~/Administracao/Empresas") %>'> INFORMAÇÕES DA EMPRESA</a></span>
                </div>
            </div>
        </div>

        <div class="container" style="background-color: #ffffff; border-radius:5px; box-shadow: 0 1px 1px #777; padding: 10px 20px 30px 20px; margin-top:5px;">
            <div class="row">
                <div class="col-md-12">
                    
                    <h3>Empresas cadastradas</h3><br /><br />
                    
                    <!--Botão NOVO CADASTRO-->
                    <asp:Button ID="btnCadastrarNovo" runat="server" CssClass="pull-left btn btn-success" Text="Cadastrar novo" ToolTip="Cadastrar novo registro" onclick="btnCadastrarNovo_Click"/><br /><br /><br /><br />
                    <!--//Botão NOVO CADASTRO-->
                    
                    <!--//Tabela exibindo os registros cadastrados-->
                    <div class="table-responsive">
                        <table id="TabelaRegistros" class="display table table-bordered table-striped table-hover" cellspacing="0" width="100%">
                        <!--Cabeçalho da tabela-->
                        <thead>
                            <tr>
                                <th class="hidden-sm hidden-xs">Identificação</th>
                                <th>Empresa</th>
                                <th class="hidden-sm hidden-xs">CNPJ</th>
                            </tr>
                        </thead>
                        <!--//Cabeçalho da tabela-->
                        <!--Rodapé da tabela-->
                        <tfoot>
                            <tr>
                                <th class="hidden-sm hidden-xs">Identificação</th>
                                <th>Empresa</th>
                                <th class="hidden-sm hidden-xs">CNPJ</th>
                            </tr>
                        </tfoot>
                        <!--//Rodapé da tabela-->
                        <!--Counteudo da tabela-->
                        <tbody>
                            <!--Conteudo da tabela-->
                            <asp:Repeater ID="rptRegistros" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td class="hidden-sm hidden-xs"><%# DataBinder.Eval(Container.DataItem,"_IdEmpresa") %></td>
                                        <td><asp:HyperLink ID="hlEditarRegistro" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"_NomeEmpresa") %>' NavigateUrl='<%# GetUrl(Eval("_IdEmpresa"),Eval("_NomeEmpresa")) %>' ToolTip="Clique para EDITAR"></asp:HyperLink></td>
                                        <td class="hidden-sm hidden-xs"><%# DataBinder.Eval(Container.DataItem,"_CNPJ") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>  
                            <!--//Conteudo da tabela-->    
                        </tbody>
                        <!--//Counteudo da tabela-->
                    </table>
                    </div>
                    <!--//Tabela exibindo os registros cadastrados-->

                </div>
            </div>    
        </div>

    </form>

    <!-- Scripts JS -->
    <script src='<%=ResolveUrl("assets/js/bootstrap.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/jquery.min.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/jquery.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/dropdown.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/collapse.js")%>' type="text/javascript"></script>
    <!--DataTable-->
    <script src="assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="assets/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" class="init">
        $(document).ready(function () {
            $('#TabelaRegistros').dataTable({
                "pagingType": "numbers" //full //full_numbers //simple_numbers
            });
        });
    </script>   
    <!--//DataTable-->

    <div id="footer" class="text-center">
        Desenvolvido por &nbsp&nbsp <a href="http://www.sasweb.com.br" target="_blank"><img src='<%=ResolveUrl("images/sasweb.png") %>' alt="" height="20px" style="vertical-align:middle;" /></a>
    </div>

</body>
</html>