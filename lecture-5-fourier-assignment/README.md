# Lecture 5: Fourier Assignment

**Student Number Last Digit (d):** 4 *(поставь свою цифру)*

---

## Exercise 1: Square Wave Approximation

- **Prediction:** Adding more odd harmonics will flatten the peak of the sine wave, make the top more horizontal, and steepen the vertical edges, gradually transforming it into a square wave.
- **Observations:** As $H$ increases ($1 \to 3 \to 9 \to 25$), the signal gets much closer to an ideal square wave.
- **Sharp Transitions Observation:** Near the sharp step changes (edges), oscillations ("ripples") appear that do not disappear even as $H$ increases. This is known as the **Gibbs Phenomenon** (over-shoot of about 9%).

---

## Exercise 2: Two Frequencies with FFT

- **Expected Frequencies & Amplitudes:**
  - $f_1 = 15\text{ Hz}$, Amplitude = $0.8$
  - $f_2 = 40\text{ Hz}$, Amplitude = $0.4$
- **Bin Spacing Calculation:**
  $$\Delta f = \frac{f_s}{N} = \frac{200\text{ Hz}}{200} = 1.0\text{ Hz}$$
- **Results:** Measured peaks match expected values exactly ($15\text{ Hz}$ at $0.8$ and $40\text{ Hz}$ at $0.4$) because $15\text{ Hz}$ and $40\text{ Hz}$ land precisely on the DFT frequency grid bins.

---

## Exercise 3: Spectral Leakage

- **Calculated $f_2$:** $f_2 = 13.2 + 0.17 \times 4 = 13.88\text{ Hz}$
- **Prediction:** Since $13.88\text{ Hz}$ does not align with the $1\text{ Hz}$ bin grid, spectral leakage will occur, causing energy to spread across adjacent bins instead of showing a single sharp peak.
- **1-sec vs 4-sec comparison:** In the 4-second recording, duration $T = 4\text{ s}$, making bin spacing $\Delta f = \frac{1}{4} = 0.25\text{ Hz}$. The peak at $13.88\text{ Hz}$ becomes significantly sharper and closer to its true value.
- **Zero-Padding Explanation:** Zero-padding interpolates more frequency values in the spectrum plot, creating a smooth line, but **it does not add new information** or increase true spectral resolution.

---

## Exercise 4: DTFT vs DFT

- **Comparison:** The DTFT produces a smooth continuous spectrum, while `fft(x,4)` takes only 4 discrete points along that curve. `fft(x,64)` evaluates the continuous DTFT at 64 points.
- **Why `fft(x,64)` has more points:** Setting $N=64$ zero-pads the 4-sample sequence to 64 samples. It samples the continuous DTFT more densely, but **does not add original signal samples**.
- **Zero Magnitude Points:** In the DTFT plot, magnitude reaches zero at $\omega = \pm \frac{\pi}{2}, \pm \pi$ (or generally $\omega = \frac{2\pi k}{4}$ for $k \ne 0$).

---

## AI Tools Statement
AI tools were used for guidance on MATLAB scripting syntax and generating README formatting.
