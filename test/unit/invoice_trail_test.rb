require 'test_helper'

class InvoiceTrailTest < ActiveSupport::TestCase
  should "be valid" do
    assert InvoiceTrail.new.valid?
  end
end
