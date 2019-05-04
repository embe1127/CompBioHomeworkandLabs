# Spotted Hyena (*Crocuta crocuta*) Interaction with a Novel Anthropogenic Food Source in the Okavango Delta, Botswana

## My Question:

- Is there individual variation in hyenas' locations near a non-predictable anthropogenic resource (trophy hunting elephant carcasses)?
-  Are females found in the carcass zone (defined here as the area surrounding a carcass, about 10 m or .0001 longitudinal and latitudinal units) more often?
-  Which of the hyena individuals was in carcass zones most often?
- Which of the carcasses received the most visits to its carcass zone? 

## Biological Context
Spotted hyenas, *Crocuta crocuta*, are large social carnivores that range across the open savannah of Sub-Saharan Africa in packs that can be anywhere from 10 to 90 individuals [2]. Though historically these animals were believed to be primarily scavengers [1], it appears that many observations of hyenas lying in wait as lions (*Panthera leo*) consumed a kill may have in fact been a case of bad PR: hyenas are highly competent solitary and group hunters of big game such as zebra, *Equus quagga*; Topi, *Damaliscus korrigum*; and wildebeest, *Connochaetes*; and it has been demonstrated that lions actually scavenge off of hyenas' kills with some frequency [1,3-4]. Thus, researchers are coming to understand these animals as capable, bone-crushing predators. 

In addition to their hunting abilities, hyenas are also highly intelligent-- studies have shown that they are both innovative problem solvers [5], and socially adept cooperators [6]. Due to these traits, one might hypothesize that as the scope of human activity increases and habitats are altered, hyenas may be especially suited to surviving in a changing landscape. One such example of this is in the case of trophy hunting-- in which African elephants (*Loxodonta africana*), hunted both legally and illegally, are killed and their carcasses are left behind in lieu of trophies such as ivory or skulls [7].  These unpredictable, anthropogenic food sources have been shown to alter behavior of hyenas[7], and may serve as a launching pad for understanding how human activities may indirectly impact large, free ranging carnivores in a wider context. 

