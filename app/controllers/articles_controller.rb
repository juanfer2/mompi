require_relative '../models/article'
require_relative './application_controller'

module Controllers
  class ArticleController < ApplicationController
    get '/api' do
      @articles = Article.all
    
      @articles.to_json
    end

    get '/articles/:id' do
      Article.find(params[:id]).to_json
    rescue ActiveRecord::RecordNotFound => e
      status 404
      { error: e.message }.to_json
    rescue => e
      status 500
      { error: e.message }.to_json
    end    
  end
end


