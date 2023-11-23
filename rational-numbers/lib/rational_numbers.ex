require Integer

defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({n1, d1}, {n2, d2}) do
    {(n1 * d2 + d1 * n2), (d1 * d2)}
    |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({n1, d1}, {n2, d2}) do
    {(n1 * d2 - d1 * n2), (d1 * d2)}
    |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({n1, d1}, {n2, d2}) do
    {n1 * n2, d1 * d2}
    |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({n1, n2}, {d1, d2}) do
    { n1 * d2, n2 * d1 }
    |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({n1, d1}) do
    { Kernel.abs(n1), Kernel.abs(d1) }
    |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({n1, d1}, n) when n < 0, do: pow_rational({-d1, -n1}, -n)

  def pow_rational({n1, d1}, n) do
    { Integer.pow(n1, Kernel.abs(n)), Integer.pow(d1, Kernel.abs(n)) }
    |> reduce()
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {n1, d1}) do
    x ** n1 ** (1 / d1)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({n, d}) when d < 0, do: reduce({-n, -d})

  def reduce({n, d}) do
    gcd = Integer.gcd(n, d)
    { n / gcd, d / gcd }
  end
end
