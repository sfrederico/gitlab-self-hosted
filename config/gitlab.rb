
external_url 'https://gitlab.sfrederico.dev'

nginx['listen_port'] = 8081 # Custom HTTP port because of nginx reverse proxy

letsencrypt['enable'] = true
letsencrypt['contact_emails'] = ['sfrederico@ucs.br']
letsencrypt['auto_renew'] = true

puma['worker_processes'] = 0

sidekiq['concurrency'] = 10

prometheus_monitoring['enable'] = false

gitlab_rails['env'] = {
  'MALLOC_CONF' => 'dirty_decay_ms:1000,muzzy_decay_ms:1000'
}

gitaly['configuration'] = {
  concurrency: [
    {
      'rpc' => "/gitaly.SmartHTTPService/PostReceivePack",
      'max_per_repo' => 3,
    }, {
      'rpc' => "/gitaly.SSHService/SSHUploadPack",
      'max_per_repo' => 3,
    },
  ],
}
gitaly['env'] = {
  'MALLOC_CONF' => 'dirty_decay_ms:1000,muzzy_decay_ms:1000',
  'GITALY_COMMAND_SPAWN_MAX_PARALLEL' => '2'
}