ENV["RAILS_ENV"] ||= "development"

# Rails環境を読み込む
require_relative "config/environment"

# Rackサーバーが必要なので読み込む
require "rack"

# 使用したいサーバーハンドラを読み込む (例: Puma)
# Gemfileにpumaが記述されている必要があります
begin
  require "rack/handler/puma"
rescue LoadError
  puts "Puma gem not found. Please add 'gem \"puma\"' to your Gemfile."
  exit 1
end

# サーバーのオプションを設定 (必要に応じて変更)
options = {
  Port: ENV["PORT"] || 3000,
  Host: ENV["BIND"] || "0.0.0.0",
  # その他のpumaオプションなどもここに追加可能
}

puts "Starting Rails application in #{Rails.env} environment on http://#{options[:Host]}:#{options[:Port]}"

# Rackサーバーを起動
# Rails.application はロードされたRailsアプリケーションのRackオブジェクトです
Rack::Handler::Puma.run(Rails.application, **options)
