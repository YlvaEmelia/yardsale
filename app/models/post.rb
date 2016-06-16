class Post < ActiveRecord::Base
  has_many :images, dependent: :destroy
  accepts_attachments_for :images, attachment: :file, append: true
  
  
  ## TAGGING ##
  
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
    joins(:taggings).group("taggings.tag_id")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
  
  def tag_list
    tags.join(", ")
  end
  
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
  
  
  ## IMPORT ##
  
  def self.import(file)
    CSV.foreach(file.path, :headers => true, :skip_blanks =>true) do |row|
      Post.create! row.to_hash
    end
  end
  
  
end