class PostsController < ApplicationController

  before_action :require_post, except: [ :index, :create,:update]
  before_filter :authorize ,except: [ :index,:show]
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  # Assinging the current logged in user id to post id and creating post
  def create
    @post =  Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post.count_view+=1
    @post.save



  end

  def edit

  end



  def update
    if @post.update_attributes!(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end


  def admin
    if current_user.role==1

    @post = Post.where(flagarticle:nil)
    else
     redirect_to 'posts'
    end
  end

  def approove_article
  @post = Post.where(id: params[:id]).first
    @post.flagarticle=true
    @post.save
    redirect_to admin_path
  end




  def unapprooved
  #debugger


  end

  def approoved
  #Sdebugger
    comment = Comment.where( id: params[:id] ).first

    comment.comment_review=true
    #debugger
    comment.save
   redirect_to posts_path
  end



  private
  def post_params
  	params.require(:post).permit(:title, :body)
  end

  def require_post
    @post  = Post.where(id: params[:id]).first


  end
end