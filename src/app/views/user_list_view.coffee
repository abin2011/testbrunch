userListTemplate= require 'templates/user_list'
{UserView} = require 'views/user_view'
class exports.UserListView extends Backbone.View
  
  initialize:->
    @collection.bind 'reset',@render
    @collection.bind 'remove', @render
  #遍歷循環所有的users#
  render: =>
    $el = @$(@el)
    $el.html userListTemplate()
    $el.find('#user-list').empty()
    @collection.each (user) ->
      userView = new UserView
        model: user
      $el.find('#user-list').append userView.render().el
    @
    
    