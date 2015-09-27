# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.


#SwaggerDocsSample::Application.load_tasks
#
require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :generate_docs => :environment do
  Rake::Task['swagger:docs'].invoke
  Swagger::Docs::Config.registered_apis.each_value do |config|
    file_name = File.join(config[:api_file_path], 'api-docs.json')
    root_doc = Oj.load(File.read(file_name))
    root_doc['apis'].each{|r| r[:path] = "#{r[:path]}"}
    root_doc['basePath'] = ENV['BASE_PATH']
    File.write(file_name, Oj.dump(root_doc))
  end
end
