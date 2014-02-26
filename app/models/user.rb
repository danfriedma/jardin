class User
  include Mongoid::Document
  #include Mongoid::Ancestry
  #has_ancestry
  has_many :comments, :as => :commentable
  has_many :articles
  field :name, type: String
  field :password, type: String
  field :email, type: String
end
