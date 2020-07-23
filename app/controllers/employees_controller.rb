class EmployeesController < ApplicationController
    before_action :set_employee, only: [:show, :edit, :update]


    def index
        @employees = Employee.all
    end

    def show
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)

        @employee.save ? (redirect_to @employee) : (render :new)
    end

    def edit
    end

    def update
    end

    private
    def set_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

end
