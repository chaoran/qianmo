require 'securerandom'

module Token
  # Generate a friendly string randomically to be used as token.
  def self.friendly_token
    SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
  end
  
  def generate_token(column)
    loop do
      token = Token.friendly_token
      break token unless self.class.exists?( column => token )
    end
  end
end