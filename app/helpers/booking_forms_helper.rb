module BookingFormsHelper
  def display_booking_form_charge(value)
    return '' if value.blank?

    str = value.to_s.strip
    return number_to_indian_currency(str) if str.match?(/\A-?\d+(?:\.\d+)?\z/)

    str
  end
end
