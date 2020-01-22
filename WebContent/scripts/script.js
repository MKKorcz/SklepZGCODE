function setCookie(name, value) {
    var date = new Date();
    date.setTime(date.getTime() + (30*60*1000));
    var expires = "expires="+ date.toUTCString();
    document.cookie = name + "=" + value + ";" + expires + ";path=/";
}

function getCookie(name) {
    name += "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function panelON() {
    document.getElementById("overlay").style.display = "initial";
    document.getElementById("panel_koszyk").style.display = "inline-block";
}
function panelOFF() {
    document.getElementById("overlay").style.display = "none";
    document.getElementById("panel_koszyk").style.display = "none";
}
function alertOFF() {
    document.getElementsByClassName("alert-box")[0].style.display = "none";
}
function numberOfOccurences(tab) {
    var a = [], b = [], prev;

    tab.sort();
    for(var i = 0; i < tab.length; i++) {
        if (tab[i] !== prev) {
            a.push(tab[i]);
            b.push(1);
        } else {
            b[b.length-1]++;
        }
        prev = tab[i];
    }
    return [a, b];
}

var zmienna = "";
function updateCart() {
    var koszyk_produkty = numberOfOccurences(x);
    if(getCookie("koszyk") != "") {
        for(var i = 0; i < koszyk_produkty[0].length; i++) {
            $.get({
                url: "scripts/db.jsp",
                data: "id="+koszyk_produkty[0][i]+"&szt="+koszyk_produkty[1][i],
                success: function(data) {
                    zmienna += data+" <i class=\"fas fa-trash-alt\"></i>"+"<br>";
                }
            });
            $(document).ajaxComplete(function() {
                document.getElementById("panel_koszyk").getElementsByTagName("span")[0].innerHTML = zmienna;
            });
            zmienna = "";
        }
    }
    else
        document.getElementById("panel_koszyk").getElementsByTagName("span")[0].innerHTML = "";
    $("form p span").html($('#panel_koszyk span').html());
}

function clearCart() {
    setCookie("koszyk", "");
    x = getCookie("koszyk").split("|");
    updateCart();
    $('#koszyk_info b').text("0");
}

function removeFromCart(product) {
    var temp = getCookie("koszyk").split("|");
    var sztuk = 0;
    for(var i = temp.length; i--; ) {
        if(temp[i] === product) {
            temp.splice(i, 1);
            sztuk++;
        }
    }
    var tempString = temp.join("|");
    setCookie("koszyk", "");
    setCookie("koszyk", tempString);
    x = getCookie("koszyk").split("|");
    return sztuk;
}

function sprawdzHaslo() {
    var haslo = document.getElementById("password").value;
    var p_haslo = document.getElementById("p_password").value;

    if(p_haslo != "") {
        if(haslo != p_haslo) {
            document.getElementById("niepasi").innerHTML = "Podane hasła nie są takie same!";
            document.getElementById("Zarejestruj").disabled = true;
        }
        else {
            document.getElementById("niepasi").innerHTML = "";
            document.getElementById("Zarejestruj").disabled = false;
        }
    }
}