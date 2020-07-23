class DogsController < ApplicationController
    before_action :set_dog, only: [:show, :edit]

    def index
        @dogs = Dog.sort_by_employees?(params[:sort])
    end

    def show
    end


    private

    def set_dog
        @dog = Dog.find(params[:id])
    end

end
