userEditTemplate = require 'templates/user_edit'

class exports.UserEditView extends Backbone.View
  tagName:'div'
  className:'add-edit'
  render:=>
    @$(@el).html userEditTemplate()
    @
			