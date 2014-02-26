class Article
  include Mongoid::Document
  has_many :comments, :as => :commentable
  belongs_to :user
  field :content, type: String
end
