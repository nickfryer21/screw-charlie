(function ($)
{
    var cardMethods =
    {
        init: function (options)
        {
            var settings = this.extend(
            {
                rank: 1,
                suit: 1
            }, options);

            var spriteLeft = (settings.rank - 1) * 73;
            var spriteTop = (settings.suit - 1) * 98;

            this.addClass('card').css({ backgroundPosition: '-' + spriteLeft + 'px -' + spriteTop + 'px' });
            this.draggable
                (
                    {
                        start: function (e)
                        {
                            var fromDeck = null;
                            var $this = $(this);

                            if ($this.parent().hasClass('deck'))
                            {
                                fromDeck = $this.parent();
                            }

                            if (fromDeck != null)
                            {
                                fromDeck.deck('collapse'); ;
                            }

                            $this.css({ 'z-index': 104 });
                        },
                        appendTo: 'body',
                        addClasses: false
                    }
                );

            this.data('tag', { rank: settings.rank, suit: settings.suit });

            return this;
        }
    };

    $.fn.card = function (method)
    {
        if (cardMethods[method])
        {
            return cardMethods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        }
        else if (typeof method === 'object' || !method)
        {
            return cardMethods.init.apply(this, arguments);
        }
        else
        {
            $.error('Method ' + method + ' does not exist on jquery.screwcharlie.card');
        }
    }
})(jQuery)