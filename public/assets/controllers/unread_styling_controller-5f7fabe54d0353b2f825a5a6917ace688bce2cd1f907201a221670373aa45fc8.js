import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["chatroomName", "userFullname"];

  connect() {
    this.listenForTurboStreamUpdates();
  }

  listenForTurboStreamUpdates() {
    this.element.addEventListener("turbo:streams:update", (event) => {
      // Check if the updated element is a new message
      if (event.target.dataset.turboStreamAction === "append") {
        // Determine the group name or user name from the updated message
        const chatroomName = event.detail.target.dataset.chatroomName;
        const userFullname = event.detail.target.dataset.userFullname;

        // Apply the bold styling to the appropriate element
        if (chatroomName) {
          this.chatroomNameTargets.find((el) => el.textContent === chatroomName).style.fontWeight = "bold";
        }
        if (userFullname) {
          this.userFullnameTargets.find((el) => el.textContent === userFullname).style.fontWeight = "bold";
        }
      }
    });
  }
};
