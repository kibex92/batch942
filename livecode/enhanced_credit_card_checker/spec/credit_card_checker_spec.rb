# spec/credit_card_checker_spec.rb
require_relative "../credit_card_checker"

describe "#credit_card_checker" do
  it "returns 'Invalid credit card number' when passed an empty string" do
    actual = credit_card_checker("")
    expected = "Invalid credit card number"
    expect(actual).to eq(expected)
  end

  it "returns 'Invalid credit card number' when passed a string with at least one non-numeric character" do
    actual = credit_card_checker("4242-4242-4242-4242")
    expected = "Invalid credit card number"
    expect(actual).to eq(expected)
  end

  it "returns 'Valid Visa credit card number' when passed 4 groups of 4 digits separated by spaces and starting with 4" do
    actual = credit_card_checker("4242 4242 4242 4242")
    expected = "Valid Visa credit card number"
    expect(actual).to eq(expected)
  end

  it "returns 'Valid Visa credit card number' when passed 16 digits starting with 4, whatever space there may be" do
    actual = credit_card_checker("  4242 4 2424 242 4242 ")
    expected = "Valid Visa credit card number"
    expect(actual).to eq(expected)
  end

  it "returns 'Valid Mastercard credit card number' when passed 16 digits starting with 5, whatever space there may be" do
    actual = credit_card_checker("5555 5555 5555 4444")
    expected = "Valid Mastercard credit card number"
    expect(actual).to eq(expected)
  end

  it "returns 'Invalid credit card number' when passed an invalid Visa credit card" do
    actual = credit_card_checker("4242 4242 4242 4241")
    expected = "Invalid credit card number"
    expect(actual).to eq(expected)
  end

  it "returns 'Valid Mastercard credit card number' when passed an invalid Mastercard credit card, whatever space there may be" do
    actual = credit_card_checker("  55 555555 5 5555555   ")
    expected = "Invalid credit card number"
    expect(actual).to eq(expected)
  end
end
