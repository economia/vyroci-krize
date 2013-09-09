new Tooltip!watchElements!
(err, unemployment) <~ d3.json "../data/unemployment.json"
unemploymentLines = for id, data of unemployment
    {id, data}
window.unemploymentGraph = new LineGraph \#unemployment, unemploymentLines, {width: 650, height: 200}
fillColors = d3.map!
[840 156 826].forEach ->
    fillColors.set it, \off
window.worldmap = new Worldmap \earth fillColors, {width: 650, height: 350}
drawYearSelector!
selectYear 2009
