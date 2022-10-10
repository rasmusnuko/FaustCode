import("stdfaust.lib");

// No anti-alliasing
saw(freq) = (A~B) * 2 - 1
with{
    delta = freq / ma.SR;
    A = _;                      // Feedforward.
    B = (_ + delta) : ma.frac;  // Feedback. Only get decimal part of count
};

process = saw(1450);
