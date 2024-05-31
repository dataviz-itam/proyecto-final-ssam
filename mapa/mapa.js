var height = 600; // 300 * 2
var width = 900; // 300 * 3
var projection = d3.geo.mercator();
var map = void 0;
var mexico = void 0;

var hover = function (d) {
  console.log("d", d, "event", event);
  var div = document.getElementById("tooltip");
  div.style.left = event.pageX + "px";
  div.style.top = event.pageY + "px";
  div.innerHTML = d.properties.NAME_1;
};

var path = d3.geo.path().projection(projection);

var svg = d3
  .select("#map")
  .append("svg")
  .attr("width", width)
  .attr("height", height);

d3.json("geo-data.json", function (data) {
  var states = topojson.feature(data, data.objects.MEX_adm1);

  var b, s, t;
  projection.scale(1).translate([0, 0]);
  var b = path.bounds(states);
  var s =
    0.9 / Math.max((b[1][0] - b[0][0]) / width, (b[1][1] - b[0][1]) / height);
  var t = [
    (width - s * (b[1][0] + b[0][0])) / 2,
    (height - s * (b[1][1] + b[0][1])) / 2,
  ];
  projection.scale(s).translate(t);

  map = svg.append("g").attr("class", "boundary");
  mexico = map.selectAll("path").data(states.features);

  var colors = [
    "#2E008B", // pan, aguascalientes
    "#651D32", // morena, baja california
    "#651D32", // morena, baja california sur
    "#c8102E", // pt, campeche
    "#651D32", // morena, chiapas
    "#2E008B", // pan, chihuahua
    "#be3a34", // pri, coahuila
    "#651D32", // morena, colima
    "#651D32", // morena, cdmx
    "#be3a34", // pri, durango
    "#2E008B", // pan, guanajuato
    "#651D32", // morena, guerrero
    "#651D32", // morena, hidalgo
    "#Fc4c02", // mc, jalisco
    "#be3a34", // pri, estado de mexico
    "#651D32", // morena, michoacan
    "#651D32", // morena, morelos
    "#651D32", // morena, nayarit
    "#Fc4c02", // mc, nuevo leon
    "#651D32", // morena, oaxaca
    "#651D32", // morena, puebla
    "#2E008B", // pan, queretaro
    "#651D32", // morena, quintana roo
    "#8edd65", // pvem, san luis potosi
    "#651D32", // morena, sinaloa
    "#651D32", // morena, sonora
    "#651D32", // morena, tabasco
    "#651D32", // morena, tamaulipas
    "#651D32", // morena, tlaxcala
    "#651D32", // morena, veracruz
    "#2E008B", // pan, yucatan
    "#c8102E", // pt, zacatecas
  ]; // Example array of colors

  mexico
    .enter()
    .append("path")
    .attr("d", path)
    .on("mouseover", hover)
    .attr("fill", function (d, i) {
      return colors[i % colors.length];
    });

  mexico.exit().remove();
});
