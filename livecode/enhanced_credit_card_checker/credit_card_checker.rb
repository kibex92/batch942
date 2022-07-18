def valid_luhn_sum?(card_number) # Sum the CC digits following the luhn algorithm to determine if cc is valid/invalid
  numbers = card_number.delete(" ").chars.map { |char| char.to_i } # remove the whitespace and map the number to an array of numbers
  sum = 0 # Initial sum to 0
  numbers.each_with_index do |number, index| # Iterate over numbers array
    if index.even? # If the index is even
      double = number * 2 # Double it
      sum += double > 9 ? double.digits.sum : double # If the doubled num is > 9, sum its digits, else add double to sum
    else
      sum += number # If index is uneven, add the number at the index to the sum
    end
  end
  sum % 10 == 0 # If the sum is equally divisible with 10, its valid
end

def credit_card_checker(card_number)
  match_data = card_number.delete(" ").match(/(\d)\d{15}/)
  if match_data && valid_luhn_sum?(card_number) && match_data[1] == "4" # Check first if we get a match, if yes then check if it matches the luhn algo and then check if the first digit matches 4|5
    "Valid Visa credit card number"
  elsif match_data && valid_luhn_sum?(card_number) && match_data[1] == "5"
    "Valid Mastercard credit card number"
  else
    "Invalid credit card number"
  end
end
