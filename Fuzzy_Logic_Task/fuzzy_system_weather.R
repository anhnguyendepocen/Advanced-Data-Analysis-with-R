# The package 'set' will be used for building this simple fuzzy systems
library(sets)

#definfing universe of values with ramge 1 to 100 and granularity= 0.5
sets_options("universe", seq(1, 100, 0.5))

#defineing variables temperature, humidity, precipitation using normal distribution membership function and weather using fuzzy_cone with radius=10

variables <- set(
  temperature = fuzzy_partition(varnames = c(cold = 5, good = 25, hot = 40),
                                sd = 5.0),
  humidity = fuzzy_partition(varnames = c(dry = 30, good = 60, wet = 80), 
                             sd = 3.0),
  precipitation = fuzzy_partition(varnames = c(no.rain = 30, little.rain = 60,
                                               rain = 90), sd = 7.5),
  weather = fuzzy_partition(varnames = c(bad = 40, ok = 65, perfect = 80),
                            FUN = fuzzy_cone, radius = 10)
)


# six Fuzzy rules are defined using fuzzy variables 
rules <- set(
  fuzzy_rule(temperature %is% good && humidity %is% dry && precipitation %is% no.rain, weather %is% perfect),
  
  fuzzy_rule(temperature %is% hot && humidity %is% wet && precipitation %is% rain, weather %is% bad),
  
  fuzzy_rule(temperature %is% cold, weather %is% bad),
  
  fuzzy_rule(temperature %is% good || humidity %is% good || precipitation %is% little.rain, weather %is% ok),
  
  fuzzy_rule(temperature %is% hot && precipitation %is% little.rain, weather %is% ok),
  
  fuzzy_rule(temperature %is% hot && humidity %is% dry && precipitation %is% little.rain, weather %is% ok)
)
# create fuzzy system
model <- fuzzy_system(variables, rules)

#output of system
print(model)

# draw graph of fuzzy system
par(mar = rep(2, 4))
plot(model)

example.1 <- fuzzy_inference(model, list(temperature = 75, humidity = 0,
                                         precipitation = 70))

gset_defuzzify(example.1, "centroid")

plot(example.1)


example.2 <- fuzzy_inference(model, list(temperature = 30, humidity = 0,
                                         precipitation = 70))
gset_defuzzify(example.2, "largestofmax")

plot(example.2)

