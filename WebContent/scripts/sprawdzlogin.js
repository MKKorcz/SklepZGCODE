$('#login').keyup(function ()
{
    var login = $('#login').val();

    if(login != "") {
        $.ajax({
            url: 'scripts/sprawdzlogin.jsp',
            type: 'POST',
            data: {
                login: login
            },
            success: function (data) {
                $("#sprawdzlogin").html(data.trim());
                if(data.trim() == "")
                    $("input[type=submit]").attr("disabled", false);
                else
                    $("input[type=submit]").attr("disabled", true);
            }
        });
    }
    else {
        $("#sprawdzlogin").html("");
    }
});

$('#email').keyup(function ()
{
    var email = $('#email').val();

    if(email != "") {
        $.ajax({
            url: 'scripts/sprawdzlogin.jsp',
            type: 'POST',
            data: {
                email: email
            },
            success: function (data) {
                $("#sprawdzemail").html(data.trim());
                if(data.trim() == "")
                    $("input[type=submit]").attr("disabled", false);
                else
                    $("input[type=submit]").attr("disabled", true);
            }
        });
    }
    else
        $("#sprawdzemail").html("");
});

$('#phone').keyup(function ()
{
    var phone = $('#phone').val();

    if(phone != "") {
        $.ajax({
            url: 'scripts/sprawdzlogin.jsp',
            type: 'POST',
            data: {
                phone: phone
            },
            success: function (data) {
                $("#sprawdzphone").html(data.trim());
                if(data.trim() == "")
                    $("input[type=submit]").attr("disabled", false);
                else
                    $("input[type=submit]").attr("disabled", true);
            }
        });
    }
    else
        $("#sprawdzphone").html("");
});

$('#nick').keyup(function ()
{
    var nick = $('#nick').val();

    if(nick != "") {
        $.ajax({
            url: 'scripts/sprawdzlogin.jsp',
            type: 'POST',
            data: {
                login: nick
            },
            success: function (data) {
                $("#sprawdznick").html(data.trim());
                if(data.trim() == "")
                    $("input[type=submit]").attr("disabled", false);
                else
                    $("input[type=submit]").attr("disabled", true);
            }
        });
    }
    else
        $("#sprawdznick").html("");
});