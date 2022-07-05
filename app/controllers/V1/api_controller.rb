class ApiController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
end
