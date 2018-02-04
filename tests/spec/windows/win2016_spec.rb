require 'spec_helper'

describe file('c:/windows') do
  it { should be_directory }
  it { should be_readable }
  it { should_not be_writable.by('Everyone') }
end

describe file('c:/temp/test.txt') do
  it { should be_file }
  it { should contain "some text" }
end

describe package('Adobe AIR') do
  it { should be_installed}
end

describe service('DNS Client') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
  it { should have_start_mode("Manual") }
end

describe port(139) do
  it { should be_listening }
end

describe user('some.admin') do
  it { should exist }
  it { should belong_to_group('Administrators')}
end

describe group('Guests') do
  it { should exist }
end

describe group('MYDOMAIN\Domain Users') do
  it { should exist }
end

describe command('& "ipconfig"') do
  its(:stdout) { should match /IPv4 Address(\.| )*: 192\.168\.1\.100/ }
end

describe windows_registry_key('HKEY_USERS\S-1-5-21-1319311448-2088773778-316617838-32407\Test MyKey') do
  it { should exist }
  it { should have_property('string value') }
  it { should have_property('binary value', :type_binary) }
  it { should have_property('dword value', :type_dword) }
  it { should have_value('test default data') }
  it { should have_property_value('multistring value', :type_multistring, "test\nmulti\nstring\ndata") }
  it { should have_property_value('qword value', :type_qword, 'adff32') }
  it { should have_property_value('binary value', :type_binary, 'dfa0f066') }
end

describe windows_feature('Minesweeper') do
  it{ should be_installed }
  it{ should be_installed.by("dism") }
  it{ should be_installed.by("powershell") }
end

describe iis_website("Default Website") do
  it { should exist }
  it { should be_enabled }
  it { should be_running }
  it { should be_in_app_pool "DefaultAppPool" }
  it { should have_physical_path "c:/inetpub/wwwroot" }
end

describe iis_app_pool("DefaultAppPool") do
  it { should exist }
  it { should have_dotnet_version "2.0" }
end
