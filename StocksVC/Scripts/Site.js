$(document).ready(function () {

    $('#submitBuy').click(function (e) {
        e.preventDefault();
        var symbol = $("#stockInfoSymbol").html();
        var price = $("#stockInfoPrice").html();
        var quantity = $("#stockInfoQuantity").val();
        var thoughts = $("#stockInfoThoughts").val();

        $.ajax({
            method: "POST",
            url: "/api/stocks/PostBuy",
            data: {
                StockName: symbol,
                Price: price,
                TotalBought: quantity,
                Thoughts: thoughts
            }
        });

        location.reload();

    });

    $('#submitSell').click(function (f) {
        f.preventDefault();
        var symbol = $("#stockInfoSymbolSell").html();
        var price = $("#stockInfoPriceSell").html();
        var quantity = $("#stockInfoQuantitySell").val();

        $.ajax({
            method: "POST",
            url: "/api/stocks/PostSell",
            data: {
                StockName: symbol,
                Price: price,
                TotalSold: quantity
            }
        });

        location.reload();

    });

    $('input[name="stock_name"]').change(function () {
        $('#stockSearch').click(function () {
            location.href = '/Home/IndividualStock?ticker=' +
            $('input[name="stock_name"]').val();
        });
    });

    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next, today',
            center: 'title',
            right: 'month,basicWeek,basicDay'
        },
        defaultDate: '2015-05-12',
        editable: true,
        eventLimit: true, // allow "more" link when too many events
        eventRender: function(event, element) {
            
        },
        events: [
            {
                title: 'Presentation',
                start: '2015-05-11',
                end: '2015-05-12'
            },
            {
                title: 'Lunch',
                start: '2015-05-16T11:30:00',
                end: '2015-05-16T12:30:00',
                allDay: false
            },
            {
                title: 'Hiking Trip',
                start: '2015-05-14'
            }
        ]
        

    });

});