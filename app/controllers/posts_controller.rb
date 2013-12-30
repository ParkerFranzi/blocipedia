class PostsController < ApplicationController
  def index
    @posts = Post.visible_to(current_user).paginate(page: params[:page], per_page: 10)
  end

  def show
    @post = Post.find(params[:id])
    authorize! :read, @post, message: "You need to be signed-in to do that."
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(params[:post])
    authorize! :create, @post, message: "You need to be signed up to do that."
    if @post.save
      flash[:notice] = "Wiki was saved"
      redirect_to @post
    else
      flash[:error] = "There was an error saving. Please try again"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize! :edit, @post, message: "You need to own the Wiki to edit it."
  end

  def update
    @post = Post.find(params[:id])
    authorize! :update, @post, message: "You need to own the Wiki to edit it"
    if @post.update_attributes(params[:post])
      flash[:notice] = "Wiki was updated"
      redirect_to @post
    else
      flash[:error] = "There was an error saving. Please try again"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    title = @post.title
    authorize! :destroy, @post, message: "You need to own that Wiki to delete it."
    if @post.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to posts_path
    else
      flash[:error] = "There was an error deleting the Wiki."
      render :show
    end
  end
end
