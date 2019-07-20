require 'aws-sdk-s3'

def upload_problem(file, type)
  s3 = Aws::S3::Resource.new(region: ENV['AWS_REGION'])

  bucket = s3.bucket(ENV['AWS_BUCKET'])
  wordlist = f.split("\n")
  10.times do
    object_name = "#{type}-#{wordlist.sample}-#{file[:filename]}"
    next if bucket.objects.any? { |item| item.key == object_name }
    obj = bucket.object(object_name)
    obj.upload_file(file[:tempfile])
    return
  end

  throw 'g'
end
