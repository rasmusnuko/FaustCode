import("stdfaust.lib");

// No anti-alliasing
phasor(freq) = (A~B)
with{
    delta = freq / ma.SR;
    A = _;                      // Feedforward.
    B = (_ + delta) : ma.frac;  // Feedback. Only get decimal part of count
};

process = phasor(1450);
