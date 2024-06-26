class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to prototype_path(@prototype), notice: 'コメントが投稿されました。'
    else
      render 'prototypes/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
