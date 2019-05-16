<*Show a list of all farmers and their locations. (GPS coordinates, village, district, country)
In order to accomplish this task, I wrote a set of nested inner joins, and the query is as follows
*>
SELECT farmer.farmerName, farmer.positionx, farmer.positiony, farmer.postionz, district.districtNumber, district.name, subnationalzone.zoneNumber, subnationalzone.name, village.villageNumber, village.name, country.countryCode, country.name
FROM country INNER JOIN (((subnationalzone INNER JOIN district ON (subnationalzone.countryCode = district.countryCode) AND (subnationalzone.zoneNumber = district.zoneNumber)) INNER JOIN village ON (district.countryCode = village.countryCode) AND (district.zoneNumber = village.zoneNumber) AND (district.districtNumber = village.districtNumer)) INNER JOIN farmer ON (village.countryCode = farmer.countryCode) AND (village.zoneNumber = farmer.zoneNumber) AND (village.districtNumer = farmer.districtNumber) AND (village.villageNumber = farmer.villageNumber)) ON (farmer.countryCode = country.countryCode) AND (country.countryCode = subnationalzone.countryCode);
<*Show a list of all farmers keeping layers chicken brood. In addition, show the age of the brood and the number of chickens on the brood
For my case, I identified chicken broods by using brood type field letters A, B, C.
Therefore instead of layers chicken brood I wrote the query using Type A broods for instance.*>
SELECT farmer.farmerName, brood.noOfChickens, brood.DateBought, brood.DateSold, brood.broodType
FROM farmer INNER JOIN brood ON farmer.farmerID = brood.farmerID
WHERE (((brood.broodType)="A"));
<Show a list of all diseases which have affected the chickens from 1 particular country and the months when the disease was recorded and how many chickens died from each outbreak*>
SELECT disease.diseaseName, diseaseoutbreak.outBreakID, diseaseoutbreak.noOfDeadChickens, country.name
FROM country, disease INNER JOIN diseaseoutbreak ON disease.diseaseID = diseaseoutbreak.diseaseID
WHERE (((country.name)="Ethiopia"));
