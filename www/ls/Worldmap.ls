window.Worldmap = class Worldmap implements Dimensionable
    (@visiblePart, @fillColors, @colorScale, {width, height}) ->
        (err, world) <~ d3.json "../data/world.topojson"
        @margin =
            top    : 0
            right  : 0
            bottom : 0
            left   : 0

        @computeDimensions width, height
        @projection = d3.geo.mercator!
            ..precision 0.1
        @project @visiblePart
        @path = d3.geo.path!
            ..projection @projection
        @svg = d3.select \#world .append \svg
            ..attr \width @fullWidth
            ..attr \height @fullHeight

        @svg.append \path
            .datum topojson.feature world, world.objects.land
            .attr \class \land
            .attr \d @path

        areas = topojson.feature world, world.objects.countries .features
        areas .= filter ({id}) ~>
            @fillColors.has id
        @areas = @svg.selectAll \path.area
            .data areas
            .enter!
            .append \path
                ..attr \class \area
                ..attr \d @path
                ..attr \fill ({id}) ~>
                    if @fillColors.get id
                        @colorScale id
                    else
                        \#ffffff

        @svg.append \path
            .datum topojson.mesh world, world.objects.countries, (a, b) -> a isnt b
            .attr \class \boundary
            .attr \d @path

    update: ->
        return if not @areas
        @areas.transition!
            ..duration 800
            ..attr \fill ({id}) ~>
                if @fillColors.get id
                    @colorScale id
                else
                    \#ffffff

    project: (area) ->
        center = [0 0]
        switch area
        | \earth
            scale       = @width / Math.PI / 2
            translation = [@width / 2, @height / 2]
            center      = [0 25]
        @projection
            ..scale scale
            ..translate translation
            ..center center
    resize: ({width, height})->
        @computeDimensions width, height
        @svg
            ..attr \width @fullWidth
            ..attr \height @fullHeight
        @project @visiblePart
        @svg.selectAll \path
            .attr \d @path
