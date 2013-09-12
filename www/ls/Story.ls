return if !d3 # IE
$parent = $ \#story
    ..addClass \js
$ "<a></a>"
    ..addClass "arrow left"
    ..appendTo $parent
    ..on \click -> moveYear -1

$ "<a></a>"
    ..addClass "arrow right"
    ..appendTo $parent
    ..on \click -> moveYear +1

moveYear = (amount) ->
    year = parseInt do
        $ "a.yearSelector.active" .attr \data-year
        10
    year += amount
    if year < 2008 then year = 2013
    if year > 2013 then year = 2008
    $ "a.yearSelector[data-year=#year]" .trigger \click

window.drawYearSelector = (width) ->
    marginLeft = unemploymentGraph.margin.left
    totalWidth = width - marginLeft - 27
    singleWidth = Math.round totalWidth / 5.75
    $yearSelector = $ "<div></div>"
        ..addClass \yearSelector
        ..appendTo $parent
    [2013 to 2008 by -1].forEach (year) ->
        index = year - 2008
        $ele = $ "<a></a>"
            ..html year
            ..append "<span class='arrow'><span></span></span>"
            ..attr \data-year year
            ..addClass \yearSelector
            ..css \left marginLeft + singleWidth * index
            ..css \width singleWidth - 10
            ..on \click ->
                $ "a.active" .removeClass \active
                $ele.addClass \active
                selectYear year
            ..appendTo $yearSelector

selectYear = (year) ->
    $ ".year.active" .removeClass \active
    $ ".year[data-year=#year]" .addClass \active
    fillColors = worldmap.fillColors
        ..keys!forEach -> fillColors.set it, off
    displayedCountries = switch year
    | 2008 => [840]
    | 2009 => [276 826 250]
    | 2010 => [300]
    | 2011 => [380 372 724]
    | 2012 => [203]
    | 2013 => [484 124 840]
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
        ..moveBackgound year
        ..draw!

