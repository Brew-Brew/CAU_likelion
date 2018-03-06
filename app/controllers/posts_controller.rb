class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_teamid
  # user 로그인 여부 체크
  before_action :authenticate_user!
  before_action :authenticate_user!, only: [:index,:show, :new, :edit, :destroy]

  before_action :check_user_in_cau
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where("team_id = ?", params[:teamid])

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    #team 넘버를 check해서, 글을 작성할수 있는지 판단한다.
    if (params[:teamid]).to_i != current_user.team_id
      flash[:alert] = "#{params[:teamid]}팀만 이 스터디방에 글을 작성할 수있습니다!"
      redirect_back(fallback_location: root_path)
    end
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    if @post.user_id != current_user.id
      redirect_back(fallback_location: root_path)
    else
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(params[:teamid],@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to post_path(@post.team_id,@post), notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if @post.user_id != current_user.id
      flash.now[:alert] = '본인만 이글을 삭제할 수있습니다!'
      redirect_back(fallback_location: root_path)
    else
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end
  #좋아요 관련 액션
  def like_toggle
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    if like.nil?
      Like.create(user_id: current_user.id, post_id: params[:post_id])
    else
      like.destroy
    end
  redirect_back(fallback_location: root_path)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    def set_teamid
      @teamid=params[:teamid]
    end
    #cau 팀학생인지 check 한다.팀번호가 없으면 cau학생만 이용가능하다는 페이지로 이동한다.
    def check_user_in_cau
      if user_signed_in?
        @user_team=current_user.id
        if([1,2,3].include? @user_team)
        else
          redirect_to '/onlycau'
        end
      end

    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.fetch(:post).permit(:content,:title,:attachment,:team_id,:user_id)
    end
end
