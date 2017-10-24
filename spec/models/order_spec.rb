require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:order_items) }

  it { is_expected.to accept_nested_attributes_for(:order_items) }
end
