# frozen_string_literal: true

task create_role: :environment do
  puts 'creating a role'
  Role.create!(
    name: 'admin',
    slug: 'admin'
  )
  Role.create(
    name: 'Super admin',
    slug: 'superadmin'
  )
  puts 'Role created!!!!'
end
