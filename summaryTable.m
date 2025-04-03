% Called by FinalProject_NM_031217.m to make a summary table showing the
% mean, standard deviation and Poisson Error of the ROI isotope ratios
%
% USAGE:
%       summary = summaryTable(data, isotope)
%
% INPUTS:
%       data        Data structure with the ROI mean isotope ratios. The
%                   structure should have the same number of columns and rows
%                   as the raw data output from Look@NanoSIMS
%       isotope     1 = oxygen, 2 = carbon, 3 = nitrogen
%
% OUTPUTS:
%       summary     Summary table of the isotope ratios' means, standard
%                   deviation and mean Poisson Error
%       
% Created by Nicolette Meyer on 03 December 2017


function summary = summaryTable( data, isotope )
summary = zeros(1,4); %Pre-allocation
summary(1,1) = mean(data(:,4)); %Mean ROI isotope ratio
summary(1,2) = std(data(:,4)); %Std ROI isotope ratio
summary(1,3) = mean(data(:,5)); %Mean of the Poiss_Ei
summary(1,4) = mean(data(:,6)); %Mean of the Poiss_%Ei
end