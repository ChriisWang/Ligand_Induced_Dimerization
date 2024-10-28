This is the MATLAB code for the fitting of ligand-induced dimerization.

Usage:

The data is stored in the "example_data.csv". It contains 5 columns.
-First column is the inhibitor concentration "Ilist". 
-Second column is the experimental %activity of 15nM enzyme "Vexp1". 
-Third column is its standard deviation "dV1". 
-Fourth Second column is the experimental %activity of 60nM enzyme "Vexp2".
-Fifth column is its standard deviation "dV2". 

To fit the data, you can type in "main_fit('example_data.csv')" in the command window of MARLAB. It should out put a CSV file of the fitted parameters and a PNG file for the plot.

Note: It is recommended to measure the dose-response curves at 2 enzyme concentrations where LID is prominent in both concentrations. You should define the concentration of the enzyme in the main_fit function.