class DogsController < ApplicationController
  before_action :find_dog, except: [:index, :new, :create]

  def index
    @dogs = Dog.all
  end

  def show
    @owners = @dog.employees
  end

  def new
    @dog = Dog.new
  end

  def edit
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      flash[:success] = "Dog successfully created"
      redirect_to @dog
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    if @dog.update_attributes(dog_params)
      flash[:success] = "Dog was successfully updated"
      redirect_to @dog
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if @dog.destroy
      flash[:success] = "Dog was successfully deleted"
      redirect_to @dogs_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @dogs_path
    end
  end

  private

    def find_dog
      @dog = Dog.find(params[:id])
    end

    def dog_params
      params.require(:dog).permit(:name, :breed, :age)
    end

end
