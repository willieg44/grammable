class GramsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def destroy
    @gram = Gram.find_by_id(params[:id])
    return render_not_found if @gram.blank?
    @gram.destroy
    redirect_to root_path
  end
  
  def update
    @gram = Gram.find_by_id(params[:id])
    return render_not_found if @gram.blank?

    @gram.update_attributes(grams_params)
    if @gram.valid?
      redirect_to root_path
    else
      return render :edit, status: :unprocessable_entity
    end 
  end
  
  def new
        @gram = Gram.new
    end

  def edit
    @gram = Gram.find_by_id(params[:id])
    if @gram.blank?
      render plain: 'Not Found :(', status: :not_found
    end
  end


    def index

    end

    def show
      @gram = Gram.find_by_id(params[:id])
      if @gram.blank?
        render plain: 'Not Found :(', status: :not_found
      end
    end

    def create
      @gram = current_user.grams.create(grams_params)
      if @gram.valid?  
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end  
    end

    private

    def grams_params
        params.require(:gram).permit(:message)

    end

    def render_not_found
      render plain: 'Not Found :(', status: :not_found
    end
end
