require 'rails_helper'

RSpec.describe 'Index features' do
	it 'Go to /expenses and verify amount title' do
		visit( '/' )
		expect( page ).to have_content( 'Expensify | la app' )
	end
end
