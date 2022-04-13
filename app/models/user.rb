class User < ApplicationRecord
  rolify
  # Con este método encriptamos al password y generamos el método "authenticate"
  # que será usado por Knock
  has_secure_password

  before_save   :downcase_email, :downcase_username

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z]+[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :username,  presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password,  presence: true, length: { minimum: 6, maximum: 50 }, allow_nil: true

  private

    # Se encarga de que email tenga sólo letras minúsculas
    def downcase_email
      self.email.downcase!
    end

    def downcase_username
      self.username.downcase!
    end
end
