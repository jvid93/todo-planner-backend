module Category::Contract
  class Create < Reform::Form
    property :name
    
    validates :name, presence: true
    validate :name_uniqueness
    
    def name_uniqueness
      errors.add(:name, "must be unique") if Category.where(name: name).exists?
    end
  end
end
