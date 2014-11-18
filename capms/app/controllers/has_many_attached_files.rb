# Extends the model to afford the ability to associate other records with the receiving record.
      #
      # This module needs the paperclip plugin to work
      # http://www.thoughtbot.com/projects/paperclip
      def has_many_attached_files(options = {})
        class_attribute(:has_many_attached_files_options)
        self.has_many_attached_files_options = { :counter_cache => options[:counter_cache], :styles => options[:styles], :model => options[:model] ||= ::Asset }
        
        attr_accessor(:upload)
        attr_accessor(:current_file_language)
        after_save(:save_attached_files)
        has_many(:assets, :as => :attachable, :dependent => :destroy, :class_name => self.has_many_attached_files_options[:model].to_s)
        include(::PaperclipI18n::HasManyAttachedFiles::InstanceMethods)
      end