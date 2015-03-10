within WasteWater;
package WasteWaterUnits
  "Type definitions for use with the activated sludge models"

  extends Modelica.Icons.Library;
  type VolumeFlowRate = Real (final quantity="VolumeFlowRate", final unit=
          "m3/d");
  type MassConcentration = Real (
      final quantity="MassConcentration",
      final unit="mg/l",
      final min=0.0);
  type Alkalinity = Real (
      final quantity="Alkalinity",
      final unit="mmol/l",
      final min=0.0);
  type SedimentationVelocity = Real (final quantity="SedimentationVelocity",
        final unit="m/d");

  type SedimentationFlux = Real (final quantity="SedimentationFlux", final unit=
         "g/(m2*d)");

  type SludgeVolumeIndex = Real (final quantity="SludgeVolumeIndex", final unit=
         "ml/g");

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.44,
      height=0.65,
      library=1,
      autolayout=1),
    Invisible=true,
    Documentation(info="This package provides special convention for units and types
for use with the activated sludge models.

These are:
  - VolumeFlowRate with unit [m3/d],
  - MassConcentration with unit [mg/l] and min=0.0,
  - Alkalinity with unit [mmol/l] and min=0.0,
  - SedimentationVelocity with unit [m/d],
  - SedimentationFlux with unit [g/(m2*d)],
  - SludgeVolumeIndex with unit [ml/g],


Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de


The package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2000 - 2001, Gerald Reichl
"));
end WasteWaterUnits;
