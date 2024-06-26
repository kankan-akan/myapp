# CarrierWave.configure do |config|
#    config.asset_host = 'http://localhost:3000'
# end

require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'myapp-strage'
    # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/myapp-s3'
    # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/myapp-strage'
    config.fog_public = false
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1',
      path_style: true
    }
    # キャッシュをS3に保存
    # config.cache_storage = :fog
  else
    config.asset_host = 'http://localhost:3000'
    config.storage :file
    config.enable_processing = false if Rails.env.test? #test:処理をスキップ
  end
end