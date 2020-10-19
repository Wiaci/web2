const svg = $("svg").html()

$('#clear').hover(() => $('.to-delete').css('background-color', '#FF9B9B'),
    () => $('.to-delete').css('background-color', '#f2facf'));

$('#clickable').click(() => {
    $("#clear_wrapper").css('background-image', 'url(images/1cz.png)');
    $("#clear").prop('disabled', false);
    $("#clear").css('opacity', 1);
    $("#clickable").css('cursor', 'auto');
})



$('#clear').click(() => delete_history());

$('svg').click(() => {
    const y = $('#y').val().replace(",", ".");
    if (!(/-?\d+((\.|,)\d+)?/.test(y) && Number(y) < 3 && Number(y) > -5)) {
        $('#y').css('background-color', '#FF9B9B');
        $('#incorrect').text("(-5;3)!");
    } else {
        $('#y').css('background-color', 'white');
        $('#incorrect').text("");

        const x = $('input[name="x-vals"]:checked').val();
        const r = $('input[name="r-vals"]:checked').val();

        $.ajax({
            method: "POST",
            url: $('form').attr('action'),
            data: { x: x, y: y, r: r }
        }).done(msg => {
            addRow(msg);
            $("svg").append(`<circle cx=\"${150+Number(x)/Number(r)*100}\" cy=\"${150-Number(y)/Number(r)*100}\" r=\"4\" 
                             fill=\"orange\" ></circle>`)
            $("svg").html($("svg").html())
        });
    }
});

function addRow (str) {
    const results = str.split(" ");
    if (results[0] === "" || results[0] === "wrong_data") return;
    $('#results').append(`<tr class="to-delete"><td>${results[0]}</td><td>${Math.round(results[1]*1e10)/1e10}</td><td>${results[2]}</td>
        <td>${results[3]}</td><td>${results[4]}</td><td>${Math.round(results[5]*1e10)/1e10}</td></tr>`);
}

function delete_history () {
    $('table').html('<table id="results"><tr id="header"><td>X</td><td>Y</td><td>R</td>' +
        '<td>Попадание</td><td>Тек. время</td><td>Время исполнения</td></tr></table>');
    $('svg').html(svg)
    $("svg").html($("svg").html())
    $.ajax({
        method: "GET",
        url: "node",
        data: { delete: "true" }
    })
}