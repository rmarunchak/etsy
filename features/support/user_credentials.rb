# frozen_string_literal: true
require_relative '../support/env'
require_relative '../support/logger'
require 'logger'

module Support
  require 'singleton'

  class UserCredentials
    include Singleton

    attr_accessor :login, :password

    def initialize
      @login = 'r.marunchak@elopage.com'
      @password = 'Qwerty12'
    end
  end
end