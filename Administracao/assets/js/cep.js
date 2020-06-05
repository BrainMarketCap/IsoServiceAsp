$(document).ready(function () {

    //Limpa valores do formulário de CEP.
    function limpa_formulário_cep() {
        $("#inputRua").val("");
        $("#inputBairro").val("");
        $("#inputCidade").val("");
    }

    //Quando o botão "Consultar" é acionado
    $('#BtnBuscaCEP').click(function () {

        //Cria uma variável com o valor do campo "CEP" (somente dígitos)
        var cep = $("#inputCEP").val().replace(/\D/g, '');

        //Verifica se campo CEP está vazio
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if (validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                $("#inputRua").val("...");
                $("#inputBairro").val("...");

                //Consulta o webservice viacep.com.br/
                $.getJSON("//viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                    if (!("erro" in dados)) {
                        //Atualiza os campos com os valores da consulta.                            
                        $("#inputRua").val(dados.logradouro);
                        $("#inputBairro").val(dados.bairro);
                        $("#ddlEstado").val(dados.uf);
                        $("#inputCidade").val(dados.localidade);
                    } //end if.
                    else {
                        //CEP pesquisado não foi encontrado.
                        limpa_formulário_cep();
                        //Formata o texto a ser exibido na janela MODAL
                        $("#lblMensagem").html("Não foi possivel localizar o CEP informado.<br/>Favor preencher manualmente os campos referentes ao endereço.");
                        //Exibe a janela MODAL
                        $('#ModalInformacao').modal('show');
                    }
                });
            } //end if.
            else {
                //CEP informado é inválido.
                limpa_formulário_cep();
            }
        } //end if.
        else {
            //CEP sem valor, limpa formulário.
            limpa_formulário_cep();
        }
    });
});