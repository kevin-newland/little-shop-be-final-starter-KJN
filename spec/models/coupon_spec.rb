require "rails_helper"

RSpec.describe Coupon do
  it { should belong_to :merchant }
  it { should have_many :invoices }
end