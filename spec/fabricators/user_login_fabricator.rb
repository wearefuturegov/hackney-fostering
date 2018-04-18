Fabricator(:user_login) do
  email { FFaker::Internet.email }
  password { 'password' }
end
