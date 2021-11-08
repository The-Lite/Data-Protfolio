import scrapy
import json
import time
class PlayerState(scrapy.Spider):
    name = 'playerState'
    # The start_ursl var contains the api link with a key and value 
    # competitive is the key and the value is an intiger that point to the next packet of data
    start_urls = ['https://api.tracker.gg/api/v2/valorant/standard/matches/riot/LGD%20Lite%23LGD?type=competitive&next=0']
    id_url=0 # incliment play the role of the key 

    def parse(self, response): 
        # load the data using json function 
        # get the all the matches, the matches variable is an array 
        # for each element in the arry we load the following data in the item
        data=json.loads(response.body) 
        matches=data['data']['matches']
        for match in matches:
            item={
                'Date':match['metadata']['timestamp'],
                'Map Name':match['metadata']['mapName'],
                'Match Result':match['metadata']['result'],
                'Agent Name':match['segments'][0]['metadata']['agentName'],
                'kills':match['segments'][0]['stats']['kills']['value'],
                'headshots':match['segments'][0]['stats']['headshots']['value'],
                'deaths':match['segments'][0]['stats']['deaths']['value'],
                'assists':match['segments'][0]['stats']['assists']['value'],
                'damage':match['segments'][0]['stats']['damage']['value'],
                'damageReceived':match['segments'][0]['stats']['damageReceived']['value'],
                'plants':match['segments'][0]['stats']['plants']['value'],
                'defuses':match['segments'][0]['stats']['defuses']['value'],
                'firstBloods':match['segments'][0]['stats']['firstBloods']['value'],
                'kdRatio':match['segments'][0]['stats']['kdRatio']['value'],
                'placement':match['segments'][0]['stats']['placement']['value'],
                'rank':match['segments'][0]['stats']['rank']['metadata']['tierName'],    
                 }
            # the use of time sleep helps the machine to not get banned from the server. many query  at the time could risk the computer for not accessing 
            # the server again
            time.sleep(1)     
            yield item
        self.id_url=self.id_url+1     
        time.sleep(5)
        # I am using my profile wish means I know how much key does the api has in my account so the max value is 10
        # I loop trhow this 10 keys and excract each data from it
        if(self.id_url<=10):
            next_page='https://api.tracker.gg/api/v2/valorant/standard/matches/riot/LGD%20Lite%23LGD?type=competitive&next='+str(self.id_url)
            next_page=response.urljoin(next_page)
            yield scrapy.Request(next_page,callback=self.parse,dont_filter=True)
      

 
