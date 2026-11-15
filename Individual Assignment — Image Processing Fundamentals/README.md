# Image Processing Experiment — Option A: Denoising Filters Comparison

## Overview
- **Selected Option:** Option A — Compare denoising filters
- **Reference Image:** `rice.png` (built-in MATLAB Image Processing Toolbox sample image; not uploaded to the repository)
- **MATLAB Version:** MATLAB R2026a (with Image Processing Toolbox) *(update if using another version)*

## Experimental Settings
- **Random Seed:** `rng(42)`
- **Noise Model:** `Id = imnoise(imnoise(Iref,'gaussian',0,0.01),'salt & pepper',0.02);`
- **Filters Evaluated:**
  1. 3×3 Median filter (`medfilt2(Id, [3 3])`)
  2. Gaussian filter with $\sigma = 1.5$ (`imgaussfilt(Id, 1.5)`)
  3. Sequential 3×3 Median filter followed by Gaussian filter with $\sigma = 1.5$
- **Zoomed Inspection Region:** 70×70 pixels (`rows 80:149, cols 80:149`)

## Repository Structure
- `analysis.mlx` — Executed MATLAB Live Script containing code, inline outputs, and analysis.
- `analysis.pdf` — Static PDF export of the executed Live Script.
- `results/` — Saved PNG outputs of all three filtered images, metrics CSV table, and full/zoomed visual comparison figure.
- `README.md` — Experiment documentation.

## How to Run
1. Clone or download this repository.
2. Open MATLAB (with Image Processing Toolbox installed) and set the repository folder as the Current Folder.
3. Open `analysis.mlx` and click **Run All** in the Live Editor tab. All metrics and images in `results/` will regenerate automatically.

## Main Conclusion & Limitation
- **Main Conclusion:** The sequential **3×3 Median + Gaussian ($\sigma = 1.5$)** pipeline performs best overall (highest PSNR and SSIM). The initial median stage removes salt-and-pepper impulses without smearing them, while the subsequent Gaussian stage suppresses residual Gaussian noise.
- **Limitation:** Pixel-wise metrics (PSNR/SSIM) do not capture task-specific downstream impacts—such as whether the edge blurring introduced by Gaussian smoothing causes neighboring rice grains to merge during subsequent segmentation.

## Use of AI Assistance
AI tools (Gemini) were used to help structure the MATLAB Live Script layout, format the multi-subplot visualization code, and refine the English phrasing of the README and interpretation sections. All code was executed, verified, and reviewed directly in MATLAB.
