# Pharmacodynamics of Parkinson's Disease Dopamine Replacement Therapy (DRT)
CSYS395 - Computational Systems Biology Final Project


**Contents**: 
- AlphaFold_Figures.ipynb contains python script to generate predictive 3D structures for proteins of interest (Figure 2).
- .pdb files are the protein databank files imported by AlphaFold_Figures.ipynb
- 


**Abstract**:

Parkinson’s Disease (PD) is one of the most prevalent neurodegenerative diseases across the world causing a disruption in motor function. Although generally asymptomatic in early stages, progression of the disease leads to accumulation of motor dysfunction including bradykinesia, tremors, muscle stiffness, and more. There are currently no cures, but pathology of PD is mostly understood. Neurodegeneration of cells in the substantia nigra region of the brain causes loss of dopamine-producing neurons. Furthermore, neurons of the substantia nigra lose the ability to communicate with neurons of the basal ganglia, resulting in the loss of motor function. The gold standard of treatment is dopamine replacement therapy (DRT), which uses the precursor molecule levodopa (L-dopa) to be synthesized into dopamine. The main problem with DRT is the variability among patient responses to treatment. Furthermore, the side effects of treatment can be too adverse for a patient to continue treatment. This can largely be attributed to misprocessing of L-dopa by the host’s metabolome. Thus, it is crucial to understand the pharmacodynamic landscape of L-dopa and further elucidate the dynamical processes intervening in the delivery of levodopa into the substantia nigra. A multiscale pharmacodynamic analysis of various steps in the levodopa pathway were implemented. Models included comparisons of Rytary and Sinemet (brands of carbidopa/levodopa), selegiline inhibitor models, and dopamine biosynthesis models. Results indicate that the pharmacodynamics of levodopa and related enzymatic reactions can be visualized, quantified, and compared on a relative basis, with the potential to more precisely simulate physiological processes with the addition of experimental data. These findings, although generalized, may help optimize dosing regimens of L-dopa treatments for patients with Parkinson’s Disease.

**Methods/Results**:

By modeling the pharmacodynamics of L-dopa absorption, we can understand the effects of differing dosage regimens on the rate of absorption. For model simplicity, only selegiline, carbidopa, and levodopa are considered. Figure 1 depicts the relationship between these three drugs.

