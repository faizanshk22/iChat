// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "channels"

//   document.addEventListener("DOMContentLoaded", function() {
//     const conversationLinks = document.querySelectorAll(".conversation-link");
//     conversationLinks.forEach(link => {
//       link.addEventListener("click", function() {
//         const conversationId = link.getAttribute("data-conversation-id");
//         App.chat = App.cable.subscriptions.create({
//           channel: "ChatChannel",
//           conversation_id: conversationId
//         }, {
//           received: function(data) {
//             const chatContainer = document.getElementById("chat-container");
//             const messageDiv = document.createElement("div");
//             messageDiv.innerText = data.message;
//             chatContainer.appendChild(messageDiv);
//           }
//         });
//       });
//     });
//   });

