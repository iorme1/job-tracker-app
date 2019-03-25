class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new 
  end

  def create
    @company = current_user.companies.new(company_params)

    if @company.save
      flash[:notice] = "Your company was successfully saved."
      redirect_to @company
    else
      flash[:alert] = "There was an error saving your company. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    @company.assign_attributes(company_params)

    if @company.save
      flash[:notice] = "Your company has been successfully updated."
      redirect_to @company
    else
      flash.now[:alert] = "There was an error updating your company. Please try again."
      render :edit
    end
  end

  def destroy
    if @company.destroy
      flash[:notice] = "Company was removed."
      redirect_to root_path
    else
      flash[:alert] = "Company could not be removed. Please try again."
      redirect_to root_path
    end
  end

  private

  def company_params
    params.require(:company).permit(:summary, :notes, :cover_letter, :contacts, :technologies, :website, :name)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
