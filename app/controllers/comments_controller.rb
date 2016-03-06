class CommentsController < ApplicationController

  def create

    @comment = Object.const_get(params[:commentable_type]).find(params[:commentable_id]).comments.build(comment_params)
    @comment.account = current_user.account

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @speech }
        format.js   # render comments/create.js.erb
      else
        format.js   # render comments/create.js.erb        
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:description)
    end
end
