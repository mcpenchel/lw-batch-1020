class Order
  attr_accessor :id
  attr_reader :meal, :employee, :customer

  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
