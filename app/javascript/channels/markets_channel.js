import consumer from "./consumer"

consumer.subscriptions.create("MarketsChannel", {
  connected() {
    console.log("Connected to WallChannel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    let tr = document.getElementById("row" + data.id)
    tr.style.background = "#d1e7dd"
    tr.getElementsByClassName('rate')[0].innerText = data.rate
    setTimeout(() => document.getElementById("row" + data.id).style.background = "", 500);
  }
});
