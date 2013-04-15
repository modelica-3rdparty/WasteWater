package WasteWater "Modelica WasteWater Library"
extends Modelica.Icons.Library;

annotation (
  Coordsys(
    extent=[0, 0; 442, 386], 
    grid=[2, 2], 
    component=[20, 20]), 
  Window(
    x=0.45, 
    y=0.01, 
    width=0.44, 
    height=0.65, 
    library=1, 
    autolayout=1), 
  Documentation(info="This package can be used to model and simulate biological municipal
wastewater treatment plants.

The package WasteWater provides a collection of 3 different
international accepted (a)ctivated (s)ludge (m)odels (ASM) of different complexity,
including models for preclarifiers and 5 different models for
the secondary settling process.

PS: SimulationTimeUnit for all models built with the WasteWater library is days [d].

The WasteWater package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

The WasteWater package currently consists of the following subpackages

  ASM1            - Activated Sludge Model No.1  (models 13 wastewater components and 8 biological processes)
  ASM2d           - Activated sludge Model No.2d (models 19 wastewater components and 21 biological processes)
  ASM3            - Activated Sludge Model No.3  (models 13 wastewater components and 12 biological processes)
  Icons           - Icon definitions for wastewater treatment components
  WasteWaterUnits - unit type definitions for use with the WasteWater library


Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de

Release Notes:
   version 2.0.1 (2003)
   First official version of the library released at 3rd Modelica Conference.

Copyright (C) 2000 - 2003, Gerald Reichl
"));
end WasteWater;
