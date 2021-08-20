# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Adding these lines of code to disable rails from injecting a div with a class "fields_with_errors" that messes up layout of 'create article' page
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end