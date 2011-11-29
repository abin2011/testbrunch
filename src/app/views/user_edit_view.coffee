userEdit = require 'templates/user_edit'

class exports.UserListView extends Backbone.View
	tagName:'div'
	className:'add-edit'
	render:=>
		@$(@el).html userEdit()
			