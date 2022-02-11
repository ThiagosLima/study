defmodule KitchenCalculator do
  @unit_to_ml %{
    milliliter: 1,
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15
  }

  def get_volume({_, number}), do: number

  def to_milliliter(volume_pair) do
    convert(volume_pair, :milliliter)
  end

  def from_milliliter(volume_pair, unit) do
    convert(volume_pair, unit)
  end

  def convert({old_unit, number}, new_unit) do
    {new_unit, number * @unit_to_ml[old_unit] / @unit_to_ml[new_unit]}
  end
end
