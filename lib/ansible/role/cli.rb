require "git"
require "thor"

module Ansible
  module Role
    class Cli < Thor
      include Thor::Actions
      source_root ::File.expand_path("#{File.dirname(__FILE__)}/../../../")

      # -----------------------------------------------------------------------
      # Tasks
      # -----------------------------------------------------------------------

      desc "init PATH", "Initialize new role"
      def init()

        @data = {}

        say "Role info", :yellow
        @data[:name] = self.class.prompt "Name", nil, true
        @data[:author] = self.class.prompt "Author", ENV['USER'], true
        @data[:company] = self.class.prompt "Company", nil, true
        @data[:description] = self.class.prompt "Description", nil, true
        @data[:min_ansible_version] = self.class.prompt "Min ansible version", "1.9", true
        @data[:category] = self.class.prompt "Category (system, web, ...)", nil, true
        @data[:var_name] = @data[:name].sub("-", "_")

        say "GitHub info", :yellow
        @data[:github_user] = self.class.prompt "GitHub user", @data[:author], true
        @data[:github_name] = self.class.prompt "GitHub repository name", File.basename(Dir.getwd)
        @data[:github_path] = "#{@data[:github_user]}/#{@data[:github_name]}"

        say "Galaxy info", :yellow
        @data[:galaxy_id] = self.class.prompt "Galaxy role ID", 0
        @data[:galaxy_user] = self.class.prompt "Galaxy user", @data[:github_user]

        @data[:role_name] = "#{@data[:galaxy_user]}.#{@data[:name]}"

        print @data.inspect

        directory  "templates/ansible/role/init", Dir.getwd
      end

      # -----------------------------------------------------------------------
      # Public methods
      # -----------------------------------------------------------------------
      no_tasks do

        def dot()
          "."
        end

        def name
          @data[:name]
        end

      end

      # -----------------------------------------------------------------------
      # Public static methods
      # -----------------------------------------------------------------------

      def self.prompt(msg, default = nil, required = false)
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

    end
  end
end
