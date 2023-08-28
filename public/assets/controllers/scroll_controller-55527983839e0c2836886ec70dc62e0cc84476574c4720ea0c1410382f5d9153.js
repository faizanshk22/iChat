import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Connected");
        const messages = document.getElementById("messages");
        messages.addEventListener("DOMNodeInserted", this.resetScroll)
        this.resetScroll(messages);
    }
    disconnected() {
        console.log("Disconnected");
        const messages = document.getElementById("messages");
        messages.removeEventListener("turbo:stream:after-append", this.resetScroll);
    }
    resetScroll() {
        messages.scrollTop = messages.scrollHeight - messages.clientHeight; 
    }
};
