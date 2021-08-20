class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        self.readers.map(&:email)
    end

    def self.most_popular
        self.max_by{|a| a.subscriptions.count }
    end
end