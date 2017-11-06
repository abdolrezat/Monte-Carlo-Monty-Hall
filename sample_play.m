%Runs a sample of the default Mounty Hall game, using monte carlo method to find the
%probabilities
Total = 1e5; % Number of total simulations in the monte carlo method
n_door = 3; % 3 doors total
n_doors_uncovered = 1; 

%pre allocation
Original = 0; 
Alternative = 0;
tic %start timer
for i=1:Total
    %run the game
    G = Game(n_door, n_doors_uncovered); 
    % NOTE: recreating instances of Game is redundant, I know.
    % However, the point of this simulation is not code execution efficiency but a
    % more realistic approach to the Monte Carlo solving method
    [original_choice, alternate_choice] = G.Run();
    
    %collect results (whether the original choice was correct or the
    %alternate choice
    if (original_choice)
        Original = Original + 1;
    elseif (alternate_choice)
        Alternative = Alternative + 1;
    end
    
end
%calculate probabilities
Original_success = Original/Total * 100;
Alternative_success = Alternative/Total * 100;

fprintf('Simulation done in %g seconds\n',toc) %time the simulation
fprintf('probability of winning with the first choice: %%%.2f\n',Original_success) 
fprintf('probability of winning by altering choice: %%%.2f\n',Alternative_success) 