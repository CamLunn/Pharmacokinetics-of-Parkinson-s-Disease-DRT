% Requires SimBiolab
model3 = sbiomodel('m3');

comp1 = addcompartment(model3,'With_Entacapone');
comp2 = addcompartment(model3,'Without_Entacapone');

s1 = addspecies(comp1, 'Levodopa_I');
s2 = addspecies(comp1, 'COMT_I');
s3 = addspecies(comp1, 'Entacapone_I');
s4 = addspecies(comp1, '3-O-M_I');
s5 = addspecies(comp1, 'CE_Complex_I');

s6 = addspecies(comp2, 'Levodopa');
s7 = addspecies(comp2, 'COMT');
s8 = addspecies(comp2, '3-O-M');


% Add reaction to model.
r1 = addreaction(model3, 'null -> null');
% Add kinetic law to reaction.
addkineticlaw(r1, 'MassAction');
% Add parameter to model.
p1 = addparameter(model3, 'kf');
% Configure SimBiology component property.
r1.KineticLaw.ParameterVariableNames = {'kf'};


% Add reaction to model.
r2 = addreaction(model3, 'null -> null');
% Add kinetic law to reaction.
addkineticlaw(r2, 'MassAction');
% Add parameter to model.
p2 = addparameter(model3, 'kf_1');
% Configure SimBiology component property.
r2.KineticLaw.ParameterVariableNames = {'kf_1'};


% Add reaction to model.
r3 = addreaction(model3, 'null -> null');
% Add kinetic law to reaction.
addkineticlaw(r3, 'MassAction');
% Add parameter to model.
p3 = addparameter(model3, 'kf_2');
% Configure SimBiology component property.
r3.KineticLaw.ParameterVariableNames = {'kf_2'};



%Reactions, initial values, and units 
r1.Reaction = 'With_Entacapone.Levodopa_I + With_Entacapone.COMT_I -> null';
r1.Reaction = 'With_Entacapone.Levodopa_I + With_Entacapone.COMT_I -> With_Entacapone.3-O-M_I';

r2.Reaction = 'With_Entacapone.COMT_I + With_Entacapone.Entacapone_I -> null'; 
r2.Reaction = 'With_Entacapone.COMT_I + With_Entacapone.Entacapone_I -> With_Entacapone.CE_Complex_I';

r3.Reaction = 'Without_Entacapone.COMT + Without_Entacapone.Levodopa -> null';
r3.Reaction = 'Without_Entacapone.COMT + Without_Entacapone.Levodopa -> Without_Entacapone.3-O-M';

%Reaction rates
s1.Value = 100;
s2.Value = 50;
s3.Value = 50;
p1.Value = 0.25;
p2.Value = 0.25;

s6.Value = 100;
s7.Value = 50;
p3.Value = 0.25;


cs = getconfigset(model3);
cs.StopTime = 1;
sd = sbiosimulate(model3);
sbioplot(sd);
xlabel('Time');
ylabel('Concentration');