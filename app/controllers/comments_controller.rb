class CommentsController < ApplicationController
    def new
        @topic = Topic.find(params[:topic_id])
        @comment = Comment.new
        @comments = @topic.comments.includes(:user)
    end
   
    def index
        @comments = Comment.all.includes(:favorite_users)
       
    end

    def create
        @comment = Comment.new(comment_params)

        if @comment.save
        redirect_to topics_path, success: 'コメントを投稿しました'

        else
          flash.now[:danger] = "コメントの投稿に失敗しました"
          render :new
        end
    end

    def destroy
        Comment.find(params[:id]).destroy
        redirect_to topics_path
    end

    private
    def comment_params
        params.require(:comment).permit(:description).merge(user_id: current_user.id, topic_id: params[:topic_id])
     end
end
