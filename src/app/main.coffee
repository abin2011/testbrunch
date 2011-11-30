window.app = {}
app.routers = {}
app.models = {}
app.collections = {}
app.views = {}

MainRouter = require('routers/main_router').MainRouter
HomeView = require('views/home_view').HomeView

{UserListView} = require 'views/user_list_view'
{UserEditView} = require 'views/user_edit_view'
{UserListColl} = require 'collections/user_list'
# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.routers.main = new MainRouter()
    app.views.home = new HomeView()
    app.collections.userListColl = new UserListColl();
    
    app.views.userList = new UserListView
      collection:app.collections.userListColl
      
    app.views.userEdit = new UserEditView();
    
      
    app.routers.main.navigate 'home', true if Backbone.history.getFragment() is ''
  app.initialize()
  Backbone.history.start()
