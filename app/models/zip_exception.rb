class ZipException < ApplicationRecord

  def self.truncate
    connection.execute("TRUNCATE #{table_name} RESTART IDENTITY")
  end

  def find_by_orig_dest(orig, dest)
    find_by_sql("orig_start < #{orig} and orig_end > #{orig} and dest_start < #{dest} and dest_end > #{dest}")
  end
end
