import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geolocation"
export default class extends Controller {
  static targets = ["latitude", "longitude"]

  connect() {
    console.log('Hello from the geolocation controller')


    navigator.geolocation.getCurrentPosition((data) => {
      console.log(data);
      const latitude = data.coords.latitude
      const longitude = data.coords.longitude

      // target value in form and replace with const
      this.latitudeTarget.value = latitude
      this.longitudeTarget.value = longitude
      console.log(this.latitudeTarget);
      console.log(this.longitudeTarget);
    });


  }
}
