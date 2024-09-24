This is the MATLAB code for the fitting of ligand-induced dimerization.

Usage:

The data is stored in the "experimental_data.csv". It contains 5 columns.
-First column is the inhibitor concentration "Ilist". 
-Second column is the experimental %activity of 15nM enzyme "Vexp15". 
-Third column is its standard deviation "dV15". 
-Fourth Second column is the experimental %activity of 60nM enzyme "Vexp60".
-Fifth column is its standard deviation "dV60". 

To fit the data, you can type in "main_fit('experimental_data.csv')" in the command window of MARLAB. It should out put a CSV file of the fitted parameters and a PNG file for the plot.
