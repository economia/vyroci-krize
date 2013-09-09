$parent = $ \#story
    ..addClass \js

window.drawYearSelector = ->
    marginLeft = unemploymentGraph.margin.left
    totalWidth = 650 - marginLeft
    singleWidth = Math.round totalWidth / 5.75
    [2008 to 2013].forEach (year, index) ->
        $ele = $ "<a></a>"
            ..html year
            ..addClass \yearSelector
            ..css \left marginLeft + singleWidth * index
            ..css \width singleWidth
            ..on \click ->
                $ "a.active" .removeClass \active
                $ele.addClass \active
                selectYear year
            ..appendTo $parent

selectYear = (year) ->
    $ ".year.active" .removeClass \active
    $ ".year[data-year=#year]" .addClass \active
    fillColors = worldmap.fillColors
        ..keys!forEach -> fillColors.set it, off
    displayedCountries = switch year
    | 2008 => [840 300 724]
    | 2009 => [372 792 203]
    | 2010 => [300]
    | 2011 => [840 826]
    | 2012 => [156 840 826]
    | 2013 => [156]
    displayedCountries.forEach -> fillColors.set it, on
    displayedCountries .= map -> "#it"
    worldmap.update!
    unemploymentGraph
        ..dataFilter = (item) ->
            item.id in displayedCountries
        ..dataSorter = (a, b) ->
            indexA = displayedCountries.indexOf a.id
            indexB = displayedCountries.indexOf b.id
            indexB - indexA
        ..draw!

