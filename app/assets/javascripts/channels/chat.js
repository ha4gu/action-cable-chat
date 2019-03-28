const room_id_from_path = location.pathname.replace('/rooms/','');
App.chat = App.cable.subscriptions.create(
  { channel: "ChatChannel", room: room_id_from_path }, {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    alert(data['message'] + " / " + data['room_id'] + " / " + data['user_id']);
  },

  speak: function(input) {
    return this.perform('speak', { content: input });
  }
});
