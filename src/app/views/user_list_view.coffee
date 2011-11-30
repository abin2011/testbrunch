userListTemplate= require 'templates/user_list'
{UserList} = require 'collections/user_list'
{UserView} = require 'views/user'
class exports.UserListView extends Backbone.View
  initialize:->
    @collection.bind 'reset',@addAll
    @collection.bind 'add',@addOne
  render:->
    @$(@el).html userListTemplate()
    @
  #遍歷循環所有的users#  
  addAll:=>
    @collection.each (user):->
      userView = new UserView 
        model:user
    @$(@el).find('#user_list_header').append userView.render().el
    
  #添加一個user#
  addOne: (user) =>
    userView = new UserView model:user
    @$(@el).find('#user_list_header').append userView.render().el
    
    