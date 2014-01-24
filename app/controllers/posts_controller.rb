class PostsController < ApplicationController

  before_filter :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.visible_to(current_user).paginate(page: params[:page], per_page: 10)
  end

  def show
    @users = User.all
    if request.path != post_path(@post)
      redirect_to @post, status: :moved_permanently
    end
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
    @users = User.all
    authorize! :edit, @post, message: "You need to own the Wiki to edit it."
  end

  def update
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

  private

  def set_post   # this method just reduces duplication in yr code
    @post = Post.find(params[:id])
  end
  
end
