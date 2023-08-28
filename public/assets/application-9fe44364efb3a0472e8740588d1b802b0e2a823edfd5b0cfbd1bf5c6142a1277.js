// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "bootstrap"
import "channels"


  const messagesContainer = document.getElementById('messages-container');
  const messagesDiv = document.getElementById('messages');

  // Function to scroll to the bottom of the messages container
  function scrollToBottom() {
    messagesContainer.scrollTop = messagesDiv.clientHeight;
  }

  // Attach an event listener to scroll whenever new messages are added
  messagesDiv.addEventListener('turbo:streams:message', scrollToBottom);

  // Initial scroll to the bottom
  scrollToBottom();

