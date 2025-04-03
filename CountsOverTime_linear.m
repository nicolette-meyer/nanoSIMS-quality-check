% Called by FinalProject_NM_031217.m to create a figure that shows the
% sum of the counts/s over the course of the analysis (sum ROI counts/s vs. plane
% number). The y axis scale is linear.
%
% USAGE:
%       figh = CountsOverTime_linear( majorisotope, minorisotope, isotope )
%
% INPUTS:
%       major isotope      Data structure with the ROI counts/s for each
%                          plane for the major isotope. The structure
%                          should have the same number of columns and rows
%                          as the depth raw data output from Look@NanoSIMS
%       minor isotope      Data structure with the ROI counts/s for each
%                          plane for the minor isotope. The structure
%                          should have the same number of columns and rows
%                          as the depth raw data output from Look@NanoSIMS
%       isotope            1 = oxygen, 2 = carbon, 3 = nitrogen
%
% OUTPUTS:
%       figh               Figure handle of resulting figure.
%       
% Created by Nicolette Meyer on 03 December 2017



function figh = CountsOverTime_linear( majorisotope, minorisotope, isotope )
%Getting the dimensions of the minorisotope array
[nrow ncol] = size(minorisotope); %The dimension of the major isotope array should be the same

%Minor Isotope
%Removing the columns of errors from the minorisotope array
minorisotope2 = minorisotope(:, (2:2:ncol));

%Making a table of the sum of the counts/s for each plane
SumMinorCounts = zeros(nrow,1);

for plane = 1:nrow
    SumMinorCounts(plane,1) = sum(minorisotope2(plane,:));
end


%Major Isotope
%Removing the columns of errors from the majorisotope array
majorisotope2 = majorisotope(:, (2:2:ncol));

%Making a table of the sum of the counts/s for each plane
SumMajorCounts = zeros(nrow,1);

for plane = 1:nrow
    SumMajorCounts(plane,1) = sum(majorisotope2(plane,:));
end


%Making a figure of the change in sum(counts/s) vs. plane
minorlabel = ["18O", "12C13C", "12C15N"];
majorlabel = ["16O", "12C2", "12C14N"];

%Linear scale
figh = figure(gcf);
   plot(SumMajorCounts);
   hold on;
   plot(SumMinorCounts);
   legend(majorlabel(isotope),minorlabel(isotope));
   xlabel('Planes');
   ylabel('Sum of ROI Counts/s');
   grid on;
   hold off;
end

