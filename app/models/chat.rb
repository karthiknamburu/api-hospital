class Chat < ActiveRecord::Base
  has_many :messages
  belongs_to :user_one, class_name: "User"#, foreign_type: user_one_id,
  belongs_to :user_two, class_name: "User"#,  foreign_type: user_two_id,

  validates_uniqueness_of :user_one_id, scope: :user_two_id
  validates_uniqueness_of :user_two_id, scope: :user_one_id

  class << self
    def find_or_create_by_user_one_id_and_user_two_id(user_one_id, user_two_id)
      Chat.where(user_one_id: user_one_id, user_two_id: user_two_id).first ||
        Chat.where(user_one_id: user_two_id, user_two_id: user_one_id).first ||
          Chat.create(user_one_id: user_one_id, user_two_id: user_two_id)

    end
  end
end
