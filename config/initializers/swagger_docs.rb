Swagger::Docs::Config.register_apis({
  '0.1' => {
    # the extension used for the API
    api_extension_type: :json,
    # the output location where your .json files are written to
    api_file_path: 'public/',
    # the URL base path to your API
    base_path: ENV['BASE_PATH'],
    # if you want to delete all .json files at each generation
    clean_directory: true,
    # add custom attributes to api-docs
    attributes: {
      info: {
        title: 'Saleswhale',
        description: 'Saleswhale'
      }
    }
  }
})
