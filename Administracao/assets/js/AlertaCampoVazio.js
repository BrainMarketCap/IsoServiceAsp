//Script que é chamado na função onblur do input, destacando a borda do elemento na situação em que ele foi preenchido ou não
function VerificaCampoVazio(valor) {
    if (document.getElementById(valor).value.length == 0) {
        document.getElementById(valor).style.borderColor = "rgb(162, 38, 36)";
        document.getElementById(valor).style.background = "rgba(162, 38, 36, 0.1)";
    }
    else {
        document.getElementById(valor).style.borderColor = "rgb(55, 228, 71)";
        document.getElementById(valor).style.background = "rgba(55, 228, 71, 0.1)";
    }
}