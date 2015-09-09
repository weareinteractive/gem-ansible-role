require "erb"
require "git"
require "thor"
require "yaml"
require "ostruct"

module Ansible
  module Role
    class Cli < Thor
      include Thor::Actions
      source_root ::File.expand_path("#{File.dirname(__FILE__)}/../../../")

      # -----------------------------------------------------------------------
      # Tasks
      # -----------------------------------------------------------------------

      desc "init", "Initialize new role"
      def init()

        @data = {}

        # check empty directory
        abort "Role directory (#{Dir.getwd}) is not empty!" unless Dir["#{Dir.getwd}/*"].empty?

        # initializing git repo
        g = Git.init(Dir.getwd)

        say "To generate your role, please give me some info about:\n\n", :yellow

        say "• Author", :yellow
        @data[:author] = prompt "  Name", "#{g.config('user.name')} <#{g.config('user.email')}>", true
        @data[:company] = prompt "  Company", nil, true
        puts ""

        say "• Role", :yellow
        @data[:name] = prompt "  Name", "my-role", true
        @data[:description] = prompt "  Description", "Best role ever!", true
        @data[:category] = prompt "  Category", "development", true
        @data[:min_ansible_version] = prompt "  Min ansible version", "1.9", true
        @data[:var_name] = @data[:name].sub("-", "_")
        puts ""

        say "• GitHub", :yellow
        @data[:github_user] = prompt "  User", g.config('user.name'), true
        @data[:github_name] = prompt "  Repository", File.basename(Dir.getwd)
        @data[:github_path] = "#{@data[:github_user]}/#{@data[:github_name]}"
        puts ""

        say "• Ansible Galaxy", :yellow
        @data[:galaxy_user] = prompt "  User", ENV['username']
        puts ""

        @data[:role_name] = "#{@data[:galaxy_user]}.#{@data[:name]}"

        # render templates
        directory  "templates/ansible/role/init", Dir.getwd

        # generate docs
        docgen

        # add and commit files
        g.add()
        g.commit('initial commit')
      end

      desc "docgen", "Generate README file"
      def docgen
        @data = {}

        @data[:defaults] = get_yaml("defaults")
        @data[:meta] = get_yaml("meta")
        @data[:tests] = get_yaml("tests")
        @data[:vars] = get_yaml("vars")

        @data[:files] = {}
        @data[:files][:defaults] = get_yaml_files("defaults")
        @data[:files][:handlers] = get_yaml_files("handlers")
        @data[:files][:tests] = get_yaml_files("tests")
        @data[:files][:vars] = get_yaml_files("vars")

        # render template
        template  "templates/ansible/role/docgen/README.md.tt", "README.md"
      end

      no_tasks do

        # ---------------------------------------------------------------------
        # Public methods
        # ---------------------------------------------------------------------

        def dot()
          "."
        end

        def name
          @data[:name]
        end

        # ---------------------------------------------------------------------
        # Private methods
        # ---------------------------------------------------------------------

        private

        def abort(msg)
           say msg, :red
           exit(1)
        end

        def prompt(msg, default = nil, required = false)
          loop do
            msg += " [#{default}]" if default != nil
            print "#{msg}: "
            ret = $stdin.gets.chomp
            if ret != ""
              return ret
            elsif ret == "" && default != nil
              return default
            elsif ret == "" && !required
              return ret
            end
          end
        end

        def get_yaml(path)
          data = {}
          Dir["#{Dir.getwd}/#{path}/*.yml"].each do |file_name|
            basename = File.basename(file_name, '.yml')
            data.store(:"#{basename}", YAML::load_file(file_name))
          end
          data
        end

        def get_yaml_files(path)
          data = {}

          return nil unless File.directory?("#{Dir.getwd}/#{path}")

          Dir["#{Dir.getwd}/#{path}/*.yml"].each do |file_name|
            basename = File.basename(file_name, '.yml')
            file = File.open(file_name, "rb")
            data.store(:"#{basename}", file.read)
          end
          data
        end

      end
    end
  end
end
