# frozen_string_literal: true

require_relative './lib/frame_services_pb'

# Server class for the Frame service
class Server < Bicycle::Frame::Service
  def create_frame(create_frame_request, _unused_call)
    Bicycle::CreateFrameResponse.new(
      frame: Bicycle::BikeFrame.new(
        id: 'urn:bicycle:frame:1',
        manufacturer: create_frame_request.manufacturer,
        material: create_frame_request.material,
        size: create_frame_request.size,
        type: create_frame_request.type,
        part_count: 0
      )
    )
  end
end
