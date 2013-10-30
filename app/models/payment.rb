class Payment < ActiveRecord::Base
  belongs_to :service
  attr_accessible :title

  def self.with(opts)
    payment = Payment.where(service_id: opts[:service_id], line_item_id: opts[:line_item_id]).first_or_create
    payment.with_lock do
      yield(payment)
    end
  end

end
