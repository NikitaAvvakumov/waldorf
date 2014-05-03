class RemoveAssetFromAssets < ActiveRecord::Migration
  def change
    remove_column :assets, :asset
  end
end
