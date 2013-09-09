$parent = $ \#story
    ..addClass \js

window.drawYearSelector = ->
    [2008 to 2013].forEach (year, index) ->
        $ "<a></a>"
            ..html year
            ..addClass \yearSelector
            ..css \left unemploymentGraph.x (index+1) * 12
            ..on \click -> selectYear year
            ..appendTo $parent

window.selectYear = (year) ->
    $ ".year.active" .removeClass \active
    $ ".year[data-year=#year]" .addClass \active
