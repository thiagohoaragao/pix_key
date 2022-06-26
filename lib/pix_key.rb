# frozen_string_literal: true

class PixKey
  attr_reader :key

  def initialize(key)
    @key = key
  end

  def valid?
    validation = /(^[0-9]{11}$|^[0-9]{14}$|^\+[1-9][0-9]\d{1,14}$|^[a-z0-9.]+@[a-z0-9]+.[a-z]+(.[a-z]+)?$|[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})/
    @key.match?(validation)
  end

  def invalid?
    if @key.class != String
      true
    elsif valid?
      false
    else
      true
    end
  end

  def value
    if invalid?
      ''
    else
      @key
    end
  end

  def key
    value
  end

  def to_s
    @key.to_s
  end

  def phone?
    @key.match?(/^\+[1-9][0-9]\d{1,14}$/i)
  end

  def cpf?
    @key.match?(/^[0-9]{11}$/i)
  end

  def email?
    @key.match?(/^[a-z0-9.]+@[a-z0-9]+.[a-z]+(.[a-z]+)?$/i)
  end

  def cnpj?
    @key.match?(/^[0-9]{14}$/i)
  end

  def evp?
    @key.match?(/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/i)
  end

  def type
    if phone?
      'phone'
    elsif cpf?
      'cpf'
    elsif email?
      'email'
    elsif cnpj?
      'cnpj'
    else
      'evp'
    end
  end

  def ==(key)
    @key.uniq
  end
end
