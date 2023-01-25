class AddRequestSampleIdToColors < ActiveRecord::Migration[6.1]
  def change
    add_column :colors, :request_sample_id, :integer
  end
end
