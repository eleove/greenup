import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';
import { initGeoloc } from '../plugins/init_geoloc';
import { initFlatpickr } from '../plugins/init_flatpickr';

initMapbox();
initGeoloc();
initFlatpickr();


