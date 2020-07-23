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

    def create
        @employee = Employee.new(employee_params)
        # @employee.dog = Dog.find_or_create_by(dog_params)

        if @employee.save
            redirect_to @employee
        else  
            render :new
        end
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        if @employee.save
            redirect_to @employee
        else  
            render :edit
        end
    end

    private
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

    # def dog_params
    #     params.require(:dog).permit(:name, :breed, :age)
    # end
end

# dogs=>name/breed/age
#employees => first_name/last_name/alias/title/office/img_url/dog_id
