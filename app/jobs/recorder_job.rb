class RecorderJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    record = args[0]

    if record == :default

    elsif record.class == Hash

    end
  end
end
