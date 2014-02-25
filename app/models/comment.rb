class Comment
  include Mongoid::Document
  #include Mongoid::Ancestry
  #has_ancestry
  belongs_to :commentable, :polymorphic => true
  field :owner, type: String
  field :content, type: String
end