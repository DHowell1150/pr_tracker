shared_context ‘login_as_user’ do
  def login_as_user
    visit login_path
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    fill_in :email, with: user.email
    click_on "Log In"
    expect(current_path).to eq(root_path)
  end
end