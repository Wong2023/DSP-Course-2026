# Lecture 01: Signal Visualization in MATLAB

## Task 2 Questions: Frequency Comparison
* **Which signal changes fastest?** 
  The 10 Hz signal changes the fastest (it completes 10 full oscillations per second).
* **Which signal has the lowest frequency?** 
  The 2 Hz signal has the lowest frequency.
* **How can you see the difference in the plots?** 
  Higher frequency signals have more crests and troughs packed closely together within the same 1-second time window.

## Task 3 Questions: Amplitude Comparison
* **Which signal has the largest amplitude?** 
  The signal with an amplitude of 2.0.
* **Does changing amplitude change frequency?** 
  No, changing the amplitude only affects the peak height/depth of the wave, while the wave's period and frequency remain unchanged.
* **Give one real-world example where amplitude is important.** 
  In audio processing, signal amplitude directly corresponds to volume: higher amplitude results in louder sound.

## Task 4 Questions: Noise
* **What changed after adding noise?** 
  The smooth sinusoidal curve became jagged and distorted due to random variations overlaid on top of the original values.
* **Can you still recognize the original signal?** 
  Yes, the underlying periodic shape of the 5 Hz wave is still visible through the random fluctuations.
* **Give one real-world source of signal noise.** 
  Thermal noise in electronic components/amplifiers or electromagnetic interference from wireless networks.

## Task 6: Responsible AI Usage
* **AI Tool Used:** Gemini
* **Prompt:** "How to generate subplots with sine waves of different frequencies in MATLAB and save the output as a PNG image?"
* **What AI Suggested:** Using `subplot(3,1,N)` to stack figures vertically and `saveas()` to output PNG files.
* **Did the code work immediately?** Yes, the syntax for plotting and saving was correct.
* **What did you modify?** Fixed axis limits (`ylim`) on amplitude plots for clear visual scaling and adjusted line widths/colors.
* **How did you verify the result?** Checked generated PNG files to ensure axes, grid lines, and titles were accurately rendered.
