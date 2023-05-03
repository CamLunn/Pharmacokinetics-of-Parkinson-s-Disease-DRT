% Requires SimBiolab

% Create Simbiolab model
model1 = sbiomodel('m1');

% Add compartments
comp1 = addcompartment(model1,'Peripheral');
comp2 = addcompartment(model1,'Central');
comp1.Units = 'liter';
comp2.Units = 'liter';

% Add the components (drugs) to compartment
s1 = addspecies(comp1, 'Dose_Rytary');
s2 = addspecies(comp1, 'Drug_Rytary');
s3 = addspecies(comp2, 'Drug_RytaryC');



% Add reaction to model.
r1 = addreaction(model1, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(r1, 'MassAction');

% Add parameter to model.
p1 = addparameter(model1, 'kf');

% Configure SimBiology component property.
r1.KineticLaw.ParameterVariableNames = {'kf'};




% Add reaction to model.
r2 = addreaction(model1, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(r2, 'MassAction');

% Add parameter to model.
p2 = addparameter(model1, 'kf_1');

% Configure SimBiology component property.
r2.KineticLaw.ParameterVariableNames = {'kf_1'};




% Add reaction to model.
r3 = addreaction(model1, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(r3, 'MassAction');

% Add parameter to model.
p3 = addparameter(model1, 'kf_2');

% Configure SimBiology component property.
r3.KineticLaw.ParameterVariableNames = {'kf_2'};




% Add reaction to model.
r4 = addreaction(model1, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(r4, 'MassAction');

% Add parameter to model.
p4 = addparameter(model1, 'kf_3');

% Configure SimBiology component property.
r4.KineticLaw.ParameterVariableNames = {'kf_3'};




% Add reaction to model.
r5 = addreaction(model1, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(r5, 'MassAction');

% Add parameter to model.
p5 = addparameter(model1, 'kf_4');

% Configure SimBiology component property.
r5.KineticLaw.ParameterVariableNames = {'kf_4'};

% Reactions, initial values, and units 
r1.Reaction = 'Peripheral.Dose_Rytary -> null';
r1.Reaction = 'Peripheral.Dose_Rytary -> Peripheral.Drug_Rytary';
r3.Reaction = 'Peripheral.Drug_Rytary -> null';
r2.Reaction = 'Peripheral.Drug_Rytary -> null';
r3.Reaction = 'Peripheral.Drug_Rytary -> Central.Drug_RytaryC';
r4.Reaction = 'Central.Drug_RytaryC -> null';
r5.Reaction = 'Central.Drug_RytaryC -> null';

% Might have to define values (zeros)
s1.Value = 58.5;
s1.Units = 'milligram';
s2.Units = 'milligram/liter';
s3.Units = 'milligram/liter';

p1.Units = '1/hour';
p2.Units = '1/hour';
p3.Units = '1/hour';
p4.Units = '1/hour';
p5.Units = '1/hour';

p1.Value = 1;
p2.Value = 0.1;
p3.Value = 0.5;
p4.Value = .5;
p5.Value = .1;


% Add dose to model.
d1 = adddose(model1, 'Rytary Dose Schedule', 'repeat');

% Specify dose features
d1.Active = true;
d1.TargetName = 'Peripheral.Dose_Rytary';
d1.Amount = 58.5;
d1.StartTime = 8;
d1.Interval = 8;
d1.RepeatCount = 5;
d1.AmountUnits = 'milligram';
d1.RateUnits = 'milligram/hour';
d1.TimeUnits = 'hour';

% Setup config and specify runtime
cs = getconfigset(model1);
cs.StopTime = 48;
cs.TimeUnits = 'hour';

% Simulate and plot
sd = sbiosimulate(model1);
sbioplot(sd);
xlabel('Hours');
ylabel('Levodopa Levels mg');
