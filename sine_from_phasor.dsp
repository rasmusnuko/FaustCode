import("stdfaust.lib");

// No anti-alliasing
phasor(freq) = (A~B)
with{
    delta = freq / ma.SR;
    A = _;                      // Feedforward.
    B = (_ + delta) : ma.frac;  // Feedback. Only get decimal part of count
};

sinwave(freq) = sin(phasor_freq*2*ma.PI)
with{
    phasor_freq = phasor(freq);
};

process = sinwave(220);
