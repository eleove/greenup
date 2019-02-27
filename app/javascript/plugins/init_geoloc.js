const initGeoloc = () => {
  const LongElement = document.getElementById('long');
  const LatElement = document.getElementById('lat');

  if (LongElement) {
    navigator.geolocation.getCurrentPosition(function(position) {
      console.log(position.coords.latitude, position.coords.longitude);
      // A RECUPERER POUR AJOUTER DANS LE FORMULAIRE
      document.querySelector('#lat').value = position.coords.latitude;
      document.querySelector('#long').value = position.coords.longitude;
    });
  }
}

export { initGeoloc };
