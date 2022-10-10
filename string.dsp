import("stdfaust.lib");

echo(millis, feedback) = A~B
with{
    samples = (millis * 0.001) * ma.SR;
    A = +;
    B = feedback * de.delay(ma.SR, samples);
};

string(hz, damp) = A~B
with{
    time = (ma.SR / hz) - 1.5;      // -1 to account for feedback already being 1 sample delayed. 
                                    // -0.5 because of delay introduced by 3rd order lowpass filter in B.
    A = +;
    B = damp * de.fdelay4(ma.SR, time) : fi.lowpass(3, 12000);  // fdelay4 =  4th order fractional delay
};

freq = hslider("freq", 220, 50, 880, 0.1);
damp = hslider("gain", 0.99, 0.95, 0.999, 0.001);

process = button("gate")
        : ba.impulsify
        : string(freq, damp)
        <: _,_;

