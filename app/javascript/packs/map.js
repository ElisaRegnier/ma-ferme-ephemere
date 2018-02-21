import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 47.061096, lng: 2.339462 });
  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);
  map.setZoom(6);
}

autocomplete();
