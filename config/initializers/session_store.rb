# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gestione_referti_session',
  :secret      => '3726fa7e6eb549fa80ee3e6e06dfd6f3a33bd239a058cbd615f5a3c9d8e32b22c9b11730bb7a4e9372c5d51d1eb9c2904e4dcc036f7671df4700e5c8d549d32'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
