class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def create

        byebug
        @employee = Employee.new(employee_params)

        respond_to do |format|
            if @employee.save
                byebug
                format.html { redirect_to @employee, notice: 'employee was successfully created.' }
            else
                byebug
                format.html { render :new }
            end
        end
    end
        
    def update

        @employee = Employee.find(params[:id])

        respond_to do |format|
            if @employee.update(employee_params)
                format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end


    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
    end

end
