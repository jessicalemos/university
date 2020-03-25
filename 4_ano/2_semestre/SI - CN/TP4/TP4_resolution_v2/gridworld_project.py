# %%
import numpy as np
import matplotlib.pyplot as plt

# rewards per state per action (order: up, down, left, right)
# rewards = wall (0) | -1 (move) | -10 (avoid position) | 100 (goal)
'''
Matrix RF (Rewards representation)
Note: each movement provides a -1 reward
---------------------
| S  |-10 | X  | X  |
---------------------
| X  | X  |-10 |+100|
---------------------
| X  | X  | X  | X  |
---------------------
| X  | X  | X  | X  |
---------------------
'''
'''
---------------------
| X  | X  | X  |+100|
---------------------
| X  | W  | X  |-10 |
---------------------
| S  | X  | X  | X  |
---------------------
'''

Goal_reward = 100
Penalizer_reward = -10
Penalizer_movement = -1
Wall_reward = 0
Start_Position = 0
End_Position = 7

reward = np.array([[Wall_reward, Penalizer_movement, Wall_reward, Penalizer_reward],                    # position (0,0) - State 0
                   [Wall_reward, Penalizer_movement, Penalizer_movement, Penalizer_movement],           # position (0,1) - State 1
                   [Wall_reward, Penalizer_reward, Penalizer_reward, Penalizer_movement],               # position (0,2) - State 2
                   [Wall_reward, Goal_reward, Penalizer_movement, Wall_reward],                         # position (0,3) - State 3
                   
                   [Penalizer_movement, Penalizer_movement, Wall_reward, Penalizer_movement],           # position (1,0) - State 4
                   [Penalizer_reward, Penalizer_movement, Penalizer_movement, Penalizer_reward],        # position (1,1) - State 5
                   [Penalizer_movement, Penalizer_movement, Penalizer_movement, Penalizer_movement],    # position (1,2) - State 6
                   [Penalizer_movement, Penalizer_movement, Penalizer_reward, Goal_reward],             # position (1,3) - State 7
                   
                   [Penalizer_movement, Penalizer_movement, Wall_reward, Penalizer_movement],           # position (2,0) - State 8
                   [Penalizer_movement, Penalizer_movement, Penalizer_movement, Penalizer_movement],    # position (2,1) - State 9
                   [Penalizer_reward, Penalizer_movement, Penalizer_movement, Penalizer_movement],      # position (2,2) - State 10
                   [Goal_reward, Penalizer_movement, Penalizer_movement, Wall_reward],                  # position (2,3) - State 11
                   
                   [Penalizer_movement, Wall_reward, Wall_reward, Penalizer_movement],                  # position (3,0) - State 12
                   [Penalizer_movement, Wall_reward, Penalizer_movement, Penalizer_movement],           # position (3,1) - State 13
                   [Penalizer_movement, Wall_reward, Penalizer_movement, Penalizer_movement],           # position (3,2) - State 14
                   [Penalizer_movement, Wall_reward, Penalizer_movement, Wall_reward]])                 # position (3,3) - State 15

# n_s defines the position/state of the agent after doing an action (i.e. order: up, down, left, right)
# example: position (0,0) / State 0 - [-1 (no-position when going up), 4 (position 4 when going down), -1 (no-position when going left), 1 (position 1 when going right)]

'''
Matrix RF (States representation)
---------------------
| 0  | 1  | 2  | 3  |
---------------------
| 4  | 5  | 6  | 7  |
---------------------
| 8  | 9  | 10 | 11 |
---------------------
| 12 | 13 | 14 | 15 |
---------------------
'''

n_s = np.array([[-1,4,-1,1],  # position (0,0) - State 0
               [-1,5,0,2],    # position (1,0) - State 1
               [-1,6,1,3],    # position (2,0) - State 2
               [-1,7,2,-1],   # position (3,0) - State 3
                
               [0,8,-1,5],      # position (1,0) - State 4
               [1,9,4,6],       # position (1,1) - State 5
               [2,10,5,7],      # position (1,2) - State 6
               [3,11,6,-1],     # position (1,3) - State 7
                
               [4,12,-1,9],     # position (2,0) - State 8
               [5,13,8,10],     # position (2,1) - State 9
               [6,14,9,11],     # position (2,2) - State 10
               [7,15,10,-1],    # position (2,3) - State 11
                
               [8,-1,-1,13],        # position (3,0) - State 12
               [9,-1,12,14],        # position (3,1) - State 13
               [10,-1,13,15],       # position (3,2) - State 14
               [11,-1,14,-1]])      # position (3,3) - State 15

