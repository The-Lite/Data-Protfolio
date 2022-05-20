
import scrapy
import pandas as pd

class Location(scrapy.Spider):
    name='locations'
    start_urls=['https://environment.data.gov.uk/water-quality/view/sampling-point/']

    def parse(self,response):
        data_=pd.read_csv(r'H:\Project\Programing\Data\BI\By Knime\Staging Area\Data_Collection\Results\Locations ID.csv')
        data=list(data_['sample.samplingPoint.notation'])

        
        for id in data:
            link='https://environment.data.gov.uk/water-quality/view/sampling-point/'
            link=link+str(id)
            print(link)
            yield response.follow(link,callback=self.parse_Location)
        yield
    def parse_Location(self,response):
        ID=response.xpath("/html/body/main/div/div/div[1]/div[1]/table/tbody/tr[2]/td/text()").get()
        Area=response.xpath("/html/body/main/div/div/div[1]/div[1]/table/tbody/tr[6]/td/text()").get()
        Sub_Area=response.xpath("/html/body/main/div/div/div[1]/div[1]/table/tbody/tr[7]/td/text()").get()
        lat=response.xpath("/html/body/main/div/div/div[1]/div[1]/table/tbody/tr[5]/td").get().strip().split('<br>')[1].split('</td>')[0].split(',')[0].split(':')[1]
        long=response.xpath("/html/body/main/div/div/div[1]/div[1]/table/tbody/tr[5]/td").get().strip().split('<br>')[1].split('</td>')[0].split(',')[1]
        Type=response.xpath("/html/body/main/div/div/div[1]/div[1]/table/tbody/tr[3]/td/text()").get()
        item={
            'ID':ID,
            'Area':Area,
            'Sub Area': Sub_Area,
            'lat':lat,
            'long':long,
            'Type':Type
        }
       
        yield item
