class CompoundInterest

  include ActiveModel::Model

  attr_accessor :current_principal, :years_to_grow, :interest_rate

  attr_reader :result

  validates :current_principal, :years_to_grow, :interest_rate, presence: true
  validates :current_principal, :years_to_grow, :interest_rate, numericality: { greater_than: 0 }

  def submit
    return false if invalid?
    @result = calculate_result
    true
  end

  private

  def calculate_result
    future_value_of_principal + future_value_of_additions
  end

  def future_value_of_principal
    current_principal.to_d * (1 + interest_rate.to_d / 100 / 12) ** (years_to_grow.to_d * 12)
  end

  def future_value_of_additions
    0
  end

end
