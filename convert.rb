require "csv"
require 'digest'

INPUT_CSV_DIR = 'data.csv'
OUTPUT_CSV_DIR = 'convert.csv'
IGNORE_TYPE = '00000000-0000-0000-0000-000000000000'

csv_data = CSV.read(INPUT_CSV_DIR)

CSV.open(OUTPUT_CSV_DIR, 'w') do |out|
    CSV.foreach(INPUT_CSV_DIR) do |data|
        row0 = (data[0].nil? || data[0] == IGNORE_TYPE) ? '' : Digest::MD5.hexdigest(data[0])
        row1 = (data[1].nil? || data[1] == IGNORE_TYPE) ? '' : Digest::MD5.hexdigest(data[1])
        if row0 != '' || row1 != ''
            results = [row0, row1]
            out << results
            p results
        end
    end
end
