class Company < ApplicationRecord
  has_rich_text :description

  #validations
  validate :validate_company_email, if: :email? ##custom_validation

  private

  ##custom_validation method
  def validate_company_email
    unless /\A^([a-zA-Z0-9_\-\.]*[a-zA-Z0-9]+[_\-]*)@getmainstreet.com\Z/.match email
      errors.add(:email, "is not matching with specified format!")
    end
  end
end
