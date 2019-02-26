import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    var geocoder = new MapboxGeocoder()
    const markers = JSON.parse(mapElement.dataset.markers);
    if (window.location.pathname === '/locations' || '/locations/' ) {
      // centrer sur la France
      const bbox = [[-1.642917, 42.525317], [8.094191, 51.016994]];
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11'
      });
      map.fitBounds(bbox, {
        padding: {top: 10, bottom:15, left: 5, right: 5}
      });
      map.addControl(geocoder);
      markers.forEach((marker) => {
        new mapboxgl.Marker()
          .setLngLat([ marker.long, marker.lat ])
          .addTo(map);
      });
    } else {
      // centrer (en zoomant ease) sur le lieu choisi par l'user / sa géoloc actuelle
      const bounds = new mapboxgl.LngLatBounds();
      // TODO : SELEC DANS CONTROLLER LES LOCATIONS_MARKERS "PROCHES" DU LIEU CHOISI
      markers.forEach((marker) => {
        bounds.extend([marker.long, marker.lat]);
      });
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11'
      });
      // map.fitBounds(bbox, {
      //   padding: {top: 10, bottom:15, left: 5, right: 5}
      // });
      map.fitBounds(bounds, {
        padding: {top: 10, bottom:15, left: 5, right: 5}
      });
      map.addControl(geocoder);
      markers.forEach((marker) => {
        new mapboxgl.Marker()
          .setLngLat([ marker.long, marker.lat ])
          .addTo(map);
      });
    }
  }
};

export { initMapbox };
