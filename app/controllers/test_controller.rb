# frozen_string_literal: true

# Sample controller.
class TestController < ApplicationController

  def home
    @items = MerchantItem.paginate(page: params[:page], per_page: 50).order('created_at DESC')
  end

end
