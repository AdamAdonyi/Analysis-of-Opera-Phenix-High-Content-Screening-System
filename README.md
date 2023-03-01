# Analysis of Opera Phenix High Contect Screening System



<img src="https://github.com/AdamAdonyi/Analysis-of-Opera-Phenix-High-Content-Screening-System/blob/main/boxplot_all_timepoint.gif" width="45%" height="45%"/> |
<img src="https://github.com/AdamAdonyi/Analysis-of-Opera-Phenix-High-Content-Screening-System/blob/main/RidgePlot_all_timepoint.gif" width="45%" height="45%"/>



# Experiment

Tumor cells were plated (NCI tumor cell line OR only T cells) into a 96-well plate in presence of a few immun cells (PBMC-derived T cells) (in order to initiate the reaction start) then covered with mixture of Matrigel and Collagen. Additional immune cells (PBMC-derived T cells) were plated onto the top of the Matrigel in presence/lack of different treatment to compare the immune cell activation and cell migration over 9 days.

## Experiment layout

![alt text](https://github.com/AdamAdonyi/Analysis-of-Opera-Phenix-High-Content-Screening-System/blob/main/layout.JPG)


# Analysis

Each timepoint was saved in a separated text file including X, Y, Z position, object ID... Sometimes two timepoints were combined. I loaded, assigned and cleaned the datasets for each timepoint then joined them. After assigning the treatment names to the wells respectively, cleaned the data based on the microscopy QC (deleted wells were the gel was damaged). Afterwards, I investigated the dynamics of the cell migration via visualization. I tried to exclude outliers but because of the default setup, the device do not tract the objects (object 1 is not the same in timepoint one and two) it makes no sense. I defined the "arriving area" as the bottom ~500 µm of the wells to visualize immune cell arrival to compare different treatments (animated ridge plot and box plot). 
The cleaned data was exported focusing on the arrival area and used for further visualization using Tableau.

# Data source
Raw data is not uploaded because it has not published yet
