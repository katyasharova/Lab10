# frozen_string_literal: true

# Main Class
class HomeController < ApplicationController
  def input; end

  def output
    @arr = []
    params[:txt].to_i.times { |i| @arr.append(i) if ((i**2).to_s.reverse.to_i == (i**2) && (i.to_s.reverse.to_i == i)) }
    render xml: convert_to_xml(@arr)
  end

  def convert_to_xml(arr)
    Nokogiri::XML::Builder.new do
      result do
        arr&.each do |elem|
          element do
            value elem
          end
        end
      end
    end
  end
end