# available actions per state / position
# actions = up (0) | down (1) | left (2) | right (3)

'''
Actions acording to the Environment Matrix (States representation)
---------------------
| 0  | 1  | 2  | 3  |
---------------------
| 4  | 5  | 6  | 7  |
---------------------
| 8  | 9  | 10 | 11 |
---------------------
| 12 | 13 | 14 | 15 |
---------------------
'''
UP = 0
DOWN = 1
LEFT = 2
RIGHT = 3

action = np.array([[DOWN,RIGHT],            # position (0,0) - State 0
                  [DOWN, LEFT, RIGHT],      # position (0,1) - State 1
                  [DOWN, LEFT, RIGHT],      # position (0,2) - State 2
                  [DOWN, LEFT],             # position (0,3) - State 3
                   
                  [UP,DOWN,RIGHT],          # position (1,0) - State 4
                   [UP,DOWN,LEFT,RIGHT],    # position (1,1) - State 5
                   [UP,DOWN,LEFT,RIGHT],    # position (1,2) - State 6
                   [UP,DOWN,LEFT],          # position (1,3) - State 7
                   
                   [UP,DOWN,RIGHT],         # position (2,0) - State 8
                   [UP,DOWN,LEFT,RIGHT],    # position (2,1) - State 9
                   [UP,DOWN,LEFT,RIGHT],    # position (2,2) - State 10
                   [UP,DOWN,LEFT],          # position (2,3) - State 11
                   
                   [UP,RIGHT],              # position (3,0) - State 12
                   [UP,LEFT,RIGHT],         # position (3,1) - State 13
                   [UP,LEFT,RIGHT],         # position (3,2) - State 14
                   [UP,LEFT]])              # position (3,3) - State 15


def find_convergence_episode(rewards_list, buffer_size=3):
    import numpy as np
    from numpy_ringbuffer import RingBuffer

    convergence_buffer = RingBuffer(capacity=buffer_size)
    res = -1
    for index, reward_value in enumerate(rewards_list):
        convergence_buffer.append(reward_value)
        if (len(np.unique(convergence_buffer)) == 1 and len(convergence_buffer) == 3):
            res = index-1
            return res

    return res

