java_import Java.java.util.logging.Logger

# A single build step in the entire build process
class JobUpdatedTrigger < Jenkins::Triggers::Trigger

  display_name "Job updated trigger"

  attr_accessor :watching_job_name

  def self.applicable?(type)
    type.is_a? Java::HudsonModel::Project
  end

  def logger
    @logger ||= Logger.getLogger(self.class.name)
  end

  # Invoked with the form parameters when this extension point
  # is created from a configuration screen.
  def initialize(attrs = {})
    @watching_job_name = attrs['watching_job_name']
  end

  def run
    logger.info "JobUpdatedTrigger#run"
  end

  def stop
    logger.info "JobUpdatedTrigger#stop"
  end
end