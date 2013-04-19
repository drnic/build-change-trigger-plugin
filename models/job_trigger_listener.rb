java_import Java.java.util.logging.Logger

# Receives notifications about CRUD operations of Items.
#
# This class will receive callbacks
# when items are created, copied, updated, deleted, etc...
#
# To receive a callback, override the method with the same name as
# the event. E.g.
#
#     class MyRunListener
#       include Jenkins::Listeners::ItemListener
#
#       def updated(item)
#         puts "#{item.inspect} updated!"
#       end
#     end
#
class JobTriggerListener
  include Jenkins::Listeners::ItemListener

  def logger
    @logger ||= Logger.getLogger(self.class.name)
  end
  
  # Called after all the jobs are loaded from disk into jenkins.model.Jenkins
  # object.
  def loaded()
    logger.info("items loaded")
  end

  # Called after a job has its configuration updated.
  #
  # @param [Jenkins::Model::Item] The item being updated
  def updated(item)
    logger.info("update - #{item.native.name} (#{item.native.inspect})")
    logger.info item.native.getPublishersList().inspect
    logger.info item.native.getBuildWrappers().inspect
    logger.info item.native.getBuildWrappers().class
  end

  # Called at the begenning of the orderly shutdown sequence to
  # allow plugins to clean up stuff
  def before_shutdown()
  end
end