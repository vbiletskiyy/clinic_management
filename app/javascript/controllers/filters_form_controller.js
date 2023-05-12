import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['filtersForm']


  submit() {
    console.log(111)
    this.filtersFormTarget.submit()
  }
}
