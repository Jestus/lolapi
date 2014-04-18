class Summoner
  include Mongoid::Document
  require 'sightstone'
  field :name, type: String
  field :sumid, type: Integer
  field :level, type: Integer

  def self.grabInfo(summoner_name)
    if(summoner_name.present?)
  	 sightstone = Sightstone::Sightstone.new('2227afef-7b9f-4199-b9ba-676df0e4c675', 'na')

  	 begin
  	 	summoner = sightstone.summoner.summoner(summoner_name) #get the summoner by its name OR id
  	 rescue Exception => e
  	 	return nil
  	 end

     if Summoner.first != nil
       Summoner.first.destroy
     end

     unless Summoner.where(sumid: summoner.id).exists?
      Summoner.create!(name: summoner.name, sumid: summoner.id, level: summoner.level)
    end
   end
  end

end
