class EventPhoto < ActiveRecord::Base
	belongs_to :event
  validates :avatar,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }

  has_attached_file :avatar, styles: {
    medium: '300x300>',
    large: '400x400>',
    i4: '500x500>',
  }
end
