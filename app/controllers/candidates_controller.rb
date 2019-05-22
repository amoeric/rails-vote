class CandidatesController < ApplicationController  
    def index
        @candidates = Candidate.all #多人用複數
    end
    def new
        @candidate = Candidate.new
    end
    def create
        @candidate = Candidate.new(candidate_params)

        if @candidate.save
            flash[:notice] = '新增成功'
            redirect_to "/"
        else
            
            render :new
        end
    end
    private
    def candidate_params
        params.require(:candidate).permit(:name, :age, :party, :platform)
    end
end