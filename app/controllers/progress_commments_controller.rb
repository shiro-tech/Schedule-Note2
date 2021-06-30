class ProgressCommmentsController < ApplicationController
  def index
    @progress_comments = ProgressComments.all
  end
  def new
    @progress_comment = ProgressComment.new
    # @progress_id = params[:progress_id]
  end
  def create
  end
end
