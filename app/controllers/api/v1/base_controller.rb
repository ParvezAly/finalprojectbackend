class Api::V1::BaseController < ApplicationController
  before_action :require_login
end