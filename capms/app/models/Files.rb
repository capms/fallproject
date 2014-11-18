class Files < ActiveRecord::Base
  belongs_to :note
  has_attached_file (:files,
              :storage => :s3,
              :s3_credentials => {:access_key_id => "AKIAIJJTZJ4ACF4AHQCQ",
                                  :secret_access_key => "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"},
              					  :bucket => "capms"
            )
  	validates_attachment_presence :files
  	validates_attachment :files, content_type: { content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain"] }


end
