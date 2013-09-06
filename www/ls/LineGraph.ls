window.LineGraph = class LineGraph implements Dimensionable, XScale, YScale
    (parentSelector, @data, {width, height}:options) ->
        @computeDimensions width, height
        @svg = d3.select parentSelector .append \svg
            ..attr \width @fullWidth
            ..attr \height @fullHeight
        @drawing = @svg.append \g
            ..attr \class \drawing
            ..attr \transform "translate(#{@margin.top}, #{@margin.left})"

        @draw!

    draw: ->
        @recomputeXScale!
        @recomputeYScale!
