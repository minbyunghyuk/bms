<!DOCTYPE html>
<meta charset="utf-8">
<style>

    body {
        font: 10px "Helvetica Neue", Helvetica, Arial, sans-serif;
        position: relative;
    }

    .axis path,
    .axis line {
        fill: none;
        stroke: #000;
        shape-rendering: crispEdges;
    }

    .x.axis path {
        display: none;
    }

    .line {
        fill: none;
        stroke: steelblue;
        stroke-width: 1.5px;
    }

    .overlay {
        fill: none;
        pointer-events: all;
    }

    .focus circle {
        fill: steelblue;
    }

    .tooltip {
        width: 94px;
        padding: 4px 10px;
        border: 1px solid #aaa;
        border-radius: 4px;
        box-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        position: absolute;
        background-color: white;
        font-size: 14px;
        pointer-events: none;
        -webkit-transition: all 0.25s;
        -moz-transition: all 0.25s;
        -ms-transition: all 0.25s;
        -o-transition: all 0.25s;
        transition: all 0.25s;
    }

    .tooltip div {
        margin: 3px 0;
    }

    .tooltip-date, .tooltip-likes {
        font-weight: bold;
    }

</style>

<body>
<script src="//d3js.org/d3.v3.min.js"></script>
<script>

    var margin = { top: 30, right: 132, bottom: 30, left: 50 },
        width = 960 - margin.left - margin.right,
        height = 500 - margin.top - margin.bottom;

    var parseDate = d3.time.format("%m/%e/%Y").parse,
        bisectDate = d3.bisector(function(d) { return d.date; }).left,
        formatValue = d3.format(","),
        dateFormatter = d3.time.format("%m/%d/%y");

    var x = d3.time.scale()
        .range([0, width]);

    var y = d3.scale.linear()
        .range([height, 0]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom")
        .tickFormat(dateFormatter);

    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left")
        .tickFormat(d3.format("s"));

    var line = d3.svg.line()
        .x(function(d) { return x(d.date); })
        .y(function(d) { return y(d.getTod_price); });

    var svg = d3.select("body").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var tooltip = d3.select("body").append("div")
        .attr("class", "tooltip")
        .style("display", "none");
    var url = "http://localhost:8080/rest/getjsonlist3?name=아시아종묘";
    d3.json(url, function(error, data) {
        if (error) throw error;

        data.forEach(function(d) {

            d.date = parseDate(d.date);
            d.getTod_price = +d.getTod_price;
            d.getTom_price = +d.getTom_price;
            console.log(d.date);
            console.log(d.getTod_price);
        });

        x.domain([data[0].date, data[data.length-1].date]);

        y.domain([0, d3.max(data, function (d) {
            return Math.max(d.getTod_price, d.getTom_price);
        })]);
        //y.domain(d3.extent(data, function(d) { return d.getTod_price; }));


        svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height + ")")
            .call(xAxis);

        svg.append("g")
            .attr("class", "y axis")
            .call(yAxis)
            .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", 6)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text("Number of Likes");

        svg.append("path")
            .datum(data)
            .attr("class", "line")
            .attr("d", line);

        var focus = svg.append("g")
            .attr("class", "focus")
            .style("display", "none");

        focus.append("circle")
            .attr("r", 5);

        var tooltipDate = tooltip.append("div")
            .attr("class", "tooltip-date");

        var tooltipLikes = tooltip.append("div");
        tooltipLikes.append("span")
            .attr("class", "tooltip-title")
            .text("Real      ");

        var tooltipLikes2 = tooltip.append("div");
        tooltipLikes.append("span")
            .attr("class", "tooltip-title")
            .text("Predict ");

        var tooltipLikesValue = tooltipLikes.append("span")
            .attr("class", "tooltip-likes");

        var tooltipLikesValue2 = tooltipLikes2.append("span")
            .attr("class", "tooltip-likes2");

        svg.append("rect")
            .attr("class", "overlay")
            .attr("width", width)
            .attr("height", height)
            .on("mouseover", function() { focus.style("display", null); tooltip.style("display", null);  })
            .on("mouseout", function() { focus.style("display", "none"); tooltip.style("display", "none"); })
            .on("mousemove", mousemove);

        function mousemove() {
            var x0 = x.invert(d3.mouse(this)[0]),
                i = bisectDate(data, x0, 1),
                d0 = data[i - 1],
                d1 = data[i],
                d = x0 - d0.date > d1.date - x0 ? d1 : d0;
            focus.attr("transform", "translate(" + x(d.date) + "," + y(d.getTod_price) + ")");

            tooltip.attr("style", "left:" + (x(d.date) + 64) + "px;top:" + y(d.getTod_price) + "px;");
            tooltip.select(".tooltip-date").text(dateFormatter(d.date));
            tooltip.select(".tooltip-likes").text(formatValue(d.getTod_price)+"    "+d.getTom_price);

        }
    });

</script>