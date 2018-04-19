class User < ApplicationRecord
  acts_as_paranoid

  has_many :user_roles
  has_many :roles, through: :user_roles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable
  validates_presence_of :first_name, :last_name, :phone_number, on: [:update]

  scope :active, ->() { where(locked_at: nil) }

  def has_role?(role_sym)
    roles.any? { |role| role.name.underscore.to_sym == role_sym.downcase }
  end

  def full_name
    self.first_name + ' ' + self.last_name unless self.first_name.nil? || self.last_name.nil?
  end
end
