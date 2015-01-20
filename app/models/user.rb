require 'securerandom'

class User < ActiveRecord::Base

  #before_create :set_auth_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #before_save :ensure_authentication_token

  has_many :lists, dependent: :destroy
  has_many :tasks, through: :lists

  

  private
    def set_auth_token
      return if auth_token.present?
      self.auth_token = generated_auth_token
    end

    def generate_auth_token
      SecureRandom.uuid.gsub(/\-/,'')
    end


end
