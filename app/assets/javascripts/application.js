// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$( document ).ready(function() {
	$('#map').hide();
    $('#prest').hide();
    $('#errorreserva').hide();
    $('#alertaseleccionrest').hide();

	if ($('#formdate').length > 0){
        $.datepicker.regional['es'] = {
            closeText: 'Cerrar',
            prevText: '<Ant',
            nextText: 'Sig>',
            currentText: 'Hoy',
            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
            dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
            dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
            dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
            weekHeader: 'Sm',
            dateFormat: 'dd/mm/yy',
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: ''
        };
        $.datepicker.setDefaults($.datepicker.regional['es']);

        $('#formdate').datepicker({
            minDate: new Date(),
            altField: "#actualDate"
        });
    }

     $('select#provincia').on('change', function(event){
        $('#localidad option').show();
        $('#localidad option:not(.'+$('#provincia option:selected').attr('class')+')').hide();
        $('#restnombre option').show();
        $('#restnombre option:not(.'+$('#provincia option:selected').attr('class')+')').hide();
    });

    $('select#localidad').on('change', function(event){
        $('#restnombre option').show();
        console.log($('#localidad option:selected').attr('class').split(' ')[1]);
        $('#restnombre option:not(.'+$('#localidad option:selected').attr('class').split(' ')[1]+')').hide();
    });

    $('#encontrar').on('click', function(){
        $('#alertaseleccionrest').empty();
        $('#alertaseleccionrest').hide();
        if ($('#restnombre option:selected').length > 0 && $('#restnombre option:selected').val() !== "Selecciona un restaurante"){
           
            var myLatLng = {lat: 27.768517, lng: -15.586641};
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 16,
                zoomControl: true,
                mapTypeControl: true,
                scaleControl: true,
                streetViewControl: true,
                rotateControl: true,
                scrollwheel:false,
                center: myLatLng
            });
            // var icon = {
            //     url: "http://www.freeiconspng.com/uploads/map-navigation-pin-point-restaurant-icon--14.png", // url
            //     scaledSize: new google.maps.Size(70, 70), // scaled size
            //     origin: new google.maps.Point(0,0), // origin
            //     anchor: new google.maps.Point(0, 0) // anchor
            // };
            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
                title: $('#restnombre option:selected').html(),
                // icon: icon
            });
            $('#map').fadeIn();
            $('#prest').fadeIn();
            $('#datosrest').empty();
            $('#datosrest').append('<br/><b>Nombre:</b> '+$('#restnombre option:selected').html()+'<br/>');
            //$('#datosrest').append('<b>Telefono:</b> '+restnombre['telefono']+'<br/>');
            //$('#datosrest').append('<b>Direccion:</b> '+restnombre['direccion']+'<br/>');
            //$('#datosrest').append('<b>Codigo Postal:</b> '+restnombre['CP']+'<br/>');
        }else{
            $('#alertaseleccionrest').text('Has de seleccionar al menos un restaurante');
            $('#alertaseleccionrest').fadeIn();
        }

    });

$('#botonreserva').on('click', function(e){
	console.log('hola');
        var vacio=false;
        var datas = Array();
        $('#errorreserva').fadeOut();
        $('.reserva option:selected').each(function(){
            if ($(this).val() == 'Selecciona un restaurante') vacio=true;
            else datas.push($(this).val());
        });

        $('.reserva input:not(#botonreserva)').each(function(){
            if ($(this).val() == '') vacio=true;
            else datas.push($(this).val());
        });
        var datos={};
        if (!vacio){
            datos={provincia: ((datas[0] !== 'Selecciona una provincia')?datas[0]:''), localidad:((datas[1] !== 'Selecciona una localidad')?datas[0]:''), restaurante: datas[2], comensales: datas[3], fecha: datas[4], hora:datas[5]};
            $.ajax({
                url: '/reservation/create',
                type: 'POST',
                data: datos
            }).done(function(){
                vacio=false;
                console.log(datos);
            });
        }else{
            $('#errorreserva').fadeIn();
        }
    });

});
