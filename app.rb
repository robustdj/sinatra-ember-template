require 'sinatra/base'
require 'sinatra/assetpack'
require 'sinatra/ember'

class App < Sinatra::Base
  register Sinatra::AssetPack
  register Sinatra::Ember

  enable :sessions

  assets {
    serve '/javascripts', :from => '/javascripts'

    serve '/stylesheets', :from => '/stylesheets'
    serve '/images', :from => '/images'

    # The second parameter defines where the compressed version will be served.
    # (Note: that parameter is optional, AssetPack will figure it out.)
    js :application, '/application.js', [
      '/javascripts/vendor/jquery.js',
      '/javascripts/vendor/handlebars.js',
      '/javascripts/vendor/ember.js',
      '/javascripts/vendor/ember-data.js',
      '/javascripts/app/app.js',
      '/javascripts/app/store.js',
      '/javascripts/app/mixins/**/*.js',
      '/javascripts/app/models/**/*.js',
      '/javascripts/app/controllers/*.js',
      '/javascripts/app/templates/*.handlebars',
      '/javascripts/app/views/*.js',
      '/javascripts/app/router.js',
    ]

    css :application, '/application.css', [
      '/stylesheets/reset.css',
      '/stylesheets/global.css'
    ]

    css_compression :sass       # Optional
  }

  ember {
    templates '/javascripts/templates.js', ['javascripts/app/templates/**/*.handlebars']
  }


  get '/' do
    erb :index
  end
end
