class CandidatesController < ApplicationController  
  before_action :find_candidate, only: [:show, :edit, :update, :destroy, :vote]
  before_action :authenticate_user!, except: [:index, :edit]
  def index
    @candidates = Candidate.all.page(params[:page]).per(3) #多人用複數
  end
  
  def show
    
  end
  
  def edit
    authorize @candidate
  end
  def update
    #還是要用id找
    if @candidate.update(candidate_params)
        redirect_to root_path, notice: '更新成功'
    else    
        render :edit
    end
  end
  def destroy
    authorize @candidate
    @candidate.destroy
    redirect_to root_path, notice: '資料已刪除'
  end
  def new
    @candidate = Candidate.new
    authorize @candidate
  end
  def create
    @candidate = Candidate.new(candidate_params)
    authorize @candidate

    if @candidate.save
        redirect_to root_path, notice: '新增成功'
    else    
        render :new
    end
  end

  def vote
    #已登入者的角度新增
    current_user.votes.create(ip_address: request.remote_ip, candidate: @candidate)
    # @candidate.increment(:vote)
    # @candidate.vote = @candidate.vote + 1
    # @candidate.save
    redirect_to root_path, notice: '投票完成'
  end
  private
  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :platform, :avatar)
  end
  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end