# class ImagesController < ApplicationController
 
# @@BUCKET = "capms"
 
# def create
#   p "1" *100
#   fileUp = params[:upload]
#   orig_filename =  fileUp['datafile'].original_filename
#   filename = sanitize_filename(orig_filename)
#   AWS::S3::S3Object.store(filename, fileUp['datafile'].read, @@BUCKET, :access => :public_read)
#   url = AWS::S3::S3Object.url_for(filename, @@BUCKET, :authenticated => false)
#   @image = Image.new(params[:profilepicture])
#   @image.user = current_user
#   @image.filename = filename
#   @image.url = url;
#   if @image.save
#     flash[:success] = "Image saved! "
#     render '/home'
#   else
#     render '/users/new_image'
#   end
# end
 
# def destroy

#   AWS::S3::S3Object.find(@image.filename, @@BUCKET).delete
#   @image.destroy
#   render '/home'
# end
 
# private 
   
#     def sanitize_filename(file_name)
#       just_filename = File.basename(file_name)
#       just_filename.sub(/[^\w\.\-]/,'_')
#     end
 
# end