class PostsController < ApplicationController
  def new
    @post = Post.new
    render :new
  end

  def create
    post = Post.create(title: params[:title],
                       content: params[:content],
                       tag_names: params[:tags],
                       written_at: DateTime.now)
    redirect_to post_path(post)
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    post = Post.find(params[:id])
    post.update(title: params[:title],
                content: params[:content],
                tag_names: params[:tags])
    redirect_to post_path(post)
  end

  #
  #   respond_to do |format|
  #     if Post.update_attributes(post_params)
  #       format.html { redirect_to @post, notice: "blerg successfully updated" }
  #     else
  #       format.html { render action: "edit" }
  #     end
  #   end
  # end





  def index
    @posts = Post.page(params[:page]).per(10)
    render :index
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def tagged
    @tag = Tag.find_by(name: params[:name])
    @posts = @tag.posts
    render :tagged
  end
end

