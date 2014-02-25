class Article
  include Mongoid::Document
  has_many :comments, :as => :commentable
  has_one :user
  field :content, type: String
end
