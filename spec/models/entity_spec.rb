require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:all) do
    @user = User.first
    @user ||= User.create(name: 'TestBot', email: 'Test.bot@email.com', password: '123456')

    @group = Group.first
    @group ||= Group.create(name: 'TestGroup', icon: 'TestIcon', author: @user)

    @entity = Entity.first
    @entity ||= Entity.create(name: 'TestEntity', amount: 10, group: @group, author: @user)
  end

  it 'Entity should be valid with a name and amount' do
    expect(@entity).to be_valid
  end

  it 'Entity name cannot be empty' do
    @entity.name = ''
    expect(@entity).to_not be_valid
  end

  it 'Entity amount should be greater than or equal to 1' do
    @entity.amount = 0
    expect(@entity).to_not be_valid
  end
end
