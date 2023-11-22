require 'rails_helper'

RSpec.describe 'Welcome page', type: :system do
  it 'can see the app title' do
    visit unauthenticated_root_path
    expect(page).to have_content('Expense App')
  end
end