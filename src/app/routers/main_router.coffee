{UserAddView} = require 'views/user_add_view'

class exports.MainRouter extends Backbone.Router
  routes :
    "home": "home"
    "add-user":"addUser"
  home: ->
    $('body').html app.views.home.render().el
    $("#content").append app.views.userList.render().el
  addUser:->
    $('body').html app.views.home.render().el
    app.views.userAddView = new UserAddView
      collection:app.collections.userList
    $("#content").append app.views.userAddView.render().el