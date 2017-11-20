# encoding: utf-8

#  Copyright (c) 2008-2017, Puzzle ITC GmbH. This file is part of
#  Cryptopus and licensed under the Affero General Public License version 3 or later.
#  See the COPYING file at the top-level directory or at
#  https://github.com/puzzle/cryptopus.

Fabricator(:user, class_name: User::Human) do
  username { Faker::Name.last_name.downcase }
  givenname { Faker::Name.first_name }
  surname 'test'
  admin false
  auth 'db'
  password '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8'
  before_save { |user| user.create_keypair('password') }
end

Fabricator(:admin, from: :user) do
  after_save do |user|
    actor = User.find_by(username: 'admin')
    private_key = actor.decrypt_private_key('password')
    user.toggle_admin(actor, private_key)
  end
end
