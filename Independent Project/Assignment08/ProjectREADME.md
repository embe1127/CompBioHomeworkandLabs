
# The impact of trophy hunting on hyena (*Crocuta crocuta*) behavior: an analysis of how individuals may utilize an unpredictable anthropogenic resource differently
## Introduction
The impact of humans on the environment and wildlife is undeniable in its magnitude, however, we are still working to understand which human behaviors are impactful. Hunting, or the killing of animals for sport and/or sustenance, has a clear [impact] on the population of animals being killed, however researchers are still working to determine how hunting of one species, or group of species, may have rippling community and ecosystem level impacts. 

[Cozzi et al.] (2015) investigated how the carcasses of African elephants, *Loxodonta africana*, impacted the behavior of free ranging spotted hyenas, *Crocuta crocuta*, using both camera traps and GPS collar data.  They found that the presence of carcasses from sport hunting did in fact change behaviors: hyenas were more highly clustered and slower. Additionally, the authors estimated that these carcasses account for a whopping 8-10% of a hyenas yearly diet. Food budget is not the only thing impacted by the carcasses. The high level of spatial clustering was also found to be impactful on a social level, with an increase in carcasses potentially related to an increase in social clan size. This reveals an underlying need to understand how these carcasses impact hyenas, as they may impact life histories and serve as a predictive measure of group size. 

Using the [data] from this research, I hope to delve further in to how unpredictable leftovers from hunting may impact an African social carnivore. My question is whether there was both within and among individual variation in carcass usage that would suggest that animals with different personalities may be utilizing anthropogenic resources differently. 

## The Data
### Goals of the Original Study
This study was one of the first to investigate how hunting indirectly impacted non-target wildlife species, and the primary goal was to assess changes (or lack thereof) in movement and feeding behavior of spotted hyenas in the Okavango Delta of Botswana. 
### Methods
#### Study Site: 
1,000 km<sup>2</sup> of the Okavango Delta, Botswana that included a game reserve and Wildlife Management Areas. The local hyena population is 14-15 individuals per 100 km <sup> 2 </sup>.
#### GPS Data
Twelve individuals were immobilized and fitted with GPS radio collars. 
#### Elephant Carcass Data
Professional hunters informed researchers of when and where elephants were brought down. There were few carcasses that were from natural causes. 
#### Camera Trap Data
Once elephant carcasses were located, camera traps were set up to watch the carcasses between sundown and sunrise. Individual hyenas were identified based on coat pattern. 

### Type of Data
Hyena GPS locations were recorded in a csv file with 40,034 lines, 40,033 of those lines being data.  Locations were organized based off of the individual hyenas. Collar ID, date, time, longitude, and latitude were recorded. 

Elephant carcass data is located in a csv file as well. It is 24 lines of data long, and comprises of: date, cause of death, whether or not it had been burned, and longitude and latitude. 

There are potential discrepancies among these two files, the largest of which (to me) is the format of the date and time that varies between the two. It should also be noted that I will have to check the hyena locations file to make sure that all the numeric entries are consistently entered.   

## My Analyses
1. **Housekeeping**: Ensure that there is no within variation of formatting, and alter variables (like date and time) so that they are consistent between files. 
2. **Concatenate**: Create one datafile with locations and dates/times of carcasses *and* locations and dates/times of hyenas. 
3. **Differentiate**: Determine how many distinct individuals are present in the data set. 
4. **Locate**: Find out how many times the GPS data for hyenas puts them at a carcass
5. **Represent**: Create plots to show location budget of hyenas to visually represent how individuals spent time at carcasses. Additionally, create plots to show variation (if it exists) among individual hyenas.  

## References 
- Loveridge, A. J., Searle, A. W., Murindagomo, F., & Macdonald, D. W. (2007). The impact of sport-hunting on the population dynamics of an African lion population in a protected area. _Biological Conservation_, _134_(4), 548-558.
- Cozzi G, Börger L, Hutter P, Abegg D, Beran C, McNutt JW, Ozgul A (2015) Effects of trophy hunting leftovers on the ranging behaviour of large carnivores: a case study on spotted hyenas. PLOS ONE 10(3): e0121471. [https://doi.org/10.1371/journal.pone.0121471](https://doi.org/10.1371/journal.pone.0121471)
- Cozzi G, Börger L, Hutter P, Abegg D, Beran C, McNutt JW, Ozgul A (2015) Data from: Effects of trophy hunting leftovers on the ranging behaviour of large carnivores: a case study on spotted hyenas. Dryad Digital Repository. [https://doi.org/10.5061/dryad.78kn3](https://doi.org/10.5061/dryad.78kn3)


[impact]: [https://www.sciencedirect.com/science/article/abs/pii/S0006320706003843](https://www.sciencedirect.com/science/article/abs/pii/S0006320706003843)

[Cozzi et al.]:
[https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0121471](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0121471)

[data]:
[https://datadryad.org/resource/doi:10.5061/dryad.78kn3](https://datadryad.org/resource/doi:10.5061/dryad.78kn3)
