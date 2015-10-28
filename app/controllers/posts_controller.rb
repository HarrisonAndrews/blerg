class PostsController < ApplicationController
  def new
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
  end

  def update
    post = Post.find(params[:id])

    respond_to do |format|
      if Post.update_attributes(post_params)
        format.html { redirect_to @foo, notice: "blerg successfully updated" }
      else
        format.html { render action: "edit" }
      end
    end
  end





  def index
    @posts = Post.page(params[:page]).per(10)
    render :index
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end
end

