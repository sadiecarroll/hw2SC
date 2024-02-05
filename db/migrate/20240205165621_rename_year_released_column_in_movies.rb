class RenameYearReleasedColumnInMovies < ActiveRecord::Migration[7.1]
  def change
    rename_column :Movie; :year released, :year_released

  end
end
