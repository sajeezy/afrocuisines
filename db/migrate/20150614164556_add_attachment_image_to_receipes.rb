class AddAttachmentImageToReceipes < ActiveRecord::Migration
  def self.up
    change_table :receipes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :receipes, :image
  end
end
