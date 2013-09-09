window.YAxis =
    drawYAxis: ->
        yAxis = d3.svg.axis!
            ..scale @y
            ..ticks 5
            ..tickFormat -> "#it%"
            ..tickSize @width
            ..outerTickSize 0
            ..orient \right
        @yAxisGroup = @drawing.append \g
            ..attr \class "axis y"
            ..call yAxis
            ..selectAll "text"
                ..attr \x -10
                ..attr \dy 5
                ..style \text-anchor \end
            # ..selectAll "line"
            #     ..filter( -> it % 10)
            #         ..classed \minor yes
