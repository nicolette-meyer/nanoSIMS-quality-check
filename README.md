Nano Secondary Ion Mass Spectrometer is a powerful analytical technique, that provides nanoscale maps of elemental and isotopic composition. It combines high resolution, sensitivity and spatial resolution to simultaneously detect 7 masses from a small sample volume (Guerquin- Kern et al., 2005). In microcosm experiments in environmental microbiology, the addition of substrates containing an isotope label (e.g., 13C, 15N, 18O, 2H, 34S, etc.) can be used to track the anabolic activity of Archaea and Bacteria (Dekas and Orphan, 2011). Furthermore, nanoSIMS measurements can be combined with microscopy using fluorescence in situ hybridization (FISH) to link phylogeny with activity. During FISH, cells fluoresce if binding of specific oligonucleotide probes to regions of the 16S rRNA subunit of the ribosome occurs (Pernthaler et al., 2002). Thus, a subset of cells that are first optically imaged using epifluorescent microscopy, and subsequently targeted with the nanoSIMS, can be used to correlate 16S rRNA phylogenetic identity with the anabolic uptake of certain substrates. In environmental microbiology, the combination of these two techniques has led to the discovery of e.g., anaerobic methane oxidizers in consortia with sulfate reducers at methane seeps (Orphan et al., 2001), the sharing of fixed nitrogen products by diazotrophic cyanobacteria to their symbionts (Behrens et al., 2008), and the detection of nitrogen fixation in marine sediments (Dekas et al., 2009).

However, it has been shown that the FISH process causes a decrease in the ratio of the minor to major isotope (13C/12C, 15N/14N) due to the introduction of unlabeled chemicals and the loss of labelled biomass (Musat et al., 2014; Woebken et al., 2015). This will cause an underestimation of the anabolic rates calculated from nanoSIMS data. Thus, I aim to expand on the existing data by quantifying the decrease in the 13C/12C, 15N/14N and 18O/16O isotope label during FISH for Methanosarcina acetivorans (Archaea, methanogen found in diverse environments), Sulfolobus acidocaldarius (Archaea, thermophile from hotsprings), and Pseudomonas aeruginosa (Bacteria, found in diverse environments). The test data used in this assignment was obtained from FISH- treated M. acetivorans cells incubated in labelled minimal media containing 50 at-% 13C, 50 at-% 15N and 5 at-% 18O.

Due to the high hourly cost of running the nanoSIMS, rapid data processing during the analysis is essential to aid decision-making and maximize time efficiency on the instrument. The Dekas lab has begun to use Look@NanoSIMS to process nanoSIMS raw data. Look@NanoSIMS is a free software, distributed as a Matlab code, that converts .im raw data files to data tables and figure outputs (Polerecky et al., 2012). However, the default generated outputs are insufficient for our purposes. Thus, I have written a matlab script (FinalProject_NM_031217.m) that processes the raw data, and generates a table and a figure output for each element (carbon, nitrogen and oxygen) with 5 subplots (Figure 1). The figures summarize data from one acquisition area represented by a single .im file. The test data used contains 50 ROIs of M. acetivorans cells, analyzed over 29 planes, with the raw data tables (.dac and .dat files) from Look@NanoSIMS provided with the submission. All code has been written for this assignment and has not been borrowed or inherited.


#####
References

Behrens, S., Lösekann, T., Pett-Ridge, J., Weber, P.K., Ng, W.O., Stevenson, B.S., Hutcheon, I.D., Relman, D.A.
and Spormann, A.M., 2008. Linking microbial phylogeny to metabolic activity at the single-cell level by using
enhanced element labeling-catalyzed reporter deposition fluorescence in situ hybridization (EL-FISH) and
NanoSIMS. Applied and environmental microbiology, 74(10), pp.3143-3150.

Dekas, A.E., Poretsky, R.S. and Orphan, V.J., 2009. Deep-sea archaea fix and share nitrogen in methane-consuming
microbial consortia. Science, 326(5951), pp.422-426.

Dekas, A.E. and Orphan, V.J., 2011. Identification of diazotrophic microorganisms in marine sediment via
fluorescence in situ hybridization coupled to nanoscale secondary ion mass spectrometry (FISH-
NanoSIMS). Methods Enzymol, 486, pp.281-305.

Guerquin-Kern, J.L., Wu, T.D., Quintana, C. and Croisy, A., 2005. Progress in analytical imaging of the cell by
dynamic secondary ion mass spectrometry (SIMS microscopy). Biochimica et Biophysica Acta (BBA)-General
Subjects, 1724(3), pp.228-238.

Musat, N., Stryhanyuk, H., Bombach, P., Adrian, L., Audinot, J.N. and Richnow, H.H., 2014. The effect of FISH
and CARD-FISH on the isotopic composition of 13 C-and 15 N-labeled Pseudomonas putida cells measured by
nanoSIMS. Systematic and applied microbiology, 37(4), pp.267-276.

Orphan, V.J., House, C.H., Hinrichs, K.U., McKeegan, K.D. and DeLong, E.F., 2001. Methane-consuming archaea
revealed by directly coupled isotopic and phylogenetic analysis. science, 293(5529), pp.484-487.

Pernthaler, A., Pernthaler, J. and Amann, R., 2002. Fluorescence in situ hybridization and catalyzed reporter
deposition for the identification of marine bacteria. Applied and Environmental Microbiology, 68(6), pp.3094-3101.

Polerecky, L., Adam, B., Milucka, J., Musat, N., Vagner, T. and Kuypers, M.M., 2012. Look@ NanoSIMS–a tool
for the analysis of nanoSIMS data in environmental microbiology. Environmental microbiology, 14(4), pp.1009-
1023.

Woebken, D., Burow, L.C., Behnam, F., Mayali, X., Schintlmeister, A., Fleming, E.D., Prufert-Bebout, L., Singer,
S.W., Cortés, A.L., Hoehler, T.M. and Pett-Ridge, J., 2015. Revisiting N2 fixation in Guerrero Negro intertidal
microbial mats with a functional single-cell approach. The ISME journal, 9(2), pp.485-496.
