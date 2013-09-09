window.Dimensionable =
    margin:
        top: 10
        right: 0
        bottom: 20
        left: 40
    computeDimensions: (@fullWidth, @fullHeight) ->
        @width = @fullWidth - @margin.left - @margin.right
        @height = @fullHeight - @margin.top - @margin.bottom
