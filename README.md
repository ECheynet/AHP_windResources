# AHP_windResources
Multicriteria decision analysis for wind resource assessment and environmental impact


# Summary

This repository contains MATLAB code and data files for implementing a Multicriteria Decision Analysis (MCDA) approach to assess wind resource potential and environmental impact, focusing on offshore wind energy planning in the Norwegian Exclusive Economic Zone (EEZ). The code utilizes the Analytic Hierarchy Process (AHP) to integrate various criteria and subcriteria. The code is used for education and research purpose. The code is inspired by the study from Solbrekke and Sorteberg (2024). However, their implementation of the AHP is likely different from mine.

# Content

- **Data**: This folder contains the `.mat` files downloaded for the example, including:
  - `averaged_windData.mat`: A dataset containing averaged wind data for wind resource assessment.
  - `bathymetry.mat`: Bathymetry data used for geographical constraint analysis.
  - `dist2coast.mat`: Data representing distances to the nearest coast.
  - `flag_EEZ.mat`: Flag data indicating points inside or outside the Norwegian EEZ.
  - `protected_areas.mat`: Binary data indicating protected areas for environmental consideration.
  
- **Function**: This folder includes MATLAB functions used in the analysis:
  - `getFinalScore.m`: A function to calculate the final score for wind energy projects using AHP.
  - `printStruct.m`: A utility function to print structured arrays or structures.
  - `normalizeVar.m`: A function to normalize variables to a 0-1 scale for analysis.
  
- **Documentation File**: `Documentation.mlx` provides detailed documentation, including explanations of the code, data files, and their usage.

# Reference

Solbrekke, I. M., & Sorteberg, A. (2024). Norwegian offshore wind power—Spatial planning using multi‐criteria decision analysis. *Wind Energy*, 27(1), 5-32.

This is the first version of the code. Bugs may still be present. Any question or feedback is welcome.
