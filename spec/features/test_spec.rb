RSpec.describe 'Test' do
    it 'test' do
        visit('/')
    expect(page).to have_content('price')

    expect(page).to have_text('Catalog')
    expect(page).to have_text('Can\`t find books')
    expect(page).to have_button('Search')
   

  end
end