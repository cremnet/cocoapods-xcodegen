module Pod
  class Command
    # This is an example of a cocoapods plugin adding a top-level subcommand
    # to the 'pod' command.
    #
    # You can also create subcommands of existing or new commands. Say you
    # wanted to add a subcommand to `list` to show newly deprecated pods,
    # (e.g. `pod list deprecated`), there are a few things that would need
    # to change.
    #
    # - move this file to `lib/pod/command/list/deprecated.rb` and update
    #   the class to exist in the the Pod::Command::List namespace
    # - change this class to extend from `List` instead of `Command`. This
    #   tells the plugin system that it is a subcommand of `list`.
    # - edit `lib/cocoapods_plugins.rb` to require this file
    #
    # @todo Create a PR to add your plugin to CocoaPods/cocoapods.org
    #       in the `plugins.json` file, once your plugin is released.
    #
    class Xcodegen < Command
      self.summary = 'Plugin for Xcode project generation'

      self.description = <<-DESC
        You need to install xcodegen first \n
        \n
        To use plugin add to your Podfile this lines: \n
         \tplugin 'cocoapods-xcodegen',\n
         \t\t\tspecs: 'project.yml' # optional value\n
         \t\t\tkeys: [\n
         \t\t\t\t'UseCache', # optional value\n
         \t\t\t\t'Verbose'   # optional value\n
         \t\t\t]\n
      DESC

      self.arguments = [
        CLAide::Argument.new('specs', true),
        CLAide::Argument.new('keys', false)
      ]

      def initialize(argv)
        @name = argv.shift_argument
        super
      end

      def validate!
        super
        help! 'Specs yml file is required.' unless @specs
      end

      def run
        UI.puts "Add your implementation for the cocoapods-xcodegen plugin in #{__FILE__}"
      end
    end
  end
end
