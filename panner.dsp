import("stdfaust.lib");

// Sqrt to perceptionaly linearize 0 - 1 gain.
pan = sqrt(hslider("LEFT / RIGHT", 0.5, 0, 1, 0.01)) : si.smoo ;

process = _ <: _ * (1-pan), _ * (pan);
