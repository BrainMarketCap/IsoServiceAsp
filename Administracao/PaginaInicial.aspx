<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaInicial.aspx.cs" Inherits="IsoService.Administracao.PaginaInicial" %>

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
    <link href="assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <%--//DataTable--%>
</head>
<body onkeydown="return (event.keyCode!=13)">
    <form id="gerenciar" runat="server" style="min-height: calc(100% - 95px);">

        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>

        <!-- Modal -->
        <div id="ModalInformacao" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title">Informação do sistema</h4>
              </div>
              <div class="modal-body">
                <p><asp:Label ID="lblMensagem" runat="server"></asp:Label></p>
              </div>
              <div class="modal-footer">
                <asp:Button ID="btnModalConfirmar" runat="server" CssClass="btn btn-primary" Text="OK" ToolTip="OK" style="margin-right:5px; margin-left:5px;" CausesValidation="False" formnovalidate onclick="btnCancelar_Click" />
              </div>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        
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
                    <span class="adm-breadcrumb"><i class="glyphicon glyphicon-home" aria-hidden="true"></i><a style="border:none;" href='<%=ResolveUrl("~/Administracao") %>'> ÍNICIO > </a> <a style="border:none;" href='<%=ResolveUrl("~/Administracao/Pagina-Inicial") %>'> PAGINA INICIAL</a></span>
                </div>
            </div>
        </div>

        <div class="container" style="background-color: #ffffff; border-radius:5px; box-shadow: 0 1px 1px #777; padding: 10px 20px 30px 20px; margin-top:5px;">
            <div class="row">
                <div class="col-md-12">
                                    
                    <h3>Página Inicial</h3><br /><br />

                    <h4>Obras exibidas na página inicial</h4>

                    <%--DROPDOWNLIST / Obra 01--%>
                    <div class="col-md-12" style="padding:0;">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">Obra 01</span>
                                <asp:DropDownList ID="ddlObra01" runat="server" CssClass="form-control"></asp:DropDownList>
                                <asp:HiddenField ID="lblIdObra01" runat="server" />
                            </div>
                        </div>
                    </div><br /><br />

                    <%--DROPDOWNLIST / Obra 02--%>
                    <div class="col-md-12" style="padding:0;">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">Obra 02</span>
                                <asp:DropDownList ID="ddlObra02" runat="server" CssClass="form-control"></asp:DropDownList>
                                <asp:HiddenField ID="lblIdObra02" runat="server" />
                            </div>
                        </div>
                    </div><br /><br />

                    <%--DROPDOWNLIST / Obra 03--%>
                    <div class="col-md-12" style="padding:0;">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">Obra 03</span>
                                <asp:DropDownList ID="ddlObra03" runat="server" CssClass="form-control"></asp:DropDownList>
                                <asp:HiddenField ID="lblIdObra03" runat="server" />
                            </div>
                        </div>
                    </div><br /><br />

                    <%--Botões para salvar--%>
                    <div class="row" style="padding-right:15px;">
                        <asp:Button ID="btnSalvar" runat="server" CssClass="pull-right btn btn-success" Text="Salvar" ToolTip="Salvar informações" onclick="btnSalvar_Click"/><br /><br />
                    </div>

                </div>
            </div>    
        </div>

    </form>

    <!-- Scripts JS -->
    <script src='<%=ResolveUrl("assets/js/bootstrap.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/jquery.min.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/jquery.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/collapse.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/transition.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/dropdown.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/collapse.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/modal.js")%>' type="text/javascript"></script>
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