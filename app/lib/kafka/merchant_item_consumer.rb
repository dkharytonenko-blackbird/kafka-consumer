# frozen_string_literal: true

module Kafka
  # Save MerchantItems to the database.
  class MerchantItemConsumer < Deimos::ActiveRecordConsumer

    record_class MerchantItem

  end
end
