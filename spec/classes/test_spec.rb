require 'spec_helper'

describe 'test' do

  on_supported_os.each do |os, facts|
    context "on #{os}", :compile do
      let(:facts) do
        facts
      end

      it { should contain_class('test') }
      it { should contain_exec('echo hello') }
      it { should contain_file('/tmp/test') }
    end
  end
end
