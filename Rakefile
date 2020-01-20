# frozen_string_literal: true

ENV['RACK_ENV'] = ENV['ENVIRONMENT'] ||= 'development'

$LOAD_PATH.unshift(File.expand_path('app', __dir__))

require 'bundler/setup'
require 'rake'

require_relative 'config/environment'

Bundler.require(ENV['ENVIRONMENT'])

module Tasks
  extend Rake::DSL

  namespace :db do
    require 'sequel'
    Sequel.extension :migration
    DB = Sequel.connect(ENV['DATABASE_URL'])

    desc 'Prints current schema version'
    task :version do
      version = begin
        DB.tables.include?(:schema_info) ? DB[:schema_info].first[:version] : 0
      end

      puts "Schema Version: #{version}"
    end

    desc 'Perform migration up to latest migration available'
    task :migrate do
      Sequel::Migrator.run(DB, 'db/migrations')
      Rake::Task['db:version'].execute
    end

    desc 'Perform rollback to specified target or full rollback as default'
    task :rollback, :target do |_t, args|
      args.with_defaults(target: 0)

      Sequel::Migrator.run(DB, 'db/migrations', target: args[:target].to_i)
      Rake::Task['db:version'].execute
    end

    desc 'Perform migration reset (full rollback and migration)'
    task :reset do
      Sequel::Migrator.run(DB, 'db/migrations', target: 0)
      Sequel::Migrator.run(DB, 'db/migrations')
      Rake::Task['db:version'].execute
    end
  end
end
