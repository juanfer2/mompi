require 'dotenv/load'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

desc 'Run server'
task :server do
  ruby "#{__dir__}/app/app.rb"
end

task :test do
  ENV['RACK_ENV'] = ENV['APP_ENV'] = 'test'
  sh 'bundle exec rspec'
end

task :routes do
  $LOAD_PATH.unshift File.join(File.expand_path(File.join(__dir__, '.')), 'app/controllers')
  @routes = {}

  def map(relative_path)
    @current_map = relative_path
    @routes[@current_map] = {}
    yield
  end

  def middleware_controllers(klass)
    klass.instance_variable_get(:@middleware).collect { |arr| arr[0] }
         .filter { |mid| mid.instance_variable_defined?(:@routes) }
  end

  def register_route(klass)
    sub_routes = klass.routes.map do |method, paths|
      [method, paths.map { |path| "#{@current_map.chomp('/')}#{path[0]}" }]
    end.to_h
    @routes[@current_map].merge!(klass.to_s => sub_routes)
  end

  def run(main_klass)
    klasses = [main_klass] + middleware_controllers(main_klass)
    klasses.each { |klass| register_route klass }
  end

  require_relative 'app/controllers/articles_controller'

  map('/') { run Controllers::ArticleController }

  print_pretty @routes
end

def print_pretty(routes_hash)
  routes_hash.each do |main, sub|
    print "#{main}  =>"
    sub.each do |controller, methods|
      puts "   #{controller}"
      methods.each do |method, occurences|
        puts "\t\t#{method}"
        occurences.each { |route| puts "\t\t\t\t#{route}" }
      end
    end
  end
end
