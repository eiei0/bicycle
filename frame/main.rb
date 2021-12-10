# frozen_string_literal: true

require 'logger'

lib_dir = File.join(__dir__, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require_relative './grpc'
require_relative './server'

def main
  s = GRPC::RpcServer.new
  host = ENV.fetch('GRPC_SERVER_HOST', '0.0.0.0')
  port = ENV.fetch('GRPC_SERVER_PORT', '8091')

  port = s.add_http2_port("#{host}:#{port}", :this_port_is_insecure)
  GRPC.logger.info "Starting gRPC server on #{host}:#{port}"
  s.handle(Server)
  s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
end

main
