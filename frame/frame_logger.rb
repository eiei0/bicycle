# frozen_string_literal: true

require 'logger'

# Wrapper module around core ruby logger class
module FrameLogger
  def logger
    Logger.new($stdout)
  end
end
