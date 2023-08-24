class Role < ApplicationRecord
  has_many :role_permissions
  has_many :permissions, through: :role_permissions
  has_many :user_roles
  has_many :users, through: :user_roles

  before_save :validates_models

  protected
  def validates_models
    if Rails.env == 'development'
      Rails.application.eager_load!
    end

    models_to_exclude = ["SchemaMigration", "ArInternalMetadatum"]
    models = ActiveRecord::Base.connection.tables.map(&:classify).reject { |m| models_to_exclude.include?(m) }

    models.each do |model|
      Permission.find_or_create_by(name: "read", model: model)
      Permission.find_or_create_by(name: "create", model: model)
      Permission.find_or_create_by(name: "update", model: model)
      Permission.find_or_create_by(name: "destroy", model: model)
      Permission.find_or_create_by(name: "manage", model: model)
    end
  end
end
