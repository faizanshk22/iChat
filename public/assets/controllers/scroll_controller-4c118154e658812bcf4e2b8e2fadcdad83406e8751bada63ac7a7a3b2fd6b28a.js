import { Controller } from "stimulus";

export default class extends Controller {
    connect() {
        console.log("Connected");
        this.resetScroll();
    }

    resetScroll() {
        console.log("Resetting scroll");
        console.log("Element:", this.element);
        this.element.scrollTop = this.element.scrollHeight - this.element.clientHeight;
    }
};
