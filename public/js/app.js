(function($){

var MAP = MAP || {};
MAP.URL = 'http://api.tiles.mapbox.com/v3/mapbox.geography-class.jsonp';
MAP.DOM = 'map';
MAP.LAT = -13.159725;
MAP.LON = -74.22431;
MAP.ZOOM = 17;

var mm = com.modestmaps;

wax.tilejson(MAP.URL,
  function(tilejson) {
    var m = new mm.Map( MAP.DOM,
    new wax.mm.connector(tilejson))
    wax.mm.interaction(m, tilejson);
    wax.mm.pointselector(m, tilejson, {
      callback: function(coords) {
      }
    });
    m.setCenterZoom(new mm.Location(MAP.LAT, MAP.LON), MAP.ZOOM);
  }
);








})(jQuery);
