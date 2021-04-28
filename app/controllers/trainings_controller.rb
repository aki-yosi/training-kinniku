class TrainingsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_product, only: [:edit, :show, :update, :destroy]
    before_action :ruby_status, only: [:edit, :update, :destroy]


    def new
        @training = Training.new
    end
    def index
        @training = Training.includes(:user).order("created_at DESC")
    end

    def create
        @training = Training.new(training_params)
        if @training.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit      
    end

    def show 
        @comment = Comment.new
        @comments = @training.comments.includes(:user)    
    end

    def update
        if @training.update(training_params)
            redirect_to root_path
        else
            render :edit
        end
    end

    def destroy
        @training.destroy
        redirect_to root_path
    end  
 

    private
    def training_params
        params.require(:training).permit(:training_title, :training_time, :training_text).merge(user_id: current_user.id)  
    end

    def set_product
        @training = Training.find(params[:id])
    end

    def ruby_status
        if current_user.id != @training.user_id
            redirect_to root_path 
        end
    end
end
