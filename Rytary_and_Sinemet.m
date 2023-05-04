% Requires SimBiolab

%Rytary Model
model1 = sbiomodel('m1');

Scomp1 = addcompartment(model1,'Peripheral');
Scomp2 = addcompartment(model1,'Central');
Scomp1.Units = 'liter';
Scomp2.Units = 'liter';

Ss1 = addspecies(Scomp1, 'Dose_Rytary');
Ss2 = addspecies(Scomp1, 'Drug_Rytary');
Ss3 = addspecies(Scomp2, 'Drug_RytaryC');



% Add reaction to model.
Sr1 = addreaction(model1, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(Sr1, 'MassAction');

% Add parameter to model.
Sp1 = addparameter(model1, 'kf');

% Configure SimBiology component property.
Sr1.KineticLaw.ParameterVariableNames = {'kf'};




% Add reaction to model.
Sr2 = addreaction(model1, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(Sr2, 'MassAction');

% Add parameter to model.
Sp2 = addparameter(model1, 'kf_1');

% Configure SimBiology component property.
Sr2.KineticLaw.ParameterVariableNames = {'kf_1'};




% Add reaction to model.
Sr3 = addreaction(model1, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(Sr3, 'MassAction');

% Add parameter to model.
Sp3 = addparameter(model1, 'kf_2');

% Configure SimBiology component property.
Sr3.KineticLaw.ParameterVariableNames = {'kf_2'};




% Add reaction to model.
Sr4 = addreaction(model1, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(Sr4, 'MassAction');

% Add parameter to model.
Sp4 = addparameter(model1, 'kf_3');

% Configure SimBiology component property.
Sr4.KineticLaw.ParameterVariableNames = {'kf_3'};




% Add reaction to model.
Sr5 = addreaction(model1, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(Sr5, 'MassAction');

% Add parameter to model.
Sp5 = addparameter(model1, 'kf_4');

% Configure SimBiology component property.
Sr5.KineticLaw.ParameterVariableNames = {'kf_4'};

%Reactions, initial values, and units 
Sr1.Reaction = 'Peripheral.Dose_Rytary -> null';
Sr1.Reaction = 'Peripheral.Dose_Rytary -> Peripheral.Drug_Rytary';
Sr3.Reaction = 'Peripheral.Drug_Rytary -> null';
Sr2.Reaction = 'Peripheral.Drug_Rytary -> null';
Sr3.Reaction = 'Peripheral.Drug_Rytary -> Central.Drug_RytaryC';
Sr4.Reaction = 'Central.Drug_RytaryC -> null';
Sr5.Reaction = 'Central.Drug_RytaryC -> null';

%Might have to define values (zeros)
Ss1.Value = 58.5;
Ss1.Units = 'milligram';
Ss2.Units = 'milligram/liter';
Ss3.Units = 'milligram/liter';

Sp1.Units = '1/hour';
Sp2.Units = '1/hour';
Sp3.Units = '1/hour';
Sp4.Units = '1/hour';
Sp5.Units = '1/hour';

Sp1.Value = 1;
Sp2.Value = 0.1;
Sp3.Value = 0.5;
Sp4.Value = .5;
Sp5.Value = .1;


% Add dose to model.
Rd1 = adddose(model1, 'Rytary Dose Schedule', 'repeat');

% Configure SimBiology component property.
Rd1.Active = true;
Rd1.TargetName = 'Peripheral.Dose_Rytary';
Rd1.Amount = 58.5;
Rd1.StartTime = 8;
Rd1.Interval = 8;
Rd1.RepeatCount = 5;
Rd1.AmountUnits = 'milligram';
Rd1.RateUnits = 'milligram/hour';
Rd1.TimeUnits = 'hour';

Rcs = getconfigset(model1);
Rcs.StopTime = 48;
Rcs.TimeUnits = 'hour';
Rsd = sbiosimulate(model1);
sbioplot(Rsd);
xlabel('Hours');
ylabel('Levodopa Levels mg');
legend
hold on









%Sinemet Model

model2 = sbiomodel('m2');

Scomp1 = addcompartment(model2,'Peripheral');
Scomp2 = addcompartment(model2,'Central');
Scomp1.Units = 'liter';
Scomp2.Units = 'liter';

Ss1 = addspecies(Scomp1, 'Dose_Sinemet');
Ss2 = addspecies(Scomp1, 'Drug_Sinemet');
Ss3 = addspecies(Scomp2, 'Drug_SinemetC');



% Add reaction to model.
Sr1 = addreaction(model2, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(Sr1, 'MassAction');

% Add parameter to model.
Sp1 = addparameter(model2, 'kf');

% Configure SimBiology component property.
Sr1.KineticLaw.ParameterVariableNames = {'kf'};




% Add reaction to model.
Sr2 = addreaction(model2, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(Sr2, 'MassAction');

% Add parameter to model.
Sp2 = addparameter(model2, 'kf_1');

% Configure SimBiology component property.
Sr2.KineticLaw.ParameterVariableNames = {'kf_1'};




% Add reaction to model.
Sr3 = addreaction(model2, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(Sr3, 'MassAction');

% Add parameter to model.
Sp3 = addparameter(model2, 'kf_2');

% Configure SimBiology component property.
Sr3.KineticLaw.ParameterVariableNames = {'kf_2'};




% Add reaction to model.
Sr4 = addreaction(model2, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(Sr4, 'MassAction');

% Add parameter to model.
Sp4 = addparameter(model2, 'kf_3');

% Configure SimBiology component property.
Sr4.KineticLaw.ParameterVariableNames = {'kf_3'};




% Add reaction to model.
Sr5 = addreaction(model2, 'null -> null');

% Add kinetic law to reaction.
addkineticlaw(Sr5, 'MassAction');

% Add parameter to model.
Sp5 = addparameter(model2, 'kf_4');

% Configure SimBiology component property.
Sr5.KineticLaw.ParameterVariableNames = {'kf_4'};

%Reactions, initial values, and units 
Sr1.Reaction = 'Peripheral.Dose_Sinemet -> null';
Sr1.Reaction = 'Peripheral.Dose_Sinemet -> Peripheral.Drug_Sinemet';
Sr3.Reaction = 'Peripheral.Drug_Sinemet -> null';
Sr2.Reaction = 'Peripheral.Drug_Sinemet -> null';
Sr3.Reaction = 'Peripheral.Drug_Sinemet -> Central.Drug_SinemetC';
Sr4.Reaction = 'Central.Drug_SinemetC -> null';
Sr5.Reaction = 'Central.Drug_SinemetC -> null';

%Might have to define values (zeros)
Ss1.Value = 0;
Ss1.Units = 'milligram';
Ss2.Units = 'milligram/liter';
Ss3.Units = 'milligram/liter';

Sp1.Units = '1/hour';
Sp2.Units = '1/hour';
Sp3.Units = '1/hour';
Sp4.Units = '1/hour';
Sp5.Units = '1/hour';

Sp1.Value = 0.66;
Sp2.Value = 0.1;
Sp3.Value = 0.5;
Sp4.Value = .5;
Sp5.Value = .25;


% Add dose to model.
Sd1 = adddose(model2, 'Sinemet Dose Schedule I', 'repeat');

% Configure SimBiology component property.
Sd1.Active = true;
Sd1.TargetName = 'Peripheral.Dose_Sinemet';
Sd1.Amount = 100;
Sd1.StartTime = 0;
Sd1.Interval = 24;
Sd1.RepeatCount = 3;
Sd1.AmountUnits = 'milligram';
Sd1.RateUnits = 'milligram/hour';
Sd1.TimeUnits = 'hour';

% Add dose to model.
S2 = adddose(model2, 'Sinemet Dose Schedule II', 'repeat');

% Configure SimBiology component property.
S2.Active = true;
S2.TargetName = 'Peripheral.Dose_Sinemet';
S2.Amount = 100;
S2.StartTime = 8;
S2.Interval = 24;
S2.RepeatCount = 3;
S2.AmountUnits = 'milligram';
S2.RateUnits = 'milligram/hour';
S2.TimeUnits = 'hour';


% Add dose to model.
S3 = adddose(model2, 'Sinemet Dose Schedule III', 'repeat');

% Configure SimBiology component property.
S3.Active = true;
S3.TargetName = 'Peripheral.Dose_Sinemet';
S3.Amount = 50;
S3.StartTime = 16;
S3.Interval = 24;
S3.RepeatCount = 3;
S3.AmountUnits = 'milligram';
S3.RateUnits = 'milligram/hour';
S3.TimeUnits = 'hour';


Ss2 = getconfigset(model2);
Ss2.StopTime = 48;
Ss2.TimeUnits = 'hour';
Ssd2 = sbiosimulate(model2);
sbioplot(Ssd2);
xlabel('Hours');
ylabel('Levodopa Levels mg');
hold off