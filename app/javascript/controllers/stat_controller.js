import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "range", "num" ]

  change() {
    this.numTarget.innerHTML = this.rangeTarget.value
  }
}
