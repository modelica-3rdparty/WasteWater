within WasteWater.ASM2d.SecClar;
package Krebs "Secondary settling tank modelling by Krebs (ASM2d)"

  extends Modelica.Icons.Library;

  package Interfaces "Partial models for Secondary Clarifier Model by Krebs"

    extends Modelica.Icons.Library;

    partial model SCVar "partial models providing variables"

      package WWU = WasteWater.WasteWaterUnits;
      WWU.MassConcentration Xf "total sludge concentration";
      WWU.MassConcentration XB "sludge concentration in sludge layer";
      WWU.MassConcentration XR "sludge concentration of return";

      WWU.MassConcentration So1
        "Dissolved oxygen in first stirrer tank of the excess layer";
      WWU.MassConcentration Sf1
        "Readily biodegradable substrate in first stirrer tank of the excess layer";
      WWU.MassConcentration Sa1
        "Fermentation products in first stirrer tank of the excess layer";
      WWU.MassConcentration Snh1
        "Ammonium in first stirrer tank of the excess layer";
      WWU.MassConcentration Sno1
        "Nitrate (plus nitrite) in first stirrer tank of the excess layer";
      WWU.MassConcentration Spo1
        "Phosphate in first stirrer tank of the excess layer";
      WWU.MassConcentration Si1
        "Inert, non biodegradable organics in first stirrer tank of the excess layer";
      WWU.Alkalinity Salk1
        "Bicarbonate alkalinity in first stirrer tank of the excess layer";
      WWU.MassConcentration Sn2_1
        "Dinitrogen in first stirrer tank of the excess layer";

      WWU.MassConcentration So2
        "Dissolved oxygen in second stirrer tank of the excess layer";
      WWU.MassConcentration Sf2
        "Readily biodegradable substrate in second stirrer tank of the excess layer";
      WWU.MassConcentration Sa2
        "Fermentation products in second stirrer tank of the excess layer";
      WWU.MassConcentration Snh2
        "Ammonium in second stirrer tank of the excess layer";
      WWU.MassConcentration Sno2
        "Nitrate (plus nitrite) in second stirrer tank of the excess layer";
      WWU.MassConcentration Spo2
        "Phosphate in second stirrer tank of the excess layer";
      WWU.MassConcentration Si2
        "Inert, non biodegradable organics in second stirrer tank of the excess layer";
      WWU.Alkalinity Salk2
        "Bicarbonate alkalinity in second stirrer tank of the excess layer";
      WWU.MassConcentration Sn2_2
        "Dinitrogen in second stirrer tank of the excess layer";

      annotation (
        Window(
          x=0.6,
          y=0.23,
          width=0.35,
          height=0.49),
        Documentation(info="partial models providing ASM2d variables"));

    end SCVar;

    partial model ratios "partial model for ratios of solid components"

      // ratios of solid components
      Real rXi;
      Real rXs;
      Real rXh;
      Real rXpao;
      Real rXpp;
      Real rXpha;
      Real rXa;
      Real rXmeoh;
      Real rXmep;
      annotation (
        Window(
          x=0.5,
          y=0.37,
          width=0.35,
          height=0.49),
        Documentation(info="partial model for ASM2d ratios of solid components"));

    end ratios;
    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.44,
        height=0.65,
        library=1,
        autolayout=1),
      Documentation(info="This package contains partial models for ASM2d secondary clarifier models.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2003, Gerald Reichl
"));
  end Interfaces;

  model SecClarModKrebs "ASM2d Secondary Settling Tank Model based on Krebs"

    extends WasteWater.Icons.SecClarKrebs;
    package WWSC = WasteWater.ASM2d.SecClar.Krebs.Interfaces;
    extends WWSC.SCVar;
    extends WWSC.ratios;
    extends WasteWater.ASM2d.Interfaces.conversion_factors;
    package SI = Modelica.SIunits;
    package WI = WasteWater.ASM2d.Interfaces;
    package WWU = WasteWater.WasteWaterUnits;

    parameter SI.Length hsc=4.0 "height of secondary clarifier";
    parameter SI.Area Asc=1500.0 "area of secondary clarifier";
    parameter WWU.SludgeVolumeIndex ISV=130 "Sludge Volume Index";
    Real te "thickening time in sludge layer in [d]";
    SI.Length hs "height of sludge layer";
    SI.Length he "height of excess layer";
    WI.WWFlowAsm2din Feed annotation (Placement(transformation(extent={{-110,4},
              {-90,24}}, rotation=0)));
    WI.WWFlowAsm2dout Effluent annotation (Placement(transformation(extent={{92,
              47},{112,67}}, rotation=0)));
    WI.WWFlowAsm2dout Return annotation (Placement(transformation(extent={{-40,
              -106},{-20,-86}}, rotation=0)));
    WI.WWFlowAsm2dout Waste annotation (Placement(transformation(extent={{20,
              -106},{40,-86}}, rotation=0)));
  equation

    // total sludge concentration in clarifier feed
    Xf = i_TSS_Xi*Feed.Xi + i_TSS_Xs*Feed.Xs + i_TSS_BM*(Feed.Xh + Feed.Xpao +
      Feed.Xa) + 3.23*Feed.Xpp + 0.6*Feed.Xpha + Feed.Xmeoh + Feed.Xmep;

    // ratios of solid components
    rXi = Feed.Xi/Xf;
    rXs = Feed.Xs/Xf;
    rXh = Feed.Xh/Xf;
    rXpao = Feed.Xpao/Xf;
    rXpp = Feed.Xpp/Xf;
    rXpha = Feed.Xpha/Xf;
    rXa = Feed.Xa/Xf;
    rXmeoh = Feed.Xmeoh/Xf;
    rXmep = Feed.Xmep/Xf;

      //following expression is only for steady state initial equation of XB and is necessary

      //to calculate hs, if there would be problems with "initial()" in your modelica version
    //leave out this term and initial XB (or hs) manually e.g. via script-file
    if initial() then
      XB = Feed.Q/(0.7*(-(Return.Q + Waste.Q)))*Xf;
    end if;

    //thickening time in sludge layer in [d]
    te = 5/7*Asc*hs/(-(Return.Q + Waste.Q));

    //sludge concentration in sludge layer (unit of time in [h]) in [g/m3]
    XB = (1000/ISV*((te*24)^(1/3)))*1000;

    //sludge concentration of return
    XR = 0.7*XB;

    //ODE of height of sludge layer
    der(hs) = (Feed.Q*Xf - (-(Return.Q + Waste.Q))*XR)/(Asc/2*XB);

    //height of excess layer
    he = hsc - hs;

    // ODE of soluble components in first stirrer tank of the excess layer

    der(So1) = (Feed.Q*Feed.So - (-Effluent.Q)*So1 - (-(Waste.Q + Return.Q))*
      So1)/(Asc*he/2);
    der(Sf1) = (Feed.Q*Feed.Sf - (-Effluent.Q)*Sf1 - (-(Waste.Q + Return.Q))*
      Sf1)/(Asc*he/2);
    der(Sa1) = (Feed.Q*Feed.Sa - (-Effluent.Q)*Sa1 - (-(Waste.Q + Return.Q))*
      Sa1)/(Asc*he/2);
    der(Snh1) = (Feed.Q*Feed.Snh - (-Effluent.Q)*Snh1 - (-(Waste.Q + Return.Q))
      *Snh1)/(Asc*he/2);
    der(Sno1) = (Feed.Q*Feed.Sno - (-Effluent.Q)*Sno1 - (-(Waste.Q + Return.Q))
      *Sno1)/(Asc*he/2);
    der(Spo1) = (Feed.Q*Feed.Spo - (-Effluent.Q)*Spo1 - (-(Waste.Q + Return.Q))
      *Spo1)/(Asc*he/2);
    der(Si1) = (Feed.Q*Feed.Si - (-Effluent.Q)*Si1 - (-(Waste.Q + Return.Q))*
      Si1)/(Asc*he/2);
    der(Salk1) = (Feed.Q*Feed.Salk - (-Effluent.Q)*Salk1 - (-(Waste.Q + Return.
      Q))*Salk1)/(Asc*he/2);
    der(Sn2_1) = (Feed.Q*Feed.Sn2 - (-Effluent.Q)*Sn2_1 - (-(Waste.Q + Return.Q))
        *Sn2_1)/(Asc*he/2);

    // ODE of soluble components in second stirrer tank of the excess layer
    der(So2) = ((-Effluent.Q)*So1 - (-Effluent.Q)*So2)/(Asc*he/2);
    der(Sf2) = ((-Effluent.Q)*Sf1 - (-Effluent.Q)*Sf2)/(Asc*he/2);
    der(Sa2) = ((-Effluent.Q)*Sa1 - (-Effluent.Q)*Sa2)/(Asc*he/2);
    der(Snh2) = ((-Effluent.Q)*Snh1 - (-Effluent.Q)*Snh2)/(Asc*he/2);
    der(Sno2) = ((-Effluent.Q)*Sno1 - (-Effluent.Q)*Sno2)/(Asc*he/2);
    der(Spo2) = ((-Effluent.Q)*Spo1 - (-Effluent.Q)*Spo2)/(Asc*he/2);
    der(Si2) = ((-Effluent.Q)*Si1 - (-Effluent.Q)*Si2)/(Asc*he/2);
    der(Salk2) = ((-Effluent.Q)*Salk1 - (-Effluent.Q)*Salk2)/(Asc*he/2);
    der(Sn2_2) = ((-Effluent.Q)*Sn2_1 - (-Effluent.Q)*Sn2_2)/(Asc*he/2);

    // volume flow rates
    Feed.Q + Effluent.Q + Return.Q + Waste.Q = 0;

    // effluent, solid and soluble components (ASM1)
    Effluent.So = So2;
    Effluent.Sf = Sf2;
    Effluent.Sa = Sa2;
    Effluent.Snh = Snh2;
    Effluent.Sno = Sno2;
    Effluent.Spo = Spo2;
    Effluent.Si = Si2;
    Effluent.Salk = Salk2;
    Effluent.Sn2 = Sn2_2;
    Effluent.Xi = 0.0*XR;
    Effluent.Xs = 0.0*XR;
    Effluent.Xh = 0.0*XR;
    Effluent.Xpao = 0.0*XR;
    Effluent.Xpp = 0.0*XR;
    Effluent.Xpha = 0.0*XR;
    Effluent.Xa = 0.0*XR;
    Effluent.Xmeoh = 0.0*XR;
    Effluent.Xmep = 0.0*XR;
    Effluent.Xtss = 0.0*XR;

    // return sludge flow, solid and soluble components (ASM1)
    Return.So = So1;
    Return.Sf = Sf1;
    Return.Sa = Sa1;
    Return.Snh = Snh1;
    Return.Sno = Sno1;
    Return.Spo = Spo1;
    Return.Si = Si1;
    Return.Salk = Salk1;
    Return.Sn2 = Sn2_1;
    Return.Xi = rXi*XR;
    Return.Xs = rXs*XR;
    Return.Xh = rXh*XR;
    Return.Xpao = rXpao*XR;
    Return.Xpp = rXpp*XR;
    Return.Xpha = rXpha*XR;
    Return.Xa = rXa*XR;
    Return.Xmeoh = rXmeoh*XR;
    Return.Xmep = rXmep*XR;
    Return.Xtss = XR;

    // waste sludge flow, solid and soluble components (ASM1)
    Waste.So = So1;
    Waste.Sf = Sf1;
    Waste.Sa = Sa1;
    Waste.Snh = Snh1;
    Waste.Sno = Sno1;
    Waste.Spo = Spo1;
    Waste.Si = Si1;
    Waste.Salk = Salk1;
    Waste.Sn2 = Sn2_1;
    Waste.Xi = rXi*XR;
    Waste.Xs = rXs*XR;
    Waste.Xh = rXh*XR;
    Waste.Xpao = rXpao*XR;
    Waste.Xpp = rXpp*XR;
    Waste.Xpha = rXpha*XR;
    Waste.Xa = rXa*XR;
    Waste.Xmeoh = rXmeoh*XR;
    Waste.Xmep = rXmep*XR;
    Waste.Xtss = XR;

    annotation (
      Window(
        x=0.41,
        y=0.12,
        width=0.6,
        height=0.49),
      Documentation(info="This component models an ASM2d secondary clarifier based on Krebs conceptional model.
It consists of two compartments: a \"sludge-bed\" and a clear water zone above.

Parameters:
  hsc -  height of clarifier [m]
  Asc -  surface area of secondary clarifier [m2]
  ISV -  Sludge Volume Index [ml/g]
"),   Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(
            extent={{-90,14},{92,-86}},
            lineColor={0,0,255},
            lineThickness=0.5),
          Line(
            points={{-90,48},{92,48}},
            color={0,0,255},
            pattern=LinePattern.Dash),
          Rectangle(
            extent={{-90,80},{92,14}},
            lineColor={0,0,255},
            lineThickness=0.5),
          Polygon(
            points={{-8,-20},{-8,-38},{-16,-38},{0,-48},{16,-38},{8,-38},{8,-20},
                {-8,-20}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-8,34},{-8,54},{-16,54},{0,64},{16,54},{8,54},{8,34},{-8,
                34}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}));
  end SecClarModKrebs;
  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.44,
      height=0.65,
      library=1,
      autolayout=1),
    Documentation(info="This package contains an ASM2d secondary clarifier model and an Interfaces sub-library
based on Krebs conceptional model [1].
The settler model consists of two compartments, a \"sludge-bed\" and a clear water zone above.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de

References:

[1] P. Krebs and M. Armbruster and W. Rodi: Numerische Nachklaerbeckenmodelle. Korrespondenz Abwasser. 47 (7)
    2000. pp 985-999.

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2003, Gerald Reichl
"));
end Krebs;
