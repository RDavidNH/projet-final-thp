$(function () {
    $('.property-favorite').click(function (e) {
        e.preventDefault();
        $(this).toggleClass('active');
    });
})
