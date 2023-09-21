class DiscussionsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_admin_user, only: [:new, :edit, :update, :destroy]

    def show
        @discussion = Discussion.find(params[:id])
        @message = Message.new(discussion: @discussion) # Initialize a new message object for this discussion
    end
      

    def index
        @discussions = Discussion.all
        @messages_by_discussion = {} # A hash to store messages for each discussion
    
        # Iterate through each discussion to build the associated message
        @discussions.each do |discussion|
            @messages_by_discussion[discussion] = Message.new(discussion: discussion) # Initialize a new message object
            # @messages_by_discussion[discussion] = discussion.messages.build
        end
    end

    def new
        @discussion = Discussion.new
    end

    def create
        @discussion = Discussion.new(discussion_params)
        @discussion.user = current_user

        if @discussion.save
            flash[:notice] = "Thread was created successfully"
            redirect_to discussions_path
        else
            render 'new'
        end
    end

    def update
        if @discussion.update(discussion_params)
            flash[:notice] = "Thread was updated successfully"
            redirect_to discussions_path
        else
            flash[:error] = "Error updating thread: #{@discussion.errors.full_messages.join(', ')}"
            render 'edit'
        end
    end

    def destroy
        @discussion.destroy
        redirect_to discussions_path
    end

    private

    def set_project
        @discussion = Discussion.find(params[:id])
    end

    def discussion_params
        params.require(:discussion).permit(:discuss)
    end

    private

    def require_admin_user
        puts "my_work", current_user.email, "my friend"
        # if !current_user.admin? || (current_user.email == "femi@gmail.com")
        unless current_user.admin? || current_user.email == "bjemiyor@gmail.com"
            flash[:alert] = "Only admin can create, edit or delete Thread"
            redirect_to discussions_path
        end
    end

end