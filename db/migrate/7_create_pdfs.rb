class CreatePdfs < ActiveRecord::Migration[5.1]
  def change
    create_table :pdfs do |t|
      t.text :name
      t.string :location, default: 'app/assets/pdfs'

    end
  end
end
