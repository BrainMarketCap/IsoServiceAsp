//Bloqueia espaços simples em campos como "senha", "site" e "email".
function BlocES(o, f) {
    v_obj = o
    v_fun = f
    setTimeout("block()", 1)
}
function mES(v) {
    v = v.replace(/\s/g, ""); //Remove espaços em branco, não permitindo ao usuário digitar espaços
    return v;
}

//Não permitir espaços duplos nos campos de texto
function BlocED(o, f) {
    v_obj = o
    v_fun = f
    setTimeout("block()", 1)
}
function mED(v) {
    v = v.replace(/\s{2}/g, " ");  //Remove espaços em branco, permitindo ao usuário digitar apenas um espaço entre letras/palavras
    return v;
}

function id(el) {
    return document.getElementById(el);
}

function block() {
    v_obj.value = v_fun(v_obj.value)
}