![Visualization of Pharmacokinetics](https://user-images.githubusercontent.com/64609764/235633275-d15615ee-b550-40ac-8137-218375d82565.png)


**Figure 1. Simplified pharmacokinetic landscape of L-dopa passing the blood brain barrier (BBB).** In the PNS, carbidopa inhibits the decarboxylase activity from the AADC enzyme, preventing the premature conversion of the precursor molecule to dopamine. This allows the transfer of L-dopa across the BBB, where it is converted into dopamine by other decarboxylases. MAO-B enzymes function to mark dopamine for degradation, but selegiline inhibits MAO-B molecules. Thus, dopamine accumulates and begins relieving some of the motor function distress in the patient.


**A**<img width="300" alt="COMT" src="https://user-images.githubusercontent.com/64609764/235642464-d0602ee6-7a87-4153-a056-cdcfb8fdb98a.png">
**B**<img width="300" alt="DDC" src="https://user-images.githubusercontent.com/64609764/235642490-38c9c4c9-82d6-402e-94d3-e64bf956100d.png">
**C**<img width="319" alt="MAO-B" src="https://user-images.githubusercontent.com/64609764/235642503-141b0bc2-a063-4086-ab7e-f23cde5c65b1.png">

**Figure 2. AlphaFold representations of COMT (A), DDC (B), and MAO-B (C) proteins show structures mainly composed of alpha helices.** The alpha helices form string-like arms, which may highlight each protein's ability to bind to dopamine directly, or its precursor protein L-Dopa (for DDC). Interestingly, AlphaFolds prediction of COMT’s structure is low in comparison to DDC and MAO-B. Proteins imported from the .pdb files from the RCSB Protein Data Bank using Biopython v1.75. The following Protein Data Bank Structures were used: 1GOS (MAO-B); 1JS2 (DDC); 3BWM (COMT). 



<img width="582" alt="Figure3" src="https://user-images.githubusercontent.com/64609764/235635019-3f3bfbc9-b011-442a-aebb-adb8544727fd.png">

**Figure 3. Schematics of levodopa flow for Rytary and Sinemet.** Peripheral and Central compartments represent the periphery (blood) and central nervous system (brain). The gap between compartments represents the BBB and yellow nodes represent rates of reaction and diffusion. Rates and dosages are changeable parameters dependent on outside metabolic reactions and dosing regimens.


The bioavailability of levodopa is also dependent on metabolic activity in the periphery and central nervous system and can be further altered by introducing drugs such as Selegiline, which increases the concentration of available levodopa. To account for these modifications, separate schematics were created to model the inhibitory behavior of the previously mentioned inhibitory drugs. Figure () shows the schematic for Selegiline targeting MAO-B and the corresponding dynamics of inactive metabolite production with and without Selegiline in Figure (). Instead of acting as a competitor to MAO-B by binding to levodopa itself, Selegiline specifically targets MAO-B and prevents the enzyme from converting levodopa into inactive metabolites.

**A** <img width="311" alt="Figure4A" src="https://user-images.githubusercontent.com/64609764/235635414-125b9fd2-5ed2-4bec-82fa-a02da30911a0.png">
**B**<img width="542" alt="Figure4B" src="https://user-images.githubusercontent.com/64609764/235635427-99116d69-d057-4ad1-96c1-105cafc2a2b5.png">

**Figure 4. Enzymatic reaction of levodopa, MAO-B, and MAO-B inhibitor (Selegiline).** (A) Schematic of MAO-B and levodopa interaction with and without Selegiline. (B) Plot showing the relative levels of levodopa and inactive metabolite with and without Selegiline. All nodes are assigned the same rate so that the interaction is generalized and relative. Blue: Levodopa with Selegiline;  Green: Levodopa without Selegiline; Red: Inactive metabolites without Selegiline; Black: Inactive metabolites with Selegiline.

A simplified schematic of carbidopa was also included using a reversible node to simulate the inhibitory effect that carbidopa has on levodopa to dopamine conversion. The forward reaction is assigned the same rate in each model, with the reverse rate being less than the forward rate and arbitrarily chosen to reflect general inhibitory kinetics. Initial doses of levodopa were chosen to be 100 mg for each schematic to best visualize the inverse dynamics of levodopa and dopamine levels in the periphery for cases with and without carbidopa. 

**A**<img width="282" alt="Figure5A" src="https://user-images.githubusercontent.com/64609764/235635804-b0e0d04b-5ef1-44ac-a08b-9d9aba8661e9.png">
**B**<img width="556" alt="Figure5B" src="https://user-images.githubusercontent.com/64609764/235635862-91514432-e765-404f-92b3-6e49f9825fbc.png">

**Figure 5. Conversion of levodopa to dopamine, with and without carbidopa.** (A) Schematic of levodopa to dopamine conversion in the periphery without and with the presence of carbidopa. (B) A plot illustrating the levels of levodopa and dopamine in the periphery with and without carbidopa. Dopamine is not useful in the periphery as it cannot pass the BBB. Blue: Available levodopa without Carbidopa; Yellow: Available levodopa with Carbidopa; Red: Dopamine levels in periphery without Carbidopa; Purple: Dopamine levels in periphery with Carbidopa. 


The resulting pharmacodynamics of Rytary and Sinemet were plotted for a 2-day period given the standard dosing regimens described in the schematics (Figure 2). Levels of levodopa are shown in three parts, as portrayed in Figures 5 and 6. The blue curves represent the dosage at each time interval, the pink curves represent the levels of levodopa in the periphery, and the black curves represent the levels of levodopa in the central nervous system for conversion to dopamine. The dosing regimens assumed a waking period from 8 am (initial dose, indicated at t = 0) to 12 am (bedtime dose) with an 8-hour period for rest in a normal 24-hour day. The dosing schedule for Rytary consisted of 3 equally spaced administrations of 58.5 mg of levodopa over a 24-hour period (starting at t = 0) and repeated for each subsequent day. The dosing schedule for Sinemet followed 3 equally spaced administrations of levodopa (starting at t = 0), with 100 mg administered for the first 2 intervals and 50 mg administered for the last. Figure 5 shows the complete dosing regimen for Rytary and Figure 6 for Sinemet. The x-axis denotes time (in hours) and the y-axis (not labeled) represents levodopa levels in mg.


<img width="618" alt="Figure6" src="https://user-images.githubusercontent.com/64609764/235636076-c79df598-477f-4d56-9b99-534343cbde3c.png">

**Figure 6. Dosing regimen and levodopa levels in the periphery and central nervous system for Rytary.** Total levodopa administered over the 2-day period → 351 mg. Blue: Rytary dosage; Purple: Levodopa levels in periphery (Rytary); Black: Levodopa levels in the CNS (Rytary).

<img width="618" alt="Figure7" src="https://user-images.githubusercontent.com/64609764/235636148-d2d41f5c-0021-4598-b321-de6a01f897a1.png">

**Figure 7. Dosing regimen and levodopa levels in the periphery and central nervous system for Sinemet.** Total levodopa administered over the 2-day period → 500 mg. Blue: Sinemet dosage; Purple: Levodopa levels in periphery (Sinemet); Black: Levodopa levels in the CNS (Sinemet).


The levels of levodopa in the central nervous system via Rytary and Sinemet were also compared to investigate the kinetic properties of the two dosing schedules. The dosing regimen for Sinemet displayed greater fluctuations in levodopa levels with the highest local maximum and lowest local minimum concentration, excluding the tails of initial and final dosages. The curves of the Rytary regimen are more consistent, reaching a steady fluctuation cycle after the first several hours. Total levodopa administered in the form of Rytary over the 2-day period was 351 mg, and 500 mg for Sinemet. 

<img width="618" alt="Figure8" src="https://user-images.githubusercontent.com/64609764/235636243-b3d6c8b5-27ce-42c7-bb05-d14b30d387f7.png">

**Figure 8. Levels of levodopa in the CNS for Rytary and Sinemet dosing regimens over a 2-day period.** Levodopa levels of Sinemet exhibit a dip in the usual peak between 16 and 24 hours, whereas Rytary is consistent. Pink: Levodopa levels (Rytary); Black: Levodopa levels (Sinemet).

