# Be sure to restart your server when you modify this file.
config.serve_static_assets = true
# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w(mushrooms.jpg)
Rails.application.config.assets.precompile += %w( CropCommandLogoStacked.png )
Rails.application.config.assets.precompile += %w( CropCommandLogoHorizontal.png )
Rails.application.config.assets.precompile += %w( handsonly.png )
