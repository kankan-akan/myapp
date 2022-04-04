# frozen_string_literal: true

class AdminRange < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one :range_outline, dependent: :destroy
  has_one :equipment, dependent: :destroy
  has_many :lessons, dependent: :destroy
end
