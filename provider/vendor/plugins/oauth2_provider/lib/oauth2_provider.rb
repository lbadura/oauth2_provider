# Copyright (c) 2010 ThoughtWorks Inc. (http://thoughtworks.com)
# Licenced under the MIT License (http://www.opensource.org/licenses/mit-license.php)

require 'oauth2/provider/a_r_datasource'
require 'oauth2/provider/in_memory_datasource'
require 'oauth2/provider/model_base'

Oauth2::Provider::ModelBase.datasource = ENV["OAUTH2_PROVIDER_DATASOURCE"]

unless ENV['LOAD_OAUTH_SILENTLY']
  puts "*"*80
  puts "*** Using data source: #{Oauth2::Provider::ModelBase.datasource.class}"
  puts "*"*80
end
