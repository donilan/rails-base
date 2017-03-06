require 'rails_helper'

RSpec.describe User, type: :model do

  it 'create' do
    before_count = User.count
    create(:user)
    expect(User.count).to be(before_count+1)
  end

  it 'find by login' do
    create(:user, username: 'test')
    expect(User.find_by_login('test')).not_to be(nil)
    expect { User.find_by_login('') }.to raise_exception(Exception)
  end

  it 'not allow duplicate username' do
    create(:user, username: 'test')
    expect { create(:user, username: 'test') }.to raise_exception(ActiveRecord::RecordInvalid)
  end

end
