# Lecture 5: Fourier Assignment

**Student Number Last Digit (d):** 6

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

- **Student Digit (d):** 6
- **Calculated $f_2$:** $f_2 = 13.2 + 0.17 \times 6 = 14.22\text{ Hz}$
- **Prediction:** Since $14.22\text{ Hz}$ does not fall directly on a $1\text{ Hz}$ grid bin, spectral leakage will occur, making the peak spread into adjacent frequency bins.
- **1-sec vs 4-sec comparison:** In the 4-second recording ($\Delta f = 0.25\text{ Hz}$), the frequency grid is 4 times denser, significantly narrowing the peak around $14.22\text{ Hz}$.
- **Zero-Padding Explanation:** Zero-padding interpolates the DTFT curve smoothly showing the sidelobes, but it does not increase the true physical frequency resolution of the 1-second signal.

---

## Exercise 4: DTFT vs DFT

- **Comparison:** The DTFT produces a smooth continuous spectrum, while `fft(x,4)` takes only 4 discrete points along that curve. `fft(x,64)` evaluates the continuous DTFT at 64 points.
- **Why `fft(x,64)` has more points:** Setting $N=64$ zero-pads the 4-sample sequence to 64 samples. It samples the continuous DTFT more densely, but **does not add original signal samples**.
- **Zero Magnitude Points:** In the DTFT plot, magnitude reaches zero at $\omega = \pm \frac{\pi}{2}, \pm \pi$ (or generally $\omega = \frac{2\pi k}{4}$ for $k \ne 0$).

---

## AI Tools Statement
AI tools were used for guidance on MATLAB scripting syntax and generating README formatting.
