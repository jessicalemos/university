import numpy as np

class Grid:
    #make grid with the start position of the agent
    def __init__(self, width, height, start):
        self.width = width
        self.height = height
        self.x = start[0]
        self.y = start[1]

    #to update rewards and actions
    def set(self, rewards, actions):
        self.rewards = rewards
        self.actions = actions

    #to update state
    def set_state(self, state):
        self.x = state[0]
        self.y = state[1]

    #we need to know the actual state
    def get_state(self):
        return (self.x, self.y)

    #also need to verify if it is the state is terminal
    def is_terminal(self, state):
        return s not in self.actions

    #verify if the game is over
    def game_over(self):
        return (self.x, self.y) not in self.actions

    #movement of the agent
    def move(self, action):
        if action in self.actions[(self.x, self.y)]:
            if action == 'U':
                self.x -= 1
            elif action == 'D':
                self.x += 1  
            elif action == 'L':
                self.y -= 1  
            elif action == 'R':
                self.y += 1
        return self.rewards.get((self.x, self.y), 0)

    #get all states
    def all_states(self):
        return set(self.actions.keys()) | set(self.rewards.keys())

#standart grid -> randomly moving
def grid():
	grid = Grid(3, 4, (2, 0))
	rewards = {(0, 3): 1, (1, 3): -1}
	actions = {
				(0, 0): ('D', 'R'),
				(0, 1): ('L', 'R'),
				(0, 2): ('L', 'D', 'R'),
				(1, 0): ('U', 'D'),
				(1, 2): ('U', 'D', 'R'),
				(2, 0): ('U', 'R'),
				(2, 1): ('L', 'R'),
				(2, 2): ('L', 'R', 'U'),
				(2, 3): ('L', 'U')
			}
	grid.set(rewards, actions)
	return grid

#grif with penalizations -> depends how much costs to move
def negative_grid(cost=-0.1):
	neg_grid = grid()
	neg_grid.rewards.update({
		(0,0): cost,
		(0,1): cost,
		(0,2): cost,
		(1,0): cost,
		(1,2): cost,
		(2,0): cost,
		(2,1): cost,
		(2,2): cost,
		(2,3): cost
	})
	return neg_grid