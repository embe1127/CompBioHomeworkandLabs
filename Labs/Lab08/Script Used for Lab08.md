
# Script Used for Lab08
## Documentation & Metadata
### Part 1: Write a function for the logarithmic growth model
1. Retrieve code for the logarithmic growth equation, which contains:
	* parameters
		* intrinsic rate
		* carrying capacity
		* initial population
		* time sequence, which is 1: number of generations
	* a preallocation variable to hold the results that is filled with as many zeroes as there are points in the time sequence
	* a for-loop that runs iteratively through the equation
	* a plot that demonstrates population abundance over time, or generations
2. Assign this code to the new function LogGrowthModel 
	* FIRST, arguments that are within the function: 
		* r, intrinsic rate
		* K, carrying capacity
		* gen, number of generations
		* initpop, initial population, or population at time/ generation 1
	* SECOND, define arguments and the preallocation variable
	* THIRDLY, include the **for-loop** to calculate population abundance
	* FOURTH, include a **plot** function such that a plot of population abundance and time
	* FIFTH, return a **cbind** function that outputs two columns as long as there are generations
3.  This function is used and the data from it is saved in a CSV file in the corresponding lab folder (Lab08).

