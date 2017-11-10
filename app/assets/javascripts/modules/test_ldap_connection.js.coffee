# Copyright (c) 2008-2017, Puzzle ITC GmbH.
# This file is part of Cryptopus and licensed under
# the Affero General Public License version 3 or later.
# See the COPYING file at the top-level directory or at
# https://github.com/puzzle/cryptopus.

app = window.App ||= {}

class app.TestLdapConnection
  constructor: () ->
    bind.call()

  test_ldap_connection = (url, settings) ->
    $.ajax({
      type: "PATCH",
      url: url,
      data: {settings},
    })

  ldap_settings = () ->
    settings = {}
    keys = ['host-list',
            'portnumber',
            'encryption']
    for key in keys
      do ->
        if key == 'host-list'
          settings[key] = $("#" + key).val()
        else
          settings[key] = $("#setting_ldap_" + key).val()
    settings

  bind = ->
    $(document).on 'click', '#ldap-button', ->
      settings = ldap_settings()
      url = '/api/admin/settings/test_ldap_connection'
      test_ldap_connection(url, settings)

  new TestLdapConnection
