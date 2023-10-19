defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * ((100.0 - discount) / 100.0)
  end

  def monthly_rate(hourly_rate, discount) do
    actual_rate = apply_discount(daily_rate(hourly_rate), discount)
    trunc(Float.ceil(22.0 * actual_rate))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    actual_rate = apply_discount(daily_rate(hourly_rate), discount)
    Float.floor(budget / actual_rate, 1)
  end
end