## Methods
### Source Data
This analysis utilized [data](https://datadryad.org/resource/doi:10.5061/dryad.78kn3) from Cozzi et al. (2015), which consisted of camera trap data, hyena locational data, and locational data for elephant carcasses (both natural and shot). The camera trap data was compiled via Cuddeback camera traps set up at five of the elephant carcasses. A sample photograph is shown in Fig 1. 

![enter image description here](https://lh3.googleusercontent.com/RwcVudgaxFo0xXepLkgw9zZ5xU6v7_FJOYt0gItGmjBxB3mPMjjjrC8zTPW65QM2j1T4MscESVg "Fig 1.")
![Hyenas gathered around an elephant carcass at night.](https://picasaweb.google.com/110232003716498184469/6687023313467056561#6687023312631279570 "Fig 1 ")

Location data for 15 hyenas was available via GPS collar coordinates, and location data for elephant carcasses was based off of word of mouth from professional hunters.

Then, GPS data, hyena ID, date, time, longitude, and latitude were compiled into one csv approximately 40,000 rows long. The elephant data was also compiled into a csv file, along with cause of death, whether or not it had been burned, and longitude and latitude. This csv was much shorter, at 24 rows. It is important to note that the instances in which the hyenas were at carcasses was not noted in either file. 

Cozzi et al. (2015) used this data to investigate spatial and feeding behavior of the hyenas. With both the camera trap data and the data from the GPS collars, the authors were able to examine behavior at the carcasses and assess how likely it was that a hyena would visit a carcass via a generalized linear mixed model. The authors also looked at ranging behavior using the GPS collars, with the locations being used as a measure of scatter or clustering.  It was determined that carcasses in an individual's territory were more likely to be visited by that individual, and that the number of individuals at a carcass at night decreased over time. It was also determined that in terms of ranging behavior, there was a significant change in scatter and speed: animals were more clustered and more slow. 

### My Methods
My goal with this dataset was to be able to identify which of the hyenas visited carcasses, and which carcasses they visited. In order to do this, I had to find matches in the locational data of the elephant carcasses and the locational data of the hyenas' GPS collars. In order to do so, first I created a new data frame of elephant locational data with only the carcasses that were shot, to avoid including natural deaths in my analysis. 

Then, I constructed a for loop to run through both the hyena and elephant data frames to find "matches". I decided that a match meant that a hyena was relatively close to an elephant carcass, and that the longitudinal and latitudinal data would not have to match precisely for this to be the case. I determined that when longitude and latitude are in decimal form, at that spot on the earth, a change in either parameter of .0001 or less translates to around 10 m or less. This was a slightly arbitrary designation, but I chose 10 m because at that distance, an animal would have a high probability of interacting with the carcass. The for loop created an output of a new data frame, one in which each individual had a count for how many times they were in the carcass zone for each carcass. I used this output for the base of my data visualization. 

I created several bar graphs to convey the variance among individuals in terms of carcass visits, in terms of gendered differences in carcass visits, and also to demonstrate the differing levels of attention each carcass got. I created a pie chart to show which of the hyenas used carcasses heavily, and which individuals did not.  

## Results and Conclusion
I found that within the larger hyena data frame, there were 15 unique entries for HyenaID, which told me that there were 15 individuals' GPS collar data included. Of those individuals, I assumed 4 of them were female based on the name (Athena, Ginger, Tori, and Vera); and that the remaining 11 (Ale, Apollo, Bumble, Ceres, Fizz, Fly, Gin, Nike, Poseidon, Sonny, and Xini) were male. It is very possible that I miscategorized some of the individuals as male when they should have been female, as some of the names were sexually ambiguous.

When the individuals' carcass visits were all graphed together, there was certainly evidence of variability (Fig 2).

![A bar graph of all the collared individuals' carcass zone tallies demonstrates variation among the individuals. Some, like Nike and Fly, had nearly two average visits, whereas other individuals, like Ale or Athena, did not have any tallies for being in the carcass zone. ](https://lh3.googleusercontent.com/gto33uhywV9XgNnfCR_Nzgj9ft_UvPGjNqYHOEclwv_ufvX2fFr49_qotX_AVacZx8fboY27ntg "Fig 2.")

There are clearly three individuals that stand out in terms of time spent in the carcass zone, and standard error bars indicate that there may be a statistically significant difference between some individuals: for example, it is highly probable that Fly's average number of times in the zone is significantly different than that of nearly all of the other individuals aside from Apollo or Nike. This is also evident in Fig 3.  It could also be the case that more collared individuals were at the carcasses, or in the carcass zones, than were documented in the GPS data, due to the timing of GPS location recordings. 

![A pie chart depicting how often hyenas were in the carcass zone. Only hyenas with above zero values are shown here. ](https://lh3.googleusercontent.com/cohChWaLp7NRUgPdfy-kVFraAAJvBMyE3e_-CghtSEzZRXS0p8GQu5Uie1_jEi32LkMLOGyk0VA "Fig 3.")

When I looked at the difference between sexes in average number of times a hyena was in the carcass zone, there is evidence for a significant difference between male and female, with males (potentially) visiting the carcasses significantly more often than females (Fig 3). This is interesting because I would have expected the more socially dominant females would have increased innovative problem solving skills and cooperative abilities in order to lead packs that might have allowed them to quickly capitalize on a rich and ready food source.  One possible explanation is that mis-sexing individuals has heavily skewed my data; or, it is possible that females were not collared as often as males; or, maybe if females are already strong hunters, there is no need to take advantage of "free" food. 
![Females had a tally of less than .2 average locations in the carcass zone, while males were over double that at an average of .4 times in the carcass zone. Standard error bars indicate strong potential for statistical significance. ](https://lh3.googleusercontent.com/UAOscxmii2w4_TMAabNgDgdBbu7PcM7PYK6H4tkP7IMz4iY0sq2mYbA9X8wOrzci1AIGjtCTPt4 "Fig 4.")


There was also variation in which carcasses were visited, although it seems to offer less support for statistical significance than previous graphs (Fig 5). It is possible that if these carcasses did not fall within the territories of the hyenas collared, then there may not be any documented visits.

![Variation in hyena presence within the carcass zone by carcass.](https://lh3.googleusercontent.com/d_pSE_KxpZRuktitCF92YUnylVbrr1LlW6x3TYFnxbeT7CmVra2Oa_BxR3fjnEH-xi2qlpDwIGQ "Fig 5.")

In conclusion, I was able to determine that there was a probably significant level of variation in carcass visits among hyena individuals, which could possibly relate to differing personalities, or may just be a case of an animal being in the right place at the right time to utilize unpredictable anthropogenic carcasses. I also found that males were in the carcass zone more often than females, and three individuals-- Nike, Apollo, and Fly-- had the highest number of average carcass visits.  Lastly, although it is arbitrary because there isn't any real significance associated with carcass ID, the most visited carcass was carcass 19. 

## Acknowledgments
I am deeply grateful to Dr. Sam Flaxman for his guidance, without which I probably would still be monkeying around with lines of code. I also acknowledge, once again, that the data collection and more complete statistical analysis was all done by Cozzi et al. (2015). 
## References
 1. Freedman, B. (2014). Hyena. In K. L. Lerner & B. W. 		   Lerner (Eds.), _The Gale Encyclopedia of Science_ (5th ed.). 		Farmington Hills, MI: Gale. Retrieved from http://link.galegroup.com.colorado.idm.oclc.org/apps/doc/CV2644031161/SUIC u=coloboulder&sid=SUIC&xid=0eaed54c
 2. Kruuk, H. (1972). _The spotted hyena: a study of predation and social behavior_ (No. Sirsi) a102104).
 3.  Holekamp, K. E., Smale, L., Berg, R., & Cooper, S. M. (1997). Hunting rates and hunting success in the spotted hyena (*Crocuta crocuta*). _Journal of Zoology,_ _242_(1), 1-15. doi:10.1111/j.1469-7998.1997.tb02925.x
 4. Périquet, S., Fritz, H., & Revilla, E. (2015). The lion king and the hyaena queen: Large carnivore interactions and coexistence. _Biological Reviews,_ _90_(4), 1197-1214. doi:10.1111/brv.12152
 5. Benson-Amram, S., & Holekamp, K. E. (2012). Innovative problem solving by wild spotted hyenas. _Proceedings: Biological Sciences,_ _279_(1744), 4087-4095. doi:10.1098/rspb.2012.1450
 6. Holekamp, K. E., Sakai, S. T., & Lundrigan, B. L. (2007). Social intelligence in the spotted hyena (crocuta crocuta). _Philosophical Transactions of the Royal Society B: Biological Sciences,_ _362_(1480), 523-538. doi:10.1098/rstb.2006.1993
 7. Cozzi, G., Börger, L., Hutter, P., Abegg, D., Beran, C., McNutt, J.W., Ozgul, A. (2015) Effect of trophy hunting leftovers on the ranging behavior of large carnivores: a case study on spotted hyenas. *PLoS One*, *10*(13): e0121471. doi: 10.1371/journal.pone.0121471](https://doi.org/10.1371/journal.pone.0121471) 
 8.  Watts, H. E., Tanner, J. B., Lundrigan, B. L., & Holekamp, K. E. (2009). Post-weaning maternal effects and the evolution of female dominance in the spotted hyena. _Proceedings of the Royal Society B: Biological Sciences,_ _276_(1665), 2291-2298. doi:10.1098/rspb.2009.0268

