module Rdpl
  # Represents a Datamatrix to be printed.
  class Datamatrix
    include Element

    DATAMATRIX     = 'W1c'

    alias :horizontal_module_multiplier :width_multiplier
    alias :horizontal_module_multiplier= :width_multiplier=
    alias :vertical_module_multiplier :height_multiplier
    alias :vertical_module_multiplier= :height_multiplier=

    DEFAULT_ROWS = 16
    DEFAULT_COLUMNS = 16

    # Sets the barcode rows. Valid values go from 0 to 144.
    def requested_rows=(rows)
      raise InvalidRowsAmountError unless valid_dimension_range.include?(rows)
      @rows = rows
    end

    # Returns the barcode's rows. Defaults to 16.
    def rows
      @rows || DEFAULT_ROWS
    end

    # Sets the columns rows. Valid values go from 0 to 144.
    def requested_columns=(columns)
      raise InvalidColumnsAmountError unless valid_dimension_range.include?(columns)
      @columns = columns
    end

    # Returns the barcode's columns. Defaults to 16.
    def columns
      @columns || DEFAULT_COLUMNS
    end

    private
    # Returns ECC + Fixed 0 value for Datamatrix
    def fixed_val
      '2000'
    end

    def valid_dimension_range
      0..144
    end

    def formatted_requested_rows
      '%03d' % rows
    end

    def formatted_requested_columns
      '%03d' % columns
    end

    def valid_font_id_ranges
      [('W1c')]
    end
  end
end
