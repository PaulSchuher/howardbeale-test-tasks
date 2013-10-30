# spec/lib/luhn_checker.rb
require 'spec_helper'
require 'luhn_checker'

describe LuhnChecker do

  valid_numbers = [
      "79927398713",
      "378282246310005",
      "371449635398431",
      "378734493671000",
      "5610591081018250",
      "30569309025904",
      "38520000023237",
      "6011111111111117",
      "6011000990139424",
      "3530111333300000",
      "3566002020360505",
      "5555555555554444",
      "5105105105105100",
      "4111111111111111",
      "4012888888881881",
      "4222222222222"
  ]

  invalid_numbers = [
      79927398710,
      79927398711,
      79927398712,
      79927398714,
      79927398715,
      79927398716,
      79927398717,
      79927398718,
      79927398719
  ]

  it "validates correct numbers" do
    valid_numbers.each do |number|
      LuhnChecker.validate(number).should be_true
    end
  end
  it "doesn't validate incorrect numbers" do
    invalid_numbers.each do |number|
      LuhnChecker.validate(number).should_not be_true
    end
  end
  it "adds correct check number" do
    valid_numbers.each do |number|
      (LuhnChecker.add_control_digit(number[0..-2]) == number).should be_true
    end
  end
end