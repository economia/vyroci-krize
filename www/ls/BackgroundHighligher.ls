window.BackgroundHighligher =
    initBackgroundHighlighter: (parent) ->
        @element = parent.append \rect
            ..attr \class \BackgroundHighligher
            ..attr \x 0
            ..attr \y 0
            ..attr \height @height
            ..attr \width @x 4

    moveBackgound: (year) ->
        year -= 2008
        @element.transition!
            ..duration 600
            ..attr \x @x 4 * year
