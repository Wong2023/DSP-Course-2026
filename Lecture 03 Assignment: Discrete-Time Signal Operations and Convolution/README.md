# Lecture 03: Discrete-Time Signal Operations and Convolution

## Signal Operations & Filtering Analysis

### 1. Amplitude Scaling
* **Operation:** Multiplying the noisy signal by 2 (`scaled = 2 * measured`).
* **Effect:** Doubled the signal amplitude. The peak-to-peak range increased from approximately $[-1.5, 1.5]$ to $[-3.0, 3.0]$.
* **Invariance:** Frequency ($\omega = 0.1\pi$) and sample positions ($n$) remained unchanged.

### 2. Signal Delay
* **Operation:** Prepending 5 zeros (`delayed = [zeros(1, 5), measured]`).
* **Effect:** Shifted the waveform **to the right** by 5 sample indices.
* **Shape & Cause:** The overall shape did not change. In real engineering systems, such delays are caused by propagation latency (e.g., sound through air, RF transmission, or digital processing buffers).

### 3. Impulse Response $h[n]$
* The impulse response $h[n]$ represents the output of a Linear Time-Invariant (LTI) system when a single discrete unit impulse $\delta[n]$ is applied to the input. For a moving-average filter, $h[n]$ serves as the uniform weighting array ($1/N$).

### 4. Convolution and Noise Filtering
* Convolution (`conv(measured, h, 'same')`) slides a weighted moving window over the signal. Averaging adjacent points cancels out rapid, uncorrelated high-frequency Gaussian noise.

### 5. Filter Comparison (5-Point vs. 15-Point)
* **5-Point Filter ($h_5$):** Effectively smooths out noise while accurately preserving the original sine wave shape and peak amplitude.
* **15-Point Filter ($h_{15}$):** Removes more noise, but excessive smoothing distorts the signal. Since 15 points span $75\%$ of the signal's period ($T = 20$ samples), averaging over peaks and troughs severely suppresses the true amplitude (below $1.0$).

### 6. Recommendation & Real-World Application
* **Recommendation:** The **5-point filter** is recommended. It strikes the best balance between noise reduction and preserving signal peak fidelity.
* **Engineering Application:** Sensor data smoothing (e.g., ECG telemetry or IoT temperature sensors) to filter out ambient electromagnetic noise before microcontroller processing.

---

## AI Usage

* **Tool used:** Claude / Gemini
* **How I used it:** Assisted with code structure verification, MATLAB `conv()` parameter flags, and organizing markdown responses.
* **What I verified or changed:** Tested the MATLAB script locally to confirm figure rendering, legend labels, and verified all saved image filenames.
