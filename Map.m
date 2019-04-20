classdef Map
    %stores occupancy grid and exploration status
    
    properties
        occupancyGrid; % an occupancy grid which is the actual map, origin at center.
        mapResolution; % meters per pixel
    end
    
    methods
        function obj = Map(pathToMapImage, resolution)
            img = imread(pathToMapImage);
            % take the first channel and call it the occupancy grid.
            obj.occupancyGrid = (img(:, :, 1)>0)*OccupancyState.OCCUPIED;
            obj.mapResolution = resolution;
        end
        
        % converts [x;y] coordinate to the occupancy grid index
        function [row, col] = position2MapIndex(obj, pos)
            sz = size(obj.occupancyGrid);
            centerIdx = sz/2;
            temp = round(centerIdx' + pos/obj.mapResolution);
            row = temp(1);
            col = temp(2);
        end
        
        % converts row column to coordinate
        function [pos] = mapIndex2Position(obj, row, col)
            sz = size(obj.occupancyGrid);
            centerIdx = sz/2;
            pos = ([row;col] - centerIdx') * obj.mapResolution;
        end
    end
end

