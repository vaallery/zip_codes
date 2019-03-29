class ZoneCalculator

  def self.call(orig, dest)

    # uncomment if orig and dest maybe Integer
    # orig = orig.rjust(5, '0') if orig.is_a?(Integer)
    # dest = dest.rjust(5, '0') if orig.is_a?(Integer)

    matrix = ZipMatrix.instance.matrix

    zone, filler = matrix[orig[0..2].to_i][dest[0..2].to_i]

    return zone if !filler || filler == '*'

    zip_exception = ZipException.find_by_orig_dest(orig, dest)

    if zip_exception
      case filler
      when '1'
        # TODO redefine for filler '1'
        zip_exception.zone
      when 'a'
        # TODO redefine for filler '2'
        zip_exception.zone
      when 'b'
        # TODO redefine for filler '3'
        zip_exception.zone
      when 'e'
        # TODO redefine for filler '4'
        zip_exception.zone
      end
    else
      zone
    end
  end
end