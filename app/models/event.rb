class Event < ApplicationRecord

  #validates :start_date, :duration, :title, :location, :description, :price, presence: true
  #validates :title, length: { in: 2..100 } 
  #validates :description, length: { in: 10..1000 }
  #validates :price, numericality: { only_integer: true, greater_than: 0 }
  #(last one to add) validate :start_after_now, :validate_duration, on: :create
  class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :event
    validates :user, presence: true
    validates :event, presence: true
    after_create :new_guest_send
  
    def new_guest_send
      UserMailer.new_guest_send(self).deliver_now
    end
  end

  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :attendees, class_name: "User", through: :attendances
    


  #def start_after_now
    #if start_date.present? && start_date < Date.today
      #errors.add(:start_date, "can't be in the past")
    #end
  #validates :stripe_customer_id,
   #presence: true,
   #format: .....???.....

  #end

  #def validate_duration
    #if (duration.present?) && ((duration.to_i < 0) || (duration.to_i % 5 != 0))
      #errors.add(:duration, "duration must be positive and by chunks of 5 min")
    #end
  #end



end # fin class 'Event'
