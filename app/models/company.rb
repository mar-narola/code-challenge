class Company < ApplicationRecord
  has_rich_text :description

  #validations
  validate :validate_company_email, if: :email? ##custom_validation

  ##callbacks
  before_save :get_city_state_from_zipcode, if: :will_save_change_to_zip_code?

  ##methods
  def address
    "#{city}, #{state}" if (city && state)
  end

  private

  ##methods
  def get_city_state_from_zipcode
    address = ZipCodes.identify(zip_code)
    unless address.nil?
      city = address[:city]
      state = address[:state_code]
    end
  end

  ##custom_validation method
  def validate_company_email
    unless /\A^([a-zA-Z0-9_\-\.]*[a-zA-Z0-9]+[_\-]*)@getmainstreet.com\Z/.match email
      errors.add(:email, "is not matching with specified format!")
    end
  end
end
