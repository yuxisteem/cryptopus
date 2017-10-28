# encoding: utf-8

#  Copyright (c) 2008-2017, Puzzle ITC GmbH. This file is part of
#  Cryptopus and licensed under the Affero General Public License version 3 or later.
#  See the COPYING file at the top-level directory or at
#  https://github.com/puzzle/cryptopus.

require 'test_helper'

class Api::AccountsControllerTest < ActionController::TestCase

  test 'authenticates with valid api user and returns account details' do

    request.env['HTTP_API_USER'] = 'bob-abcd'
    request.env['HTTP_API_TOKEN'] = 'abcd'

    account1 = accounts(:account1)

    get :show, params: { id: account1.id }

  end

  #test 'cannot authenticate for unsupported action' do
  #end

end

#def http_auth_headers
#{ 'HTTP_API_USER': 'bob-abcd', 'HTTP_API_TOKEN': 'abcd' }
#end

