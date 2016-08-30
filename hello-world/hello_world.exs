defmodule HelloWorld do

  def hello do
    hello("World")
  end

  def hello(name) do
    "Hello, #{name}!"
  end
end