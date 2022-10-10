import("stdfaust.lib");

echo(millis, feedback) = A~B
with{
    samples = (millis * 0.001) * ma.SR;
    A = +;
    B = feedback * de.delay(ma.SR, samples);
};

delay_time = hslider("delay time (ms)", 2, 1, 1000, 1);     // Millis
delay_gain = hslider("delay gain", 0.3, 0, 1, 0.01);        // 0 - 1

process = echo(delay_time, delay_gain) <: _,_;
