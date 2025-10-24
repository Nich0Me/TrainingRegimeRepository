# TrainingRegimeRepository
MATLAB code and data for the paper “Impact of Task Similarity and Training Regimes on Cognitive Transfer and Interference.” Includes behavioral analyses comparing blocked and interleaved learning across same and different task structures with figures.


This folder contains MATLAB scripts for analyzing behavioral performance from a study investigating learning and generalization across same and different task structures under two training regimes: blocked and interleaved.

# Contents

BothTest_Blocked.mat – Behavioral data from the blocked group, testing phase.
BothTest_Interleaved.mat – Behavioral data from the interleaved group, testing phase.
Training_Blocked.mat – Behavioral data from the blocked group, training phase.
Training_Interleaved.mat – Behavioral data from the interleaved group, training phase.
Training_Plot.m – Main script that reproduces all  figures of the training phase.
Testing_Plot.m - Main script that reproduces all  figures of the testing phase.

# Overview
The script computes and visualizes:

- General performance differences between blocked and interleaved learning groups.
- Accuracy for same vs. different structures within each training condition.
- Effects of training order (e.g., spatial first vs. conceptual first sessions).
- Separate analyses for old (previously trained) and new (novel) configurations.


# Requirements
MATLAB
The .mat data files must be located in the same directory as the script.

# Output
The script produces several figures summarizing behavioral accuracy across:

- Training conditions (blocked vs. interleaved).
- Structure type (same vs. different).
- Stimulus novelty (old vs. new).
