$(document).ready(function () {
    $('li img').on('click', function () {
        var src = $(this).attr('src');
        var img = '<img src="' + src + '" class="img-responsive"/>';
        var titulo = $(this).attr('title');

        //start of new code new code
        var index = $(this).parent('li').index();

        var html = '';
        html += img;

        var rodape = '';
        rodape += '<div style="height:25px;clear:both;display:block;padding:5px 20px 5px 20px;">';
        rodape += '<a class="button controls next" href="' + (index + 2) + '">Prox. &raquo;</a>';
        rodape += '<a class="button controls previous" href="' + (index) + '">&laquo; Voltar</a>';
        rodape += '</div>';

        var cabecalho = titulo;
        cabecalho += "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";

        $('#ModalFoto').modal();
        $('#ModalFoto').on('shown.bs.modal', function () {
            $('#ModalFoto .modal-body').html(html);
            $('#ModalFoto .modal-header').html(cabecalho);
            $('#ModalFoto .modal-footer').html(rodape);
            //new code
            $('a.controls').trigger('click');
        })
        $('#ModalFoto').on('hidden.bs.modal', function () {
            $('#ModalFoto .modal-body').html('');
        });
    });
})


$(document).on('click', 'a.controls', function () {
    var index = $(this).attr('href');
    var src = $('ul.row li:nth-child(' + index + ') img').attr('src');

    $('.modal-body img').attr('src', src);

    var titulo = $('ul.row li:nth-child(' + index + ') img').attr('title');
    var cabecalho = titulo;
    cabecalho += "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
    $('#ModalFoto .modal-header').html(cabecalho);

    var newPrevIndex = parseInt(index) - 1;
    var newNextIndex = parseInt(newPrevIndex) + 2;

    if ($(this).hasClass('previous')) {
        $(this).attr('href', newPrevIndex);
        $('a.next').attr('href', newNextIndex);
    } else {
        $(this).attr('href', newNextIndex);
        $('a.previous').attr('href', newPrevIndex);
    }

    var total = $('ul.row li').length + 1;
    //hide next button
    if (total === newNextIndex) {
        $('a.next').hide();
    } else {
        $('a.next').show()
    }
    //hide previous button
    if (newPrevIndex === 0) {
        $('a.previous').hide();
    } else {
        $('a.previous').show()
    }

    return false;
});