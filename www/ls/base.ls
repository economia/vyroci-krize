new Tooltip!watchElements!
(err, unemployment) <~ d3.json "../data/unemployment.json"
unemploymentLines = for id, data of unemployment
    {id, data}
unemploymentGraph = new LineGraph \#unemployment, unemploymentLines, {width: 650, height: 200}
