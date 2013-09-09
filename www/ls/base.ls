new Tooltip!watchElements!
(err, unemployment) <~ d3.json "../data/unemployment.json"
unemploymentLines = for id, data of unemployment
    {id, data}

fillColors = d3.map!
g7 =
    250 # france
    840 # usa
    826 # GB
    276 # DE
    380 # IT
    124 # CA
    643 # RUS
    392 # JP
g20 =
    682 # saud
     36 # AUS
    356 # india
    710 # jafrika
    792 # tur
     32 # arg
     76 # bra
    484 # mex
    156 # cina
    360 # indon
    300 # greece
    410 # korea
    372 # irsko
    724 # spain
    203 # cz




(g7 ++ g20).forEach ->
    fillColors.set it, off

colorScale = d3.scale.ordinal!
    ..domain fillColors.keys!
    ..range <[ #E41A1C #377EB8 #4DAF4A #984EA3 #FF7F00 #FFFF33 #A65628 #F781BF #999999 ]>

window.unemploymentGraph = new LineGraph \#unemployment, unemploymentLines, colorScale, {width: 650, height: 200}
window.worldmap = new Worldmap \earth fillColors, colorScale, {width: 650, height: 350}
drawYearSelector!
$ "a.yearSelector" .first!trigger \click
