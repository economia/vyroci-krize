window.LineDefinition =
    getLineDefinition: ->
        d3.svg.line!
            ..x (point, index) ~> @x index
            ..y @y

    getLineAreaDefinition: ->
        d3.svg.area!
            ..x (point, index) ~> @x index
            ..y0 @height
            ..y1 @y
