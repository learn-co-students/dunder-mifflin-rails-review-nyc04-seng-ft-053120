class DogsController < ApplicationController

    def index
        @dogs = Dog.all
    end

    def show
        byebug
        @dog = Dog.find(params[:id])
    end
end
