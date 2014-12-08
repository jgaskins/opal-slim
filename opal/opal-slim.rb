require 'template'
require 'erb'

module Temple
  module Utils
    def self.escape_html *args
      ERB::Util.html_escape *args
    end

    def self.escape_html_safe *args
      args.first
    end
  end
end

# module ERB
#   module Util
#     def self.html_escape_safe *args
#       html_escape *args
#     end
#   end
# end

# class Template
#   class OutputBuffer
#     alias << append

#     # allow tags in haml to have dynamic attributes
#     def attributes(class_id, obj_ref, *attributes_hashes)
#       attributes = class_id

#       attributes_hashes.each do |hash|
#         attributes.update hash
#       end

#       result = attributes.collect do |attr, value|
#         if value == true
#           next " #{attr}"
#         elsif value == false
#           next
#         else
#           " #{attr}='#{value}'"
#         end
#       end

#       result.join
#     end
#   end
# end
