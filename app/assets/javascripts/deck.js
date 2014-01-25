/// <reference path="jquery-1.7.2.min.js" />
/// <reference path="jquery-ui-1.8.20.min.js" />
/// <reference path="screwcharlie.sound.js" />

(function ($)
{
    var deckMethods =
    {
        init: function (options)
        {
            var self = $(this);
            this.settings = this.extend(
                {
                    deckType: 'played',
                    sort: 'unsorted'
                },
                options);

            this.addClass('deck');
            this.droppable
            (
                {
                    drop: function (e, ui)
                    {
                        var card = ui.draggable;
                        var position = $(ui.helper).position();
                        var deck = $(this);

                        //card.animate({left: position.left, top: position.top}, 'slow');
                        card.appendTo(deck);
                        //card.draggable( "option", "containment", "parent" );

                        $(this).deck('collapse');
                        $(this).board('collapse');

                        var sm = new SoundManager(websiteRoot + 'Content/sounds/');
                        sm.playCard();
                    },
                    greedy: true,
                    tolerance: 'touch'
                }
            );

            return this;
        },
        collapse: function (options)
        {
            this.init(options);
            var left = 0;
            var count = this.children('.card').length;

            this.children('.card').each
            (
                function ()
                {
                    $(this).css('z-index', 6)
                        .animate({ left: left, top: 0 }, 'fast');

                    left += 20;
                }
            );

            this.css({ width: (count * 20 + 53).toString() + 'px' });

            return this;
        }
    };

    $.fn.deck = function (method)
    {
        if (deckMethods[method])
        {
            return deckMethods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        }
        else if (typeof method === 'object' || !method)
        {
            return deckMethods.init.apply(this, arguments);
        }
        else
        {
            $.error('Method ' + method + ' does not exist on jquery.screwcharlie.deck');
        }
    };

})(jQuery)