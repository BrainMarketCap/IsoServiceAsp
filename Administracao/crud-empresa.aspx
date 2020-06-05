<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crud-empresa.aspx.cs" Inherits="ArteFesta.Administracao.CRUDEmpresa" %>

<!DOCTYPE HTML>
<html>
<head id="cabecalho" runat="server">
    <title>Administracao - ISO SERVICE</title>
    <link rel="shortcut icon" href="images/favicon.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" /> 
    <link href="assets/css/gerenciar.css" rel="stylesheet" type="text/css" /> 
    <link href="assets/autocompletar/jquery-ui.css" rel="stylesheet" type="text/css" /> 

    <!-- Auto Completar -->
    <script src='<%=ResolveUrl("assets/autocompletar/jquery-1.10.0.min.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/autocompletar/jquery-ui.min.js")%>' type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("[id$=inputCidade]").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: '<%=ResolveUrl("~/Administracao/crud-empresa.aspx/ObterCidades") %>',
                        data: "{ 'valor': '" + request.term + "', 'siglaEstado': '" + $("[id*=ddlEstado]").find("option:selected").val() + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.split('-')[0],
                                    val: item.split('-')[1]
                                }
                            }))
                        },
                        error: function (response) {
                            //alert(response.responseText);
                        },
                        failure: function (response) {
                            //alert(response.responseText);
                        }
                    });
                },
                select: function (e, i) {
                    $("[id$=hfCidadeId]").val(i.item.val);
                },
                minLength: 1
            });
        });  
    </script>

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
                    <span class="adm-breadcrumb"><i class="glyphicon glyphicon-home" aria-hidden="true"></i><a style="border:none;" href='<%=ResolveUrl("~/Administracao") %>'> ÍNICIO > </a> <a style="border:none;" href='<%=ResolveUrl("~/Administracao/Empresas") %>'> INFORMAÇÕES DA EMPRESA</a></span>
                </div>
            </div>
        </div>

        <div class="container" style="background-color: #ffffff; border-radius:5px; box-shadow: 0 1px 1px #777; padding: 10px 20px 30px 20px; margin-top:5px;">
            <div class="row">
                <div class="col-md-12">
                    <h3><asp:Label ID="lblTituloPagina" runat="server"></asp:Label></h3><br /><br />
                    
                    <asp:HiddenField ID="lblIdEmpresa" runat="server" />

                    <%--Formulario para cadastro/edição--%>
                    <%--Nome da Empresa--%>
                    <div class="form-group">
                        <asp:RequiredFieldValidator ID="rfvNomeEmpresa" runat="server" ErrorMessage="Por favor, verifique o campo abaixo." ControlToValidate="inputNomeEmpresa" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="empresa"></asp:RequiredFieldValidator>
                        <div class="input-group">
                            <span class="input-group-addon">Empresa<span style="color:Red;">*</span></span>
                            <input type="text" class="form-control" id="inputNomeEmpresa" name="inputNomeEmpresa" placeholder="Nome da empresa" maxlength="100" runat="server" ValidationGroup="empresa" required title="Informe o nome da empresa" spellcheck="true" onblur="VerificaCampoVazio(this.id);" onkeypress="BlocED(this, mED);" />
                        </div>
                    </div>

                    <%-- Descricao Empresa --%>
                    <span class="small">Preencha o campo abaixo com uma breve descrição sobre sua empresa. Esta informação ficará disponível em seu SITE e para o GOOGLE.</span>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Descrição</span>
                            <textarea class="form-control" id="inputDescricaoEmpresa" name="inputDescricaoEmpresa" placeholder="Descrição da empresa" rows="3" style="resize: vertical; min-height:35px;" spellcheck="true" onkeypress="BlocED(this, mED);" onkeyup="blocTexto(this.id);" runat="server"></textarea>
                        </div>
                        <span id="contadorDescricaoEmpresa">500 caractere(s)</span>
                    </div>
                    
                    <%--CNPJ da Empresa--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">CNPJ&nbsp</span>
                            <input type="text" class="form-control" id="inputCNPJ" name="inputCNPJ" placeholder="CNPJ" maxlength="18" runat="server" ValidationGroup="empresa"/>
                        </div>
                    </div>

                    <%--Tipo de empresa--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Empresa&nbsp&nbsp</span>
                            <asp:DropDownList ID="ddlTipoEmpresa" runat="server" CssClass="form-control" ValidationGroup="empresa"></asp:DropDownList>
                            <asp:HiddenField ID="lblTipoEmpresa" runat="server" />
                        </div>
                    </div>

                    <%--Foto da Empresa (LOCAL)--%>
                    <asp:HiddenField ID="lblImagemEmpresa" runat="server" />
                    <span>Foto da empresa:</span><br />
                    <div class="col-md-12">
                        <asp:Image ID="imgImagemEmpresa" runat="server" style="margin-top:10px; margin-bottom:10px; width:300px;" />
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <asp:FileUpload ID="fuImagemEmpresa" runat="server" ViewStateMode="Enabled" ToolTip="Selecione uma imagem" ForeColor="White" accept=".jpg" ></asp:FileUpload>
                            <span class="small">*Utilize arquivos no formato jpg.</span>
                        </div>
                    </div>

                    <%--Logo--%>
                    <asp:HiddenField ID="lblLogoEmpresa" runat="server" />
                    <span>Logo da empresa:</span><br />
                    <div class="col-md-12">
                        <asp:Image ID="imgLogoEmpresa" runat="server" style="margin-top:10px; margin-bottom:10px; width:300px;" />
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <asp:FileUpload ID="fuLogoEmpresa" runat="server" ViewStateMode="Enabled" ToolTip="Selecione uma imagem" ForeColor="White" accept=".jpg" ></asp:FileUpload>
                            <span class="small">*Utilize arquivos no formato PNG (preferencialmente), ou JPG.</span>
                        </div>
                    </div>

                    <%--Email Principal--%>
                    <div class="form-group">
                        <asp:RequiredFieldValidator ID="rfvEmailPrincipal" runat="server" ErrorMessage="Por favor, verifique o campo abaixo." ControlToValidate="inputEmailPrincipal" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="empresa"></asp:RequiredFieldValidator>
                        <div class="input-group">
                            <span class="input-group-addon">Email<span style="color:Red;">*</span></span>
                            <input type="text" class="form-control" id="inputEmailPrincipal" name="inputEmailPrincipal" placeholder="Email principal" maxlength="100" runat="server" ValidationGroup="empresa" required title="Informe o email" onblur="VerificaCampoVazio(this.id);" onkeypress="BlocES(this, mES);" />
                        </div>
                    </div>

                    <%--Telefone Principal--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Telefone&nbsp</span>
                            <input type="text" class="form-control" id="inputTelefonePrincipal" name="inputTelefonePrincipal" placeholder="Telefone Principal" maxlength="15" runat="server" ValidationGroup="empresa"/>
                        </div>
                    </div>

                    <%--Celular Principal--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Celular&nbsp&nbsp&nbsp&nbsp</span>
                            <input type="text" class="form-control" id="inputCelularPrincipal" name="inputCelularPrincipal" placeholder="Celular Principal" maxlength="15" runat="server" ValidationGroup="empresa" />
                        </div>
                    </div>

                    <%--Whatsapp Principal--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Whatsapp</span>
                            <input type="text" class="form-control" id="inputWhatsappPrincipal" name="inputWhatsappPrincipal" placeholder="Whatsapp Principal" maxlength="15" runat="server" ValidationGroup="empresa" />
                        </div>
                    </div>

                    <br />

                    <%--Informações Adicionais de contato--%>
                    <div class="panel-group">
                      <div class="panel panel-default">
                        <div class="panel-heading">
                          <h4 class="panel-title">
                            <a data-toggle="collapse" href="#InfContatoAdicional"><span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span> + contatos</a>
                          </h4>
                        </div>
                        <div id="InfContatoAdicional" class="panel-collapse collapse">
                          <div class="panel-body">
                            
                            <%--Email Secundario--%>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Email&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                                    <input type="text" class="form-control" id="inputEmailSecundario" name="inputEmailSecundario" placeholder="Email alternativo" maxlength="100" runat="server" ValidationGroup="empresa" onkeypress="BlocES(this, mES);" />
                                </div>
                            </div>
                            
                            <%--Telefone Secundario--%>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Telefone&nbsp</span>
                                    <input type="text" class="form-control" id="inputTelefoneSecundario" name="inputTelefoneSecundario" placeholder="Telefone alternativo" maxlength="15" runat="server" ValidationGroup="empresa"/>
                                </div>
                            </div>

                            <%--Celular Secundario--%>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Celular&nbsp&nbsp&nbsp&nbsp</span>
                                    <input type="text" class="form-control" id="inputCelularSecundario" name="inputCelularSecundario" placeholder="Celular Alternativo" maxlength="15" runat="server" ValidationGroup="empresa"/>
                                </div>
                            </div>

                            <%--Whatsapp Secundario--%>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Whatsapp</span>
                                    <input type="text" class="form-control" id="inputWhatsappSecundario" name="inputWhatsappSecundario" placeholder="Whatsapp Alternativo" maxlength="15" runat="server" ValidationGroup="empresa" />
                                </div>
                            </div>

                            <%--Link Google Maps--%>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Mapa&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                                    <input type="text" class="form-control" id="inputGoogleMaps" name="inputGoogleMaps" placeholder="Link do Google Maps" maxlength="300" runat="server" ValidationGroup="empresa" />
                                </div>
                            </div>

                          </div>
                        </div>
                      </div>
                    </div>

                    <%--Redes Sociais--%>
                    <div class="panel-group">
                      <div class="panel panel-default">
                        <div class="panel-heading">
                          <h4 class="panel-title">
                            <a data-toggle="collapse" href="#RedesSociais" ><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> Redes Sociais</a>
                          </h4>
                        </div>
                        <div id="RedesSociais" class="panel-collapse collapse">
                          <div class="panel-body">

                              <%--Facebook--%>
                              <div class="form-group">
                                  <div class="input-group">
                                      <span class="input-group-addon">Facebook</span>
                                      <input type="text" class="form-control" id="inputFacebook" name="inputFacebook" placeholder="Facebook" maxlength="200" runat="server" ValidationGroup="empresa" onkeypress="BlocES(this, mES);" />
                                  </div>
                              </div>

                              <%--Twitter--%>
                              <div class="form-group">
                                  <div class="input-group">
                                      <span class="input-group-addon">Twitter&nbsp&nbsp&nbsp&nbsp</span>
                                      <input type="text" class="form-control" id="inputTwitter" name="inputTwitter" placeholder="Twitter" maxlength="200" runat="server" ValidationGroup="empresa" onkeypress="BlocES(this, mES);" />
                                  </div>
                              </div>

                              <%--Pinterest--%>
                              <div class="form-group">
                                  <div class="input-group">
                                      <span class="input-group-addon">Pinterest&nbsp</span>
                                      <input type="text" class="form-control" id="inputPinterest" name="inputPinterest" placeholder="Pinterest" maxlength="200" runat="server" ValidationGroup="empresa" onkeypress="BlocES(this, mES);" />
                                  </div>
                              </div>

                              <%--Instagram--%>
                              <div class="form-group">
                                  <div class="input-group">
                                      <span class="input-group-addon">Instagram</span>
                                      <input type="text" class="form-control" id="inputInstagram" name="inputInstagram" placeholder="Instagram" maxlength="200" runat="server" ValidationGroup="empresa" onkeypress="BlocES(this, mES);" />
                                  </div>
                              </div>

                              <%--GooglePlus--%>
                              <div class="form-group">
                                  <div class="input-group">
                                      <span class="input-group-addon">Google+&nbsp&nbsp</span>
                                      <input type="text" class="form-control" id="inputGooglePlus" name="inputGooglePlus" placeholder="Google+" maxlength="200" runat="server" ValidationGroup="empresa" onkeypress="BlocES(this, mES);" />
                                  </div>
                              </div>

                              <%--Youtube--%>
                              <div class="form-group">
                                  <div class="input-group">
                                      <span class="input-group-addon">Youtube&nbsp</span>
                                      <input type="text" class="form-control" id="inputYoutube" name="inputYoutube" placeholder="Youtube" maxlength="200" runat="server" ValidationGroup="empresa" onkeypress="BlocES(this, mES);" />
                                  </div>
                              </div>
                          
                          </div>
                        </div>
                      </div>
                    </div>

                    <%--SEO--%>
                    <div class="panel-group">
                      <div class="panel panel-default">
                        <div class="panel-heading">
                          <h4 class="panel-title">
                            <a data-toggle="collapse" href="#SEO" ><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Otimização de Busca (SEO)</a>
                          </h4>
                        </div>
                        <div id="SEO" class="panel-collapse collapse">
                          <div class="panel-body">
                              
                              <%--Title--%>
                              <div class="form-group">
                                  <div class="input-group">
                                      <span class="input-group-addon">Titulo</span>
                                      <input type="text" class="form-control" id="inputTagTitle" name="inputTagTitle" placeholder="Título da página" maxlength="250" runat="server" ValidationGroup="empresa" onkeypress="BlocED(this, mED);" onkeyup="blocTexto(this.id);" />
                                  </div>
                                  <span id="contadorTagTitle">250 caractere(s)</span>
                              </div>

                              <%--Descrição--%>
                              <div class="form-group">
                                  <div class="input-group">
                                      <span class="input-group-addon">Descrição</span>
                                      <textarea class="form-control" id="inputMetaTagDescricao" name="inputMetaTagDescricao" placeholder="Descrição do site" rows="3" style="resize: vertical; min-height:35px;" spellcheck="true" onkeypress="BlocED(this, mED);" onkeyup="blocTexto(this.id);" runat="server"></textarea>
                                  </div>
                                  <span id="contadorMetaTagDescricao">250 caractere(s)</span>
                              </div>

                              <%--Keywords--%>
                              <span class="small">Separe os termos por vírgula.</span>
                              <div class="form-group">
                                  <div class="input-group">
                                      <span class="input-group-addon">Keywords</span>
                                      <input type="text" class="form-control" id="inputKeywords" name="inputKeywords" placeholder="Palavras-chave para o site" maxlength="250" runat="server" ValidationGroup="empresa" onkeypress="BlocED(this, mED);" onkeyup="blocTexto(this.id);" />
                                  </div>
                                  <span id="contadorKeywords">250 caractere(s)</span>
                              </div>

                          </div>
                        </div>
                      </div>
                    </div>

                    <h4 style="margin-top:15px; margin-bottom:15px;">Dados de endereço:</h4>

                    <asp:HiddenField ID="lblIdEndereco" runat="server" />

                    <%--CEP--%>
                    <div class="col-md-10" style="padding-left:0px;">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">CEP</span>
                                <input type="text" class="form-control" id="inputCEP" name="inputCEP" maxlength="8" placeholder="Somente números (35160000)" runat="server" ValidationGroup="empresa" required title="Informe o CEP" onblur="VerificaCampoVazio(this.id); $('#BtnBuscaCEP').click();" onkeypress="BlocES(this, mES);" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <%--Botão Buscar CEP--%>
                            <button id="BtnBuscaCEP" type="button" class="btn btn-primary" style="width:100%;">Buscar</button>
                        </div>
                    </div>
                    
                    <%--Rua--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Rua&nbsp</span>
                            <input type="text" class="form-control" id="inputRua" name="inputRua" placeholder="Rua" maxlength="100" runat="server" ValidationGroup="empresa" required title="Informe o LOGRADOURO" onblur="VerificaCampoVazio(this.id);" onkeypress="BlocED(this, mED);" />
                        </div>
                    </div>
                    
                    <%--Número--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Número</span>
                            <input type="text" class="form-control" id="inputNumero" name="inputNumero" placeholder="Número" maxlength="10" runat="server" ValidationGroup="empresa" required title="Informe o NÚMERO" onblur="VerificaCampoVazio(this.id);" />
                        </div>
                    </div>
                    
                    <%--Complemento--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Complemento</span>
                            <input type="text" class="form-control" id="inputComplemento" name="inputComplemento" placeholder="Complemento" maxlength="50" runat="server" ValidationGroup="empresa" />
                        </div>
                    </div>
                    
                    <%--Bairro--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Bairro&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                            <input type="text" class="form-control" id="inputBairro" name="inputBairro" placeholder="Bairro" runat="server" ValidationGroup="empresa" maxlength="50" required title="Informe o BAIRRO" onblur="VerificaCampoVazio(this.id);" onkeypress="BlocED(this, mED);" />
                        </div>
                    </div>

                    <%--Estado--%>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Estado&nbsp&nbsp&nbsp</span>
                            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control" ValidationGroup="empresa" required title="Informe o ESTADO" onblur="VerificaCampoVazio(this.id);"></asp:DropDownList>
                        </div>
                    </div>

                    <%--Input Cidade--%>
                    <asp:HiddenField ID="hfCidadeId" runat="server" />
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Cidade&nbsp&nbsp&nbsp</span>
                            <input type="text" class="form-control" id="inputCidade" name="inputCidade" placeholder="Cidade" runat="server" ValidationGroup="empresa" maxlength="100" required title="Informe a CIDADE" onblur="VerificaCampoVazio(this.id);" onkeypress="BlocED(this, mED);" />
                        </div>
                    </div>

                    <br />
                    <%--Botões para salvar/cancelar/excluir--%>
                    <div class="row" style="padding-right:15px;">
                        <asp:Button ID="btnExcluir" runat="server" CssClass="pull-right btn btn-danger" Text="Excluir" ToolTip="Excluir o cadastro do registro selecionado" CausesValidation="False" onclick="btnExcluir_Click"/>
                        <asp:Button ID="btnCancelar" runat="server" CssClass="pull-right btn btn-warning" Text="Cancelar" ToolTip="Cancela a edição" style="margin-right:5px; margin-left:5px;" CausesValidation="False" formnovalidate onclick="btnCancelar_Click"/>
                        <asp:Button ID="btnSalvar" runat="server" CssClass="pull-right btn btn-success" Text="Salvar" ToolTip="Salvar informações" ValidationGroup="empresa" onclick="btnSalvar_Click"/><br /><br />
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
    <script src='<%=ResolveUrl("assets/js/cep.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/BloqueiaEspacos.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/MascaraTelefone.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/AlertaCampoVazio.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("assets/js/ContAndBlockTexto.js")%>' type="text/javascript"></script>

    <script src='<%=ResolveUrl("assets/js/jquery.maskedinput.js")%>' type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(function ($) {
            $("#inputCNPJ").mask("99.999.999/9999-99", { placeholder: "__.___.___/____-__" });
        }); 
    </script>

    <div id="footer" class="text-center">
        Desenvolvido por &nbsp&nbsp <a href="http://www.sasweb.com.br"><img src='<%=ResolveUrl("images/sasweb.png") %>' alt="" height="20px" style="vertical-align:middle;" /></a>
    </div>

</body>
</html>