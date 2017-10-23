module ProductsImporter
  def self.from_json(file:)
    file = File.read(file)
    data = JSON.parse(file)
    ApplicationRecord.transaction do
      Product.create!(data['products'])
    end

    true
  rescue
    false
  end
end
