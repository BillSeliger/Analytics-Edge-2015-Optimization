/* Objective function */
max: +617 reg +238 disc;

/* Constraints */
capacity: +reg +disc <= 166;
reg_demand: +reg <= 100;
discount_demand: +disc <= 150;
reg_positive: +reg >= 0;
disc_positive: +disc >= 0;
