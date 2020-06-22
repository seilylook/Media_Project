class Item < ApplicationRecord
  mount_uploader :image, ImageUploader

  enum status: { normal: 0, new_: 1, sale: 2, hot: 3 }

  belongs_to :user
  has_many :comments

  def status_to_span(percent=nil)
    case status
    when "normal"
    when "new_"
      "<span class='new'>NEW</span>".html_safe
    when "sale"
      "<span class='sale'>30%</span>".html_safe
    when "hot"
      "<span class='hot'>HOT</span>".html_safe
    end
  end

  def self.generate_seeds
    img1 = "https://images.unsplash.com/photo-1526047932273-341f2a7631f9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
    img2 = "https://images.unsplash.com/photo-1487530811176-3780de880c2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
    img3 = "https://images.unsplash.com/photo-1452827073306-6e6e661baf57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
    img4 = "https://images.unsplash.com/photo-1533616688419-b7a585564566?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
    12.times do |x|
      Item.create!(
        name: "#{x+1}번째 게시물",
        desc: "#{x+1}번째 게시물을 판매합니다",
        remote_image_url: [img1, img2, img3, img4].sample,
        price: rand(10..100)*100,
        status: (0..3).to_a.sample
      )
    end
  end
end
