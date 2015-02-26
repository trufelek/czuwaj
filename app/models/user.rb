class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :magazines
  validates_presence_of :name
  before_save :assign_role

  def assign_role
  	self.role = Role.find_by name: "Client" if self.role.nil?
  end

  def admin?
    self.role && self.role.name == "Admin"
  end

  def coordinator?
    self.role && self.role.name == "Coordinator"
  end
  
  def client?
    self.role && self.role.name == "Client"
  end

end
