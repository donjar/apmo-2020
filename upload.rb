require 'aws-sdk-s3'

def upload_problem(file, type)
  throw 'g' if file[:tempfile].size > 10 * (2**30)

  s3 = Aws::S3::Resource.new(region: ENV['AWS_REGION'])

  bucket = s3.bucket(ENV['AWS_BUCKET'])
  wordlist = File.read('wordlist.txt').split("\n")
  10.times do
    object_name = "#{type}-#{wordlist.sample}-#{file[:filename]}"
    next if bucket.objects.any? { |item| item.key == object_name }
    obj = bucket.object(object_name)
    obj.upload_file(file[:tempfile])
    return
  end

  throw 'g'
end
