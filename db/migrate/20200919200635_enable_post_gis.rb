class EnablePostGis < ActiveRecord::Migration[6.0]
  def change
    enable_extension "postgis"
  end
end
