config = {
  elastic_host: 'http://localhost:9200',
  log: false,
  transport_options: {
    request: {
      timeout: 5
    }
  }
}

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
