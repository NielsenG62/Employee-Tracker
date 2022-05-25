class ProjectsController < ApplicationController

  def new
    @division = Division.find(params[:division_id])
    @project = Project.new
    render :new
  end

  def create
    @division = Division.find(params[:division_id])
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project successfully added!"
      redirect_to division_project_path(@division, @project)
    else
      render :new
    end
  end

  def show
    # @employee = Employee.find(params[:employee_id])
    @project = Project.find(params[:id])
    render :show
  end

  def edit
    @employee = Employee.find(params[:employee_id])
    @project = Project.find(params[:project_id])
    render :edit
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to employee_path(@project.employee)
    else
      @employee = Employee.find(params[:employee_id])
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to employee_path(@project.employee)
  end

  private
    def project_params
      params.require(:project).permit(:name)
    end
end