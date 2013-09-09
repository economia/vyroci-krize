window.XScale =
    recomputeXScale: ->
        @x ?= d3.scale.linear!
            ..domain [0 @data.0.data.length]
            ..range [0 @width]


window.YScale =
    recomputeYScale: ->
        @y ?= d3.scale.linear!
            ..domain [0 15]
            ..range [@height, 0]
