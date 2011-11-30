userTemplates= require 'templates/user'
{User_model}= require 'models/user'
class exports.UserView extends Backbone.View
  tagName:'tr'
  className:'user-list'
  events:
    'click .user-delete':'userDelete'
    'click .user-edit':'userEdit'
  initialize: ->
    @model.bind('change', @render)
  render:=>
    @$(@el).html userTemplates @model.toJSON()
    @
    
  #刪除單個信息#
  userDelete:=>
    @model.clear()
    
  #編輯#
  userEdit:=>
    alert 'this is user edit'