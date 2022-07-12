module V1
class ApplicationController < ActionController::API
include Response
include ExceptionHandler
include Devisefn
require 'will_paginate/array'
 #protect_from_forgery with: :null_session
end
end
