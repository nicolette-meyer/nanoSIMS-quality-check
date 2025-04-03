% Called by FinalProject_NM_031217.m to make a summary table showing the
% mean ROI isotope ratios
%
% USAGE:
%       figh = ROI_boxplot(data, isotope)
%
% INPUTS:
%       data        A double array of dimension (number of ROI's)*(number of elements analysed = 3)
%                   containing all the ROI means
%       isotope     1 = oxygen, 2 = carbon, 3 = nitrogen
%
% OUTPUTS:
%       figh         Figure handle of resulting figure.
%       
% Created by Nicolette Meyer on 02 December 2017


function figh = ROI_boxplot(data, isotope)
minorlabel = ["18O", "13C", "15N"];
elementlabel = ["Oxygen", "Carbon", "Nitrogen"];
figh = figure(gcf);
    boxplot(data);
    xlabel('All ROIs');
    ylabel(sprintf('%s (atom percent)', minorlabel(isotope)));
end

