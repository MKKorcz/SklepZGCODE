// $('.rate').click(function ()
$(document).ready(function() {
    $(document).on('click', '.rate', function() {
        var rate = $(this).attr("value");
        $.ajax({
            url: 'scripts/rate.jsp',
            type: 'POST',
            data: {
                id: id,
                rate: rate
            },
            success: function (data) {
                var x = data;
                $('.rate').removeClass("checked");
                if(x > 0)
                    $('.rate').eq(0).addClass("checked");
                if(x >= 1.5)
                    $('.rate').eq(1).addClass("checked");
                if(x >= 2.5)
                    $('.rate').eq(2).addClass("checked");
                if(x >= 3.5)
                    $('.rate').eq(3).addClass("checked");
                if(x >= 4.5)
                    $('.rate').eq(4).addClass("checked");
                $('.rate').removeClass("rate");
                $('#oferta_gwiazdki').attr("title", "Średnia ocen: "+data.toString().trim());
            }
        });
    });
});