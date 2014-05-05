# Be sure to restart the server whenever this file is modified. 

# Your secret key is used for verifying the intergrity of signed cookies/ 
# If you change this key, all old signed cookies will become invalid. 

# Make sure the secret key is at least 30 charachters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
# You can use 'rake secret' to generate a secure secret key.

# Make sure you secret_key_base is kept private
# if you're sharing your code publicly. 
require 'securerandom'

def secure_token
	token_file = Rails.root.join('secret')
	if File.exist?(token_file)
		#use the existing token
		File.read(token_file).chomp
	else
		#generate a new token and store it in the token file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

SampleApp::Application.config.secret_key_base = secure_token 