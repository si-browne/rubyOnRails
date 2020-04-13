class Novel < ApplicationRecord
    belongs_to :author
    belongs_to :genre
    belongs_to :publisher
    validates :title, presence: true
    validates :genre_id, presence: true
    validates :author_id, presence: true
    validates :publisher_id, presence: true
    validates :isbn, presence: true
    validates :price, presence: true
    validates :publication, presence: true
    validates :format, presence: true
    validates :description, presence: true
    validates :pages, presence: true
end
