class CommentsController < ApplicationController

  def create
    @speech = Speech.find(params[:speech_id])
    @comment = @speech.comments.build(comment_params)
    @comment.account = current_user.account
    @comment.save
    redirect_to speech_path(@speech)
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      #params[:conference]
      params.require(:comment).permit(:description)
    end
end
