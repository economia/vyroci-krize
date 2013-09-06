window.LineGraph = class LineGraph implements Dimensionable
    (parentSelector, @data, {width, height}:options) ->
        @computeDimensions width, height
        @svg = d3.select parentSelector .append \svg
            ..attr \width @fullWidth
            ..attr \height @fullHeight
