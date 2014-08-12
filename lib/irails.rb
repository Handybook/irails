module IRails

  ENV["RAILS_ENV"] ||= 'development'
  require ::File.expand_path('../../config/environment',  __FILE__)
  #require ::File.expand_path('../../config/application',  __FILE__)
    
  class OnetimeController < ActionController::Base;

  end;

  def self.render(*args)

    controller = OnetimeController.new
    controller.send :instance_variable_set, '@_response', ActionDispatch::Response.new
    controller.send :instance_variable_set, '@_request', ActionDispatch::Request.new( {} )
    
    controller.render(*args)[0]
  end
end