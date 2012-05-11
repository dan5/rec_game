module ResultsHelper
  def rowspans_table(rows, colum_name)
    rowspans = []
    pre = nil
    skip_ct = 0
    rows.each_with_index do |result, i|
      if skip_ct > 0
        skip_ct -= 1
        next
      end
      if !pre.blank? and pre == result.send(colum_name)
        n = 0
        rows[i - 1, 20].each {|e| e.send(colum_name) == pre ? n += 1 : break }
        rowspans[i - 1] = n + 1
        skip_ct = n - 1
      else
        rowspans[i] = 1
        pre = result.send(colum_name)
      end
    end
    rowspans
  end
end
