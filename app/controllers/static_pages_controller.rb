class StaticPagesController < ApplicationController
  before_action :require_logout, only: [:homepage]

  #this page will eventually serve as a sign-in or signup page
  def homepage
  end

  def about
  end
end
