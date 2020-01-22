$(".fa-heart").click(function () {
    var productID = $("#productID").text();
    var action;
    if($(".far.fa-heart")[0])
        action = "add";
    else if($(".fas.fa-heart")[0])
        action = "remove";
    $.ajax({
        url: "scripts/wishlist.jsp",
        type: "POST",
        data: {
            productID: productID,
            action: action
        }
    });
    $(this).toggleClass("far fas");
    if($(this).prop("title") == "Usuń z listy życzeń")
        $(this).prop("title", "Dodaj do listy życzeń");
    else
        $(this).prop("title", "Usuń z listy życzeń");
});