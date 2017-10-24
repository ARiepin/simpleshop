require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:brand) }
  it { is_expected.to validate_presence_of(:model) }
  it { is_expected.to validate_presence_of(:sku) }
  it { is_expected.to validate_presence_of(:price) }

  it { is_expected.to have_many(:order_items) }
end
