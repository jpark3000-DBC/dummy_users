class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, presence: true
  validates :email, presence: true, :uniqueness => true, :format => { :with => /\w+\@\w+.\w{2}/, :message => "Email format doesn't validate"}
  validates :password, presence: true

  def self.authenticate(email, password)
    user = User.where(email: email, password: password)
    user.empty? ? nil : user[0]
  end

  def self.create_user(name, email, password)
    user = User.create(name: name, email: email, password: password)
    user.id.nil? ? nil : user
  end
end
