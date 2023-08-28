import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() {
    this.element.addEventListener('turbo:stream-authorized', this.handleStreamAuthorized);
  }

  disconnect() {
    this.element.removeEventListener('turbo:stream-authorized', this.handleStreamAuthorized);
  }

  handleStreamAuthorized = (event) => {
    const target = event.target;
    if (target.dataset.boldOnNewMessage) {
      // Add CSS class to make the target bold
      target.classList.add('bold-on-new-message');
    }
  };
};
