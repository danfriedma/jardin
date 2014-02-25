class User
  include Mongoid::Document
  #include Mongoid::Ancestry
  #has_ancestry
  has_many :comments, :as => :commentable
  belongs_to :article
  field :name, type: String
  field :password, type: String
  field :email, type: String
end
