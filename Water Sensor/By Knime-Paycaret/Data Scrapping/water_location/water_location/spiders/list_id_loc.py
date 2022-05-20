import pandas as pd


data_=pd.read_csv(r'H:\Project\Programing\Data\BI\By Knime\Staging Area\Data_Collection\Results\Locations ID.csv')
data=list(data_['sample.samplingPoint.notation'].tail(1))
print(data)