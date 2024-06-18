1. spec/features/movements/create_movement_spec.rb
  describe "HAPPY PATHS" do
  ```
      include_context 'login_as_user'
      let(:user) {create(:user)}
      

       def login_as
         visit login_path
         fill_in :username, with: user.username
         fill_in :password, with: user.password
         fill_in :email, with: user.email
         click_on "Log In"
         expect(current_path).to eq(root_path)
       end

      before do
        
        login_as_user
        @athlete = user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")
        end
```

2. spec/mkdir support/login_helper.rb

  ```
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
  ```
3. app/helpers/application_helper.rb

```
  module ApplicationHelper
    def login_as(user)
      fill_in :username, with: @user.username
      fill_in :password, with: @user.password
      fill_in :email, with: @user.email
      click_on "Log In"
      expect(current_path).to eq(root_path)
    end
  end
  ```

4. spec/rails_helper line 75 
Play around with where this goes. Before or after first `end` and also after require up top, but below Rails
```
  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
```