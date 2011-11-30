userEditTemplate = require 'templates/user_edit'
{User} = require 'models/user'
class exports.UserAddView extends Backbone.View
  tagName:'div'
  className:'add-edit'
  collection:@collection
  events:
    'click #comment_btn':'addUser'
  render:=>
    @$(@el).html userEditTemplate()
    @   
  #獲取數據#
  userinfo:=>
       c_author = @$('#c_author').val()
       c_email = @$('#c_email').val()
       c_phone = @$('#c_phone').val()
       c_homepage = @$('#c_homepage').val()
       user=new User
          'author':c_author
          'email':c_email
          'phone':c_phone
          'homepage':c_homepage
       return user
  #新增#    
  addUser:=>
    user=@userinfo()
    @collection.add user
    app.routers.main.navigate 'home', true