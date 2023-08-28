import consumer from "./consumer"

consumer.subscriptions.create("UserStatusChannel", {
  received(data) {
    const { user_id, status } = data;
    const userElement = document.querySelector(`#user-${user_id}`);
    
    if (userElement) {
      const userStatusElement = userElement.querySelector('.user-status');
      userStatusElement.classList.remove('offline', 'online', 'away');
      userStatusElement.classList.add(status);
    }
  }
});
