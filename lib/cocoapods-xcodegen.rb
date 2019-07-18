require 'cocoapods-xcodegen/gem_version'

module CocoapodsXcodegen
    module Xcodegen
        class << self
            def generate(options)
                if !command?("xcodegen")
                    Pod::UI.puts "xcodegen not found! run `brew install xcodegen`".red
                    return
                end
                
                #   Options:
                #   --cache-path <value>     Where the cache file will be loaded from and save to. Defaults to ~/.xcodegen/cache/{SPEC_PATH_HASH}
                #   -c, --use-cache          Use a cache for the xcodegen spec. This will prevent unnecessarily generating the project if nothing has changed
                #   -h, --help               Show help information
                #   -p, --project <value>    The path to the directory where the project should be generated. Defaults to the directory the spec is in. The filename is defined in the project spec
                #   -q, --quiet              Suppress all informational and success output
                #   -s, --spec <value>       The path to the project spec file. Defaults to project.yml

                specs       = options[:specs] ? "-s #{options[:specs]}" : "-s project.yml"
                # project     = options[:project] ? "-p #{options[:project]}" : ""
                # usecache    = 'UseCache'.in?(options[:keys]) ? "-c" : " "
                usecache    = (options[:keys].include? 'UseCache') ? "-c" : ''
                quiet       = (options[:keys].include? 'Verbose') ? "" : '-q'
            
                command = "xcodegen #{usecache} #{specs} #{quiet}"
            
                Pod::UI.message "Executing '#{command}'".yellow do
                    system(command)
                end
            
                Pod::UI.titled_section "Project generation complete".green    
            end

            def command?(command)
                system("which #{ command} > /dev/null 2>&1")
            end
        end
    end
end