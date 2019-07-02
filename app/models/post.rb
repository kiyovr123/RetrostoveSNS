class Post < ApplicationRecord
    validates:user_id,{presence: true}

    def get_user
        return find_by(id: self.user_id)
    end
end
