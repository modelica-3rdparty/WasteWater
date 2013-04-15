package ASM2d "Component models for the Activated Sludge Model No.2d"
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
  Documentation(info="This library contains components to build models of biological municipal
wastewater treatment plants based on the Activated Sludge Model No.2d (ASM2d) by the
International Association on Water Quality (IAWQ) [1].


The library currently is structured in following sub-libraries.

 - Interfaces (partial ASM2d models and connectors)
 - PreClar (primary clarifier models)
 - SecClar (several secondary settling tank models)
 - Examples (wastewater treatment plant models)

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

[1] M. Henze and W.Gujer and T. Mino and. M.v. Loosdrecht: Activated Sludge
    Models ASM1, ASM2, ASM2d, and ASM3. IWA Task Group on Mathematical Modelling
    for Design and Operation of Biological Wastewater Treatment, 2000.

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2002 - 2003, Gerald Reichl
"));

model deni "ASM2d denitrification tank" 
  //denitrification tank based on the ASM2d model
  
  extends WasteWater.Icons.deni;
  extends Interfaces.ASM2dbase;
  
  // tank specific parameters
  parameter Modelica.SIunits.Volume V=1000 "Volume of denitrification tank";
  Interfaces.WWFlowAsm2din In annotation (extent=[-110, -10; -90, 10]);
  Interfaces.WWFlowAsm2dout Out annotation (extent=[90, -10; 110, 10]);
  Interfaces.WWFlowAsm2dout MeasurePort annotation (extent=[50, 40; 60, 50]);
  Modelica.Blocks.Interfaces.InPort T(final n=1) annotation (extent=[-110, 30; 
        -90, 50]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component models the ASM2d processes and reactions taking place in an unaerated (denitrification) tank
of a wastewater treatment plant.

The InPort signal gives the tank temperature to the model.

Parameters:

    - all conversion factors and stoichiometric and kinetic parameters of the activated sludge model No.2d (ASM2d)
  V - volume of the tank [m3]
"));
equation 
  
  aeration = 0;
  // no aeration in this tank //
  
  // volume dependent dilution term of each concentration
  
  inputSo = (In.So - So)*In.Q/V;
  inputSf = (In.Sf - Sf)*In.Q/V;
  inputSa = (In.Sa - Sa)*In.Q/V;
  inputSnh = (In.Snh - Snh)*In.Q/V;
  inputSno = (In.Sno - Sno)*In.Q/V;
  inputSpo = (In.Spo - Spo)*In.Q/V;
  inputSi = (In.Si - Si)*In.Q/V;
  inputSalk = (In.Salk - Salk)*In.Q/V;
  inputSn2 = (In.Sn2 - Sn2)*In.Q/V;
  inputXi = (In.Xi - Xi)*In.Q/V;
  inputXs = (In.Xs - Xs)*In.Q/V;
  inputXh = (In.Xh - Xh)*In.Q/V;
  inputXpao = (In.Xpao - Xpao)*In.Q/V;
  inputXpp = (In.Xpp - Xpp)*In.Q/V;
  inputXpha = (In.Xpha - Xpha)*In.Q/V;
  inputXa = (In.Xa - Xa)*In.Q/V;
  inputXtss = (In.Xtss - Xtss)*In.Q/V;
  inputXmeoh = (In.Xmeoh - Xmeoh)*In.Q/V;
  inputXmep = (In.Xmep - Xmep)*In.Q/V;
  
end deni;

model nitri "ASM2d nitrification tank" 
  // nitrification (aerated) tank, based on the ASM2d model
  
  extends WasteWater.Icons.nitri;
  extends Interfaces.ASM2dbase;
  
  // aeration system dependend parameters
  parameter Modelica.SIunits.Volume V=1000 "Volume of nitrification tank";
  parameter Real alpha=0.7 "Oxygen transfer factor";
  parameter Modelica.SIunits.Length de=4.5 "depth of aeration";
  parameter Real R_air=23.5 "specific oxygen feed factor [gO2/(m^3*m)]";
  WWU.MassConcentration So_sat "Dissolved oxygen saturation";
  Interfaces.WWFlowAsm2din In annotation (extent=[-110, -10; -90, 10]);
  Interfaces.WWFlowAsm2dout Out annotation (extent=[90, -10; 110, 10]);
  Interfaces.WWFlowAsm2dout MeasurePort annotation (extent=[50, 40; 60, 50]);
  Modelica.Blocks.Interfaces.InPort T(final n=1) annotation (extent=[-110, 30; 
        -90, 50]);
  Interfaces.AirFlow AirIn annotation (extent=[-5, -103; 5, -93]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component models the ASM2d processes and reactions taking place in an aerated (nitrification) tank
of a wastewater treatment plant.

The InPort signal gives the tank temperature to the model.

Parameters:

        - all conversion factors and soichiometric and kinetic parameters of the activated sludge model No.2d (ASM2d)
  V     - volume of the tank [m3]
  alpha - oxygen transfer factor
  de    - depth of the aeration system [m]
  R_air - specific oxygen feed factor [g O2/(m3*m)]
"));
equation 
  
  // Temperature dependend oxygen saturation by Simba
  So_sat = 13.89 + (-0.3825 + (0.007311 - 0.00006588*T.signal[1])*T.signal[1])*
    T.signal[1];
  
  // extends the Oxygen differential equation by an aeration term
  // aeration [mgO2/l]; AirIn.Q_air needs to be in 
  // Simulationtimeunit [m3/day^-1]
  aeration = (alpha*(So_sat - So)/So_sat*AirIn.Q_air*R_air*de)/V;
  // aeration = Kla * (So_sat -So);
  
  // volume dependent dilution term of each concentration  
  inputSo = (In.So - So)*In.Q/V;
  inputSf = (In.Sf - Sf)*In.Q/V;
  inputSa = (In.Sa - Sa)*In.Q/V;
  inputSnh = (In.Snh - Snh)*In.Q/V;
  inputSno = (In.Sno - Sno)*In.Q/V;
  inputSpo = (In.Spo - Spo)*In.Q/V;
  inputSi = (In.Si - Si)*In.Q/V;
  inputSalk = (In.Salk - Salk)*In.Q/V;
  inputSn2 = (In.Sn2 - Sn2)*In.Q/V;
  inputXi = (In.Xi - Xi)*In.Q/V;
  inputXs = (In.Xs - Xs)*In.Q/V;
  inputXh = (In.Xh - Xh)*In.Q/V;
  inputXpao = (In.Xpao - Xpao)*In.Q/V;
  inputXpp = (In.Xpp - Xpp)*In.Q/V;
  inputXpha = (In.Xpha - Xpha)*In.Q/V;
  inputXa = (In.Xa - Xa)*In.Q/V;
  inputXtss = (In.Xtss - Xtss)*In.Q/V;
  inputXmeoh = (In.Xmeoh - Xmeoh)*In.Q/V;
  inputXmep = (In.Xmep - Xmep)*In.Q/V;
  
end nitri;

model precipitation "Phosphorus precipitation tank" 
  
  extends WasteWater.Icons.precipitation;
  extends Interfaces.ASM2dbase;
  
  parameter Modelica.SIunits.Volume V=50 "Volume of precipitation tank";
  parameter Real Wsub=2.5 "effective substance in precipitant [mol/kg]";
  parameter Real D=1.4 "density of precipitant [kg/l]";
  parameter Real beta=5.0 "precipitant surplus";
  parameter Real Qmin=5.0 "Minimum flow of precipitant [l/h]";
  parameter Real MP=30.97 "Molar Mass of Phosphorus [g/mol]";
  parameter Real Mpre=55.85 "Molar Mass of precipitant [g/mol]";
  WWU.VolumeFlowRate Qpreci "Dosage flow of precipitant used";
  Real Preci "Concentration of effective substance in precipitant flow
  [g/m³]";
  Real H;
  Interfaces.WWFlowAsm2din In annotation (extent=[-110, -10; -90, 10]);
  Interfaces.WWFlowAsm2dout Out annotation (extent=[90, -10; 110, 10]);
  Interfaces.WWFlowAsm2dout MeasurePort annotation (extent=[50, 40; 60, 50]);
  Modelica.Blocks.Interfaces.InPort T(final n=1) annotation (extent=[-110, 30; 
        -90, 50]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[1, 1], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This ASM2d component is used to model the chemical Phosphorus precipitation
with FeCl3 as precipitant.

Parameters:

      - all ASM2d conversion factors and stoichiometric and kinetic parameters
 V    - Volume of precipitation tank [m3]
 Wsub - effective substance in precipitant [mol/kg]
 D    - density of precipitant [kg/l]
 beta - precipitant surplus
 Qmin - minimum flow rate of precipitant [l/h]
 MP   - molar mass of phosphorus [g/mol]
 Mpre - molar mass of precipitant [g/mol]
"));
equation 
  
  aeration = 0;
  //no aerotation in this tank
  
  H = (1/Wsub)*(1/(D*1000))*(1/Mpre)*Mpre/MP*beta*In.Spo*In.Q;
  Qpreci = if H < (Qmin*24/1000) then Qmin*24/1000 else H;
  // the factor 1.91 is a stoichiometric coefficient between Fe3+ and Xmeoh
  Preci = 1.91*Wsub*D*Mpre*1000;
  
  // volume dependent dilution term of each concentration  
  inputSo = (In.So - So)*In.Q/V;
  inputSf = (In.Sf - Sf)*In.Q/V;
  inputSa = (In.Sa - Sa)*In.Q/V;
  inputSnh = (In.Snh - Snh)*In.Q/V;
  inputSno = (In.Sno - Sno)*In.Q/V;
  inputSpo = (In.Spo - Spo)*In.Q/V;
  inputSi = (In.Si - Si)*In.Q/V;
  inputSalk = (In.Salk - Salk)*In.Q/V;
  inputSn2 = (In.Sn2 - Sn2)*In.Q/V;
  inputXi = (In.Xi - Xi)*In.Q/V;
  inputXs = (In.Xs - Xs)*In.Q/V;
  inputXh = (In.Xh - Xh)*In.Q/V;
  inputXpao = (In.Xpao - Xpao)*In.Q/V;
  inputXpp = (In.Xpp - Xpp)*In.Q/V;
  inputXpha = (In.Xpha - Xpha)*In.Q/V;
  inputXa = (In.Xa - Xa)*In.Q/V;
  inputXtss = (In.Xtss - Xtss)*In.Q/V;
  inputXmeoh = (In.Xmeoh - Xmeoh)*In.Q/V + Qpreci*Preci/V;
  inputXmep = (In.Xmep - Xmep)*In.Q/V;
  
end precipitation;

model SecClarModTakacs "ASM2d Secondary Clarifier Model based on Takacs" 
  
  extends WasteWater.Icons.SecClar;
  extends ASM2d.SecClar.Takacs.Interfaces.ratios;
  package SCP = ASM2d.SecClar.Takacs;
  package SI = Modelica.SIunits;
  package WI = ASM2d.Interfaces;
  package WWU = WasteWater.WasteWaterUnits;
  
  parameter SI.Length hsc=4.0 "height of secondary clarifier";
  parameter Integer n=10 "number of layers of SC model";
  parameter SI.Length zm=hsc/(1.0*n) "height of m-th secondary clarifier layer"
    ;
  parameter SI.Area Asc=1500.0 "area of secondary clarifier";
  parameter WWU.MassConcentration Xt=3000.0 "threshold for X";
  
  // total sludge concentration in clarifier feed
  WWU.MassConcentration Xf;
  WI.WWFlowAsm2din Feed annotation (extent=[-110, 4; -90, 24]);
  WI.WWFlowAsm2dout Effluent annotation (extent=[92, 47; 112, 67]);
  WI.WWFlowAsm2dout Return annotation (extent=[-40, -106; -20, -86]);
  WI.WWFlowAsm2dout Waste annotation (extent=[20, -106; 40, -86]);
  
  // layers 1 to 10
  SCP.bottom_layer S1(
    zm=zm, 
    Asc=Asc, 
    Xf=Xf, 
    rXi=rXi, 
    rXs=rXs, 
    rXh=rXh, 
    rXpao=rXpao, 
    rXpp=rXpp, 
    rXpha=rXpha, 
    rXa=rXa, 
    rXmeoh=rXmeoh, 
    rXmep=rXmep) annotation (extent=[-35, -93; 35, -78]);
  SCP.lower_layer S2(
    zm=zm, 
    Asc=Asc, 
    Xf=Xf) annotation (extent=[-35, -74; 35, -59]);
  SCP.lower_layer S3(
    zm=zm, 
    Asc=Asc, 
    Xf=Xf) annotation (extent=[-35, -55; 35, -40]);
  SCP.lower_layer S4(
    zm=zm, 
    Asc=Asc, 
    Xf=Xf) annotation (extent=[-35, -36; 35, -21]);
  SCP.lower_layer S5(
    zm=zm, 
    Asc=Asc, 
    Xf=Xf) annotation (extent=[-35, -17; 35, -2]);
  SCP.feed_layer S6(
    zm=zm, 
    Asc=Asc, 
    Xf=Xf) annotation (extent=[-35, 2; 35, 17]);
  SCP.upper_layer S7(
    zm=zm, 
    Asc=Asc, 
    Xf=Xf, 
    Xt=Xt) annotation (extent=[-35, 21; 35, 36]);
  SCP.upper_layer S8(
    zm=zm, 
    Asc=Asc, 
    Xt=Xt, 
    Xf=Xf) annotation (extent=[-35, 40; 35, 55]);
  SCP.upper_layer S9(
    zm=zm, 
    Asc=Asc, 
    Xf=Xf, 
    Xt=Xt) annotation (extent=[-35, 59; 35, 74]);
  SCP.top_layer S10(
    zm=zm, 
    Asc=Asc, 
    Xf=Xf, 
    Xt=Xt, 
    rXi=rXi, 
    rXs=rXs, 
    rXh=rXh, 
    rXpao=rXpao, 
    rXpp=rXpp, 
    rXpha=rXpha, 
    rXa=rXa, 
    rXmeoh=rXmeoh, 
    rXmep=rXmep) annotation (extent=[-35, 78; 35, 93]);
equation 
  
  connect(S1.Up, S2.Dn) annotation (points=[-2.22045e-15, -78; -2.22045e-15, -
        74]);
  connect(S2.Up, S3.Dn) annotation (points=[-2.22045e-15, -59; -2.22045e-15, -
        55]);
  connect(S3.Up, S4.Dn) annotation (points=[-2.22045e-15, -40; -2.22045e-15, -
        36]);
  connect(S5.Up, S6.Dn) annotation (points=[-2.22045e-15, -2; -2.22045e-15, 2])
    ;
  connect(S6.Up, S7.Dn) annotation (points=[-2.22045e-15, 17; -2.22045e-15, 21]
    );
  connect(S7.Up, S8.Dn) annotation (points=[-2.22045e-15, 36; -2.22045e-15, 40]
    );
  connect(S9.Up, S10.Dn) annotation (points=[-2.22045e-15, 74; -2.22045e-15, 78
        ]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.12, 
      y=0.03, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component models an ASM2d 10 - layer secondary clarifier model with 4 layers above the feed_layer (including top_layer)
and 5 layers below the feed_layer (including bottom_layer) based on Takac`s theory.

Parameters:
  hsc -  height of clarifier [m]
  n   -  number of layers
  Asc -  surface area of sec. clar. [m2]
  Xt  -  threshold value for Xtss [mg/l]

"));
  connect(S4.Up, S5.Dn) annotation (points=[-2.22045e-15, -21; -2.22045e-15, -
        17]);
  connect(S8.Up, S9.Dn) annotation (points=[-2.22045e-15, 55; -2.22045e-15, 59]
    );
  connect(Feed, S6.In) annotation (points=[-100, 10; -67.5, 10; -67.5, 9.8; -35
        , 9.8]);
  connect(S1.PQw, Waste) annotation (points=[17.5, -93; 17.5, -100; 30, -100]);
  connect(S10.Out, Effluent) annotation (points=[35, 85.5; 67.5, 85.5; 67.5, 57
        ; 100, 57]);
  connect(S1.PQr, Return) annotation (points=[-21, -93; -21, -100; -30, -100]);
  
  // total sludge concentration in clarifier feed
  Xf = Feed.Xtss;
  
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
  
end SecClarModTakacs;

model blower "Blower for the aeration of the nitrification tanks" 
  
  package WWU = WasteWater.WasteWaterUnits;
  extends WasteWater.Icons.blower;
  
  parameter WWU.VolumeFlowRate Q_max=20000 "maximum blower capacity";
  parameter WWU.VolumeFlowRate Q_min=0.0 "minimum blower capacity";
  Real H;
  // this is just a help variable to reduce expressions
  
  Interfaces.AirFlow AirOut annotation (extent=[-20, 90; 0, 110]);
  Modelica.Blocks.Interfaces.InPort u(final n=1) annotation (extent=[88, -40; 
        108, -20], rotation=180);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component models a blower of a wastewater treatment plant which generates an airflow that is needed
for the nitrification.
The blower is connected to the nitrification tank.
The airflow is controlled by a signal u (-1 <= u <= 1).

Parameter:

  Qmax - maximum blower capacity [m3 Air/d], this is produced when the control signal u is 1 or greater.
  Qmin - minimum blower capacity [m3 Air/d], this is produced when the control signal u is -1 or below.

"));
equation 
  
  H = 0.5*(-Q_min + Q_max) + u.signal[1]*0.5*(-Q_min + Q_max) + Q_min;
  AirOut.Q_air = -(if H > Q_max then Q_max else if H < Q_min then Q_min else H)
    ;
  
end blower;

model pump "ASM2d wastewater pump" 
  
  package WWU = WasteWater.WasteWaterUnits;
  extends WasteWater.Icons.pump;
  
  parameter WWU.VolumeFlowRate Q_min=0.0 "minimum pump capacity";
  parameter WWU.VolumeFlowRate Q_max=20000 "maximum pump capacity";
  
  Real H;
  //help variable to reduce expressions
  
  Interfaces.WWFlowAsm2din In annotation (extent=[-110, -43; -90, -23]);
  Interfaces.WWFlowAsm2dout Out annotation (extent=[90, 18; 110, 38]);
  Modelica.Blocks.Interfaces.InPort u(final n=1) annotation (extent=[-98, 15; -
        78, 35]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[1, 1], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component models an ASM2d wastewater pump. It generates a wastewater flow
that is controlled by the signal u (-1 <= u <=1).

Parameter:

  Qmax - maximum pump capacity [m3/d], this is produced when the control signal u is 1 or greater.
  Qmin - minimum pump capacity [m3/d], this is produced when the control signal u is -1 or below.

"));
equation 
  
  H = 0.5*(-Q_min + Q_max) + u.signal[1]*0.5*(-Q_min + Q_max) + Q_min;
  
  Out.Q = -(if H > Q_max then Q_max else if H < Q_min then Q_min else H);
  Out.Q + In.Q = 0;
  
  Out.So = In.So;
  Out.Sf = In.Sf;
  Out.Sa = In.Sa;
  Out.Snh = In.Snh;
  Out.Sno = In.Sno;
  Out.Spo = In.Spo;
  Out.Si = In.Si;
  Out.Salk = In.Salk;
  Out.Sn2 = In.Sn2;
  Out.Xi = In.Xi;
  Out.Xs = In.Xs;
  Out.Xh = In.Xh;
  Out.Xpao = In.Xpao;
  Out.Xpp = In.Xpp;
  Out.Xpha = In.Xpha;
  Out.Xa = In.Xa;
  Out.Xtss = In.Xtss;
  Out.Xmeoh = In.Xmeoh;
  Out.Xmep = In.Xmep;
  
end pump;

model FlowSource "Flowsource" 
  
  extends WasteWater.Icons.FlowSource;
  Interfaces.WWFlowAsm2dout Out annotation (extent=[88, -80; 108, -60]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component is used to feed an ASM2d wwtp model with flow data from measurement
when e.g. concentration is measured after the primary clarifier.

The dimension of InPort is 1.

  1 volumeflowrate Q of incoming wastewater [m3/d]"), 
    Diagram(
      Ellipse(extent=[-54, 54; 56, -54], style(color=8, fillColor=8)), 
      Polygon(points=[-8, -54; -14, -52; -24, -48; -32, -44; -36, -40; -42, -34
            ; -48, -26; -50, -20; 52, -20; 50, -26; 46, -32; 42, -36; 38, -40; 
            34, -44; 30, -46; 26, -48; 22, -50; 16, -52; 10, -54; 4, -54; 0, -
            54; -8, -54], style(pattern=0, fillColor=70)), 
      Ellipse(extent=[-54, 54; 56, -54], style(color=0, thickness=2)), 
      Rectangle(extent=[-4, -52; 4, -74], style(pattern=0, fillColor=70)), 
      Rectangle(extent=[4, -74; 88, -68], style(pattern=0, fillColor=70)), 
      Line(points=[-4, -54; -4, -74; 88, -74], style(color=0, thickness=2)), 
      Line(points=[4, -54; 4, -68; 88, -68], style(color=0, thickness=2))));
  Modelica.Blocks.Interfaces.InPort data(final n=1) annotation (extent=[-100, -
        10; -80, 10]);
equation 
  
  Out.Q = -data.signal[1];
  
end FlowSource;

model WWSource "Wastewater source" 
  
  extends WasteWater.Icons.WWSource;
  extends ASM2d.Interfaces.conversion_factors;
  
  Interfaces.WWFlowAsm2dout Out annotation (extent=[88, -80; 108, -60]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component provides all ASM2d data at the influent of a wastewater treatment plant.
The dimension of InPort is 19.

  1 volumeflowrate Q of incoming wastewater [m3/d]
  2 So   [g O2/m3]
  3 Sf   [g COD/m3]
  4 Sa   [g COD/m3]
  5 Snh  [g N/m3]
  6 Sno  [g N/m3]
  7 Spo  [g P/m3]
  8 Si   [g COD/m3]
  9 Salk [mmol/l]
 10 Sn2  [g N/m3]
 11 Xi   [g COD/m3]
 12 Xs   [g COD/m3]
 13 Xh   [g COD/m3]
 14 Xpao [g COD/m3]
 15 Xpp  [g P/m3]
 16 Xpha [g COD/m3]
 17 Xa   [g COD/m3]
 18 Xmeoh [g TSS/m3]
 19 Xmep [g TSS/m3]

Parameters:
   - all ASM2d conversion factors for the calculation of Xtss."));
  Modelica.Blocks.Interfaces.InPort data(final n=19) annotation (extent=[-100, 
        -10; -80, 10]);
equation 
  
  Out.Q = -data.signal[1];
  Out.So = data.signal[2];
  Out.Sf = data.signal[3];
  Out.Sa = data.signal[4];
  Out.Snh = data.signal[5];
  Out.Sno = data.signal[6];
  Out.Spo = data.signal[7];
  Out.Si = data.signal[8];
  Out.Salk = data.signal[9];
  Out.Sn2 = data.signal[10];
  Out.Xi = data.signal[11];
  Out.Xs = data.signal[12];
  Out.Xh = data.signal[13];
  Out.Xpao = data.signal[14];
  Out.Xpp = data.signal[15];
  Out.Xpha = data.signal[16];
  Out.Xa = data.signal[17];
  Out.Xtss = i_TSS_Xi*Out.Xi + i_TSS_Xs*Out.Xs + i_TSS_BM*(Out.Xh + Out.Xpao + 
    Out.Xa) + 3.23*Out.Xpp + 0.6*Out.Xpha + Out.Xmeoh + Out.Xmep;
  Out.Xmeoh = data.signal[18];
  Out.Xmep = data.signal[19];
  
end WWSource;

model EffluentSink "Receiving water (river)" 
  // only for graphical termination in diagram layer, no equations needed
  
  extends WasteWater.Icons.EffluentSink;
  Interfaces.WWFlowAsm2din In annotation (extent=[-110, 10; -90, 30]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component terminates an ASM2d wastewater treatment plant model e.g. the wastewater flow to the receiving water.
"));
equation 
  
end EffluentSink;

model SludgeSink "Wastesludge sink" 
  // only for graphical termination in diagram layer, no equations needed
  
  extends WasteWater.Icons.SludgeSink;
  Interfaces.WWFlowAsm2din In annotation (extent=[-110, -22; -90, -2]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[1, 1], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component terminates the waste sludge stream of an ASM2d wastewater treatment plant model.
Storage or further sludge treatment is not jet considered."));
equation 
  
end SludgeSink;

model ControlledDivider2 "Controlled flow divider" 
  // divides one flow of wastewater into 2 Flows controlled by the
  
  // input signal u; u=1 means Out1.Q=In.Q and u=0 means Out2.Q=In.Q
  extends WasteWater.Icons.ControlledDivider2;
  
  Interfaces.WWFlowAsm2din In annotation (extent=[-110, -7; -90, 13]);
  Interfaces.WWFlowAsm2dout Out1 annotation (extent=[90, 15; 110, 35]);
  Interfaces.WWFlowAsm2dout Out2 annotation (extent=[90, -25; 110, -5]);
  Modelica.Blocks.Interfaces.InPort u(final n=1) annotation (
    extent=[-10, -70; 10, -50], 
    rotation=90, 
    layer="icon");
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[1, 1], 
      component=[20, 20]), 
    Window(
      x=0.29, 
      y=0.31, 
      width=0.68, 
      height=0.6), 
    Documentation(info="This component divides one wastewater flow (ASM2d) into two flows which are controlled by the signal u (0...1).
Is u.signal=1, the flow goes to output 1 (Out1) and is u.signal=0, the flow goes to output 2 (Out2).
The concentrations of the outport-flows are equal to the concentration at inport."
      ));
equation 
  
  Out1.Q = -In.Q*u.signal[1];
  Out2.Q = -In.Q*(1 - u.signal[1]);
  
  Out1.So = In.So;
  Out1.Sf = In.Sf;
  Out1.Sa = In.Sa;
  Out1.Snh = In.Snh;
  Out1.Sno = In.Sno;
  Out1.Spo = In.Spo;
  Out1.Si = In.Si;
  Out1.Salk = In.Salk;
  Out1.Sn2 = In.Sn2;
  Out1.Xi = In.Xi;
  Out1.Xs = In.Xs;
  Out1.Xh = In.Xh;
  Out1.Xpao = In.Xpao;
  Out1.Xpp = In.Xpp;
  Out1.Xpha = In.Xpha;
  Out1.Xa = In.Xa;
  Out1.Xtss = In.Xtss;
  Out1.Xmeoh = In.Xmeoh;
  Out1.Xmep = In.Xmep;
  
  Out2.So = In.So;
  Out2.Sf = In.Sf;
  Out2.Sa = In.Sa;
  Out2.Snh = In.Snh;
  Out2.Sno = In.Sno;
  Out2.Spo = In.Spo;
  Out2.Si = In.Si;
  Out2.Salk = In.Salk;
  Out2.Sn2 = In.Sn2;
  Out2.Xi = In.Xi;
  Out2.Xs = In.Xs;
  Out2.Xh = In.Xh;
  Out2.Xpao = In.Xpao;
  Out2.Xpp = In.Xpp;
  Out2.Xpha = In.Xpha;
  Out2.Xa = In.Xa;
  Out2.Xtss = In.Xtss;
  Out2.Xmeoh = In.Xmeoh;
  Out2.Xmep = In.Xmep;
  
end ControlledDivider2;

model divider2 "Flowdivider" 
  
  
    // divides one flow of wastewater into 2 Flows; one amout needs to be specified
  
  extends WasteWater.Icons.divider2;
  Interfaces.WWFlowAsm2din In annotation (extent=[-110, -7; -90, 13]);
  Interfaces.WWFlowAsm2dout Out1 annotation (extent=[90, 15; 110, 35]);
  Interfaces.WWFlowAsm2dout Out2 annotation (extent=[90, -25; 110, -5]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[1, 1], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info=
          "This component divides one ASM2d wastewater flow into two ASM2d wastewater flows."
      ));
equation 
  
  In.Q + Out1.Q + Out2.Q = 0;
  
  Out1.So = In.So;
  Out1.Sf = In.Sf;
  Out1.Sa = In.Sa;
  Out1.Snh = In.Snh;
  Out1.Sno = In.Sno;
  Out1.Spo = In.Spo;
  Out1.Si = In.Si;
  Out1.Salk = In.Salk;
  Out1.Sn2 = In.Sn2;
  Out1.Xi = In.Xi;
  Out1.Xs = In.Xs;
  Out1.Xh = In.Xh;
  Out1.Xpao = In.Xpao;
  Out1.Xpp = In.Xpp;
  Out1.Xpha = In.Xpha;
  Out1.Xa = In.Xa;
  Out1.Xtss = In.Xtss;
  Out1.Xmeoh = In.Xmeoh;
  Out1.Xmep = In.Xmep;
  
  Out2.So = In.So;
  Out2.Sf = In.Sf;
  Out2.Sa = In.Sa;
  Out2.Snh = In.Snh;
  Out2.Sno = In.Sno;
  Out2.Spo = In.Spo;
  Out2.Si = In.Si;
  Out2.Salk = In.Salk;
  Out2.Sn2 = In.Sn2;
  Out2.Xi = In.Xi;
  Out2.Xs = In.Xs;
  Out2.Xh = In.Xh;
  Out2.Xpao = In.Xpao;
  Out2.Xpp = In.Xpp;
  Out2.Xpha = In.Xpha;
  Out2.Xa = In.Xa;
  Out2.Xtss = In.Xtss;
  Out2.Xmeoh = In.Xmeoh;
  Out2.Xmep = In.Xmep;
  
end divider2;

model mixer2 "Mixer of two ASM2d characterised flows" 
  
  extends WasteWater.Icons.mixer2;
  Interfaces.WWFlowAsm2din In1 annotation (extent=[-110, 15; -90, 35]);
  Interfaces.WWFlowAsm2din In2 annotation (extent=[-110, -25; -90, -5]);
  Interfaces.WWFlowAsm2dout Out annotation (extent=[90, -6; 110, 14]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[1, 1], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info=
          "This component mixes two flows of wastewater (ASM2d) of different concentration and different amount."
      ));
equation 
  
  In1.Q + In2.Q + Out.Q = 0;
  
  Out.So = (In1.So*In1.Q + In2.So*In2.Q)/(In1.Q + In2.Q);
  Out.Sf = (In1.Sf*In1.Q + In2.Sf*In2.Q)/(In1.Q + In2.Q);
  Out.Sa = (In1.Sa*In1.Q + In2.Sa*In2.Q)/(In1.Q + In2.Q);
  Out.Snh = (In1.Snh*In1.Q + In2.Snh*In2.Q)/(In1.Q + In2.Q);
  Out.Sno = (In1.Sno*In1.Q + In2.Sno*In2.Q)/(In1.Q + In2.Q);
  Out.Spo = (In1.Spo*In1.Q + In2.Spo*In2.Q)/(In1.Q + In2.Q);
  Out.Si = (In1.Si*In1.Q + In2.Si*In2.Q)/(In1.Q + In2.Q);
  Out.Salk = (In1.Salk*In1.Q + In2.Salk*In2.Q)/(In1.Q + In2.Q);
  Out.Sn2 = (In1.Sn2*In1.Q + In2.Sn2*In2.Q)/(In1.Q + In2.Q);
  Out.Xi = (In1.Xi*In1.Q + In2.Xi*In2.Q)/(In1.Q + In2.Q);
  Out.Xs = (In1.Xs*In1.Q + In2.Xs*In2.Q)/(In1.Q + In2.Q);
  Out.Xh = (In1.Xh*In1.Q + In2.Xh*In2.Q)/(In1.Q + In2.Q);
  Out.Xpao = (In1.Xpao*In1.Q + In2.Xpao*In2.Q)/(In1.Q + In2.Q);
  Out.Xpp = (In1.Xpp*In1.Q + In2.Xpp*In2.Q)/(In1.Q + In2.Q);
  Out.Xpha = (In1.Xpha*In1.Q + In2.Xpha*In2.Q)/(In1.Q + In2.Q);
  Out.Xa = (In1.Xa*In1.Q + In2.Xa*In2.Q)/(In1.Q + In2.Q);
  Out.Xtss = (In1.Xtss*In1.Q + In2.Xtss*In2.Q)/(In1.Q + In2.Q);
  Out.Xmeoh = (In1.Xmeoh*In1.Q + In2.Xmeoh*In2.Q)/(In1.Q + In2.Q);
  Out.Xmep = (In1.Xmep*In1.Q + In2.Xmep*In2.Q)/(In1.Q + In2.Q);
  
end mixer2;

model mixer3 "Mixer of 3 ASM2d characterised flows" 
  
  extends WasteWater.Icons.mixer3;
  Interfaces.WWFlowAsm2din In1 annotation (extent=[-110, 25; -90, 45]);
  Interfaces.WWFlowAsm2din In2 annotation (extent=[-110, -15; -90, 5]);
  Interfaces.WWFlowAsm2din In3 annotation (extent=[-110, -55; -90, -35]);
  Interfaces.WWFlowAsm2dout Out annotation (extent=[90, -14; 110, 6]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[1, 1], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info=
          "This component mixes 3 flows of wastewater (ASM2d) of different concentration and different amount."
      ));
equation 
  
  In1.Q + In2.Q + In3.Q + Out.Q = 0;
  Out.So = (In1.So*In1.Q + In2.So*In2.Q + In3.So*In3.Q)/(In1.Q + In2.Q + In3.Q)
    ;
  Out.Sf = (In1.Sf*In1.Q + In2.Sf*In2.Q + In3.Sf*In3.Q)/(In1.Q + In2.Q + In3.Q)
    ;
  Out.Sa = (In1.Sa*In1.Q + In2.Sa*In2.Q + In3.Sa*In3.Q)/(In1.Q + In2.Q + In3.Q)
    ;
  Out.Snh = (In1.Snh*In1.Q + In2.Snh*In2.Q + In3.Snh*In3.Q)/(In1.Q + In2.Q + 
    In3.Q);
  Out.Sno = (In1.Sno*In1.Q + In2.Sno*In2.Q + In3.Sno*In3.Q)/(In1.Q + In2.Q + 
    In3.Q);
  Out.Spo = (In1.Spo*In1.Q + In2.Spo*In2.Q + In3.Spo*In3.Q)/(In1.Q + In2.Q + 
    In3.Q);
  Out.Si = (In1.Si*In1.Q + In2.Si*In2.Q + In3.Si*In3.Q)/(In1.Q + In2.Q + In3.Q)
    ;
  Out.Salk = (In1.Salk*In1.Q + In2.Salk*In2.Q + In3.Salk*In3.Q)/(In1.Q + In2.Q
     + In3.Q);
  Out.Sn2 = (In1.Sn2*In1.Q + In2.Sn2*In2.Q + In3.Sn2*In3.Q)/(In1.Q + In2.Q + 
    In3.Q);
  Out.Xi = (In1.Xi*In1.Q + In2.Xi*In2.Q + In3.Xi*In3.Q)/(In1.Q + In2.Q + In3.Q)
    ;
  Out.Xs = (In1.Xs*In1.Q + In2.Xs*In2.Q + In3.Xs*In3.Q)/(In1.Q + In2.Q + In3.Q)
    ;
  Out.Xh = (In1.Xh*In1.Q + In2.Xh*In2.Q + In3.Xh*In3.Q)/(In1.Q + In2.Q + In3.Q)
    ;
  Out.Xpao = (In1.Xpao*In1.Q + In2.Xpao*In2.Q + In3.Xpao*In3.Q)/(In1.Q + In2.Q
     + In3.Q);
  Out.Xpp = (In1.Xpp*In1.Q + In2.Xpp*In2.Q + In3.Xpp*In3.Q)/(In1.Q + In2.Q + 
    In3.Q);
  Out.Xpha = (In1.Xpha*In1.Q + In2.Xpha*In2.Q + In3.Xpha*In3.Q)/(In1.Q + In2.Q
     + In3.Q);
  Out.Xa = (In1.Xa*In1.Q + In2.Xa*In2.Q + In3.Xa*In3.Q)/(In1.Q + In2.Q + In3.Q)
    ;
  Out.Xtss = (In1.Xtss*In1.Q + In2.Xtss*In2.Q + In3.Xtss*In3.Q)/(In1.Q + In2.Q
     + In3.Q);
  Out.Xmeoh = (In1.Xmeoh*In1.Q + In2.Xmeoh*In2.Q + In3.Xmeoh*In3.Q)/(In1.Q + 
    In2.Q + In3.Q);
  Out.Xmep = (In1.Xmep*In1.Q + In2.Xmep*In2.Q + In3.Xmep*In3.Q)/(In1.Q + In2.Q
     + In3.Q);
  
end mixer3;

model sensor_COD "Ideal sensor to measure chemical oxygen demand (COD)" 
  
  extends WasteWater.Icons.sensor_COD;
  
  Interfaces.WWFlowAsm2din In annotation (extent=[-10, -110; 10, -90]);
  Modelica.Blocks.Interfaces.OutPort COD(final n=1) annotation (extent=[88, -10
        ; 108, 10]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component measures the chemical oxygen demand (COD) concentration [g/m3]
of ASM2d wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
equation 
  
  In.Q = 0.0;
  COD.signal[1] = In.Sf + In.Sa + In.Si + In.Xi + In.Xs + In.Xh + In.Xpao + In.
    Xpha + In.Xa;
  
end sensor_COD;

model sensor_NH "Ideal sensor to measure ammonium nitrogen" 
  
  extends WasteWater.Icons.sensor_NH;
  
  Interfaces.WWFlowAsm2din In annotation (extent=[-10, -110; 10, -90]);
  Modelica.Blocks.Interfaces.OutPort Snh(final n=1) annotation (extent=[88, -10
        ; 108, 10]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.63, 
      y=0.04, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component measures the ammonium nitrogen concentration [g/m3]
of ASM2d wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
equation 
  
  In.Q = 0;
  Snh.signal[1] = In.Snh;
  
end sensor_NH;

model sensor_NO "Ideal sensor to measure nitrate nitrogen" 
  
  extends WasteWater.Icons.sensor_NO;
  
  Interfaces.WWFlowAsm2din In annotation (extent=[-10, -110; 10, -90]);
  Modelica.Blocks.Interfaces.OutPort Sno(final n=1) annotation (extent=[88, -10
        ; 108, 10]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component measures the nitrate nitrogen concentration [g/m3]
of ASM2d wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
equation 
  
  In.Q = 0;
  Sno.signal[1] = In.Sno;
  
end sensor_NO;

model sensor_O2 "Ideal sensor to measure dissolved oxygen concentration" 
  
  extends WasteWater.Icons.sensor_O2;
  
  Interfaces.WWFlowAsm2din In annotation (extent=[-10, -110; 10, -90]);
  Modelica.Blocks.Interfaces.OutPort So(final n=1) annotation (extent=[88, -10
        ; 108, 10]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component measures the dissolved oxygen concentration [g/m3]
of ASM2d wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"), 
    Diagram(
      Ellipse(extent=[-50, 50; 50, -50], style(
          color=0, 
          thickness=2, 
          fillColor=52)), 
      Text(extent=[-80, 100; 80, 60], string="%name"), 
      Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
      Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
      Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
      Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
      Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
      Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
      Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, fillColor
            =0)), 
      Text(extent=[-36, -10; 36, -32], string="O2"), 
      Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
      Line(points=[50, 0; 88, 0], style(color=0))));
equation 
  
  In.Q = 0;
  So.signal[1] = In.So;
  
end sensor_O2;

model sensor_PO "Ideal sensor to measure dissolved phosphorus" 
  
  extends WasteWater.Icons.sensor_PO;
  
  Interfaces.WWFlowAsm2din In annotation (extent=[-10, -110; 10, -90]);
  Modelica.Blocks.Interfaces.OutPort Spo(final n=1) annotation (extent=[88, -10
        ; 108, 10]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.57, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component measures the dissolves phosphorus concentration [g/m3]
of ASM2d wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
equation 
  
  In.Q = 0;
  Spo.signal[1] = In.Spo;
  
end sensor_PO;

model sensor_Q 
  "Ideal sensor to measure the flow rate of an ASM2d wastewater stream" 
  
  extends WasteWater.Icons.sensor_Q;
  
  Interfaces.WWFlowAsm2din In annotation (extent=[-110, -10; -90, 10]);
  Interfaces.WWFlowAsm2dout Out annotation (extent=[92, -10; 112, 10]);
  Modelica.Blocks.Interfaces.OutPort Q(final n=1) annotation (extent=[-10, -110
        ; 10, -90], rotation=-90);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component measures the flow of an ASM2d wastewater stream and provides
the result as output signal (to be further processed with blocks of
the Modelica.Blocks library).
"));
equation 
  
  In.Q + Out.Q = 0;
  Q.signal[1] = In.Q;
  // eventually abs(In.Q) to be shure to have pos. signal
  In.So = Out.So;
  In.Sf = Out.Sf;
  In.Sa = Out.Sa;
  In.Snh = Out.Snh;
  In.Sno = Out.Sno;
  In.Spo = Out.Spo;
  In.Si = Out.Si;
  In.Salk = Out.Salk;
  In.Sn2 = Out.Sn2;
  In.Xi = Out.Xi;
  In.Xs = Out.Xs;
  In.Xh = Out.Xh;
  In.Xpao = Out.Xpao;
  In.Xpp = Out.Xpp;
  In.Xpha = Out.Xpha;
  In.Xa = Out.Xa;
  In.Xtss = Out.Xtss;
  In.Xmeoh = Out.Xmeoh;
  In.Xmep = Out.Xmep;
  
end sensor_Q;

model sensor_TKN "Ideal TKN and total nitrogen sensor" 
  
  extends WasteWater.Icons.sensor_TKN;
  extends Interfaces.conversion_factors;
  Interfaces.WWFlowAsm2din In annotation (extent=[-10, -110; 10, -90]);
  Modelica.Blocks.Interfaces.OutPort TKN(final n=2) annotation (extent=[88, -10
        ; 108, 10]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.57, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component measures the Total Kjeldal Nitrogen (TKN) and the
total nitrogen (N_total) concentration [g/m3] of ASM2d wastewater
and provides the result as output signal (to be further processed
with blocks of the Modelica.Blocks library).

signal[1] - TKN
signal[2] - N_total
"));
equation 
  
  In.Q = 0.0;
  TKN.signal[1] = In.Snh + i_N_Si*In.Si + i_N_Sf*In.Sf + i_N_Xi*In.Xi + i_N_Xs*
    In.Xs + i_N_BM*(In.Xh + In.Xpao + In.Xa);
  TKN.signal[2] = TKN.signal[1] + In.Sno;
  
end sensor_TKN;

model sensor_TP 
  "Ideal sensor to measure the total phosphorus concentration in ASM2d wastewater"
   
  
  extends WasteWater.Icons.sensor_TP;
  extends Interfaces.conversion_factors;
  Interfaces.WWFlowAsm2din In annotation (extent=[-10, -110; 10, -90]);
  annotation (Documentation(info="This component measures the total phosphorus concentration [g/m3]
of ASM2d wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"), Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]));
  Modelica.Blocks.Interfaces.OutPort TP(final n=1) annotation (extent=[88, -10
        ; 108, 10]);
equation 
  
  In.Q = 0.0;
  TP.signal[1] = In.Spo + In.Xpp + i_P_Sf*In.Sf + i_P_Si*In.Si + i_P_Xi*In.Xi
     + i_P_Xs*In.Xs + i_P_BM*(In.Xh + In.Xa + In.Xpao) + In.Xmep/4.87;
  
end sensor_TP;

model sensor_TSS 
  "Ideal sensor to measure total suspended solids concentration (ASM2d)" 
  
  extends WasteWater.Icons.sensor_TSS;
  Interfaces.WWFlowAsm2din In annotation (extent=[-10, -110; 10, -90]);
  Modelica.Blocks.Interfaces.OutPort TSS(final n=1) annotation (extent=[88, -10
        ; 108, 10]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="This component measures the total suspended solids concentration [g/m3]
of ASM2d wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
equation 
  
  In.Q = 0;
  TSS.signal[1] = In.Xtss;
  
end sensor_TSS;
end ASM2d;
