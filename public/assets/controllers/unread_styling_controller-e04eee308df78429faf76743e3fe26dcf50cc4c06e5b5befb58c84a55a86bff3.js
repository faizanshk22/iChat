import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["groupName", "userName"];

  connect() {
    this.listenForTurboStreamUpdates();
  }

  listenForTurboStreamUpdates() {
    this.element.addEventListener("turbo:streams:update", (event) => {
      // Check if the updated element is a new message
      if (event.target.dataset.turboStreamAction === "append") {
        // Determine the group name or user name from the updated message
        const groupName = event.detail.target.dataset.groupName;
        const userName = event.detail.target.dataset.userName;

        // Apply the bold styling to the appropriate element
        if (groupName) {
          this.groupNameTargets.find((el) => el.textContent === groupName).style.fontWeight = "bold";
        }
        if (userName) {
          this.userNameTargets.find((el) => el.textContent === userName).style.fontWeight = "bold";
        }
      }
    });
  }
};
