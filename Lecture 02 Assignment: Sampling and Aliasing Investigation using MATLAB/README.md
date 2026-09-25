# Lecture 02 – Sampling and Aliasing

## Objective
Investigate how different sampling frequencies affect a 10 Hz vibration signal, demonstrate aliasing, and select an optimal sampling rate for an industrial condition monitoring system.

## Nyquist Analysis
By the Nyquist Theorem ($f_{s, min} = 2 \cdot f_{max}$), for $f_{max} = 10\text{ Hz}$:

$$f_{s, min} = 2 \cdot 10\text{ Hz} = 20\text{ Hz}$$

* **Satisfy Nyquist:** 20 Hz, 25 Hz, 50 Hz, 100 Hz.
* **Fail Nyquist:** 15 Hz.

**Is exactly $20\text{ Hz}$ recommended?**  
No. As seen in the $20\text{ Hz}$ plot, if samples coincide with zero-crossings, the amplitude drops to zero. Practical systems also require headroom for real anti-aliasing filters.

## Results
* **15 Hz:** Severe aliasing. Signal folds back to a false 5 Hz sine wave.
* **20 Hz:** Critical sampling; phase alignment causes complete signal loss (flat line at 0).
* **25 Hz:** Coarse wave shape (2.5 samples/cycle) with amplitude distortion.
* **50 Hz & 100 Hz:** Accurate representation with clear wave shape and correct peak values.

## Aliasing Discussion
Aliasing occurs at $15\text{ Hz}$ because $f_s < 20\text{ Hz}$. Undersampling causes high-frequency oscillations to fold into the lower frequency spectrum ($|10 - 15| = 5\text{ Hz}$).

## Engineering Recommendation
Recommend **50 Hz to 100 Hz** ($5\times$ to $10\times f_{max}$):
* **Accuracy:** Captures true amplitude peaks without phase-dependent loss.
* **Robustness:** Provides margin for analog anti-aliasing filter roll-off.
* **Efficiency:** $100\text{ Hz}$ creates minimal memory/CPU load on modern hardware.

## AI Usage
* **Tool:** Gemini
* **Prompt:** "Explain aliasing or generate MATLAB code related to this assignment."
* **Summary:** Provided Nyquist theory explanation and starter code for continuous/discrete signal plotting.
* **Modified:** Set signal to 10 Hz, updated $f_s$ array, adjusted plot layouts, and refined Markdown documentation.
* **Verification:** Verified MATLAB plot outputs against mathematical formula ($f_{alias} = |10 - 15| = 5\text{ Hz}$).
