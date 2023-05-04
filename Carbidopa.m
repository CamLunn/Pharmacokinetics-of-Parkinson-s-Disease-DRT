% Requires SimBiolab
model4 = sbiomodel('m4');

comp1 = addcompartment(model4,'With_Carbidopa');
comp2 = addcompartment(model4,'Without_Carbidopa');

s1 = addspecies(comp1, 'C-Levodopa');
s2 = addspecies(comp1, 'C-Dopamine');
s3 = addspecies(comp2, 'Levodopa');
s4 = addspecies(comp2, 'Dopamine');

% Add reaction to model.
r1 = addreaction(model4, 'null -> null');
% Add kinetic law to reaction.
addkineticlaw(r1, 'MassAction');
% Add parameter to model.
p1 = addparameter(model4, 'kf');
% Configure SimBiology component property.
r1.KineticLaw.ParameterVariableNames = {'kf'};
r1.Reversible = true;
% Add parameter to model.
p2 = addparameter(model4, 'kr');
% Configure SimBiology component property.
r1.KineticLaw.ParameterVariableNames = {'kf','kr'};


% Add reaction to model.
r2 = addreaction(model4, 'null -> null');
% Add kinetic law to reaction.
addkineticlaw(r2, 'MassAction');
% Add parameter to model.
p3 = addparameter(model4, 'kf_1');
% Configure SimBiology component property.
r2.KineticLaw.ParameterVariableNames = {'kf_1'};

%Reaction
r1.Reaction = 'With_Carbidopa.C-Levodopa -> null';
r1.Reaction = 'With_Carbidopa.C-Levodopa -> With_Carbidopa.C-Dopamine';
r1.reversible = true;

r2.Reaction = 'Without_Carbidopa.Levodopa -> null';
r2.Reaction = 'Without_Carbidopa.Levodopa -> Without_Carbidopa.Dopamine';



%Reaction rates
s1.Value = 100;
s3.Value = 100;
p1.Value = 0.5;
p2.Value = 0.25;
p3.Value = 0.5;


cs = getconfigset(model4);
cs.StopTime = 20;
sd = sbiosimulate(model4);
sbioplot(sd);
xlabel('Time');
ylabel('Concentration');