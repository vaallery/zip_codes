class ZipException < ApplicationRecord

  def self.truncate
    connection.execute("TRUNCATE #{table_name} RESTART IDENTITY")
  end

  def self.find_by_orig_dest(orig, dest)
    orig = orig.to_i if orig.is_a?(String)
    dest = dest.to_i if orig.is_a?(String)
    find_by("orig_start <= #{orig} and orig_end >= #{orig} and dest_start < #{dest} and dest_end > #{dest}")
  end
end
