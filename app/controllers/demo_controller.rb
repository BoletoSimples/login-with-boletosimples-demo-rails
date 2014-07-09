class DemoController < ApplicationController
  before_filter :authenticate!, only: [:logged_in]

  def index
  end

  def api
  end

  def access_api
  end

  def logged_in
  end
end
