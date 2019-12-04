class GramsController < ApplicationController
    def new
        @gram = Gram.new
    end


    def index

    end

    def create
      @gram = Gram.create(grams_params)  
      redirect_to root_path
    end

    private

    def grams_params
        params.require(:gram).permit(:message)
    end
end
