class Team < ActiveRecord::Base
	has_many :users
	belongs_to :completion_status
	has_many :notifications
  has_many :files
	has_attached_file(:files,
              :storage => :s3,
              :s3_credentials => {:access_key_id => "AKIAIJJTZJ4ACF4AHQCQ",
                                  :secret_access_key => "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"},
              					  :bucket => "capms"
            )
validates_attachment :files, content_type: { content_type: [ "application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/vnd.openxmlformats-officedocument.presentationml.presentation",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain", "video/mp4", "video.mov", "video/mpeg","video/mpeg4", "image/jpg", "image/jpeg",
             "image/jpg", "image/jpeg", "image/png", "image/gif", "video/avi", 'Audio/mp3'
] }
has_attached_file(:files1,
              :storage => :s3,
              :s3_credentials => {:access_key_id => "AKIAIJJTZJ4ACF4AHQCQ",
                                  :secret_access_key => "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"},
                          :bucket => "capms"
            )
validates_attachment :files1, content_type: { content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/vnd.openxmlformats-officedocument.presentationml.presentation",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain", "video/mp4", "video.mov", "video/mpeg","video/mpeg4", "image/jpg", "image/jpeg",
             "image/jpg", "image/jpeg", "image/png", "image/gif", "video/avi", 'Audio/mp3'] }
has_attached_file(:files2,
              :storage => :s3,
              :s3_credentials => {:access_key_id => "AKIAIJJTZJ4ACF4AHQCQ",
                                  :secret_access_key => "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"},
                          :bucket => "capms"
            )
validates_attachment :files2, content_type: { content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/vnd.openxmlformats-officedocument.presentationml.presentation",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain", "video/mp4", "video.mov", "video/mpeg","video/mpeg4", "image/jpg", "image/jpeg",
             "image/jpg", "image/jpeg", "image/png", "image/gif", "video/avi", 'Audio/mp3'] }
has_attached_file(:files3,
              :storage => :s3,
              :s3_credentials => {:access_key_id => "AKIAIJJTZJ4ACF4AHQCQ",
                                  :secret_access_key => "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"},
                          :bucket => "capms"
            )
validates_attachment :files3, content_type: { content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/vnd.openxmlformats-officedocument.presentationml.presentation",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain", "video/mp4", "video.mov", "video/mpeg","video/mpeg4", "image/jpg", "image/jpeg",
             "image/jpg", "image/jpeg", "image/png", "image/gif", "video/avi", 'Audio/mp3'] }
has_attached_file(:files4,
              :storage => :s3,
              :s3_credentials => {:access_key_id => "AKIAIJJTZJ4ACF4AHQCQ",
                                  :secret_access_key => "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"},
                          :bucket => "capms"
            )
validates_attachment :files4, content_type: { content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/vnd.openxmlformats-officedocument.presentationml.presentation",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain", "video/mp4", "video.mov", "video/mpeg","video/mpeg4", "image/jpg", "image/jpeg",
             "image/jpg", "image/jpeg", "image/png", "image/gif", "video/avi", 'Audio/mp3'] }
has_attached_file(:files5,
              :storage => :s3,
              :s3_credentials => {:access_key_id => "AKIAIJJTZJ4ACF4AHQCQ",
                                  :secret_access_key => "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"},
                          :bucket => "capms"
            )             

validates_attachment :files5, content_type: { content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/vnd.openxmlformats-officedocument.presentationml.presentation",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain", "video/mp4", "video.mov", "video/mpeg","video/mpeg4", "image/jpg", "image/jpeg",
             "image/jpg", "image/jpeg", "image/png", "image/gif", "video/avi", 'Audio/mp3'] }
has_attached_file(:files6,
              :storage => :s3,
              :s3_credentials => {:access_key_id => "AKIAIJJTZJ4ACF4AHQCQ",
                                  :secret_access_key => "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"},
                          :bucket => "capms"
            )             

validates_attachment :files6, content_type: { content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/vnd.openxmlformats-officedocument.presentationml.presentation",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain", "video/mp4", "video.mov", "video/mpeg","video/mpeg4", "image/jpg", "image/jpeg",
             "image/jpg", "image/jpeg", "image/png", "image/gif", "video/avi", 'Audio/mp3'] }
has_attached_file(:files7,
              :storage => :s3,
              :s3_credentials => {:access_key_id => "AKIAIJJTZJ4ACF4AHQCQ",
                                  :secret_access_key => "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"},
                          :bucket => "capms"
            )

validates_attachment :files7, content_type: { content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/vnd.openxmlformats-officedocument.presentationml.presentation",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain", "video/mp4", "video.mov", "video/mpeg","video/mpeg4", "image/jpg", "image/jpeg",
             "image/jpg", "image/jpeg", "image/png", "image/gif", "video/avi", 'Audio/mp3'] }
has_attached_file(:files8,
              :storage => :s3,
              :s3_credentials => {:access_key_id => "AKIAIJJTZJ4ACF4AHQCQ",
                                  :secret_access_key => "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"},
                          :bucket => "capms"
            )

validates_attachment :files8, content_type: { content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/vnd.openxmlformats-officedocument.presentationml.presentation",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain", "video/mp4", "video.mov", "video/mpeg","video/mpeg4", "image/jpg", "image/jpeg",
             "image/jpg", "image/jpeg", "image/png", "image/gif", "video/avi", 'Audio/mp3'] }
has_attached_file(:files9,
              :storage => :s3,
              :s3_credentials => {:access_key_id => "AKIAIJJTZJ4ACF4AHQCQ",
                                  :secret_access_key => "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"},
                          :bucket => "capms"
            )

validates_attachment :files9, content_type: { content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/vnd.openxmlformats-officedocument.presentationml.presentation",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain", "video/mp4", "video.mov", "video/mpeg","video/mpeg4", "image/jpg", "image/jpeg",
             "image/jpg", "image/jpeg", "image/png", "image/gif", "video/avi", 'Audio/mp3'] }

end

class Asset < ActiveRecord::Base
  belongs_to :Team
end
