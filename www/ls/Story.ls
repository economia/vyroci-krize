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
    fillColors = worldmap.fillColors
    fillColors.keys!forEach ->
        fillColors.set it, \white
    onYears = switch year
    | 2008 => [840]
    | 2009 => [156]
    | 2010 => [826]
    | 2011 => [840 826]
    | 2012 => [156 840 826]
    | 2013 => [156]
    onYears.forEach -> fillColors.set it, \red
    worldmap.update!
