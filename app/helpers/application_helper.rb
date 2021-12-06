# frozen_string_literal: true

module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    # steps how to use gravatar -> https://en.gravatar.com/site/implement/images/ruby/
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    # we can return a tag to views
    image_tag(gravatar_url, alt: user.username, class: 'rounded shadow mx-auto d-block')
  end

end
