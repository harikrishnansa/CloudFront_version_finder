require ‘aws-sdk’
puts “Cloudfront ID\tStatus \t HTTP version\tDistribution name\tDomain name”
clf= Aws::CloudFront::Client.new(region: “us-east-1”)
resp = clf.list_distributions()
resp.distribution_list.items.each do |temp|
output=clf.get_distribution({id:“#{temp.id}”})
puts “#{temp.id}\t#{temp.status}\t#{output.distribution.distribution_config.http_version}\t#{temp.domain_name}\t\t#{output.distribution.distribution_config.origins.items0.domain_name}”
puts “\n”
end
