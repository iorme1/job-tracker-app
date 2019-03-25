class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def company_params
    params.require(:company).permit(:summary, :notes, :cover_letter, :contacts, :technologies, :website, :name)
  end
end
