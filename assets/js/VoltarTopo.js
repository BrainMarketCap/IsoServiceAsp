//Botão Voltar ao Topo
$(window).scroll(function () {
    if ($(this).scrollTop() > 200) {
        document.getElementById("subir-topo").style.display = "block";
    } else {
        document.getElementById("subir-topo").style.display = "none";
    };
});

$(document).ready(function () {
    $('#subir-topo').click(function () {
        $('html, body').animate({ scrollTop: 0 }, 'slow');
        return false;
    });
});