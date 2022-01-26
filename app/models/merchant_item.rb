# frozen_string_literal: true

class MerchantItem < ApplicationRecord
end

# == Schema Information
#
# Table name: merchant_items
#
#  id              :bigint           not null, primary key
#  brand           :string(63)
#  description     :text(65535)
#  google_category :string(255)
#  gtin            :string(63)
#  manufacturer    :string(63)
#  mpn             :string(63)
#  sku             :string(63)       not null
#  title           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  merchant_id     :bigint           not null
#
