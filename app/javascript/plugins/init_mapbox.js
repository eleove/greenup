import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const geocoder = new MapboxGeocoder({ // Initialize the geocoder
      accessToken: mapboxgl.accessToken, // Set the access token
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    // centrer sur la France
    const bbox = [[-5.025736, 42.084348], [9.415401, 51.242286]];
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11'
    });
    map.fitBounds(bbox, {
      padding: {top: 10, bottom:15, left: 5, right: 5}
    });
    // map.addControl(geocoder);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '30px';//'15px';
      element.style.height = '42px';//'21px';
      new mapboxgl.Marker(element)
        .setLngLat([ marker.long, marker.lat ])
        .setPopup(popup)
        .addTo(map)
      // let content = document.querySelector('.mapboxgl-popup-content > h2')
      // content.setContent(content.getContent());
    });
    // map.addControl(new mapboxgl.NavigationControl());
    document.getElementById('geocoder').appendChild(geocoder.onAdd(map));
  };
};

export { initMapbox };
