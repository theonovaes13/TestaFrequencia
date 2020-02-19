class User < ApplicationRecord
  has_many :subjects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum status: [:admin, :professor, :secretaria]

  attr_accessor :login

  after_create :send_admin_mail

  validates :email, uniqueness: true
  validates :matricula, presence: true, uniqueness: true


  def email_required?
    false
  end

  def email_changed?
    false
  end

  def send_admin_mail
    UserMailer.send_welcome_email(self).deliver_later
  end

  def self.find_for_database_authentication warden_conditions

    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(matricula) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end

  # def login
  #   @login || self.matricula || self.email
  # end
  #
end
