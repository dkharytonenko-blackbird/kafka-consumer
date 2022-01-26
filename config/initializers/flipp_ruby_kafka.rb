# frozen_string_literal: true

require 'flipp_ruby_kafka'

Rails.configuration.to_prepare do
  FlippRubyKafka.configure do
    schema.backend :avro_schema_registry
    kafka.logger.level = Logger::INFO
    consumer do
      class_name 'Kafka::MerchantItemConsumer'
      topic 'ContentBots.MerchantItem'
      schema 'RawMeta'
      namespace 'com.flipp.content.itempipeline.raw'
      key_config schema: 'RawNationalKey'
      group_id 'kafka_consumer_merchant_items'
    end
  end
end

FlippRubyKafka.configure_datadog unless %w(test development).include?(Rails.env)
