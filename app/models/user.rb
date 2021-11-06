class User < ApplicationRecord
    validates :name, presence: true, length: {maximum: 15}
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    
    before_validation :nanashi


    has_secure_password
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    validates :password, presence: true, length: { minimum: 8, maximum: 32 }, format: { with: VALID_PASSWORD_REGEX}

    has_many :topics
    has_many :favorites
    has_many :favorite_topics, through: :favorites, source: 'topic'
    has_many :comments, dependent: :destroy

    private 
      def nanashi
        if self.name.blank?
            self.name = 'ななし'
        end
      end
end
