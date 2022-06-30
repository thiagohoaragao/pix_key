# frozen_string_literal: true
class PixKey

  def initialize(pix_key)
    @pix_key = pix_key.to_s.strip
  end

  def valid?
    [phone?, cpf?, email?, cnpj?, evp?].any?
  end

  def invalid?
    !valid?
  end

  def value
    valid? ? @pix_key.freeze : ''
  end

  alias key value
  alias_method :to_s, :value

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
