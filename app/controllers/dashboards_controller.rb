# frozen_string_literal: true

class DashboardsController < ApplicationController
  def index
    @tab = :dashboard
    @dashboard = :dashboard
  end
end
