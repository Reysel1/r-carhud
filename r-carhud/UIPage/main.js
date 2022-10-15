window.addEventListener('message', function(event){
    let r = event.data
    if (r.InVehicle)
    {
        $(".main").fadeIn(500)
        $(".num").html(Math.round(r.speed))
        $("#fueltext").html(Math.round(r.fuel))
        $("#enginetext").html(Math.round(r.healt)/10)
        $("#street").html(r.streetName)
    } else  {
       $(".main").fadeOut();
    }

    if (r.fuel <= 50) {
        $("#fueltext").addClass('parpadea');
        $("#fuel").addClass('parpadea');
        $("#fuel").css({
            "color": "red",
        });
    } else {
        $("#fueltext").removeClass('parpadea');
        $("#fuel").removeClass('parpadea');
        $("#fuel").css({
            "color": "white",
        });
    }
    if (r.healt <= 500) {
        $("#enginetext").addClass('parpadea');
        $("#engine").addClass('parpadea');
        $("#engine").css({
            "color": "red",
        });
    } else {
        $("#enginetext").removeClass('parpadea');
        $("#engine").removeClass('parpadea');
        $("#engine").css({
            "color": "white",
        });
    }
})