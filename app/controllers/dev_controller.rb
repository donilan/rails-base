class DevController < ApplicationController
  def exception
    raise 'You got Exception'
  end
end if Rails.env.development?
