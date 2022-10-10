import("stdfaust.lib");

one_poll(a1) = _ * (1-a1) : A~B
with{
    A = +;
    B = _ * a1;
};

process = no.noise : one_poll(0.999);
