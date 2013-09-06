$parent = $ \#story

window.drawYearSelector = ->
    [2008 to 2013].forEach (year, index) ->
        $ "<a></a>"
            ..html year
            ..addClass \yearSelector
            ..css \left unemploymentGraph.x (index+1) * 12
            ..appendTo $parent

