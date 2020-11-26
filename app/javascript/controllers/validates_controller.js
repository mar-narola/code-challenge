import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["email", "emailMessage"];

  validateEmail(event) {
    event.preventDefault;
    var email = new RegExp(/^([a-zA-Z0-9_\-\.]*[a-zA-Z0-9]+[_\-]*)@getmainstreet.com$/);
    console.log(this.submitTarget);
    if(this.element.querySelector(".error")){
      this.element.querySelector(".error").remove();
    }
    if (this.emailTarget.value && !this.emailTarget.value.match(email)) {
      this.emailTarget.classList.add("is-invalid");
      this.emailMessageTarget.innerHTML = "Email not matching with specified format!"
    } else {
      this.emailTarget.classList.remove("is-invalid");
      this.emailMessageTarget.innerHTML = "";
    }
  }
}
