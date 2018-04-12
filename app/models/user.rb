class User < ActiveRecord::Base
before_save { self.email = email.downcase }
validates_presence_of :first_name, :last_name, :email
  # Devise modules
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :confirmable, :lockable, :timeoutable
end
