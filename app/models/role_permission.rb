class RolePermission < ApplicationRecord
  belongs_to :role, dependent: :destroy
  belongs_to :permission, dependent: :destroy
end
