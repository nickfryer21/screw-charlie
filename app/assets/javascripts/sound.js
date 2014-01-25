function SoundManager(path)
{
    this.path = path;
}

SoundManager.prototype.drawCard = function ()
{
    var sound = new Audio(this.path + "draw-card.mp3");
    sound.play();

}

SoundManager.prototype.playCard = function ()
{
    var sound = new Audio(this.path + "play-card.mp3");
    sound.play();
}

SoundManager.prototype.shuffleDeck = function ()
{
    var sound = new Audio(this.path + "shuffle-deck.mp3");
    sound.play();
}

SoundManager.prototype.sortCardsLong = function ()
{
    var sound = new Audio(this.path + "sort-cards-long.mp3");
    sound.play();
}

SoundManager.prototype.sortCardsShort = function ()
{
    var sound = new Audio(this.path + "sort-cards-short.mp3");
    sound.play();
}