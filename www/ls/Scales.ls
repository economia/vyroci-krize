window.XScale =
    recomputeXScale: ->
        console.log @data.0.data.length
        @x ?= d3.scale.linear!
            ..domain [0 @data.0.data.length]
            ..range [0 @width]


window.YScale =
    recomputeYScale: ->
        @y ?= d3.scale.linear!
            ..domain [0 30]
            ..range [@height, 0]
