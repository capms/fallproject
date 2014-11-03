class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  belongs_to :team
  belongs_to :user_type
  has_many :documents
  has_many :approvals

  def forem_name
  	first_name
  end

  def forem_email
  	email
  end

end
