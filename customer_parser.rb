require 'csv'

# GOAL
# 1. Sort the data by count for the top 10 reasons
# 2. Display the count for the reasons

# PSUEDOCODE
# take in each line of the csv
  # if the reason does not exist, create a data structure with the reason and the count of it's occurance
  # if the reason does exist, increase it's count in the data structure

# Notes and questions:
# I will assume every second column of a file contains the 'reason' 	
# is sort_by lossy?
# invert a hash in ruby is lossy 


module ReasonCount 
  def self.get_top_reasons_from_csv(filename)
    reasons = {}
    CSV.foreach("customerio_sample_data.csv", headers: true, header_converters: :symbol) do |row|

      if row[1] != nil
        if reasons.has_key?([row[1]])
          reasons[[row[1]]] += 1
        else 
          reasons[[row[1]]] = 1
        end
      end

    end 
      puts "Top 10 reasons: "     
      sorted = reasons.sort_by {|k,v| -v}[0..9]

      # To print neatly:
      count = 1
      sorted.each do |ar|
        puts "#{count}. #{ar[0][0]}"
        puts "occurrs #{ar[1]} times"
        count +=1
      end

  end
end

ReasonCount.get_top_reasons_from_csv("customerio_sample_data.csv")

