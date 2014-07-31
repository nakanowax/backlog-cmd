require 'backlog'
require 'thor'
require 'xmlrpc/client'
require 'yaml'
require 'pp'

module Backlog
  class Command < Thor
    @@config = YAML.load_file(File.join(__dir__, '../../config.yaml'))
    @@proxy = XMLRPC::Client.new_from_hash({
      "host"     => @@config['backlog']['space'] + ".backlog.jp",
      "path"     => "/XML-RPC",
      "port"     => 443,
      "use_ssl"  => true,
      "user"     => @@config['backlog']['user'],
      "password" => @@config['backlog']['password'],
    })

    desc "init", "backlog setting."
    method_option :space, :required => true, :aliases => "-s", :type => :string
    method_option :user, :required => true, :aliases => "-u", :type => :string
    method_option :password, :required => true, :aliases => "-p", :type => :string
    def init
      @@config['backlog']['space'] = options[:space]
      @@config['backlog']['user'] = options[:user]
      @@config['backlog']['password'] = options[:password]
      open(File.join(__dir__, '../../config.yaml'),"w") do |f|
        YAML.dump(@@config,f)
      end
      puts 'sucusess!!'
    end

    desc "project", "get puroject data"
    method_option :key , :aliases => "-k", :type => :string
    method_option :id, :aliases => "-i", :type => :numeric
    def project
      projects = []
      if options[:key]
        project = @@proxy.call("backlog.getProject", options[:key])
        projects.push(project)
      elsif options[:id]
        project = @@proxy.call("backlog.getProject", options[:id])
        projects.push(project)
      else
        projects = @@proxy.call("backlog.getProjects")
      end
      # pp projects
      projects.each do |proj|
        puts "#{proj['id']} | #{proj['key']} | #{proj['name']} | #{proj['url']}"
      end
    end

    desc "issue", "get issuse data"
    method_option :key, :required => true, :aliases => "-k", :type => :string
    def issue
      issue = @@proxy.call("backlog.getIssue", options[:key])

      puts "ID            : #{issue['id']}"
      puts "Key           : #{issue['key']}"
      puts "Title         : #{issue['summary']}"
      puts "Status        : #{issue['status']['name']}"
      puts "Issue Type    : #{issue['issueType']['name']}"
      puts "マイルストーン: #{issue['milestones'][0]['name']}"
      puts "開始日        : #{issue['start_date']}"
      puts "終了日        : #{issue['due_date']}"
      puts "予定時間      : #{issue['actual_hours']}"
      puts "担当者        : #{issue['assigner']['name']}"
    end

    desc "hanzawa times", "puts times 倍返しだ！！"
    method_option :strong, :type => :boolean, :default => false
    def hanzawa(times)
      color = options[:strong] ? :red : nil
      output = "#{times}倍返しだ！！"
      say(output, color)
    end
  end
end
