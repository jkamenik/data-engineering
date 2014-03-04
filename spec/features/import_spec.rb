require 'spec_helper'

feature 'Legacy Import' do
  scenario 'returns the gross revenue from the import' do
    visit '/'
    
    click_link 'Import'
    attach_file 'file', Rails.root.join('spec','files','example_input.tab')
    click_button 'Import'
    
    expect(page).to have_content '$95'
  end
end
