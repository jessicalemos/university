import numpy as np
import matplotlib.pyplot as plt
from grid import negative_grid

GAMMA = 0.9
ALPHA = 0.1
all_actions = ('R','L','U','D')

def epsilon_greedy(action, epsilon=0.1):
    if np.random.rand() < 1 - epsilon:
        act = action
    else:
        act = np.random.choice(all_actions)
    return act

#inicialize Q
def init_q(grid):
    Q = {}
    for state in grid.all_states():
        Q[state] = {}
        for action in all_actions:
            Q[state][action] = 0
    return Q

#return max from Q that is a dictionary
def max_q(dic):
	max_key = None
	max_val = float('-inf')
	for k, v in dic.items():
		if v > max_val:
			max_val = v
			max_key = k
	return max_key, max_val

def show_values(rewards, grid):
    for x in range(0, grid.width):
        print('-------------------------------------')
        out = '| '
        for y in range(0, grid.height):
            out += str(rewards.get((x, y),0)).ljust(6) + ' | '
        print(out)
    print('-------------------------------------')

if __name__ == '__main__':
    grid = negative_grid(cost=-0.1)
    show_values(grid.rewards, grid)

    #initialize
    Q = init_q(grid)

    #save the number of times that Q[state] has been updated
    update_counts_sa = {}
    for state in grid.all_states():
        update_counts_sa[state] = {}
        for action in all_actions:
            update_counts_sa[state][action] = 1.0

    #make this until it converge
    t = 1.0
    deltas = []
    for iteration in range(10000):
        if iteration % 100 == 0:
            t += 1e-2

        #let's start!
        state = (2, 0)
        grid.set_state(state)
        action, _ = max_q(Q[state])
        delta = 0  # track updates
        while not grid.game_over():
            action = epsilon_greedy(action, epsilon=0.5/t)
            #move
            reward = grid.move(action)
            #next state
            next_state = grid.get_state()

            # adaptive learning rate
            alpha = ALPHA / update_counts_sa[state][action]
            update_counts_sa[state][action] += 0.005

            #old Q
            old_q = Q[state][action]
            #use max of Q for update
            next_action, next_max_q = max_q(Q[next_state])
            #estimate Q
            Q[state][action] = Q[state][action] + alpha*(reward + GAMMA*next_max_q - Q[state][action])
            delta = max(delta, np.abs(old_q-Q[state][action]))

            #next state is now the current state
            state = next_state
            action = next_action

        deltas.append(delta)

    plt.plot(deltas)
    plt.show()