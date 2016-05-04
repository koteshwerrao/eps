class User
  include Mongoid::Document
  field :user_name, :type => String
  field :merchant_id, :type => Integer
  field :role, :type => String
  belongs_to :merchant
end
