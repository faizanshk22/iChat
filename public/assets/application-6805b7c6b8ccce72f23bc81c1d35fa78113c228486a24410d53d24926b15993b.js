// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "bootstrap"
import "channels"


const messagesContainer = document.getElementById('messages-container');
  
function scrollToBottom() {
  messagesContainer.scrollTop = messagesContainer.scrollHeight;
}

messagesContainer.addEventListener('turbo:streams:message', scrollToBottom);

scrollToBottom();
