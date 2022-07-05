module V1
class ApplicationController < ActionController::API
include Response
include ExceptionHandler
include Devisefn
 #protect_from_forgery with: :null_session
end
end
