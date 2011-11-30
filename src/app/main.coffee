window.app = {}
app.routers = {}
app.models = {}
app.collections = {}
app.views = {}

MainRouter = require('routers/main_router').MainRouter
HomeView = require('views/home_view').HomeView

{UserListView} = require 'views/user_list_view'
{UserAddView} = require 'views/user_add_view'
{UserList} = require 'collections/user_list'

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.routers.main = new MainRouter()
    app.views.home = new HomeView()
    app.collections.userList = new UserList();
    app.models.user = new User();
    app.views.userList = new UserListView
      collection:app.collections.userList
      
    app.views.userAdd = new UserAddView
      collection:app.collections.userList
    app.routers.main.navigate 'home', true if Backbone.history.getFragment() is ''
  app.initialize()
  Backbone.history.start()
