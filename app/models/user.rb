class User < ActiveRecord::Base
  belongs_to :department

  before_create :set_account, :set_secrete_key

  private
  def set_account
    begin
      self.account_id = "#{Time.new.to_f.to_s.gsub(".", "")}#{rand(2**15)}".to_i.to_s(36).upcase
    end while self.class.exists?(account_id: account_id)
  end

  def set_secrete_key
    begin
      self.secret_token = SecureRandom.urlsafe_base64(27, false)
    end while self.class.exists?(secret_token: secret_token)
  end
end
