<!DOCTYPE html>
<meta charset="utf-8">
<style>
    body {
        background-color: #F1F3F3
    }
    .axis {
        font: 10px sans-serif;
    }

    .axis path,
    .axis line {
        fill: none;
        stroke: #D4D8DA;
        stroke-width: 2px;
        shape-rendering: crispEdges;
    }

    .line {
        fill: none;
        stroke: steelblue;
        stroke-width: 1.5px;
    }

    .line2 {
        fill: none;
        stroke: steelblue;
        stroke-width: 1.5px;
    }
    .lineChart {
        fill: none;
        stroke: steelblue;
        stroke-width: 1.5px;
    }

    .overlay {
        fill: none;
        pointer-events: all;
    }

    .focus circle {
        fill: #F1F3F3;
        stroke: steelblue;
        stroke-width: 2px;
    }

    .hover-line {
        stroke: steelblue;
        stroke-width: 2px;
        stroke-dasharray: 3,3;
    }

</style>
<body>
<svg width="960" height="500"></svg>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script>
    var svg = d3.select("svg"),
        margin = {top: 20, right: 20, bottom: 30, left: 40},
        width = +svg.attr("width") - margin.left - margin.right,
        height = +svg.attr("height") - margin.top - margin.bottom;

    var parseTime = d3.timeParse("%Y-%m-%d");
    bisectDate = d3.bisector(function(d) { return d.date; }).left;

    var x = d3.scaleTime().range([0, width]);
    var y = d3.scaleLinear().range([height, 0]);

    var valueline = d3.line()
        .x(function (d) {
            return x(d.date);
        })
        .y(function (d) {
            //console.log(d.getTom_price);
            return y(d.getTod_price);
        });

    // define the 2nd line
    var valueline2 = d3.line()
        .x(function (d) {
            return x(d.date);
        })
        .y(function (d) {
            //console.log(d.getTom_price);
            return y(d.getTom_price);
        });

    var g = svg.append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
    var url = "http://localhost:8080/rest/getjsonlist?name=아시아종묘" ;
    d3.json(url, function(error, data) {
        if (error) throw error;

        data.forEach(function(d) {
            d.date = parseTime(d.date);
            d.getTod_price = +d.getTod_price;
            d.getTom_price = +d.getTom_price;
            console.log(d.date);
            console.log(d.getTod_price);
        });

        x.domain(d3.extent(data, function(d) { return d.date; }));
        y.domain([d3.min(data, function(d) { return d.getTod_price; }) , d3.max(data, function(d) { return d.getTod_price; }) ]);

        g.append("g")
            .attr("class", "axis axis--x")
            .attr("transform", "translate(0," + height + ")")
            .call(d3.axisBottom(x));

        g.append("g")
            .attr("class", "axis axis--y")
            .call(d3.axisLeft(y).ticks(6).tickFormat(function(d) { return parseInt(d / 1000) + "k"; }))
            .append("text")
            .attr("class", "axis-title")
            .attr("transform", "rotate(-90)")
            .attr("y", 6)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .attr("fill", "#5D6971")
            .text("Population)");

        g.append("path")
            .datum(data)
            .attr("class", "line")
            .attr("d", valueline);

        g.append("path")
            .datum(data)
            .attr("class", "line")
            .style("stroke", "#ff7f0e")
            .attr("d", valueline2);

        var focus = g.append("g")
            .attr("class", "focus")
            .style("display", "none");

        focus.append("line")
            .attr("class", "x-hover-line hover-line")
            .attr("y1", 0)
            .attr("y2", height);

        focus.append("line")
            .attr("class", "y-hover-line hover-line")
            .attr("x1", width)
            .attr("x2", width);


        focus.append("text")
            .attr("x", 15)
            .attr("dy", ".31em");

        svg.append("rect")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
            .attr("class", "overlay")
            .attr("width", width)
            .attr("height", height)
            .on("mouseover", function() { focus.style("display", null); })
            .on("mouseout", function() { focus.style("display", "none"); })
            .on("mousemove", mousemove);


        function mousemove() {
            var x0 = x.invert(d3.mouse(this)[0]),
                i = bisectDate(data, x0, 1),
                d0 = data[i - 1],
                d1 = data[i],
                d = x0 - d0.date > d1.date - x0 ? d1 : d0;
            focus.attr("transform", "translate(" + x(d.date) + "," + y(d.getTod_price) + ")");
            focus.select("text").text(function () {
                return d.getTod_price;
            });

            focus.select(".x-hover-line").attr("y2", height - y(d.getTod_price));
            focus.select(".y-hover-line").attr("x2", width + width);



            }
        

    });

</script>