class LoadZoneMatrix
  include Interactor

  def call
    matrix = []
    exceptions = []
    files_root = 'app/commands'
    ZipException.truncate

    # store matrix in memory. its not so big.
    IO.readlines(Rails.root.join(files_root, 'Format2.txt')).drop(1).each do |row|
      matrix[row[0..2].to_i] = row[3..].scan(/.{1,#{2}}/).map{|s| [s[0].to_i, s[1]!=' ' ? s[1] : nil]}
    end
    ZipMatrix.instance.matrix = matrix

    IO.readlines(Rails.root.join(files_root, 'exception.txt')).drop(1).each do |row|
      # exceptions << {
      #     orig_start: row[0..4],
      #     orig_end: row[5..9],
      #     dest_start: row[10..14],
      #     dest_end: row[15..19],
      #     zone: row[20..21],
      #     mail_type: row[22..23],
      #     filler: row[24..29]
      # }
      exceptions << [
          row[0..4],
          row[5..9],
          row[10..14],
          row[15..19],
          row[20..21],
          row[22..23],
          row[24..29]
      ]
    end

    ZipException.import([:orig_start, :orig_end, :dest_start, :dest_end, :zone, :mail_type, :filler], exceptions)
  end
end