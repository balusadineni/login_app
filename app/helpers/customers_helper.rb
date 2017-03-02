module CustomersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(customer, size: 80)
    gravatar_id = Digest::MD5::hexdigest(customer.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: customer.name, class: "gravatar")
  end
end
