
function drawCard(e)
{
    var data = $.cookie("ScrewCharlie");

    data = 'gameId=1&playerId=2';

    if (data != null)
    {
        var pairs = data.split('&');
        var gameId = pairs[0].split('=')[1];

        $.get(websiteRoot + 'game/' + gameId.toString()+ '/draw_card.json', function (card)
        {
            var playerHand = $('#player-hand');
            var div = $('<div></div>').attr('id', card.ClientId);
            var drawPile = $('#draw-pile');
            div.card({ rank: card.Rank, suit: card.Suit });
            $('body').append(div);
            div.css({ position: 'absolute', left: drawPile.position().left, top: drawPile.position().top, 'z-index': '102' });

            var left = playerHand.offset().left;
            var top = playerHand.offset().top;

            if (playerHand.children('.card').length > 0)
            {
                left = playerHand.children('.card').last().offset().left + 20;
                top = playerHand.children('.card').last().offset().top;
            }

            div.animate
            (
                {
                    left: left,
                    top: top
                },
                'slow',
                function ()
                {
                    $(this).stop();
                    playerHand.append(div).deck().deck('collapse');
                }
            );
            var sm = new SoundManager(websiteRoot + 'Content/sounds/');
            sm.drawCard();
        });
    }
}

function showOptionsDialog()
{
    callAction
    (
        'Home',
        'GetActivePlayer',
        null,
        function (player)
        {
            if (player != null)
            {
                showDialog(websiteRoot + 'Options/Edit', 'Preferences For ' + player.ScreenName, 500, 400);
            }
        });
}

function endTurn()
{
    var turn =
    {
        Moves:
            [
                { FromDeck: null, ToDeck: null, Card: {Rank: 1, Suit: 1} }
            ]
    };

    callAction
    (
        'Home',
        'EndTurn',
        turn,
        function (result)
        {
            alert('done');
        },
        function ()
        {
            alert('damn it!');
        }
    );
}

function gameIndex()
{
    alert('hello');
}

function gamePlay()
{
    $(function ()
    {
        $('#board').board();
        $('#btnUndo').button({ disabled: true });
        $('#btnReset').button();
        $('#btnEndTurn').button().click(null, endTurn);
        $('#btnOptions').button().click(null, showOptionsDialog);
        $('#player-hand').deck().deck('collapse');
        $('#imgDrawCard').click(null, drawCard);
        $('#tab-container').tabs();
    });

}