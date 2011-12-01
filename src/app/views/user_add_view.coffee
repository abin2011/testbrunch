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
       #user_json=form2js(@$('#comment_frm'));
       user_json=@$('#comment_frm').toObject();
       console.log "asdasdads====#{user_json}"
       user=new User user_json
       return user
  #新增#    
  addUser:=>
    user=@userinfo()
    @collection.add user
    app.routers.main.navigate 'home', true