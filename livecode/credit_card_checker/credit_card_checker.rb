def credit_card_checker(ccnumber)
  pattern = /([1-9])[0-9]{15}/
  ccnumber_clean = ccnumber.delete(' ')
  matched_ccnumber = ccnumber_clean.match(pattern)
  if matched_ccnumber && matched_ccnumber[1] == "4" 
    "Valid Visa credit card number"
  elsif matched_ccnumber && matched_ccnumber[1] == "5"
    "Valid Mastercard credit card number"
  else
    "Invalid credit number"
  end
end
