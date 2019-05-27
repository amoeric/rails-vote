class UsersController < ApplicationController  
    before_action :authenticate_user!, except: [:history]
    def history
    end

end