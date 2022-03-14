feature 'User can see Hello world on the home page' do
    scenario 'can see hello world' do
        visit '/' 
        expect(page).to have_content 'Hello World!'
    end
end