require_relative "diegoedoolsapi/version"
require_relative "configuration.rb"
require "httparty"
require "json"
require "pry"

module Diegoedoolsapi
  include HTTParty
  attr_accessor :configuration
  base_uri "https://core.myedools.info"
  
  class << self
    attr_accessor :configuration
  end

  def self.configuration 
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def initialize
    @created_token = nil

    raise "Você não configurou o token master." if self.configuration.token_master.nil?
  end

  def self.create_school(data)
    response = post("/schools/wizard", body: data, headers: get_headers)
    credentials = to_hash(response.body)[:admin][:credentials]
    @created_token = credentials  
    check_response(response)
  end

  def self.update_school(school_id, data)
    response = put("/schools/#{school_id}", body: data, headers: get_headers)
    if response.success?
      response.parsed_response
    else
      puts "#{response.body}"
    end
  end

  def self.create_course(data)
    response = post("/courses", body: data, headers: get_headers )
    check_response(response)
  end

  def self.create_school_product(school_id, data)
    response = post("/schools/#{school_id}/school_products", body: data, headers: get_headers)
    check_response(response)
  end
      
  def self.get_all(endpoint)
    response = get("/#{endpoint}", headers: get_headers)
    check_response(response)
  end

  def self.invitation_student(data)
    response = post("/invitations", body: data, headers: get_headers)
    check_response(response)
  end

  def self.get_school_product_students(school_product_id)
    response = get("/school_products/#{school_product_id}/enrollments", headers: get_headers)
    check_response(response)
  end

  def self.get_students(response)
    parsed_response = to_hash(response)
    parsed_response[:enrollments].map{ |enrollment| enrollment[:student] }
  end

  def self.get_headers 
    token = @created_token || self.configuration.token || self.configuration.token_master
    { 
      "Authorization" => "Token token=#{token}"
    }
  end

  private

  def self.check_response(response)
    if response.success?
      puts "#{response.parsed_response}"
      return response.code
    else
      puts "#{response.body}"
    end
  end

  def self.to_hash(object)
    JSON.parse object, symbolize_names: true
  end
end
