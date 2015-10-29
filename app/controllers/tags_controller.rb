class TagsController < ApplicationController
  def tagged
    @tag = Tag.find_by!(name: params[:name])
    @posts = @tag.posts
    render :tagged
  end
end