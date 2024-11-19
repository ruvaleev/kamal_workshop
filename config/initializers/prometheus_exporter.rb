unless Rails.env.test?
  require 'prometheus_exporter/middleware'

  PrometheusExporter::Client.default = PrometheusExporter::Client.new(
    host: ENV['PROMETHEUS_EXPORTER_HOST'] || 'localhost', port: 9394
  )

  # This reports stats per request like HTTP status and timings
  Rails.application.middleware.unshift PrometheusExporter::Middleware
end
