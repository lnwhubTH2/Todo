class Task < ApplicationRecord
    validates :name, presence: true
    validates :status, inclusion: { in: ['incomplete', 'complete'] }
  
    after_initialize :set_default_status, if: :new_record?
  
    private
  
    def set_default_status
      self.status ||= 'incomplete'
    end
  end
  