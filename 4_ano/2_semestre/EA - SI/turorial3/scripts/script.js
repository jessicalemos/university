function sayHello(){
    console.log("Hello world!")
}

$(function() {
    alert("Hello world!");
    reset();
    loadGames();
});

var count = 0;

function reset() {
    count = 0;
    document.getElementById("counter").innerHTML = count + " clicks!";
}

/* onclick in html -> function on javascript */

/*
function onClick() {
    count += 1;
    document.getElementById("counter").innerHTML = count + " clicks!";
};
*/

/* onclick in javascript */

/*
document.getElementById("click").onclick = function() {
    count += 1;
    document.getElementById("counter").innerHTML = count + " clicks!";
};*/

/* jQuery */
$( "#click" ).click(function() {
    count += 1;
    $('#counter').html(function(i, val) {
        return count + " clicks!";
    });
});

function loadGames(){
    u = "http://ivy.di.uminho.pt:8080/GamesLibraryProvider/GamesService?action=list"
    $.get(u)
    .done(function(data) {
        $("#myRawData").html(data);
        //information to an object
        var json = JSON.parse(data);
        $.each(json, function( k, v ) {
            $('#queryTable > tbody').append('<tr><td>'+v.name+'</td><td>'+v.year+
            '</td><td>'+v.platform+'</td></tr>');
        });
    });
}