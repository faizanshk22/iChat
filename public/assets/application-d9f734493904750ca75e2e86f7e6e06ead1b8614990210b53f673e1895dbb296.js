// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "bootstrap"
import "channels"


document.addEventListener('turbo:load', () => {
    const messageContainer = document.querySelector('.message-container');
    
    if (messageContainer) {
      // Scroll to the bottom of the message container
      messageContainer.scrollTop = messageContainer.scrollHeight;
    }
  });
