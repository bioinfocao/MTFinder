# MTFinder
It has been shown that only a few key or master transcription factors (MTFs) are required to establish or change a cell’s identity. Recent studies have revealed that MTFs have unique expression and epigenetics features comparing with regular transcription factors.  

MTFinder intergrate transcriptome and epigenome data of a query tissue/cell and rank all transcription factors based on following scores: 1) Expression  level of TFs; 2) Tissue specificity score, we used an entropy-based Jensen-Shannon divergence to measure the tissue specificity of TFs; 3) Super-enhancers regulatory activity of TFs' promoters; 4) Super-enhancers motif enrichment score of TFs.  

Requirements:  
  MTFinder require multiple python packages (including Pandas, Numpy, Scipy, pymc, etc) to run. The recommend way is using anaconda to setup an environment for MTFinder:  
  conda create --name MTFinder  
  conda activate MTFinder  
If full anaconda (https://www.anaconda.com/) has been installed, simply install pymc and pytensor with pip or conda or mamba:  
  pip install pymc pytensor

Input:  
  Input for MTFinder is a dataframe that have transcription factors as rows and 4 feature scores as columns.  
  Gene	EXP_score	JSD_score	SERA_score	MotifES_score  
  TF-1		   
  TF-2   
  ...   
  TF-n   
   
  EXP_score and JSD_score can be generated with helper_Transcriptome_EXP_JSD_scores.ipynb based on the query tissue/cell's transcriptome data.   
  SERA_score and MotifES_score can be generated with helper_Epigenome_SERA_MotifES_scores.ipynb based on the query tissue/cell's epigenome data.   

Output:    
  Rank of all transcription factors for their possibility to be master/key transcription factor of the query tissue/cell.
