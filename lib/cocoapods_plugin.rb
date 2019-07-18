require 'cocoapods-xcodegen/command'
require 'cocoapods-xcodegen'

module CocoapodsXcodegen
    Pod::HooksManager.register('cocoapods-xcodegen', :source_provider) do |context, options|
        Pod::UI.message 'cocoapods-xcodegen received source_provider hook'

        Xcodegen.generate(options)
    end
end