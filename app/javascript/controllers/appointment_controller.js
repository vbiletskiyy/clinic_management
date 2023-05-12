import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['dateField', 'appointmentModal']

  connect () {
    const today = new Date().toISOString().split('T')[0]
    this.dateFieldTarget.setAttribute('min', today)
  }
}
