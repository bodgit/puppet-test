require 'spec_helper_acceptance'

describe 'test' do
  it 'should work with no errors' do
    pp = <<-EOS
      include ::test
    EOS

    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes  => true)
  end
end
