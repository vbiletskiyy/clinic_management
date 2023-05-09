import { Controller } from '@hotwired/stimulus'


export default class extends Controller {
  connect () {
    this.closeFlash()
  }
  closeFlash () {
    const flash = document.getElementsByClassName("alert")
    console.log(flash)
    setTimeout(function(){
      flash[0].remove();
    }, 2000);
  }
}
