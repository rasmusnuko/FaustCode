import("stdfaust.lib");

onePoll(a1, x) = y
letrec{
    'y = x + y*a1;
};

process = onePoll(0.999);import("stdfaust.lib");
