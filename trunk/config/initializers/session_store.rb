# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cactins_session',
  :secret      => '55c15e4c83d79c39056e6846f7fce3c7be87051d7d94e2ae4f42836cd94d1ef1b5492516173f65a0adc2cf25d8a3ee8f399c526c2d216fe3ff0b68564aae7e42'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
