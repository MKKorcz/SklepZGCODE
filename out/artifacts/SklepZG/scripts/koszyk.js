$('#koszyk_usun, #oferta_kup').click(function ()
{
    clearCart();
});

$('#koszyk_dodaj, #oferta_kup').click(function ()
{
    var liczba = $('#koszyk_info b').text();
    $('#koszyk_info b').text(++liczba);
    if(getCookie("koszyk") != "")
        setCookie("koszyk", getCookie("koszyk")+"|"+id);
    else
        setCookie("koszyk", id);

    x = getCookie("koszyk").split("|");
    updateCart();
});

$(document).on('click', '.fa-trash-alt', function() {
    var id = $(this).prev('#ID_Produktu').val();
    var sztuk = removeFromCart(id+"");
    updateCart();
    var liczba = $('#koszyk_info b').text();
    $('#koszyk_info b').text(liczba - sztuk);
});