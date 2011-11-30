class exports.MainRouter extends Backbone.Router
  routes :
    "home": "home"
    "add-user":"addUser"
  home: ->
    $('body').html app.views.home.render().el
    $("#content").append app.views.userList.render().el
  addUser:->
    $('body').html app.views.home.render().el
    $("#content").append app.views.userEdit.render().el