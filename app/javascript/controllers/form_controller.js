import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["formContainer"];

  toggleForm() {
    this.formContainerTarget.classList.toggle("show");
  }
}
