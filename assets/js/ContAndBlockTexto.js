//Função que conta a quantidade de caracteres inseridos no input e bloqueia caso tenha atingido o limite determinado
function blocTexto(valor) {
    
    if (valor == "inputDescricaoEmpresa") {
        quant = 500;
        var contador = 'contadorDescricaoEmpresa';
    }
    else if (valor == "inputTagTitle") {
        quant = 250;
        var contador = 'contadorTagTitle';
    }
    else if (valor == "inputMetaTagDescricao") {
        quant = 250;
        var contador = 'contadorMetaTagDescricao';
    }
    else if (valor == "inputKeywords") {
        quant = 250;
        var contador = 'contadorKeywords';
    }
    else if (valor == "inputDescricao") {
        quant = 500;
        var contador = 'contadorDescricao';
    }

    total = document.getElementById(valor).value.length;

    if (total <= quant) {
        resto = quant - total;
        document.getElementById(contador).innerHTML = resto + " caractere(s)";
    }
    else {
        document.getElementById(valor).value = document.getElementById(valor).value.substr(0, quant);
    }
}