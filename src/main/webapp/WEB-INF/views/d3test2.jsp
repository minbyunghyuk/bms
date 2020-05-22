<!DOCTYPE html>
<meta charset="utf-8">
<style> /* set the CSS */

.line {
    fill: none;
    stroke: steelblue;
    stroke-width: 2px;
}

</style>
<body>

<!-- load the d3.js library -->
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script>
    var url = "http://localhost:8080/rest/getjsonlist?name=아시아종묘";


    // set the dimensions and margins of the graph
    var margin = {top: 20, right: 20, bottom: 30, left: 50},
        width = 960 - margin.left - margin.right,
        height = 500 - margin.top - margin.bottom;

    // parse the date / time
    //var parseTime = d3.timeParse("%d-%b-%y");
    var parseTime = d3.timeParse("%Y-%m-%d");

    var x = d3.scaleTime().range([0, width]);
    var y = d3.scaleLinear().range([height, 0]);
    // define the 1st line
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
    // set the ranges

    var svg = d3.select("body").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform",
            "translate(" + margin.left + "," + margin.top + ")");
    var data2=[];
    $.ajax({
        url: url,
        success: function (data) {
            // Get the data
            d3.json(url, function (error, data) {
                data.forEach(function (d) {
                    d.date = parseTime(d.date);
                    d.getTod_price = +d.getTod_price;
                    d.getTom_price = +d.getTom_price;
                    data2.push(d);
                });
                console.log(data2);
                move(data2);
            });
        }
    });

    function move(data) {
        x.domain(d3.extent(data, function (d) {
            return d.date;
        }));
        y.domain([0, d3.max(data, function (d) {
            return Math.max(d.getTod_price, d.getTom_price);
        })]);
        svg.append("path")
            .data([data])
            .attr("class", "line")
            .attr("d", valueline);

        // Add the valueline2 path.
        svg.append("path")
            .data([data])
            .attr("class", "line")
            .style("stroke", "red")
            .attr("d", valueline2);

        // Add the X Axis
        svg.append("g")
            .attr("transform", "translate(0," + height + ")")
            .call(d3.axisBottom(x));

        // Add the Y Axis
        svg.append("g")
            .call(d3.axisLeft(y));

    }

    // Add the valueline path.


    // Scale the range of the data


</script>
</body>