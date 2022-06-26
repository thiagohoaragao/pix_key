# frozen_string_literal: true

class PixKey
  attr_reader :key

  def initialize(key)
    @key = key
  end

  def valid?
    self.key.match?(/^[a-z0-9.]+@[a-z0-9]+.[a-z]+(.[a-z]+)?$/i)
  end

  def invalid?
    self.key.class != String
  end

  def value
    '' if invalid?
  end

  def key
  end

  def to_s
  end

  def phone?
  end

  def cpf?
  end

  def email?
  end

  def cnpj?
  end

  def evp?
  end

  def type
  end
end

#email regex
#/^[a-z0-9.]+@[a-z0-9]+\.[a-z]+(\.[a-z]+)?$/i

#cpf regex
#/^[0-9]{11}$/i
