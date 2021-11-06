class Comment < ApplicationRecord
  validates :description, presence: true

  after_save :comment_name

  belongs_to :user
  belongs_to :topic

  private
    def comment_name
      if @comments.present?
      params.require(:comment).permit(:description, :name).merge(user_id: current_user.id, topic_id: params[:topic_id])
      end
    end
end
