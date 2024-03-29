# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  include DeviseTokenAuth::Concerns::User

  mount_uploader :avatar, AvatarUploader

  has_many :posts, dependent: :destroy
  has_many :reviews

  has_many :lessons, through: :reservations
  has_many :reservations, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :bookmarks, dependent: :destroy
  has_many :range_outlines, through: :bookmarks

  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user

  def follow(other_user)
    return if self == other_user
    relationships.find_or_create_by!(follower_id: other_user.id)
  end

  def following?
    followings.include?(user)
  end

  def unfollow(other_user)
    relationships.find_by(follower_id: other_user.id).destroy!
  end

  def unlike(other_post)
    likes.find_by(post_id: other_post.id).destroy!
  end

  def unbookmark(other_outline)
    bookmarks.find_by(range_outline_id: other_outline.id).destroy!
  end

end
