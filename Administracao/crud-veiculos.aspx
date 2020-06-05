<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crud-veiculos.aspx.cs" Inherits="IsoService.Administracao.crud_veiculos" %>

<!DOCTYPE HTML>
<html>
<head id="cabecalho" runat="server">
    <title>Administracao - ISO SERVICE</title>
    <link rel="shortcut icon" href="images/favicon.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" /> 
    <link href="assets/css/gerenciar.css" rel="stylesheet" type="text/css" /> 
    <script src='<%=ResolveUrl("assets/autocompletar/jquery-1.10.0.min.js")%>' type="text/javascript"></script>
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
                    <span class="adm-breadcrumb"><i class="glyphicon glyphicon-home" aria-hidden="true"></i><a style="border:none;" href='<%=ResolveUrl("~/Administracao") %>'> ÍNICIO > </a> <a style="border:none;" href='<%=ResolveUrl("~/Administracao/Veiculos") %>'> VEÍCULOS</a></span>
                </div>
            </div>
        </div>

        <div class="container" style="background-color: #ffffff; border-radius:5px; box-shadow: 0 1px 1px #777; padding: 10px 20px 30px 20px; margin-top:5px;">
            <div class="row">
                <div class="col-md-12">
                    <h3><asp:Label ID="lblTituloPagina" runat="server"></asp:Label></h3><br /><br />
                    <asp:HiddenField ID="lblIdRegistro" runat="server" />
                    <asp:HiddenField ID="lblTituloVeiculo" runat="server" />

                    <%--Formulario para cadastro/edição--%>
                    
                    <%--Título--%>
                    <div class="form-group">
                        <asp:RequiredFieldValidator ID="rfvTitulo" runat="server" ErrorMessage="Por favor, verifique o campo abaixo." ControlToValidate="inputTitulo" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="veiculo"></asp:RequiredFieldValidator>
                        <div class="input-group">
                            <span class="input-group-addon">Título<span style="color:Red;">*</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                            <input type="text" class="form-control" id="inputTitulo" name="inputTitulo" placeholder="Título" maxlength="100" runat="server" ValidationGroup="veiculo" required title="Informe o título" spellcheck="true" onblur="VerificaCampoVazio(this.id);" onkeypress="BlocED(this, mED);" />
                        </div>
                    </div>

                    <%--DropDownList TIPO DE VEÍCULO - Leves / Pesados--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Tipo de Veículo</span>
                            <asp:DropDownList ID="ddlTipoVeiculo" runat="server" CssClass="form-control"></asp:DropDownList>                                
                            <asp:HiddenField ID="lblIdTipoVeiculo" runat="server" />
                        </div>
                    </div>

                    <%-- Descricao --%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Descrição</span>
                            <textarea class="form-control" id="inputDescricao" name="inputDescricao" placeholder="Descrição" rows="3" style="resize: vertical; min-height:35px;" spellcheck="true" onkeypress="BlocED(this, mED);" onkeyup="blocTexto(this.id);" runat="server"></textarea>
                        </div>
                        <span id="contadorDescricao">300 caractere(s)</span>
                    </div>

                    <%-- Informações Detalhadas --%>
                    <span>Informações</span>
                    <textarea class="form-control" id="inputInformacoes" name="inputInformacoes" placeholder="Informações detalhadas" rows="4" style="resize: vertical; min-height:35px;" spellcheck="true" onkeypress="BlocED(this, mED);" runat="server"></textarea>

                    <%--Cidade--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Cidade</span>
                            <input type="text" class="form-control" id="inputCidade" name="inputCidade" placeholder="Cidade" maxlength="100" runat="server" ValidationGroup="veiculo" title="Informe a cidade" spellcheck="true" onkeypress="BlocED(this, mED);" />
                        </div>
                    </div>

                    <%--Ano--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Ano&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                            <input type="text" class="form-control" id="inputAno" name="inputAno" placeholder="Ano" maxlength="10" runat="server" ValidationGroup="veiculo" title="Informe o ano do veículo" spellcheck="true" onkeypress="BlocED(this, mED);" />
                        </div>
                    </div>

                    <%--Kilometragem--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">KM&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                            <input type="text" class="form-control" id="inputKilometragem" name="inputKilometragem" placeholder="Informe a kilometragem" maxlength="50" runat="server" ValidationGroup="veiculo" title="Informe o tipo de imóvel" spellcheck="true" onkeypress="BlocED(this, mED);" />
                        </div>
                    </div>

                    <%--Valor--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Valor&nbsp&nbsp&nbsp</span>
                            <input type="text" class="form-control" id="inputValor" name="inputValor" placeholder="Informe o valor do veículo" maxlength="15" runat="server" ValidationGroup="veiculo" title="Informe o valor do veículo" spellcheck="true" onkeypress="BlocED(this, mED);" />
                        </div>
                    </div>
                    
                    <%--Imagem Principal--%>
                    <asp:HiddenField ID="lblCaminhoImagem" runat="server" />
                    <span>Imagem:</span><br />
                    <div class="col-md-12">
                        <asp:Image ID="imgRegistro" runat="server" style="margin-top:10px; margin-bottom:10px; max-width:100%;" />
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <asp:FileUpload ID="fuImagem" runat="server" ViewStateMode="Enabled" ToolTip="Selecione uma imagem" ForeColor="White" accept=".jpg" ></asp:FileUpload>
                            <span class="small">*Utilize arquivos no formato jpg.</span>
                        </div>
                    </div>

                    <%--Define se o registro está ativo--%>
                    <asp:CheckBox ID="cbRegistroAtivo" runat="server" Checked="True" Text="Ativo" ToolTip="Define se o registro está ativo para ser exibido no site" />

                    <!--Demais Imagens do Veículo-->
                    <br /><br /><span><b>Imagens do Veículo:</b></span><br />
                    <div class="form-group">
                        <div class="input-group">
                            <asp:FileUpload ID="fuImagensVeiculo" runat="server" Multiple="multiple" ViewStateMode="Enabled" ToolTip="Selecione imagens do veículo" ForeColor="White" accept=".jpg" ></asp:FileUpload>
                            <span class="small">*Utilize arquivos no formato jpg.</span>
                        </div>
                    </div>

                    <%--Imagens do Veículo--%>
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                  <a data-toggle="collapse" href="#ImagensVeiculo"><span class="glyphicon glyphicon-picture" aria-hidden="true"></span> Imagens do Veículo</a>
                                </h4>
                            </div>
                            <div id="ImagensVeiculo" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <asp:Repeater ID="rptImagensVeiculo" runat="server">
                                        <ItemTemplate>
                                        <div class="col-md-3 col-sm-12" style="text-align:center;">
                                            <asp:Image ID="imgObra" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"_CaminhoImagem") %>' style="margin-top:10px; width:100%; object-fit:cover; height:200px;" />
                                            <asp:Button ID="btnRemoverImagem" runat="server" CssClass="btn btn-link" Text="Remover Imagem" ToolTip="Clique para REMOVER a imagem" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"_NomeImagem") %>' onclick="btnRemoverImagem_Click" />
                                        </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>                              
                            </div>
                        </div>
                    </div>
                    <%--//Imagens do Veículo--%>

                    <br />
                    <%--Botões para salvar/cancelar/excluir--%>
                    <div class="row" style="padding-right:15px;">
                        <asp:Button ID="btnExcluir" runat="server" CssClass="pull-right btn btn-danger" Text="Excluir" ToolTip="Excluir o cadastro do registro selecionado" CausesValidation="False" onclick="btnExcluir_Click"/>
                        <asp:Button ID="btnCancelar" runat="server" CssClass="pull-right btn btn-warning" Text="Cancelar" ToolTip="Cancela a edição" style="margin-right:5px; margin-left:5px;" CausesValidation="False" formnovalidate onclick="btnCancelar_Click"/>
                        <asp:Button ID="btnSalvar" runat="server" CssClass="pull-right btn btn-success" Text="Salvar" ToolTip="Salvar informações" ValidationGroup="veiculo" onclick="btnSalvar_Click"/><br /><br />
                    </div>
                    <div class="row" style="padding-right:18px; padding-top:10px;">
                        <asp:CheckBox ID="cbConfirmarExcluir" runat="server" Checked="false" Text="Excluir" CssClass="pull-right" />
                        <br /><br />
                        <asp:Label ID="lblInformacao" runat="server" ForeColor="Red" CssClass="pull-right" style="padding-left:15px;"></asp:Label>
                    </div>
                </div>
            </div>    
        </div>

    </form>

    <!-- Scripts JS -->
    <script src='<%=ResolveUrl("assets/js/bootstrap.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/modal.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/dropdown.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/collapse.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/BloqueiaEspacos.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/AlertaCampoVazio.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/ContAndBlockTexto.js")%>' type="text/javascript"></script>

    <!--ckeditor -->
    <script type="text/javascript" src='<%=ResolveUrl("Editor/ckeditor.js")%>'></script>
    <script type="text/javascript">
        CKEDITOR.inline('inputInformacoes');
    </script>
    <!--//ckeditor -->
    
    <div id="footer" class="text-center">
        Desenvolvido por &nbsp&nbsp <a href="http://www.sasweb.com.br"><img src='<%=ResolveUrl("images/sasweb.png") %>' alt="" height="20px" style="vertical-align:middle;" /></a>
    </div>

</body>
</html>