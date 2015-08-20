<style>

.overlay {
  fill: none;
  pointer-events: all;
}

</style>
<div id="graph_{{id}}"></div>

<script type="text/javascript">

graph_{{id}} = function(){

var margin = {top: 50, right: 20, bottom: 50, left:20},
    width = 700 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var svg_{{id}} = d3.select("#graph_{{id}}").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .call(d3.behavior.zoom().scaleExtent([0.75, 8]).on("zoom", zoom_{{id}}))
    .append("g");

svg_{{id}}.append("rect")
    .attr("class", "overlay")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom);

    draw = function(nodes, svg){

     var x_scale = d3.scale.linear()
                    .domain([d3.min(nodes, function(d){ return d['x'];}), 
                             d3.max(nodes, function(d){ return d['x'];})])
                    .range([0, width]);

    var y_scale = d3.scale.linear()
                    .domain([d3.min(nodes, function(d){ return d['y'];}), 
                             d3.max(nodes, function(d){ return d['y'];})])
                    .range([height, 0]);

    svg.selectAll("circle")
       .data(nodes)
       .enter()
       .append("circle")
       .attr("cx", function(d) { return x_scale(d['x']); })
       .attr("cy", function(d) { return y_scale(d['y']); })
       .attr("r",  function(d) { return d['r']; })
       .attr("fill", "red")
       .attr("stroke-width",  0.25)
       .attr("stroke",  "#d3d3d3");

    svg.selectAll("text")
       .data(nodes)
       .enter()
       .append("text")
       .attr("x", function(d) { return x_scale(d['x']); })
       .attr("y", function(d) { return y_scale(d['y']); })
       .attr("dy", ".55em")
       .text(function(d){ return d['name']; });

    }

    var nodes_{{id}} = {{nodes}};

    draw(nodes_{{id}}, svg_{{id}});

    function zoom_{{id}}() {
      svg_{{id}}.attr("transform", "translate(" + d3.event.translate + ")scale(" + d3.event.scale + ")");
    }

}

function load_lib(url, callback){
  var s = document.createElement('script');
  s.src = url;
  s.async = true;
  s.onreadystatechange = s.onload = callback;
  s.onerror = function(){console.warn("failed to load library " + url);};
  document.getElementsByTagName("head")[0].appendChild(s);
}

if ( typeof(d3) !== "undefined" ){
    console.log('d3 is defined');
    graph_{{id}}();
}else if(typeof define === "function" && define.amd){
  console.log('trying d3 with require');
  require.config({paths: {d3: "{{ d3_url[:-3] }}"}});
      console.log('trying {{ d3_url[:-3] }}');
        
      require(["d3"], function(d3){
        window.d3 = d3;
        console.log('loaded d3 with require');
        graph_{{id}}();
  });
}else{
    consle.log('trying to load from load_lib');
    load_lib("http://d3js.org/d3.v3.min.js", graph_{{id}}());
}

</script>
