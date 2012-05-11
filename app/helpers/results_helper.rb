module ResultsHelper
  def rowspans_table(rows, colum_name)
    rowspans = []
    skip_ct = 0
    rows.each_with_index do |row, i|
      if skip_ct > 0
        skip_ct -= 1
        next
      end
      nxt = if i < rows.size - 1
              rows[i + 1].send(colum_name)
            else
              nil
            end
      if nxt == row.send(colum_name)
        n = 0
        rows[i, 20].each {|e| e.send(colum_name) == nxt ? n += 1 : break }
        rowspans[i] = n
        skip_ct = n - 1
      else
        rowspans[i] = 1
      end
    end
    rowspans
  end
end
