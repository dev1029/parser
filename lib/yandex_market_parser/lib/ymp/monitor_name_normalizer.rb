module Ymp
  class MonitorNameNormalizer
    def normalize(name)
      normilized_name = case name
      when /Acer/i
        name.match(/Acer(.+?)ms/i).to_s.gsub(/\d+ms/, '')
      when /Benq/i
        name.match(/Benq(.+?)\s/i).to_s
      when /LG/i
        name.match(/LG(.+?)-/i).to_s.gsub('-', '')
      when /NEC/i
        name.match(/NEC(.+?)\s/i).to_s
      when /Samsung/i
        name.match(/Samsung(.+?)\s?\(/i).to_s.gsub('(', '')
      when /ViewSonic/i
        name.match(/ViewSonic(.+?)(,|$)/i).to_s.gsub(',', '')
      else
        name.strip
      end

      normilized_name.strip
    end
  end
end
