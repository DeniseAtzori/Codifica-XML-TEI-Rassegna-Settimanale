// Funzione che gestisce l'apparizione degli articoli
function appArticoli(id_testo){

    // Controlla se l'elemento è visibile. Se non lo è, nasconde tutti gli altri
    // e lo mostra, altrimenti lo nasconde
    if($(id_testo).css("display")=="none"){

        $(".ArtImg").css("display", "none");
        $("#appendice").css("display", "none");
        $("#bibliografiaCompleta").css("display", "none");
        $(id_testo).css("display", "block");
    }
    else{
        $(id_testo).css("display", "none");
    }
}

// Funzione che gestisce l'apparizione dell'appendice e della bibliografia
function appAppBibl(id_appendice){

    // Controlla se l'elemento è visibile. Se non lo è, nasconde tutti gli altri
    // e lo mostra, altrimenti lo nasconde
    if($(id_appendice).css("display")=="none"){

        $(".ArtImg").css("display", "none");
        $("#appendice").css("display", "none");
        $("#bibliografiaCompleta").css("display", "none");
        $(id_appendice).css("display", "block");
    }
    else{
        $(id_appendice).css("display", "none");
    }
}
//Funzione che, cliccando sull'autore, rimanda alla sezione Appendice corrispondente
function apriAppendice(id_autore){
    $("#appendice").css("display", "block");
    $('html, body').animate({
        scrollTop: $(id_autore).offset().top
    }, 2000);
}

//Funzione che, cliccando sul titolo, rimanda alla sezione Bibliografia corrispondente
function apriBibliografia(id_titolo){
    $("#bibliografiaCompleta").css("display", "block");
    $('html, body').animate({
        scrollTop: $(id_titolo).offset().top
    }, 2000);
}

// Funzione per evidenziare le maparea
    // $(zonaImg).mouseover(function(){
    //     $(zonaImg).css("background-color","yellow");
    // });