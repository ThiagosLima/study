defmodule LanguageList do
  def new, do: []

  def add(list, language), do: [language | list]

  def remove([head | list]), do: list

  def first([head | list]), do: head

  def count(list), do: length(list)

  def exciting_list?(list), do: "Elixir" in list
end
