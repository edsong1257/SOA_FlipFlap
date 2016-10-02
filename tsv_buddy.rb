# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  attr_accessor :data
  require 'yaml'
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format

  def take_tsv(tsv)
    @data = []
    keyarr = []
    arr = tsv.split("\n")
    keyarr = arr[0].split("\t")
    arr.shift
    arr.each do |line|
    val = line.split("\t")
    temphash = Hash[keyarr.zip val]
    @data << temphash
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    column_name = @data[0].keys
    tsv_string = column_name.join("\t") + "\n"
    @data.each_index do |index|
      records = data[index]
      values = records.map { |_key, value| value }.join("\t")
      tsv_string.concat(values + "\n")
    end
    tsv_string
  end
end
