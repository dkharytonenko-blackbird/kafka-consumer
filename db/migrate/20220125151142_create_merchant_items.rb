# frozen_string_literal: true

# :nodoc:
class CreateMerchantItems < ActiveRecord::Migration[6.1]

  def change
    if table_exists?(:merchant_items)
      warn 'merchant_items already exists, exiting'
      return
    end

    create_table :merchant_items, force: true do |t|
      t.bigint :merchant_id, null: false
      t.string :sku, limit: 63, null: false
      t.string :gtin, limit: 63, null: true
      t.string :mpn, limit: 63, null: true
      t.string :brand, limit: 63, null: true
      t.string :manufacturer, limit: 63, null: true
      t.string :google_category
      t.string :title
      t.text   :description

      t.timestamps
    end

  end
end
