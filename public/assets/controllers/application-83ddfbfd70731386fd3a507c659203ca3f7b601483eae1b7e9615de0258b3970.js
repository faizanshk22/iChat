import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export default class extends Controller {
    static targets = ["message"];
  
    connect() {
      const turboStreamUpdatesChannel = this.data.get("channel");
      this.subscription = consumer.subscriptions.create(
        turboStreamUpdatesChannel,
        {
          received: this.handleUpdate.bind(this),
        }
      );
    }
  
    disconnect() {
      this.subscription.unsubscribe();
    }
  
    handleUpdate(data) {
      const target = data.target;
      const action = data.action;
      const id = data.id;
  
      if (target && action && id) {
        const targetElement = this.messageTarget.querySelector(`[data-${action}="${id}"]`);
        if (targetElement) {
          Turbo.renderStreamMessage(targetElement.outerHTML);
        }
      }
    }
  };
