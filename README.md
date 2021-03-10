# Stanford-CS-193P
# CS193pGames
Combined Set and Concentration games for Stanford CS193p (Fall 2017) [course](https://www.youtube.com/playlist?list=PLPA-ayBrweUzGFmkT_W65z64MoGnKRZMq).
![gif](https://github.com/zm1ca/CS193pGames/blob/main/showcareV1-lowres.gif)

[High resolution showcase](https://github.com/zm1ca/CS193pGames/blob/main/showcaseV1.gif)

***
## Concentration
[Concentration](https://en.wikipedia.org/wiki/Concentration_(card_game)), also known as Match Match, Match Up, Memory, Pelmanism, Shinkei-suijaku, Pexeso or simply Pairs, is a card game in which all of the cards are laid face down on a surface and two cards are flipped face up over each turn. 
The object of the game is to turn over pairs of matching cards.

This particular implementation of COncentration has those major features (mostly as in [Programming Assignment One](https://github.com/zm1ca/CS193pGames/blob/main/Programming%20Project%201_%20Concentration.pdf), including extra credit):
* Concentration game itself
* Themes set (consisting of emoji-set and colors), to increase game's replayability
* Theme is shown in the navigation bar
* Changing themes on-fly, not violating current gameplay
* Speed-dependent scoring system, to make the gameplay as fair as it's needed to have fun c:
* Penalties for not recognizing an emoji, which had already been presented to a player
* Automated restart if there are no more cards left to concentrate on
* UI is adapting to both landscape and portrait modes look fine and use space effectively on any device supporting iOS14 in all circumstances
* Customized glyph for tab bar, which perfectly depicts Concentration grid
