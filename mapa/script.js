// Define constants
var height = 600;
var width = 900;
var projection = d3.geoMercator();
var map = void 0;
var mexico = void 0;

var hover = function (d) {
  console.log("d", d, "event", event);
  var div = document.getElementById("tooltip");
  div.style.left = event.pageX + "px";
  div.style.top = event.pageY + "px";
  div.innerHTML = d.properties.NAME_1;
};

// Draw map
var path = d3.geoPath().projection(projection);

// Create SVG element
const svg = d3
  .select("#map-container")
  .append("svg")
  .attr("width", width)
  .attr("height", height);

// Load geo data
d3.json("geo-data.json", function (data) {
  var states = topojson.feature(data, data.objects.MEX_adm1);

  // Create map projection
  const projection = d3.geoMercator().fitSize([width, height], states);

  // Create map paths
  const paths = svg
    .selectAll("path")
    .data(states.features)
    .enter()
    .append("path")
    .attr("d", path)
    .style("fill", "lightgray")
    .style("stroke", "white");

  // Generate random data for bivariate mapping (example)
  const randomData = [];
  states.features.forEach((feature) => {
    const randomValue1 = Math.random() * 100; // Modify as needed
    const randomValue2 = Math.random() * 100; // Modify as needed
    randomData.push({ value1: randomValue1, value2: randomValue2 });
  });

  // Color map features based on random data
  paths.style("fill", (d, i) => {
    const value1 = randomData[i].value1;
    const value2 = randomData[i].value2;
    // Example: mix RGB channels based on values
    return `rgb(${value1 * 2}, ${value2 * 2}, ${(value1 + value2) * 2})`;
  });
}).catch((error) => {
  console.error("Error loading geo data:", error);
});
