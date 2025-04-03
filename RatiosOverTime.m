% Called by FinalProject_NM_031217.m to create a figure that shows the
% change in isotope ratios over the course of the analysis (isotope ratio vs. plane
% number).The plot shows error bars that represent 2 standard deviations of the isotope ratio.
%
% USAGE:
%       figh = RatiosOverTime( isotoperatioz, isotope )
%
% INPUTS:
%       isotoperatioz      Data structure with the ROI isotope ratios for each plane. The
%                          structure should have the same number of columns and rows
%                          as the depth raw data output from Look@NanoSIMS
%       isotope            1 = oxygen, 2 = carbon, 3 = nitrogen
%
% OUTPUTS:
%       figh               Figure handle of resulting figure.
%       
% Created by Nicolette Meyer on 03 December 2017


function [figh] = RatiosOverTime( isotoperatioz, isotope )
%Getting the dimensions of the input array
[nrow ncol] = size(isotoperatioz); %The dimension of the major isotope array should be the same

%Removing the columns of errors from the array
isotoperatioz2 = isotoperatioz(:, (2:2:ncol));

%Making a table of the mean and SDs of the isotope ratios for each plane
SummaryRatiosz = zeros(nrow,3);
SummaryRatiosz(:,1) = isotoperatioz(:, 1);

for plane = 1:nrow
    SummaryRatiosz(plane,2) = mean(isotoperatioz2(plane,:));
    SummaryRatiosz(plane,3) = 2.*std(isotoperatioz2(plane,:));
end

%Making a line plot of the change in isotope ratios vs. plane (time)
minorlabel = ["18O", "13C", "15N"];
figh = figure(gcf);
    hold on;
    errorbar(SummaryRatiosz(:,1), SummaryRatiosz(:,2), SummaryRatiosz(:,3)), 'black';
    %The plot has error bars that represent 2SD of the Poisson Error
    plot(SummaryRatiosz(:,1), SummaryRatiosz(:,2));
    xlabel('Plane');
    ylabel(sprintf('%s atom percent (+-2SD)', minorlabel(isotope)));
    hold off;
end

