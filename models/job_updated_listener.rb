java_import Java.java.util.logging.Logger

# Receives notifications about CRUD operations of Items.
class JobUpdatedListener
  include Jenkins::Listeners::ItemListener

  def logger
    @logger ||= Logger.getLogger(self.class.name)
  end
  
  # Called after a job has its configuration updated.
  #
  # @param [Jenkins::Model::Item] The item being updated
  def updated(item)
    logger.info("update - #{item.native.name} (#{item.native.inspect})")
    logger.info item.native.getPublishersList().inspect
    logger.info item.native.getBuildWrappers().inspect
    logger.info item.native.getBuildWrappers().class.to_s
  end
end