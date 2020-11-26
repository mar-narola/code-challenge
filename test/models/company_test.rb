require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

  # Validation test cases
  test 'should save with valid email' do
    company = Company.new(name: 'New Test Company', zip_code: '28173', phone: '5553335555', email: 'ew_test_company@getmainstreet.com')
    assert company.save
  end

  test 'should save with blank email' do
    company = Company.new(name: 'New Test Company', zip_code: '28173', phone: '5553335555')
    assert company.save
  end

  test 'should not save with invalid email' do
    company = Company.new(name: 'New Test Company', zip_code: '28173', phone: '5553335555', email: 'ew_test_company@strret.com')
    assert_not company.save
    assert_equal company.errors[:email], ['is not matching with specified format!']
  end

  test 'should not save without brand color' do
    company = Company.new(name: 'New Test Company', phone: '5553335555', email: 'ew_test_company@strret.com', zip_code: '28173', brand_color: '')
    assert_not company.save
    assert_equal company.errors[:brand_color], ["can't be blank"]
  end

  test 'should not save without zip code' do
    company = Company.new(name: 'New Test Company', phone: '5553335555', email: 'ew_test_company@strret.com')
    assert_not company.save
    assert_equal company.errors[:zip_code], ["can't be blank"]
  end
end
