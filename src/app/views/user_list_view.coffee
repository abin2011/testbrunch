userList= require 'templates/user_list'
{UserList} = require 'collections/user_list'
class exports.UserListView extends Backbone.View
  render:->
    @$(@el).html userList()
	  @