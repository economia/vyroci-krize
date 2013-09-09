window.LineGraph = class LineGraph implements Dimensionable, XScale, YScale, YAxis, LineDefinition
    (parentSelector, @data, {width, height}:options) ->
        @computeDimensions width, height
        @svg = d3.select parentSelector .append \svg
            ..attr \width @fullWidth
            ..attr \height @fullHeight
        @drawing = @svg.append \g
            ..attr \class \drawing
            ..attr \transform "translate(#{@margin.left}, #{@margin.top})"
        @draw!
        @drawYAxis!

    draw: ->
        @recomputeXScale!
        @recomputeYScale!
        @line = @getLineDefinition!
        @drawing.selectAll \path.line
            .data @data, (.id)
            .enter!append \path
                ..attr \d ~> @line it.data
                ..attr \class \line


