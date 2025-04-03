%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%Final Project%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Processing real time nanoSIMS data%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%By: Nicolette Meyer
%December 2017

%This script will help process nanoSIMS data .dac and .dat file
%outputs from Look@NanoSIMS. It processes data from 1 acquisition area.
%It is to be used for 16O, 18O, 12C2, 12C13C, 12C14N and 12C15N data.
%All the .dac .dat files required are found in the 'dat' folder. This
%script is to be used for highly enriched samples, as the outputs are in
%atom-% instead of delta ratios.

%Data files required:
%'16O.dac'
%'16O-z.dat'
%'18O.dac'
%'18O-z.dat'
%'(18O-(16O+18O))-100.dac'
%'(18O-(16O+18O))-100-z.dat'
%'12C2.dac'
%'12C2-z.dat'
%'12C13C.dac'
%'12C13C-z.dat'
%'(12C13C-(12C2-2+12C13C))-100.dac'
%'(12C13C-(12C2-2+12C13C))-100-z.dat'
%'12C14N.dac'
%'12C14N-z.dat'
%'12C15N.dac'
%'12C15N-z.dat'
%'(12C15N-(12C14N+12C15N))-100.dac'
%'(12C15N-(12C14N+12C15N))-100-z.dat'

%Figure output (1 figure each for oxygen, carbon and nitrogen)
%1. Boxplot showing the spread of isotope ratios for all the ROIs
%2. Change in mean ROI Poisson Error with increasing plane numbers. To be used
%to determine the minimum planes required to optimize Poisson
%Error to acquisition time
%3. Sum of all the ROI's counts/s for the major and minor isotope with
%different plane numbers
%4. Sum of all the ROI's counts/s for the major and minor isotope with
%different plane numbers on a log plot
%5. The mean ROI isotope ratios with different plane numbers. To be used to
%determine if there is a change in isotope ratios over the analysis period

%------------------------------------------------------------------
%Loading the data into separate variables
%Oxygen data
majorO = importdata('16O.dac'); %Mean counts/s of 16O data for each ROI
majorOz = importdata('16O-z.dat'); %Counts/s of 16O data for each ROI and for each plane
minorO = importdata('18O.dac'); %Mean counts/s of 18O data for each ROI
minorOz = importdata('18O-z.dat'); %Counts/s of 18O data for each ROI and for each plane
ORatio = importdata('(18O-(16O+18O))-100.dac'); %Mean 18O atom percent data for each ROI
ORatioz = importdata('(18O-(16O+18O))-100-z.dat'); %Mean 18O atom percent data for each ROI and each plane

%Carbon data
majorC = importdata('12C2.dac');
majorCz = importdata('12C2-z.dat');
minorC = importdata('12C13C.dac');
minorCz = importdata('12C13C-z.dat');
CRatio = importdata('(12C13C-(12C2-2+12C13C))-100.dac');
CRatioz = importdata('(12C13C-(12C2-2+12C13C))-100-z.dat');

%Nitrogen data
majorN = importdata('12C14N.dac');
majorNz = importdata('12C14N-z.dat');
minorN = importdata('12C15N.dac');
minorNz = importdata('12C15N-z.dat');
NRatio = importdata('(12C15N-(12C14N+12C15N))-100.dac');
NRatioz = importdata('(12C15N-(12C14N+12C15N))-100-z.dat');


%------------------------------------------------------------------
%concatenating data into single structures
%Variable of all the mean 18O, 13C and 15N isotope ratios for all the ROIs
ROImeanAllData = [ORatio.data(:,4), CRatio.data(:,4), NRatio.data(:,4)];
AllMinorzData = {minorOz.data, minorCz.data, minorNz.data};
AllMajorzData = {majorOz.data, majorCz.data, majorNz.data};
AllIsotopezData = {ORatioz.data, CRatioz.data, NRatioz.data};
AllIsotopeData = {ORatio.data, CRatio.data, NRatio.data};

%Pre-assigning the summary table
SummaryOfResults = zeros(3,4);

%A for loop to create subplots for oxygen, carbon and nitrogen data
%on 3 different figures
for index = 1:3 %index where 1 = oxygen, 2 = carbon, and 3 = nitrogen
    figure(index);
        set(gcf, 'Position', [1000, 1000, 1000, 1000]); %increasing the size of the figure generated

        %1. Box plot of all the ROIs isotope ratios
        subplot(3,2,1);
            ROI_boxplot(ROImeanAllData(:,index), index); %function made for this assignment, called 'ROI_boxplot.m'

        %2. Line plot showing the change in Poisson error over time
        subplot(3,2,2);
            PoissonError( AllMinorzData{1,index}, index); %function made for this assignment, called 'PoissonError.m'

        %3. and 4. Two line plots showing the change in counts/s over to course of the analysis
        subplot(3,2,3);
            CountsOverTime_linear( AllMajorzData{1,index}, AllMinorzData{1,index}, index ); %function made for this assignment, called 'CountsOverTime_linear.m'
        subplot(3,2,4);
            CountsOverTime_log( AllMajorzData{1,index}, AllMinorzData{1,index}, index ); %function made for this assignment, called 'CountsOverTime_log.m'

        %5. Line plot showing the change in the isotope ratios over to course of the analysis
        subplot(3,2,5);
            RatiosOverTime( AllIsotopezData{1,index}, index ); %function made for this assignment, called 'RatiosOverTime_linear.m'

    %Summary table
    row = summaryTable(AllIsotopeData{1,index}, index );
    SummaryOfResults(index,:) = row;
end %end of for loop

%Converting the summary table into a table with headers
isotope = [1;2;3];
SummaryOfResults = [isotope, SummaryOfResults];
SummaryOfResults = num2cell(SummaryOfResults);
header = {'1=O,2=C,3=N','Mean_ROI_Isotope-Ratio','Std_ROI_Isotope_Ratio','Mean_ROI_Poiss_Ei', 'Mean_ROI_Poiss_%Ei'};
SummaryOfResults = [header; SummaryOfResults]