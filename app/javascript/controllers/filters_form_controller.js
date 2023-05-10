import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['filtersForm']


  submit() {
    this.filtersForm.submit()
  }

  get filtersForm() {
    return this.element.querySelector("form")
  }
}
