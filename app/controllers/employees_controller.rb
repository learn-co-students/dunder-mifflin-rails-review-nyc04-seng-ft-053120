class EmployeesController < ApplicationController
  before_action :find_employee, except: [:index, :new, :create]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = "Employee successfully created"
      redirect_to @employee
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    if @employee.update_attributes(employee_params)
      flash[:success] = "Employee was successfully updated"
      redirect_to @employee
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if @employee.destroy
      flash[:success] = "Employee was successfully deleted"
      redirect_to @employees_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @employees_path
    end
  end

  private

    def find_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

end
