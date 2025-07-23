class TodoList < ApplicationRecord
  belongs_to :event
  validates :title, presence: true


  enum :todolist_status, { pending: 0, done: 1 }

end
