# Pasajero Civico

Pasajero Civico is project which want to allow users to report crime and
problems in the bus routes in Ayacucho, Peru.

This idea comes from [Desarrollando America Latina](http://desarrollandoamerica.org/).
An Idea that can comes to the reality but this time I really want to make it happen.

The idea original comes from de conversation of @ianshward, @rub21 and @matiskay.


## Tools

Mapbox : Tile Based Maps.

Tile Mill : A Map Studio Designer.

Wax : A geteway to put maps on the web. This library is so nice but it doesn't allow me
to do what I want.

Sinatra : A DSL for quickly creating web applications in Ruby with minimal effort.

Leaflet: A Modern, Lightweight Open-Source JavaScript Library for Interactive Maps. 


## Strategy

Sinatra will provide the api to server all the information relative to location. Wax
will handle put that information on the maps.

## API

### api/submit

- Save in database.
  * Latitude
  * Longitude
  * Titulo 
  * Description 
  * Issue Date 
  * Category 
  * Timestamp 
  * id 

### api/getpoint
  * id

### api/getpoints
  * range of dates 

## References

- [Tilemill](http://mapbox.com/tilemill/)
- [Sinatra](http://www.sinatrarb.com/)
- [Leaflet](http://leaflet.cloudmade.com/)
- [Mapbox](http://mapbox.com/)
- [Wax](http://mapbox.com/wax/)
