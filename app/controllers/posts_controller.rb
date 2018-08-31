class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  respond_to :js, :json, :html

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    tomorrow = (Date.today+1).strftime("%Y-%m-%d")
    twodaysafter = (Date.today+2).strftime("%Y-%m-%d")
    @pickuplist = ["내일(#{tomorrow}) 8:45 ~ 9:00", "내일(#{tomorrow}) 10:15 ~ 10:30", "내일(#{tomorrow}) 11:45 ~ 12:00",
                    "내일(#{tomorrow}) 13:15 ~ 13:30", "내일(#{tomorrow}) 14:45 ~ 15:00", "내일(#{tomorrow}) 16:15 ~ 16:30",
                    "모레(#{twodaysafter}) 8:45 ~ 9:00", "모레(#{twodaysafter}) 10:15 ~ 10:30", "모레(#{twodaysafter}) 11:45 ~ 12:00",
                    "모레(#{twodaysafter}) 13:15 ~ 13:30", "모레(#{twodaysafter}) 14:45 ~ 15:00", "모레(#{twodaysafter}) 16:15 ~ 16:30"]
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.writer = current_user.email
    @post.pagenum = params[:post][:pagenum].to_i
    today = Date.today

    a=params[:post][:pickup]

    if a == "내일(#{today+1}) 8:45 ~ 9:00"
      @post.pickupdate = today+1
      @post.pickuptime = Time.utc((today+1).year, (today+1).month, (today+1).day, 8,45,0)

    elsif a == "내일(#{today+1}) 10:15 ~ 10:30"
      @post.pickupdate = today+1
      @post.pickuptime = Time.utc(@post.pickupdate.year, @post.pickupdate.month, @post.pickupdate.day, 10,15,0)

    elsif a == "내일(#{today+1}) 11:45 ~ 12:00"
      @post.pickupdate = today+1
      @post.pickuptime = Time.utc(@post.pickupdate.year, @post.pickupdate.month, @post.pickupdate.day, 11,45,0)

    elsif a == "내일(#{today+1}) 13:15 ~ 13:30"
      @post.pickupdate = today+1
      @post.pickuptime = Time.utc(@post.pickupdate.year, @post.pickupdate.month, @post.pickupdate.day, 13,15,0)

    elsif a == "내일(#{today+1}) 14:45 ~ 15:00"
      @post.pickupdate = today+1
      @post.pickuptime = Time.utc(@post.pickupdate.year, @post.pickupdate.month, @post.pickupdate.day, 14,45,0)

    elsif a == "내일(#{today+1}) 16:15 ~ 16:30"
      @post.pickupdate = today+1
      @post.pickuptime = Time.utc(@post.pickupdate.year, @post.pickupdate.month, @post.pickupdate.day, 16,15,0)

    elsif a == "모레(#{today+2}) 8:45 ~ 9:00"
      @post.pickupdate = today+2
      @post.pickuptime = Time.utc(@post.pickupdate.year, @post.pickupdate.month, @post.pickupdate.day, 8,45,0)

    elsif a == "모레(#{today+2}) 10:15 ~ 10:30"
      @post.pickupdate = today+2
      @post.pickuptime = Time.utc(@post.pickupdate.year, @post.pickupdate.month, @post.pickupdate.day, 10,15,0)

    elsif a == "모레(#{today+2}) 11:45 ~ 12:00"
      @post.pickupdate = today+2
      @post.pickuptime = Time.utc(@post.pickupdate.year, @post.pickupdate.month, @post.pickupdate.day, 11,45,0)

    elsif a == "모레(#{today+2}) 13:15 ~ 13:30"
      @post.pickupdate = today+2
      @post.pickuptime = Time.utc(@post.pickupdate.year, @post.pickupdate.month, @post.pickupdate.day, 13,15,0)

    elsif a == "모레(#{today+2}) 14:45 ~ 15:00"
      @post.pickupdate = today+2
      @post.pickuptime = Time.utc(@post.pickupdate.year, @post.pickupdate.month, @post.pickupdate.day, 14,45,0)

    elsif a == "모레(#{today+2}) 16:15 ~ 16:30"
      @post.pickupdate = today+2
      @post.pickuptime = Time.utc(@post.pickupdate.year, @post.pickupdate.month, @post.pickupdate.day, 16,15,0)   
      
    end 

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

    current_user.cash = current_user.cash - (@post.pagenum*50)
    current_user.save
    
  end

  # # PATCH/PUT /posts/1
  # # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
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
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:attachment, :pagenum, :pickupdate, :pickuptime)
    end
end
