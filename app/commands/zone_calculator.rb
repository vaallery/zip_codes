class ZoneCalculator
  include Singleton

  def call(orig, dest)
    # orig = orig.rjust(5, '0') if orig.is_a?(Integer)
    # dest = dest.rjust(5, '0') if orig.is_a?(Integer)

    matrix = ZipMatrix.instance.matrix

    zone, filler = matrix[orig[0..2]][dest[0..2].to_i]

    return zone if !filler || filler == '*'

    zip_exception = ZipException.find_by_orig_dest(orig, dest)

    if zip_exception
      case filler
      when '1'
        zip_exception.zone
      when 'a'
        zip_exception.zone
      when 'b'
        zip_exception.zone
      when 'e'
        zip_exception.zone
      end
    else
      zone
    end

  end
end