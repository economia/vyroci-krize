new Tooltip!watchElements!
(err, unemployment) <~ d3.json "../data/unemployment.json"
unemploymentLines = for id, data of unemployment
    {id, data}
window.unemploymentGraph = new LineGraph \#unemployment, unemploymentLines, {width: 650, height: 200}
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
    36 # AUS
    682 # saud
    356 # india
    710 # jafrika
    792 # tur
     32 # arg
     76 # bra
    484 # mex
    156 # cina
    360 # indon
    410 # korea


(g7 ++ g20).forEach ->
    fillColors.set it, \red

window.worldmap = new Worldmap \earth fillColors, {width: 650, height: 350}
drawYearSelector!
selectYear 2009
