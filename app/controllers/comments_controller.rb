class CommentsController < ApplicationController

  def create
    @speech = Speech.find(params[:speech_id])
    @comment = @speech.comments.build(comment_params)
    @comment.account = current_user.account
    @comment.save!
    respond_to do |format|
      format.html { redirect_to @speech }
      format.js   # render comments/create.js.erb
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:description)
    end
end
