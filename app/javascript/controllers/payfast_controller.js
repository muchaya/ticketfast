import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

// Connects to data-controller="payfast"
export default class extends Controller {
  static targets = ['amount', 'email', 'firstName', 'lastName']

  async initiatePayment(event) {
    event.preventDefault()

    const url = this.element.action;

    try {
      // Send POST request to the Rails server
      const request = await post(url, {
        body: JSON.stringify({
          amount: this.amountTarget.value,
          email: this.emailTarget.value,
          first_name: this.firstNameTarget.value,
          last_name: this.lastNameTarget.value
        }),
        contentType: "application/json", // Ensure correct content type
        responseKind: "json" // Expect JSON response
      });

      // Handle the response
      if (request.ok) {
        const response = await request.json;
        const uuid = response.uuid;
        const returnUrl = response.return_url;
        const cancelUrl = response.cancel_url;

        if (uuid) {
          window.payfast_do_onsite_payment({
            "uuid": uuid, 
            "return_url": returnUrl,
            "cancel_url": cancelUrl
          })
        } else {
          console.error("UUID not found in the response");
        }
      } else {
        console.error("Failed to initiate payment. Response status:", request.response.status);
      }
    } catch (error) {
      console.error("An error occurred while initiating payment:", error);
    }
  }
}
