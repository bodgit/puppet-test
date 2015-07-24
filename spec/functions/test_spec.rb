require 'spec_helper'

describe 'test' do

  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      before :each do
        facts.each do |k, v|
          scope.stubs(:lookupvar).with("::#{k}").returns(v)
          scope.stubs(:lookupvar).with(k.to_s).returns(v)
        end
      end

      it { should run.with_params('foo').and_return(['test']) }
      it { should run.with_params(['foo', 'bar', 'baz']).and_return(['test', 'test', 'test']) }
      it { expect { should run.with_params({}) }.to raise_error(/Requires either array or string to work with/) }
      it { expect { should run.with_params() }.to raise_error(/Wrong number of arguments given \(0 for 1\)/) }
    end
  end
end
