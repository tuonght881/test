hideChat(0);

$('#prime').click(function() {
    toggleFab();
});

function toggleFab() {
    $('.prime').toggleClass('zmdi-comment-outline');
    $('.prime').toggleClass('zmdi-close');
    $('.prime').toggleClass('is-active');
    $('.prime').toggleClass('is-visible');
    $('#prime').toggleClass('is-float');
    $('.chat').toggleClass('is-visible');
    $('.fab').toggleClass('is-visible');

}

$('#chat_first_screen').click(function(e) {
    hideChat(1);
});

$('#chat_fullscreen_loader').click(function(e) {
    $('.fa-solid').toggleClass('fa-expand');
    $('.fa-solid').toggleClass('fa-minimize');
    $('.chat').toggleClass('chat_fullscreen');
    $('.fab').toggleClass('is-hide');
    $('.header_img').toggleClass('change_img');
    $('.img_container').toggleClass('change_img');
    $('.chat_header').toggleClass('chat_header2');
    $('.fab_field').toggleClass('fab_field2');
    $('.chat_converse').toggleClass('chat_converse2');
    //$('#chat_converse').css('display', 'none');
    // $('#chat_body').css('display', 'none');
    // $('#chat_form').css('display', 'none');
    // $('.chat_login').css('display', 'none');
    // $('#chat_fullscreen').css('display', 'block');
});

function hideChat(hide) {
    switch (hide) {
        case 0:
            $('#chat_converse').css('display', 'none');
            $('#chat_body').css('display', 'none');
            $('#chat_form').css('display', 'none');
            $('.chat_login').css('display', 'block');
            $('.chat_fullscreen_loader').css('display', 'none');
            $('#chat_fullscreen').css('display', 'none');
            break;
        case 1:
            $('#chat_converse').css('display', 'block');
            $('#chat_body').css('display', 'none');
            $('#chat_form').css('display', 'none');
            $('.chat_login').css('display', 'none');
            $('.chat_fullscreen_loader').css('display', 'block');
            break;
    }
}