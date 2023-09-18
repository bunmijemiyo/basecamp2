# class MessagesController < ApplicationController
#     before_action :set_message, only: [:show, :edit, :update, :destroy]

#     def show
#     end

#     def index
#         @messages = Message.all
        
#     end

#     def new
#         @message = Message.new
#     end

#     def create
#         @message = Message.new(message_params)
#         # @project.user = current_user

#         if @message.save
#             flash[:notice] = "message was created successfully"
#             redirect_to discussions_path
#         else
#             render 'new'
#         end
#     end

#     def update
#         if @message.update(message_params)
#             flash[:notice] = "message was updated successfully"
#             redirect_to discussions_path
#         else
#             render 'edit'
#         end
#     end

#     def destroy
#         @message.destroy
#         redirect_to discussions_path
#     end

#     private

#     def set_message
#         @message = Message.find(params[:id])
#     end

#     def message_params
#         params.require(:message).permit(:comment)
#     end

# end


class MessagesController < ApplicationController
    before_action :set_discussion, only: [:new, :create]
  
    def new
      @message = @discussion.messages.build
    end
  
    def create
      @message = @discussion.messages.build(message_params)
      if @message.save
        flash[:notice] = 'Message created successfully.'
        redirect_to discussion_path(@discussion)
      else
        render 'new'
      end
    end

    # app/controllers/messages_controller.rb
def edit
    @discussion = Discussion.find(params[:discussion_id])
    @message = @discussion.messages.find(params[:id])
  end

  def update
    @discussion = Discussion.find(params[:discussion_id])
    @message = @discussion.messages.find(params[:id])

    if @message.update(message_params)
      redirect_to discussion_path(@discussion), notice: 'Message was successfully updated.'
    else
      render 'edit'
    end
  end
  

    def destroy
        @discussion = Discussion.find(params[:discussion_id])
        @message = @discussion.messages.find(params[:id])
        @message.destroy
    
        redirect_to discussion_path(@discussion), notice: 'Message was successfully deleted.'
      end
  
    private
  
    def set_discussion
      @discussion = Discussion.find(params[:discussion_id])
    end
  
    def message_params
      params.require(:message).permit(:comment)
    end

end
  