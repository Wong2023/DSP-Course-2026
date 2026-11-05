# Audio Processing & Classification Assignment

## Selected Option
**Option A — Compare sound classifiers**

## Project Overview
This project presents an end-to-end audio processing and classification pipeline executed in Google Colab. The primary goal is to evaluate traditional hand-crafted features against deep pre-trained neural network embeddings for environmental sound classification.

## Dataset & Audio Files
- **Dataset Source:** Supplied course audio package (`DATA/manifest.csv`).
- **Audio Classes:** 4 distinct environmental categories (`clock_tick`, `crackling_fire`, `dog`, `rain`).
- **Data Partitions:** Strict, leak-free partition splits into `train` (60%), `validation` (20%), and `test` (20%) sets.

## Feature Representations & Classifiers
1. **MFCC + SVM:** 
   - 20 Mel-Frequency Cepstral Coefficients extracted per frame, aggregated via mean and standard deviation (40-dimensional feature vector).
   - Classified using a Support Vector Machine with an RBF kernel (`C=1`, `class_weight='balanced'`).
2. **YAMNet + Logistic Regression:**
   - 1024-dimensional deep audio embeddings extracted using the pre-trained YAMNet model.
   - Classified using a Logistic Regression classifier (`max_iter=1000`).

## How to Run
1. Open `analysis.ipynb` in Google Colab or your local Jupyter environment.
2. Ensure all required Python dependencies are installed (`librosa`, `scipy`, `scikit-learn`, `noisereduce`, `whisper`, `torchaudio`).
3. Execute all notebook cells sequentially from top to bottom.

## Main Results & Findings
- **Pipeline Performance:** The YAMNet embedding pipeline achieved higher classification accuracy and macro F1 scores on both the validation and test sets compared to the baseline MFCC pipeline.
- **Feature Quality:** Deep representations from YAMNet effectively capture high-level semantic audio characteristics, reducing confusion between continuous broadband sound categories like `crackling_fire` and `rain`.

## Key Limitations
1. **Small Dataset Size:** The test set consists of only 8 audio clips (2 per class), leading to high variance in evaluation metrics and limiting statistical confidence.
2. **Confounded Pipeline Comparison:** The standard comparison changes both the feature representation (MFCC vs. YAMNet) and the downstream classifier (SVM vs. Logistic Regression) simultaneously, making it difficult to isolate representation quality alone without controlling for the classifier architecture.

## AI Assistance Statement
AI assistance (Gemini) was utilized during this assignment to troubleshoot Google Colab environment variable conflicts (specifically resolving `AttributeError` issues related to `perf_counter`), structure code blocks for feature comparisons, and draft clear explanations for acoustic analysis and confusion matrix entries. All code was executed, verified, and validated independently.
