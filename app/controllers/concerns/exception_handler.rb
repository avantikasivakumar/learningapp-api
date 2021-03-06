module ExceptionHandler
    # provides the more graceful `included` method
    extend ActiveSupport::Concern
  

    def throw_error(message, status = :unprocessable_entity)
      raise CustomException::CustomError.new(status, message)
    end

    included do
      rescue_from ActiveRecord::RecordNotFound do |e|
        json_response({ message: e.message }, :not_found)
      end
  
      rescue_from ActiveRecord::RecordInvalid do |e|
        json_response({ message: e.message }, :unprocessable_entity)
      end

      rescue_from CustomException::CustomError do |e|
        json_response({ message: e.message }, :unprocessable_entity)
      end
    end
  end