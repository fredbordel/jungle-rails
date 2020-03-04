Rails.configuration.stripe = {
  # :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :publishable_key => 'pk_test_UfTnwSci3ONuXw6hTLuEfyjQ00UxLRSaTm',
  # :secret_key      => ENV['STRIPE_SECRET_KEY']
  :secret_key      => 'sk_test_jT6irj79k1qVOOKU0FrDZgjr00WfvSsPCQ'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
