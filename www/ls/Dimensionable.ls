window.Dimensionable =
    margin:
        top: 0
        right: 0
        bottom: 0
        left: 0
    computeDimensions: (@fullWidth, @fullHeight) ->
        @width = @fullWidth - @margin.left - @margin.right
        @height = @fullHeight - @margin.top - @margin.bottom
