# Mounty-Hall Monte Carlo Simulation ![MATLAB](https://img.shields.io/badge/MATLAB-all%20versions-orange.svg)

<p align="center"><img width=60% src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Monty-MiddleCarSwitch.svg/266px-Monty-MiddleCarSwitch.svg.png"></p>

## Basic Problem Overview

This is the basic definition of the [Mounty Hall problem](https://en.wikipedia.org/wiki/Monty_Hall_problem):

> Suppose you're on a game show, and you're given the choice of three doors: Behind one door is a car; behind the others, goats. You pick a door, say No. 1, and the host, who knows what's behind the doors, opens another door, say No. 3, which has a goat. He then says to you, "Do you want to pick door No. 2?" Is it to your advantage to switch your choice?

## How it works

Here, the [Mounty Hall problem](https://en.wikipedia.org/wiki/Monty_Hall_problem) is solved by [Monte Carlo simulation](https://en.wikipedia.org/wiki/Monte_Carlo_method), the code eventually calculates the probabilities of winning by either holding on to original choice, or altering choice. If you're new to the Mounty Hall problem, see [this link](https://betterexplained.com/articles/understanding-the-monty-hall-problem/) for more information. This code can also calculate the problem with any given number of doors and any number of opened doors by the host, as illustrated in the examples in the previous link.

In this approach, the game is played countless times and the history of whether the original choice or the alternate choice were correct is recorded. In the end, the numbers are used to calculate probabilities of winning in both cases. Since every game is simulated with random choices and answers, we'd expect to get a near valid result.

## Running the tests

MATLAB is required in order to run the scripts, works with all versions of MATLAB.

### The Basic Mounty Hall Game

If you want to run the default game (3 doors, 1 uncovered by the host), simply run the script:

```
sample_play
```

You may adjust the number of total Monte Carlo iterations in the script. More iterations means better accuracy, but will take longer to finish simulation. 

Ideally, the results should be like this:

```
probability of winning with the first choice: %33.30
probability of winning by altering choice: %66.70
```

This means that if the player changes his choice after the host opens another door, he'll have twice the chance to win.

### Try new things

You can also run the [100 door example](https://betterexplained.com/articles/understanding-the-monty-hall-problem/) in order to get a better understanding of how it works, you'll need to modify the following parameters in the sample script:

```
n_door = 100; % 100 doors in total
n_doors_uncovered = 98; 
```

You'll get results similar to this which should add up to 100% :

```
probability of winning with the first choice: %1.00
probability of winning by altering choice: %99.00
```

Enjoy.


## License

This project is licensed under the [MIT License](LICENSE.md) - Author: [**Abdolreza Taheri**](https://www.researchgate.net/profile/Abdolreza_Taheri)
