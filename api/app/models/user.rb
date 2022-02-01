# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  include DeviseTokenAuth::Concerns::User

  has_many :posts, dependent: :destroy
  has_many :reviews

  has_many :lessons, through: :reservations
  has_many :reservations

  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
end
