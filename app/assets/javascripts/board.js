/// <reference path="jquery-1.7.2.min.js" />
/// <reference path="jquery-ui-1.8.20.min.js" />
/// <reference path="jquery.screwcharlie.deck.js" />

(function ($)
{
    var boardMethods =
    {
        init: function (options)
        {
            var settings = this.extend({}, options);
            this.droppable
            (
                {
                    drop: function (e, ui)
                    {
                        var card = ui.draggable;
                        $(this).board('createDeck');
                        var deck = $(this).children().last();
                        deck.append(card);
                        deck.deck('collapse');
                        $(this).board('collapse');

                        var sm = new SoundManager(websiteRoot + 'Content/sounds/');
                        sm.playCard();
                    },
                    tolerance: 'fit'
                }
            );
        },
        createDeck: function (options)
        {
            this.init(options);
            var deck = $('<div>');
            deck.attr('id', 'd-' + guidGenerator().substr(0, 8));
            this.append(deck);
            deck.deck();
        },
        collapse: function (options)
        {
            var board = $('#board');

            var emptyDecks = [];

            board.children('.deck').each(function ()
            {
                var deck = $(this);

                if (deck.children('.card').length == 0)
                {
                    emptyDecks.push(deck);
                }
            });

            for (var index in emptyDecks)
            {
                emptyDecks[index].remove();
            }
        }
    };

    $.fn.board = function (method)
    {
        if (boardMethods[method])
        {
            return boardMethods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        }
        else if (typeof method === 'object' || !method)
        {
            return boardMethods.init.apply(this, arguments);
        }
        else
        {
            $.error('Method ' + method + ' does not exist on jquery.screwcharlie.board');
        }
    }
})(jQuery)