# MATLAB Assignment: Z-Transform and Sample Delays

This repository contains the solution for the DSP assignment on Z-Transform and Sample Delays.

---

## Part 1: Signal and Z-Transform

### Answers

**1. Identify the sample represented by each term in $X(z) = 1 + 2z^{-1} + z^{-2}$:**
* `1` (or $1 \cdot z^0$) represents $x[0] = 1$ at sample $n = 0$.
* `2z⁻¹` represents $x[1] = 2$ at sample $n = 1$.
* `z⁻²` represents $x[2] = 1$ at sample $n = 2$.

**2. Z-transform of the delayed signal $x_{delayed} = [0, 1, 2, 1]$:**
$$X_{delayed}(z) = z^{-1} + 2z^{-2} + z^{-3}$$

**3. Why delaying by one sample multiplies $X(z)$ by $z^{-1}$:**
In the Z-domain, $z^{-1}$ represents a one-sample time delay. Shifting a signal to the right by one step ($n \to n+1$) increases every negative exponent of $z$ by 1, which is mathematically equivalent to multiplying the original $X(z)$ by $z^{-1}$:
$$X_{delayed}(z) = z^{-1} \cdot X(z)$$

---

## Part 2: System with One Sample Delay

### Answers

**4. Hand calculations for $y[n] = 0.5x[n] + 0.5x[n-1]$:**
Given $x = [1, 2, 1, 0]$ and $x[-1] = 0$:
* $y[0] = 0.5(1) + 0.5(0) = \mathbf{0.5}$
* $y[1] = 0.5(2) + 0.5(1) = \mathbf{1.5}$
* $y[2] = 0.5(1) + 0.5(2) = \mathbf{1.5}$
* $y[3] = 0.5(0) + 0.5(1) = \mathbf{0.5}$

*Comparison:* The hand-calculated output `[0.5, 1.5, 1.5, 0.5]` exactly matches the MATLAB `filter()` output.

**5. How `b = [0.5 0.5]` represents $H(z) = 0.5 + 0.5z^{-1}$:**
In MATLAB's `filter(b, a, x)`, the vector `b` stores numerator coefficients for $H(z)$:
* `b(1) = 0.5` multiplies the current input sample $x[n]$.
* `b(2) = 0.5` multiplies the one-sample delayed input $x[n-1]$.

**6. Updated system $H(z) = 0.8 + 0.2z^{-1}$ (`b = [0.8 0.2]`):**
The **current input sample** $x[n]$ now has significantly more influence on the output because $80\%$ of the output value comes from $x[n]$ and only $20\%$ comes from $x[n-1]$. The filter responds faster and smooths the signal less.
