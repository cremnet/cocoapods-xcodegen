require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Xcodegen do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ xcodegen }).should.be.instance_of Command::Xcodegen
      end
    end
  end
end

