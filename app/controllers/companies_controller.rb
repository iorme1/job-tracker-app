class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @shares = current_user.shares.all
    @pending_invitations = current_user.invitations.where(accepted: false)
    @companies = current_user.companies.all
  end

  def show
    owner = @company.user

    unless current_user == owner || authorized_user(owner)
      flash[:alert] = "You do not have access to see that user's companies."
      redirect_to root_path
    end
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

  def shared_index
    @share = Share.find(params[:id])
    @owner = User.find_by_email(@share.authorized_by)
    @shared_companies = @owner.companies.all
  end

  def shared_show

  end

  private

  def company_params
    params.require(:company).permit(
      :summary, :notes, :cover_letter,
      :contacts, :technologies, :website,
      :name, :job_title, :status
    )
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def authorized_user(owner)
    shares = current_user.shares.all

    shares.each do |share|
      return true if share.authorized_by == owner.email
    end
    false
  end
end
