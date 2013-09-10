new Tooltip!watchElements!
countries =
    250 : "Francie"
    840 : "USA"
    826 : "Velká Británie"
    276 : "Německo"
    380 : "Itálie"
    124 : "Kanada"
    392 : "Japonsko"
    792 : "Turecko"
    484 : "Mexiko"
    300 : "Řecko"
    410 : "Korea"
    372 : "Irsko"
    724 : "Španělsko"
    203 : "Česká republika"
(err, unemployment) <~ d3.json "../data/unemployment.json"
unemploymentLines = for id, data of unemployment
    name = countries[id]
    {id, name, data}
fillColors = d3.map!

for id, name of countries
    fillColors.set id, off

colorScale = d3.scale.ordinal!
    ..domain fillColors.keys!
    ..range <[ #E41A1C #377EB8 #4DAF4A #984EA3 #FF7F00 #FFFF33 #A65628 #F781BF #999999 ]>

width = $ window .width!
window.unemploymentGraph = new LineGraph \#unemployment, unemploymentLines, colorScale, {width, height: 200}
window.worldmap = new Worldmap \earth fillColors, colorScale, countries, {width, height: width / 1.85}
drawYearSelector width
$ "a.yearSelector" .last!trigger \click