# %%
# Gamma: a value between [0-1] that controls the discount reward of future decisions
# learning_rate: Rate of learning process
# max_n_episodes: Maximum number of episodes
# log: print results or not
def Q_learning_gridworld(start_state = 0, end_state = 1, Gamma=0.7, learning_rate = 0.7, max_n_episodes = 20, log = 1):
    # Q-learning Algorithm
    '''
    initiate Q matrix.
    Loop (Episodes):
    Choose an initial state (s)
    while (goal):
            Choose an action (a) with the maximum Q value
            Determine the next State (s')
            Find total reward -> Immediate Reward + Discounted Reward (Max(Q[s'][a]))
            Update Q matrix
            s <- s'
    new episode
    '''
    import numpy as np

    Q = np.zeros((16,4))    # initialize Q-Matrix (start with 0s)
    next_state = -1          # Variable representing the next state / position of the Agent
    episode = 1             # Number of current episode
    path = []               # List with Agent's Decisions / Path taken

    # Values to return
    rewards_list = []       # List of rewards per episode
    paths_list = []         # List of paths per episode
    n_actions_list = []     # List of number of actions per episode
    
    print('----------------------------------')
    print('Starting Q-Learning Model Training')

    # plays maximum of n_episodes
    for _ in range(max_n_episodes):
        # Initialize variables
        episode_reward = 0                  # Episode current reward
        current_state = start_state         # Start State / Position of Agent
        path = []                           # Path taken

        while(current_state != end_state): # Run Agent until goal is met (when receives reward of +100)
            
            # Decision Making Policy
            Qx = -999 # init to -999 in order to determine max. Q value
            # Determine next action based on: available actions in position and exploitation policy (i.e., greedy policy)
            # get best current_state Q-value
            for i in action[current_state]:
                if Q[current_state][i] > Qx:
                    act = i                     # save action
                    Qx = Q[current_state][i]    # save its Q-value
            
            # Save next_state position
            next_state = n_s[current_state][act]
            
            # Adquire Q-values from possible actions in next state and select the maximum value
            next_values = []
            for i in action[next_state]:
                next_values.append(Q[next_state][i])
            max_Q_value = max(next_values)
            
            # episode_reward is applied to determine how the algorithm varies its learning process (if episode_reward decreases: model is converging)
            # Calculate episode reward = Current_reward + Discounted Reward [reward_of_action_taken + (discount_factor x max_q_value - Q_value_of_action_taken_in_current_position)]
            
            #episode_reward = episode_reward + reward[current_state][act] + Gamma * max_Q_value - Q[current_state][act]
            episode_reward = episode_reward + reward[current_state][act]

            # Update Q_Value_current_state_and_action_taken = Q_Value_current_state_and_action_taken + Discounted Reward [reward_of_action_taken + (discount_factor x max_q_value - Q_value_of_action_taken_in_current_position)]
            Q[current_state][act] = Q[current_state][act] + learning_rate * (reward[current_state][act] + Gamma * max_Q_value - Q[current_state][act])
            
            # Save current position in Path list and update current_state
            path.append(current_state)
            current_state = next_state

        path.append(current_state)
        if log == 1:
            print("Episode ",episode," Reward ", episode_reward)
            print("Path ", path)
        episode = episode + 1

        # Append results of each episode to further analysis
        rewards_list.append(episode_reward)
        paths_list.append(path)
        n_actions_list.append(len(path))

    if log == 1:
        print("The Final Q-Matrix is: \n", np.divide(Q, np.amax(Q)))

    print('Q-Learning Model Training Complete!')
    return paths_list, rewards_list, n_actions_list


# %%
# Epsilon: value between [0-1] - Larger Epsilon: more random exploration / less exploitation; Smaller Epsilon: less random exploration / more exploitation;
# Gamma: a value between [0-1] that controls the discount reward of future decisions
# learning_rate: Rate of learning process
# max_n_episodes: Maximum number of episodes
# log: print results or not

