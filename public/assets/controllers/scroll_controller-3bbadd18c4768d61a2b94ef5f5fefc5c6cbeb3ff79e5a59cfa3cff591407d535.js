export default class {
    constructor(element) {
        this.element = element;
        this.scrollMessages();
    }

    scrollMessages() {
        this.element.scrollTop = this.element.scrollHeight - this.element.clientHeight;
    }
};
