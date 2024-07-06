// Funzione che gestisce l'apparizione degli articoli
function appArticoli(id_testo){

    // Controlla se l'elemento è visibile. Se non lo è, nasconde tutti gli altri
    // e lo mostra, altrimenti lo nasconde
    if($(id_testo).css("display")=="none"){

        $(".ArtImg").css("display", "none");
        $(id_testo).css("display", "block");
    }
    else{
        $(id_testo).css("display", "none");
    }
}