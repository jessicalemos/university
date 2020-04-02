import numpy as np
from numpy import inf
np.seterr(divide='ignore', invalid='ignore')

# Given values for the problems
# Distance Matrix between different cities
# Line j defines distances from city i to other cities (sorted by number of city)
d = np.array([[0,10,12,11,14]
          ,[10,0,13,15,8]
          ,[12,13,0,9,14]
          ,[11,15,9,0,16]
          ,[14,8,14,16,0]])

# intialization part
iteration = 10
m = 5 			# number of ants
n = 5		 	# number of cities / nodes
e = .5         	# evaporation rate
alpha = 1     	# pheromone factor
beta = 0.2      	# visibility factor

#calculating the visibility of the next city visibility(i,j)=1/d(i,j)
visibility = 1/d
visibility[visibility == inf] = 0

#intializing pheromone present at the routes to the cities
pheromone = .1 * np.ones((m,n))

#intializing the routes of the ants with size routes(n_ants,n_citys+1) 
#note adding 1 because we want to come back to the source city
routes = np.ones((m,n+1))

# Define Loop cycle for each training iteration
for ite in range(iteration):
    # All ants will start at node 1
    routes[:,0] = 1          #initial starting and ending positon of every ants '1' i.e city '1'

    # Define Loop cycle for each Ant
    for i in range(m):

        temp_visibility = np.array(visibility)         #creating a copy of visibility

        # Define Loop Cycle for each city
        for j in range(n-1):
            #print(routes)
            
            combine_feature = np.zeros(5)     	#intializing combine_feature array to zero
            cum_prob = np.zeros(5)            	#intializing cummulative probability array to zeros
            
            cur_loc = int(routes[i,j]-1)        #current city of the ant
            
            temp_visibility[:,cur_loc] = 0     	#making visibility of the current city as zero
			
            # ROUTE DECISION MAKING - use formulas of ACO presented in slide 15
			# Calculate pheromone and visibility matrices

            #calculating pheromone feature 
            p_feature = np.power(pheromone[cur_loc,:],beta)
            #calculating visibility feature
            v_feature = np.power(temp_visibility[cur_loc,:],alpha)

            p_feature = p_feature[:,np.newaxis]
            v_feature = v_feature[:,np.newaxis] 

            # Calculating the combine feature
            combine_feature = np.multiply(p_feature,v_feature)

            # Sum of all the feature
            total = np.sum(combine_feature) 

            # Finding probability of element probs(i) = combine_feature(i)/total
            probs = combine_feature/total

            # Calculating cummulative sum
            cum_prob = np.cumsum(probs)

            r = np.random.random_sample()   # randon number between [0,1]
            
			# Finding the next city having probability higher then random(r)
            next_city = np.nonzero(cum_prob>r)[0][0]+1
            
            # adding city to route
            routes[i,j+1] = next_city 

        left = list(set([i for i in range(1,n+1)])-set(routes[i,:-2]))[0]   #finding the last untraversed city to route 
        routes[i,-2] = left                   								#adding untraversed city to route

    routes_opt = np.array(routes)           #intializing optimal route
    
    dist_cost = np.zeros((m,1))             #intializing total_distance_of_tour with zero 
    
	# Calculate Distance of each Ant
    for i in range(m):
        
        s = 0
		# Define Loop cycle for each City/Node
        for j in range(n-1):
            
            # Calculating total route distance
            s = s + d[int(routes_opt[i,j])-1, int(routes_opt[i,j+1])-1]

        #store distance of tour for 'i'th ant at location 'i' 
        dist_cost[i] = s

	# find location of minimum dist_cost
    dist_min_loc = np.argmin(dist_cost)
    dist_min_cost = dist_cost[dist_min_loc]

    best_route = routes[dist_min_loc,:]
    pheromone = (1-e)*pheromone
    
    # UPDATE PHEROMONE LEVEL - use formulas of ACO presented in slide 17
    for i in range(m):
        for j in range(n-1):
            # updating the pheromone with delta_distance
            # delta_distance will be more with min_dist i.e adding more weight to that route pheromone
            # ...
            dt = 1 / dist_cost[i]
            pheromone[int(routes_opt[i,j])-1,int(routes_opt[i,j+1])-1] = pheromone[int(routes_opt[i,j])-1,int(routes_opt[i,j+1])-1] + dt
            
# print cost and best route
print('Rota de todas as formigas no final:')
print(routes_opt)
print('Melhor caminho :', best_route)
print('Custo: ', int(dist_min_cost[0]) + d[int(best_route[-2])-1,0])