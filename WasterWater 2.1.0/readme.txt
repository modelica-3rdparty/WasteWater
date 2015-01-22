
How to use the WasteWater library (with dymola) 
===============================================


1. Start dymola and open .../WasteWater/package.mo

2. Choose one of the possible Activated Sludge Model sub-libraries ASM1, ASM2d or ASM3.

3. Open one of the models from the examples sub-library or build a new model
   with appropriate ASMx objects.

4. Before translating a model change into current ASMx sub-directory from dymola
   command line (e.g. ..\WasteWater\ASM1) and then translate it.

5. To initalize the given examples with initial state values you can use the appropriate 
   *.mos script-files at the ASMx directories.

6. The examples usually include dry-weather-influent-files about a period of 14 days for dynamic simualtions, 
   for beyond simulations adequate influent-files will be needed.

7. Specify simulation parameters like start and stop time and if needed the number of intervals.
   The time unit of the WasteWater library is days [d], so a stop time value of 14 means 14 days simulation time.

8. Simulation.


Because of the complexity of some wastewater treatment plant models 
simulations could take a while, dependent on your hardware!

The WasteWater library only includes the biological standart values from ASMx distributions,
so it is subject to the user to calibrate the ASM parameters for own purposes.


Remark: All files within the WasteWater library are stored in dos-file-format.
        If you want to use the library under a Linux platform it is recommended to
        transform the files into linux-file-format by dos2unix command as modelica
        script files (*.mos) cannot be loaded otherwise.


Main Author:

   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de



This package is free software; it can be redistributed and/or modified under the terms of the Modelica license,
see the license conditions and the accompanying disclaimer in the documentation of package Modelica 
in file "Modelica/package.mo".

Copyright (C) 2000 - 2003 Gerald Reichl




