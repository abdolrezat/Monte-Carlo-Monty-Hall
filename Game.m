classdef Game
    %GAME class that plays the game given initial conditions
    %   Run() method -> Returns the results that show if the original
    %   choice was the correct answer or the alternate choice (Alternate choice is the
    %   choice that was remade randomly after unveiling one or some doors)
    
    properties (Access = public)
        n_door % number of doors in the game
        n_doors_uncovered  % number of doors revealed after player chooses i-th door(s)
        i_choice % index of the chosen door by player
        i_answer % index of the door that contains the price
        i_alternate % alternate choice
    end
    
    methods
        function obj = Game(n_door, n_doors_uncovered)
            if(nargin < 2)
                warning('not enough inputs, using default values: 3 doors, one uncovered')
                n_door = 3;
                n_doors_uncovered = 1;
            end
            obj.n_door = n_door;
            obj.n_doors_uncovered = n_doors_uncovered;
            %the line of code below is optional, but slows down the process
            %significantly if used ...
            %          rng shuffle;
            %choose randomly the player's pick and the real answer
            obj.i_answer = ceil(rand()*obj.n_door);
            obj.i_choice = ceil(rand()*obj.n_door);
        end
        
        function [original_choice, alternate_choice] = Run(obj)
            N = zeros(1, obj.n_door);
            N(obj.i_choice) = 1;
            %indexes that are not answer nor choice
            q = find(N == 0);
            q_ref = q( q ~= obj.i_answer );
            
            % obsolete version
            %choose randomly to reveal
            %             unveil = 1:obj.n_doors_uncovered;
            %             while(true ) %avoid repetitive doors
            %                 unveil = ceil(rand(1, obj.n_doors_uncovered)*length(q_ref));
            %                 if( length(unique(unveil)) == length(unveil) )
            %                     break
            %                 end
            %             end
            
            % modern version
            % this is where gameshow host unveils a random door that he
            % knows is not the answer (and not the player's choice)
            unveil = randperm(length(q_ref), obj.n_doors_uncovered);
            
            %execute the rest of the game, choose an alternate choice from
            %the remaining set of doors
            doors_remaining = setdiff(q, q_ref(unveil));
            obj.i_alternate = doors_remaining(ceil(rand()*length(doors_remaining)));
            [original_choice, alternate_choice] = results(obj);
            
        end
        
        function [original_choice, alternate_choice] = results(obj)
            if( obj.i_choice == obj.i_answer)
                original_choice = 1;
            else
                original_choice = 0;
            end
            
            if( obj.i_alternate == obj.i_answer)
                alternate_choice = 1;
            else
                alternate_choice = 0;
            end
            
        end
    end
    
end

