import("stdfaust.lib");

delay(dSec) = de.delay(ma.SR, d)
with{
    d = dSec * ma.SR;
};

del = hslider("d (secs)", 1, 0, 5, 0.01) : si.smoo;

doppler(freq, index) = delay(LFO*index)
with{
    LFO = os.osc(freq) * 0.5 + 0.5;
};

freq = hslider("freq", 1, 0, 1, 0.01);
index = hslider("index", 1, 0, 1, 0.01);

process = doppler(freq, index) <: _,_;
