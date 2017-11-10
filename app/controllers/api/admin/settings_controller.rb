# encoding: utf-8

#  Copyright (c) 2008-2017, Puzzle ITC GmbH. This file is part of
#  Cryptopus and licensed under the Affero General Public License version 3 or later.
#  See the COPYING file at the top-level directory or at
#  https://github.com/puzzle/cryptopus.

class Api::Admin::SettingsController < ApiController

  def test_ldap_connection
    settings = params[:settings]
    params = settings_params(settings)
    begin
      ldap_connection(params)
      add_info(t('flashes.api.admin.settings.test_ldap_connection.successful'))
    rescue
      add_info(t('flashes.api.admin.settings.test_ldap_connection.failed'))
    end
    render_json ''
  end

  private

  def ldap_connection(params)
    ldap = Net::LDAP.new(params)
    ldap.bind ? true : false
  end

  def settings_params(settings)
    { host: settings[:'host-list'].first,
      port: settings[:portnumber],
      encryption: settings[:encryption] }
  end

end
