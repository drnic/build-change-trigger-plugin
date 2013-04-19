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
  
  # Called after a new job is created and added to@link jenkins.model.Jenkinsend,
  # before the initial configuration page is provided.
  # 
  # This is useful for changing the default initial configuration of newly created jobs.
  # For example, you can enable/add builders, etc.
  def created(item)
  end

  # Called after a new job is created by copying from an existing job.
  #
  # For backward compatibility, the default implementation of this method calls@link #onCreated(Item)end.
  # If you choose to handle this method, think about whether you want to call super.onCopied or not.
  #
  # @param [Jenkins::Model::Item] The source item that the new one was copied from. Never null.
  # @param [Jenkins::Model::Item] The newly created item. Never null.
  def copied(src_item, item)
  end

  # Called after all the jobs are loaded from disk into@link jenkins.model.Jenkinsend
  # object.
  def loaded()
  end

  # Called right before a job is going to be deleted.
  #
  # At this point the data files of the job is already gone.
  # @param [Jenkins::Model::Item] The item being deleted.
  def deleted(item)
  end

  # Called after a job is renamed.
  #
  # @param [Jenkins::Model::Item] The item being renamed
  # @param The old name of the job.
  # @param The new name of the job. Same as@link Item#getName()end.
  def renamed(item, oldName, newName)
  end

  # Called after a job has its configuration updated.
  #
  # @param [Jenkins::Model::Item] The item being updated
  def updated(item)
    logger.info("update(#{item.name})")
  end

  # Called at the begenning of the orderly shutdown sequence to
  # allow plugins to clean up stuff
  def before_shutdown()
  end
end