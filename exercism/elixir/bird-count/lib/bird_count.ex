defmodule BirdCount do
  def today([]), do: nil
  def today([today | _other_days]), do: today

  def increment_day_count([]), do: [1]
  def increment_day_count([today | other_days]), do: [today + 1 | other_days]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([today | _other_days]) when today == 0, do: true
  def has_day_without_birds?([_today | other_days]), do: has_day_without_birds?(other_days)

  def total([]), do: 0
  def total([today | other_days]), do: today + total(other_days)

  def busy_days([]), do: 0
  def busy_days([today | other_days]) when today >= 5, do: 1 + busy_days(other_days)
  def busy_days([_today | other_days]), do: busy_days(other_days)
end
