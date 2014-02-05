require 'sinatra'

class S3GyazoApp < Sinatra::Base

  configure :production do
    s3 = AWS::S3.new(
      :access_key_id => ENV['S3GYAZO_ACCESS_KEY_ID'],
      :secret_access_key => ENV['S3GYAZO_SECRET_ACCESS_KEY']
    )
    bucket = s3.buckets[ENV['S3GYAZO_BUCKET_NAME']]
    set :bucket, bucket
  end

  get '/' do
    'S3Gyazo'
  end

  post '/upload.cgi' do
    bucket = settings.bucket
    data = (begin
              params[:imagedata][:tempfile].read
            rescue
              params[:imagedata]
            end)
    hash = Digest::MD5.hexdigest(data).to_s
    bucket.objects[hash].write(data)
    "http://#{request.host_with_port}/#{hash}.png"
  end

  get '/:hash.png' do
    bucket = settings.bucket
    begin
      s3obj = bucket.objects[params[:hash]]
      content_type 'image/png'
      s3obj.read
    rescue 
      content_type 'text/plain'
      halt 404, 'image not found'
    end
  end
end


