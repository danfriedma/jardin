class Boyname
  include Mongoid::Document
  field :year_of_birth, type: Integer
  field :gender, type: String
  field :child_first_name, type: String
  field :count, type: Integer
  field :rank,  type: Integer
end
