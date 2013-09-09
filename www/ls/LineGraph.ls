window.LineGraph = class LineGraph implements Dimensionable, XScale, YScale, YAxis, LineDefinition
    (parentSelector, @data, {width, height}:options) ->
        @computeDimensions width, height
        @svg = d3.select parentSelector .append \svg
            ..attr \width @fullWidth
            ..attr \height @fullHeight
        @drawing = @svg.append \g
            ..attr \class \drawing
            ..attr \transform "translate(#{@margin.left}, #{@margin.top})"
        @computeScales!
        @drawYAxis!
        @draw!

    computeScales: ->
        @recomputeXScale!
        @recomputeYScale!
    draw: ->
        @line = @getLineDefinition!
        @area = @getLineAreaDefinition!
        @drawing.selectAll \path.line
            .data @data, (.id)
            .enter!
                ..append \path
                    ..attr \d ~> @area it.data
                    ..attr \class \area
                ..append \path
                    ..attr \d ~> @line it.data
                    ..attr \class \line


