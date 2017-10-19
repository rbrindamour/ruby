require 'digest'
 
class SecurityHash
 
 attr_reader :md5_digest, :sha256_digest
 
 def initialize(file_name)
 #file_name = ARGV[0]
 @sha256_digest = Digest::SHA256.file(file_name).hexdigest
 @md5_digest = Digest::MD5.file(file_name).hexdigest
 
 puts "SHA256 Digest: #{@sha256_digest}"
 puts "MD5 Digest: #{@md5_digest}"
 end
 
end
 
security_hash = SecurityHash.new ARGV[0] 
