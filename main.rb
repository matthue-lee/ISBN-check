class ISBNValidator

  def self.isbn_13_check_digit(isbn)
    # Ensure it's 12 digits for ISBN-13 calculation
    raise ArgumentError, 'ISBN must be 12 digits long' unless isbn.length == 12 && isbn.scan(/\D/).empty?

    sum = 0
    isbn.chars.each_with_index do |char, index|
      multiplier = index.even? ? 1 : 3
      sum += multiplier * char.to_i
    end

    check_digit = (10 - sum % 10) % 10
    check_digit.to_s
  end
end

# Example Usage:

isbn_13 = '978014300723'

puts "ISBN-13 check digit: #{ISBNValidator.isbn_13_check_digit(isbn_13)}"
