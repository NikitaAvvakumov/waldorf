class AddAttachmentPhotoToTeachers < ActiveRecord::Migration
  def self.up
    change_table :teachers do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :teachers, :photo
  end
end
