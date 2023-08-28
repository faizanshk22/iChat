import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Connected");
        const messages = this.element; // Change this line
        messages.addEventListener("DOMNodeInserted", () => this.resetScroll(messages));
        this.resetScroll(messages);
    }
    disconnected() {
        console.log("Disconnected");
    }
    resetScroll(messages) {
        messages.scrollTop = messages.scrollHeight - messages.clientHeight; 
    }
};
