class Comment
  include Mongoid::Document
  belongs_to :commentable, :polymorphic => true
  include Mongoid::Ancestry
  has_ancestry
  field :content, type: String

  validates :content, :presence => true 
end