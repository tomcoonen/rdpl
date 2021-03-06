$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

module Rdpl
  STX      = 2.chr
  CR       = 13.chr
  LF       = 10.chr
  NEW_LINE = CR + LF
  FEED     = 'F'

  module Commandable # :nodoc:
    def command(param)
      raise EndedElementError if self.state == :finished
      @contents << STX << param << NEW_LINE
    end
  end

  module Sensor 
    REFLECTIVE = 'r'
    EDGE      = 'e'
  end

  # Raised when a job is created without a printer name
  class MissingPrinterNameError < StandardError; end
  # Raised when inserting a new command to a already closed job.
  class EndedElementError       < StandardError; end
end

require 'job'
require 'label'
require 'elements/element'
require 'elements/graphic'
require 'elements/barcode'
require 'elements/datamatrix'
require 'elements/bitmapped_text'
require 'elements/lines_and_boxes'
require 'elements/line'
require 'elements/box'
