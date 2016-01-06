class Api::V1::BaseController < ApplicationController

include ParamsChecker

  before_action :params_parser

end
