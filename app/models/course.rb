class Course
  include Mongoid::Document

  field :name, type: String
  field :intro, type: String
  field :description, type: String
  field :cover_url, type: String
  field :released_at, type: DateTime

  validates :name, presence: true
end
