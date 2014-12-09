class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

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

        
  # validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create
  # validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true
  # file types for resume and profile pictures
	belongs_to :team
	belongs_to :user_type
	has_many :documents
	has_many :approvals
	has_many :notifications
  has_attached_file :profilepicture
  has_attached_file :resume
  validates_attachment :profilepicture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  validates_attachment :resume, content_type: { content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain"] }
	has_many :bulletins
  has_many :acceptable_users

end
