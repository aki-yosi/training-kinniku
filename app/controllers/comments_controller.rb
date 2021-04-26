class CommentsController < ApplicationController

    def create
        comment = Comment.create(comment_params)
        redirect_to "/trainings/#{comment.training.id}"  # コメントと結びつくツイートの詳細画面に遷移する
      end
    
      private
      def comment_params
        params.require(:comment).permit(:text).merge(user_id: current_user.id, training_id: params[:training_id])
      end
    end
end
