# frozen_string_literal: true
class PixKey

  def initialize(pix_key)
    @pix_key = pix_key.strip if pix_key.class == String
  end

  def valid?
    validation = /(^[0-9]{11}$|^[0-9]{14}$|^\+[1-9][0-9]\d{1,14}$|^[a-z0-9.]+@[a-z0-9]+.[a-z]+(.[a-z]+)?$|[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})/
    true if @pix_key.to_s.match?(validation)
  end

  def invalid?
    valid? ? false : true
  end

  def value
    valid? ? @pix_key.freeze : ''
  end

  def key
    @pix_key.freeze
  end

  def to_s
    value.to_s
  end

  def phone?
    @pix_key.match?(/^\+[1-9][0-9]\d{1,14}$/i)
  end

  def cpf?
    @pix_key.match?(/^[0-9]{11}$/i)
  end

  def email?
    @pix_key.match?(/^[a-z0-9.]+@[a-z0-9]+.[a-z]+(.[a-z]+)?$/i)
  end

  def cnpj?
    @pix_key.match?(/^[0-9]{14}$/i)
  end

  def evp?
    @pix_key.match?(/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/i)
  end

  def type
    return 'phone' if phone?
    return'cpf' if cpf?
    return 'email' if email?
    return 'cnpj' if cnpj?
    return 'evp' if evp?
  end

  def ==(other)
    self.class == other.class && self.value == other.value
  end
end
