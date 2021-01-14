import consumer from "./consumer"

consumer.subscriptions.create("MarketsChannel", {
  connected() {
    console.log("Connected to WallChannel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
  }
});
