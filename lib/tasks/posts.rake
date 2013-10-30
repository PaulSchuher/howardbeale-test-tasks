namespace :posts do
  desc "Generates permalinks for posts which doesn't have it yet"
  task :generate_permalinks => :environment do
    Post.all.each do |post|
      if post.permalink.blank?
        post.generate_permalink!
        post.save
      end
    end
  end

end
