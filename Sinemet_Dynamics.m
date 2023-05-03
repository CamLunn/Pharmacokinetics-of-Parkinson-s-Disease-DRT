% Requires SimBiolab

% Create Simbiolab model
model2 = sbiomodel('m2');

% Add compartments
comp1 = addcompartment(model2,'Peripheral');
comp2 = addcompartment(model2,'Central');
comp1.Units = 'liter';
comp2.Units = 'liter';

% Add the components (drugs) to compartment
s1 = addspecies(comp1, 'Dose_Sinemet');
s2 = addspecies(comp1, 'Drug_Sinemet');
s3 = addspecies(comp2, 'Drug_SinemetC');



% Add reaction to model.
r1 = addreaction(model2, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(r1, 'MassAction');

% Add parameter to model.
p1 = addparameter(model2, 'kf');

% Configure SimBiology component property.
r1.KineticLaw.ParameterVariableNames = {'kf'};




% Add reaction to model.
r2 = addreaction(model2, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(r2, 'MassAction');

% Add parameter to model.
p2 = addparameter(model2, 'kf_1');

% Configure SimBiology component property.
r2.KineticLaw.ParameterVariableNames = {'kf_1'};


% Add reaction to model.
r3 = addreaction(model2, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(r3, 'MassAction');

% Add parameter to model.
p3 = addparameter(model2, 'kf_2');

% Configure SimBiology component property.
r3.KineticLaw.ParameterVariableNames = {'kf_2'};


% Add reaction to model.
r4 = addreaction(model2, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(r4, 'MassAction');

% Add parameter to model.
p4 = addparameter(model2, 'kf_3');

% Configure SimBiology component property.
r4.KineticLaw.ParameterVariableNames = {'kf_3'};




% Add reaction to model.
r5 = addreaction(model2, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(r5, 'MassAction');

% Add parameter to model.
p5 = addparameter(model2, 'kf_4');

% Configure SimBiology component property.
r5.KineticLaw.ParameterVariableNames = {'kf_4'};

% Reactions, initial values, and units 
r1.Reaction = 'Peripheral.Dose_Sinemet -> null';
r1.Reaction = 'Peripheral.Dose_Sinemet -> Peripheral.Drug_Sinemet';
r3.Reaction = 'Peripheral.Drug_Sinemet -> null';
r2.Reaction = 'Peripheral.Drug_Sinemet -> null';
r3.Reaction = 'Peripheral.Drug_Sinemet -> Central.Drug_SinemetC';
r4.Reaction = 'Central.Drug_SinemetC -> null';
r5.Reaction = 'Central.Drug_SinemetC -> null';

% Might have to define values (zeros)
s1.Value = 0;
s1.Units = 'milligram';
s2.Units = 'milligram/liter';
s3.Units = 'milligram/liter';

p1.Units = '1/hour';
p2.Units = '1/hour';
p3.Units = '1/hour';
p4.Units = '1/hour';
p5.Units = '1/hour';

p1.Value = 0.66;
p2.Value = 0.1;
p3.Value = 0.5;
p4.Value = .5;
p5.Value = .25;


%%%%%%%%%%% Making 1st dose regimen

% Add dose to model.
d1 = adddose(model2, 'Sinemet Dose Schedule I', 'repeat');

% Specify dose features
d1.Active = true;
d1.TargetName = 'Peripheral.Dose_Sinemet';
d1.Amount = 100;
d1.StartTime = 0;
d1.Interval = 24;
d1.RepeatCount = 3;
d1.AmountUnits = 'milligram';
d1.RateUnits = 'milligram/hour';
d1.TimeUnits = 'hour';


%%%%%%%%%%% Making 2nd dose regimen

% Add dose to model.
d2 = adddose(model2, 'Sinemet Dose Schedule II', 'repeat');

% Specify dose features
d2.Active = true;
d2.TargetName = 'Peripheral.Dose_Sinemet';
d2.Amount = 100;
d2.StartTime = 8;
d2.Interval = 24;
d2.RepeatCount = 3;
d2.AmountUnits = 'milligram';
d2.RateUnits = 'milligram/hour';
d2.TimeUnits = 'hour';


%%%%%%%%%%% Making 3rd dose regimen

% Add dose to model.
d3 = adddose(model2, 'Sinemet Dose Schedule III', 'repeat');

% Specify dose features
d3.Active = true;
d3.TargetName = 'Peripheral.Dose_Sinemet';
d3.Amount = 50;
d3.StartTime = 16;
d3.Interval = 24;
d3.RepeatCount = 3;
d3.AmountUnits = 'milligram';
d3.RateUnits = 'milligram/hour';
d3.TimeUnits = 'hour';

% Setup config and specify runtime
cs2 = getconfigset(model2);
cs2.StopTime = 48;
cs2.TimeUnits = 'hour';

% Simulate and plot
sd2 = sbiosimulate(model2);
sbioplot(sd2);
xlabel('Hours');
ylabel('Levodopa Levels mg');
