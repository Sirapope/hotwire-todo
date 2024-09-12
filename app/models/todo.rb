class Todo < ApplicationRecord
    belongs_to :assigned_user, class_name: 'User', optional: true
    validates_presence_of :name
    enum status: {
        incomplete: 0,
        complete: 1
    }    
end
