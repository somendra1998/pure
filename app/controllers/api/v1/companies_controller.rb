class Api::V1::CompaniesController < ApiController
  before_action :set_company, only: [:show]

  def index
    companies = current_user.companies
    render json: companies
  end

  def show
    render json: @company
  end

  private

  def set_company
    @company = current_user.company.find([params[:id]])
    rescue
      render json: {error: "No Company found"}, status: :not_found
  end
end
