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
    392 # JP
    643 # RUS
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
    410 # korea
    300 # greece
    372 # irsko
    724 # spain



(g7 ++ g20).forEach ->
    fillColors.set it, off

colorScale = d3.scale.ordinal!
    ..domain fillColors.keys!
    ..range <[#A6CEE3 #1F78B4 #B2DF8A #33A02C #FB9A99 #E31A1C #FDBF6F #FF7F00 #CAB2D6 #6A3D9A #FFFF99 ]>

window.unemploymentGraph = new LineGraph \#unemployment, unemploymentLines, colorScale, {width: 650, height: 200}
window.worldmap = new Worldmap \earth fillColors, colorScale, {width: 650, height: 350}
drawYearSelector!
$ "a.yearSelector" .first!trigger \click
