classdef ExplorationQuadTree < handle
    % Efficiently stores the explored areas of the map.
    
    properties
        tree; % the actual tree datastructure
        width;
        levels; % how deep the tree goes
    end
    
    methods
        function obj = ExplorationQuadTree(width, levels)
            obj.tree = ExploredQuad([0;0], width, 0, levels);
            obj.width = width;
            obj.levels = levels;
        end
        
        % given a position, this returns a quadrant number path.
        function [path] = position2Path(obj, pos, level)
            path = ones(1, level);
            
            center = [0;0];
            currentWidth = obj.width;
            for idx = (1:level)
                delta = pos-center;
                q = vec2Quadrant(delta);
                path(idx) = q;
                %TODO
                error('not ready')
            end
        end
        
        
    end
end