def SARSA_gridworld(start_state = 0, end_state = 1, Epsilon=0.3, Gamma=0.7, learning_rate = 0.7, max_n_episodes = 20, Epsilon_degradation = 0.03, log = 1):
    # SARSA Algorithm
    '''
    initiate Q matrix
    Loop (Episodes):
    choose an initial state (s)
    while (goal):
            Take an action (a) and get next state (s')
            Get a' from s'
            Total Reward -> Immediate reward + Gamma * next Q value - current Q value
            Update Q
            s <- s' a <- a'
    '''
    import numpy as np
    import random

    Q = np.zeros((16,4))        # initialize Q-Matrix (start with 0s)
    next_state = start_state    # Variable representing the next state / position of the Agent
    episode = 1                 # Number of current episode
    path = []                   # List with Agent's Decisions / Path taken

    # Values to return
    rewards_list = []       # List of rewards per episode
    paths_list = []         # List of paths per episode
    n_actions_list = []     # List of number of actions per episode

    print('----------------------------------')
    print('Starting SARSA Model Training')

    # plays maximum of n_episodes
    for _ in range(max_n_episodes):
        # Initialize variables
        episode_reward = 0                  # Episode current reward
        current_state = start_state         # Start State / Position of Agent
        path = []                           # Path taken

        # Decision Making Policy
        random_value = random.random()                      # initialize a random_value between [0-1]
        
        if (random_value > Epsilon):                        # If random_value is bigger then epsilon value -> choose action with max Q-value (exploitation)
            Max_reward = [-999, -999, -999, -999]           # init to -999 for all possible actions (in current state) in order to determine max. Q value
            for M in action[current_state]:
                Max_reward[M] = (Q[current_state][M])       # save rewards from all possible actions in current state
            act = np.argmax(Max_reward)                     # get max. reward value from all possible actions
        
        else:                                               # If random_value is smaller or equal then epsilon value -> choose random action (exploration)
            act = random.choice(action[current_state])
        
        while(current_state != end_state): # Run Agent until goal is met (when receives reward of +100)
            
            next_state = n_s[current_state][act]
            
            # Decision Making Policy
            random_value = random.random()                          # initialize a random_value between [0-1]
            
            if (random_value > Epsilon):                            # If random_value is bigger then epsilon value -> choose action with max Q-value (exploitation)
                Max_reward = [-999, -999, -999, -999]               # init to -999 for all possible actions (in current state) in order to determine max. Q value
                for M in action[next_state]:
                    Max_reward[M] = (Q[next_state][M])              # save rewards from all possible actions
                next_act = np.argmax(Max_reward)                    # get max. reward value from all possible actions
        
            else:                                                   # If random_value is smaller or equal then epsilon value -> choose random action (exploration)
                next_act = random.choice(action[next_state])
            
            # Extra: episode_reward is applied to determine how the algorithm varies its learning process (if episode_reward decreases: model is converging)
            # Calculate episode reward = Current_reward + Discounted Reward [reward_of_action_taken + (discount_factor x max_q_value - Q_value_of_action_taken_in_current_position)]
            
            #episode_reward = episode_reward + reward[current_state][act] + Gamma * Q[next_state][next_act] - Q[current_state][act]
            episode_reward = episode_reward + reward[current_state][act]

            # Update Q_Value_current_state_and_action_taken = Q_Value_current_state_and_action_taken +  Discounted Reward [reward_of_action_taken + (discount_factor x max_q_value - Q_value_of_action_taken_in_current_position)]
            Q[current_state][act] = Q[current_state][act] + learning_rate * (reward[current_state][act] + Gamma * Q[next_state][next_act] - Q[current_state][act])
            
            # Update Path taken and current state & action
            path.append(current_state)
            current_state = next_state
            act = next_act

        path.append(current_state)

        if log == 1:
            print("Episode ",episode," Reward ", episode_reward)
            print("Path ", path)
        episode = episode + 1
        
        # Extra: add Epsilon degratation over episodes - less random exploration / more exploitation;
        if Epsilon > 0: Epsilon -= Epsilon_degradation

        # Append results of each episode to further analysis
        rewards_list.append(episode_reward)
        paths_list.append(path)
        n_actions_list.append(len(path))

    if log == 1:
        print(path)
        print("The Final Q-Matrix is: \n", np.divide(Q,np.amax(Q)))

    print('SARSA Model Training Complete!')
    return paths_list, rewards_list, n_actions_list

# %%
# Train both Reinforcement Learning approaches: Q-Learning vs SARSA
MAX_N_EPISODES = 20
LEARNING_RATE = 0.7
GAMMA_DISCOUNT = 0.7
EPSILON = 0.3
EPSILON_DEGRADATION = 0.03
LOG = 0

SARSA_paths_list, SARSA_rewards_list, SARSA_n_actions_list = SARSA_gridworld(start_state=Start_Position, end_state=End_Position, Epsilon=EPSILON, Gamma=GAMMA_DISCOUNT, learning_rate = LEARNING_RATE, max_n_episodes = MAX_N_EPISODES, Epsilon_degradation = EPSILON_DEGRADATION, log = LOG)
Q_learning_paths_list, Q_learning_rewards_list, Q_learning_n_actions_list = Q_learning_gridworld(start_state=Start_Position, end_state=End_Position, Gamma=GAMMA_DISCOUNT, learning_rate = LEARNING_RATE, max_n_episodes = MAX_N_EPISODES, log = LOG)
episodes = list(range(0, MAX_N_EPISODES))
plt.plot(episodes, SARSA_rewards_list, label = "SARSA")
plt.plot(episodes, Q_learning_rewards_list, label = "Q-Learning")
plt.xlabel('Number of episodes') 
plt.ylabel('Rewards') 
plt.show()