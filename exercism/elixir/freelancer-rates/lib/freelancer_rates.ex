defmodule FreelancerRates do
  @daily_hours 8.0
  @monthly_days 22.0

  def daily_rate(hourly_rate) do
    hourly_rate * @daily_hours
  end

  def apply_discount(before_discount, discount) do
    before_discount * (100 - discount) / 100
  end

  def monthly_rate(hourly_rate, discount) do
    (daily_rate(hourly_rate) * @monthly_days)
    |> apply_discount(discount)
    |> Float.ceil()
    |> round()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_discount =
      hourly_rate
      |> daily_rate()
      |> apply_discount(discount)

    Float.floor(budget / daily_discount, 1)
  end
end