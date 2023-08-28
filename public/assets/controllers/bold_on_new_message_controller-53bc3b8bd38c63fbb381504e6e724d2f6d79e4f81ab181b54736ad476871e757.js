import { Controller } from 'stimulus';

export default class extends Controller {
  connect() {
    this.element.addEventListener('turbo:stream:update', this.handleTurboStreamUpdate);
  }

  disconnect() {
    this.element.removeEventListener('turbo:stream:update', this.handleTurboStreamUpdate);
  }

  handleTurboStreamUpdate = (event) => {
    const message = event.detail.action == 'append' ? event.detail.html : null;

    if (message) {
      const boldUserElements = document.querySelectorAll('.bold-on-new-message');
      boldUserElements.forEach((element) => {
        element.classList.add('font-weight-bold');
      });
    }
  };
};
