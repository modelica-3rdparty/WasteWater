package Examples 
  "Demonstration examples of the components of the ASM2d library" 
  
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
    Documentation(info="This package contains example ASM2d wastewater treatment plant models to demonstrate the usage of 
the WasteWater.ASM2d library.
Open the models and simulate them according to the description provided in the models.

The following demo models are present:

 - SmallPlant
 - BenchPlant
 - ComplexPlant

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2003, Gerald Reichl
"));
  class SmallPlant "Small WWTP Configuration" 
    import WasteWater;
    
    //Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark
    extends Modelica.Icons.Example;
    
    //Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark
    annotation (
      Coordsys(
        extent=[-120, -100; 120, 105], 
        grid=[1, 1], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.39, 
        height=0.58), 
      Diagram(Line(points=[-22, 58; -22, 58], style(color=3))), 
      Documentation(info="This fictitious plant provides an ASM2d example model with a small number of equations.
It consists of one denitrification and 2 nitrification tanks and a settler.

Change into the directory ../ASM2d and translate the model.
Before simulating the model load initial values from the script file small_asm2d.mos
that is provided besides the model.
A 14 days dynamic influent data file is provided. So you may simulate up to 14 days.
But start with 1 day as it may take some time for simulation.
After simulation you may have a look at internal concentrations but most interesting
are the relevant concentrations at the effluent of a plant which can be viewed via the 
sensors at the effluent of the secondary clarifier.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de
"));
    ASM2d.EffluentSink Effluent annotation (extent=[88, -28; 108, -8]);
    ASM2d.SludgeSink WasteSludge annotation (extent=[87, -51; 107, -31]);
    ASM2d.divider2 divider annotation (extent=[20, -6; 40, 14]);
    ASM2d.nitri tank3(V=1333) annotation (extent=[-5, -6; 15, 14]);
    ASM2d.nitri tank2(V=1333) annotation (extent=[-32, -6; -12, 14]);
    ASM2d.deni tank1(V=3000) annotation (extent=[-65, -6; -45, 14]);
    ASM2d.mixer3 mixer annotation (extent=[-104, 22; -84, 42]);
    ModelicaAdditions.Tables.CombiTableTime CombiTableTime(
      tableName="Inf_dry", 
      fileName="Inf_dry.txt", 
      icol={21,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}) annotation (
        extent=[-114, 78; -94, 98]);
    ASM2d.WWSource WWSource annotation (extent=[-88, 78; -68, 98]);
    ASM2d.blower blower1(Q_max=34574.2654508612) annotation (extent=[-32, -62; 
          -12, -42]);
    ASM2d.blower blower2(Q_max=34574.2654508612) annotation (extent=[-4, -62; 
          16, -42]);
    ASM2d.sensor_O2 sensor_O2 annotation (extent=[0, 18; 20, 38]);
    Modelica.Blocks.Math.Feedback Feedback annotation (extent=[62, 40; 82, 60])
      ;
    Modelica.Blocks.Continuous.PI PI1(k={500}, T={0.001}) annotation (extent=[
          88, 40; 108, 60]);
    Modelica.Blocks.Sources.Constant Constant1 annotation (extent=[-66, -89; -
          46, -69]);
    ASM2d.pump RecyclePump(Q_max=46115) annotation (extent=[-94, -22; -74, -2]
        , rotation=180);
    ASM2d.pump ReturnPump(Q_max=9223) annotation (extent=[16, -36; 36, -16], 
        rotation=180);
    ASM2d.pump WastePump(Q_max=193) annotation (extent=[59, -55; 79, -35]);
    Modelica.Blocks.Sources.Constant Constant2 annotation (extent=[22, -68; 42
          , -48]);
    Modelica.Blocks.Sources.Constant Temperature(k={15}) annotation (extent=[-
          94, 50; -82, 62]);
    sensor_NH sensor_NH1 annotation (extent=[64, 15; 80, 31]);
    WasteWater.ASM2d.sensor_NO sensor_NO1 annotation (extent=[81, 15; 97, 31]);
    WasteWater.ASM2d.sensor_TKN sensor_TKN1 annotation (extent=[97, 14; 113, 30
          ]);
    WasteWater.ASM2d.sensor_COD sensor_COD1 annotation (extent=[97, -5; 113, 11
          ]);
    Modelica.Blocks.Sources.Step OxygenSetpoint(height={1.5}) annotation (
        extent=[36, 40; 56, 60]);
    WasteWater.ASM2d.SecClar.Krebs.SecClarModKrebs Settler annotation (extent=[
          49, -7; 69, 13]);
  equation 
    connect(tank3.Out, divider.In) annotation (points=[15, 4; 20, 4]
      );
    connect(tank2.Out, tank3.In) annotation (points=[-12, 4; -6, 4]);
    connect(mixer.Out, tank1.In) annotation (points=[-84, 32; -74.5, 32; -74.5
          , 4; -65, 4]);
    connect(mixer.In1, WWSource.Out) annotation (points=[-104, 36; -104, 74; -
          68, 74; -68, 81; -68.2, 81]);
    connect(CombiTableTime.outPort, WWSource.data) annotation (points=[-93, 88
          ; -88, 88]);
    connect(blower1.AirOut, tank2.AirIn) annotation (points=[-22, -42; -22, -
          5.8]);
    connect(blower2.AirOut, tank3.AirIn) annotation (points=[5, -42; 5, -23.9; 
          5, -23.9; 5, -5.8]);
    connect(tank3.MeasurePort, sensor_O2.In) annotation (points=[10.5, 8.5; 10
          , 8.5; 10, 18]);
    connect(Feedback.outPort, PI1.inPort) annotation (points=[81, 50; 86, 50]);
    connect(PI1.outPort, blower2.u) annotation (points=[109, 50; 114, 50; 114, 
          -84; 18, -84; 18, -56; 15.8, -56]);
    connect(divider.Out2, RecyclePump.In) annotation (points=[40, 2; 44, 2; 44
          , -8.7; -74, -8.7]);
    connect(RecyclePump.Out, mixer.In3) annotation (points=[-94.2, -14.8; -104
          , -14.8; -104, 28]);
    connect(ReturnPump.Out, mixer.In2) annotation (points=[16, -28; 15.5, -28; 
          15.5, -30; -112, -30; -112, 32; -104, 32]);
    connect(sensor_O2.So, Feedback.inPort2) annotation (points=[19.8, 28; 72, 
          28; 72, 42]);
    connect(Temperature.outPort, tank1.T) annotation (points=[-81.5, 56; -69, 
          56; -69, 8; -65, 8], style(color=3));
    connect(Temperature.outPort, tank2.T) annotation (points=[-81.5, 56; -32, 
          56; -32, 8], style(color=3));
    connect(Temperature.outPort, tank3.T) annotation (points=[-81.5, 56; -5.9, 
          56; -5.9, 8; -5.8, 8], style(color=3));
    connect(OxygenSetpoint.outPort, Feedback.inPort1) annotation (points=[58, 
          50; 64, 50], style(color=3));
    connect(blower1.u, Constant1.outPort) annotation (points=[-12.2, -55; -9, -
          55; -9, -79; -44, -79], style(color=3));
    connect(WastePump.Out, WasteSludge.In) annotation (points=[79, -42; 87, -42
          ]);
    connect(WastePump.u, Constant2.outPort) annotation (points=[60, -43; 46, -
          43; 46, -58; 44, -58], style(color=3));
    connect(tank1.Out, tank2.In) annotation (points=[-44, 4; -32, 4]);
    connect(RecyclePump.u, Constant1.outPort) annotation (points=[-75, -15; -38
          , -15; -38, -79; -45, -79], style(color=3));
    connect(divider.Out1, Settler.Feed) annotation (points=[40, 6.6; 44, 6.6; 
          44, 4.4; 48, 4.4]);
    connect(Settler.Effluent, Effluent.In) annotation (points=[68.2, 8.7; 78, 
          8.7; 78, -15; 88, -15]);
    connect(Settler.Return, ReturnPump.In) annotation (points=[55, -6.6; 55, -
          22.7; 36, -22.7]);
    connect(WastePump.In, Settler.Waste) annotation (points=[59, -48; 52, -48; 
          52, -31; 62, -31; 62, -6.6]);
    connect(sensor_NH1.In, Settler.Effluent) annotation (points=[72, 15; 72, 
          8.7; 69, 8.7]);
    connect(sensor_NO1.In, Settler.Effluent) annotation (points=[89, 15; 89, 
          8.7; 68.2, 8.7]);
    connect(sensor_TKN1.In, Settler.Effluent) annotation (points=[105, 14; 105
          , 8.7; 68.2, 8.7]);
    connect(sensor_COD1.In, Settler.Effluent) annotation (points=[105, -5; 105
          , 8.7; 68.2, 8.7]);
    connect(Constant2.outPort, ReturnPump.u) annotation (points=[43, -58; 46, -
          58; 46, -28; 34.8, -28], style(color=3));
    
  end SmallPlant;
  class BenchPlant "COST Benchmark WWTP Configuration" 
    import WasteWater;
    
    //Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark
    
    extends Modelica.Icons.Example;
    //Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark
    annotation (
      Coordsys(
        extent=[-120, -100; 120, 105], 
        grid=[1, 1], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.39, 
        height=0.58), 
      Diagram, 
      Documentation(info="This ASM2d example plant consists of 2 denitrification tanks (tank1 and tank2),
3 nitrification tanks (tank3 - tank5) and a secondary clarifier by Takacs.
Furthermore there are 2 control loops modelled.
This configuration corresponds to the COST simulation benchmark [1].

Change into the directory ../ASM2d and translate the model.
Before simulating the model load initial values from the script file bench_asm2d.mos
that is provided besides the model.
A 14 days dynamic influent data file is provided. So you may simulate up to 14 days.
But start with 1 day as it may take some time for simulation.
After simulation you may have a look at internal concentrations but most interesting
are the relevant concentrations at the effluent of a plant which can be viewed via the 
sensors at the effluent of the secondary clarifier.

References: 

[1] J.B. Copp: The COST Simulation Benchmark. 2000. http://www.ensic.u-nancy.fr/COSTWWTP/
"));
    ASM2d.EffluentSink Effluent annotation (extent=[88, -28; 108, -8]);
    ASM2d.SludgeSink WasteSludge annotation (extent=[87, -51; 107, -31]);
    ASM2d.SecClarModTakacs Settler annotation (extent=[49, -5; 69, 15]);
    ASM2d.divider2 divider annotation (extent=[20, -6; 40, 14]);
    ASM2d.nitri tank5(V=1333) annotation (extent=[-6, -6; 14, 14]);
    ASM2d.nitri tank4(V=1333) annotation (extent=[-32, -6; -12, 14]);
    ASM2d.nitri tank3(V=1333) annotation (extent=[-60, -6; -40, 14]);
    ASM2d.deni tank2 annotation (extent=[-48, 22; -28, 42]);
    ASM2d.deni tank1 annotation (extent=[-76, 22; -56, 42]);
    ASM2d.mixer3 mixer annotation (extent=[-104, 22; -84, 42]);
    ModelicaAdditions.Tables.CombiTableTime CombiTableTime(
      tableName="Inf_dry", 
      fileName="Inf_dry.txt", 
      icol={2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}) annotation (
        extent=[-114, 78; -94, 98]);
    ASM2d.WWSource WWSource annotation (extent=[-88, 78; -68, 98]);
    ASM2d.sensor_NO sensor_NO annotation (extent=[-42, 48; -22, 68]);
    ASM2d.blower blower1(Q_max=34574.2654508612) annotation (extent=[-60, -62; 
          -40, -42]);
    ASM2d.blower blower2(Q_max=34574.2654508612) annotation (extent=[-32, -62; 
          -12, -42]);
    ASM2d.blower blower3(Q_max=34574.2654508612) annotation (extent=[-6, -62; 
          14, -42]);
    ASM2d.sensor_O2 sensor_O2 annotation (extent=[0, 18; 20, 38]);
    Modelica.Blocks.Math.Feedback Feedback annotation (extent=[62, 40; 82, 60])
      ;
    Modelica.Blocks.Continuous.PI PI1(k={500}, T={0.001}) annotation (extent=[
          88, 40; 108, 60]);
    Modelica.Blocks.Sources.Constant Constant1 annotation (extent=[-66, -89; -
          46, -69]);
    ASM2d.pump RecyclePump(Q_max=92230) annotation (extent=[-94, -22; -74, -2]
        , rotation=180);
    Modelica.Blocks.Continuous.PI PI2(k={15000}, T={0.05}) annotation (extent=[
          58, 78; 78, 98]);
    Modelica.Blocks.Sources.Constant NitrogenSetpoint annotation (extent=[-8, 
          78; 12, 98]);
    Modelica.Blocks.Math.Feedback Feedback1 annotation (extent=[22, 78; 42, 98]
      );
    Modelica.Blocks.Nonlinear.Limiter Limiter1(uMax={10}, uMin={0.1}) 
      annotation (extent=[8, 48; 28, 68]);
    ASM2d.pump ReturnPump(Q_max=18446) annotation (extent=[16, -36; 36, -16], 
        rotation=180);
    ASM2d.pump WastePump(Q_max=385) annotation (extent=[59, -55; 79, -35]);
    Modelica.Blocks.Sources.Constant Constant2 annotation (extent=[22, -68; 42
          , -48]);
    Modelica.Blocks.Sources.Constant Temperature(k={15}) annotation (extent=[-
          94, 50; -82, 62]);
    ModelicaAdditions.Blocks.Nonlinear.FixedDelay FixedDelay1(delayTime=1/6/24)
       annotation (extent=[-18, 48; 2, 68]);
    sensor_NH sensor_NH1 annotation (extent=[64, 15; 80, 31]);
    WasteWater.ASM2d.sensor_NO sensor_NO1 annotation (extent=[81, 15; 97, 31]);
    WasteWater.ASM2d.sensor_TKN sensor_TKN1 annotation (extent=[97, 14; 113, 30
          ]);
    WasteWater.ASM2d.sensor_COD sensor_COD1 annotation (extent=[97, -5; 113, 11
          ]);
    Modelica.Blocks.Sources.Step OxygenSetpoint(height={2}) annotation (extent=
          [36, 40; 56, 60]);
  equation 
    connect(tank5.Out, divider.In) annotation (points=[14, 4; 20, 4]
      );
    connect(tank4.Out, tank5.In) annotation (points=[-12, 4; -6, 4]);
    connect(tank3.Out, tank4.In) annotation (points=[-40, 4; -32, 4]);
    connect(tank3.In, tank2.Out) annotation (points=[-60, 4; -70, 4; -70, 18; -
          18, 18; -18, 32; -28, 32]);
    connect(tank1.Out, tank2.In) annotation (points=[-56, 32; -48, 32]);
    connect(mixer.Out, tank1.In) annotation (points=[-84, 32; -76, 32]);
    connect(mixer.In1, WWSource.Out) annotation (points=[-104, 36; -104, 74; -
          68, 74; -68, 81; -68.2, 81]);
    connect(CombiTableTime.outPort, WWSource.data) annotation (points=[-93, 88
          ; -88, 88]);
    connect(sensor_NO.In, tank2.MeasurePort) annotation (points=[-32, 48; -32, 
          36.5; -32.5, 36.5]);
    connect(blower1.AirOut, tank3.AirIn) annotation (points=[-50, -42; -50, -
          5.8]);
    connect(blower2.AirOut, tank4.AirIn) annotation (points=[-22, -42; -22, -
          5.8]);
    connect(blower3.AirOut, tank5.AirIn) annotation (points=[4, -42; 4, -5.8]);
    connect(tank5.MeasurePort, sensor_O2.In) annotation (points=[9.5, 8.5; 10, 
          8.5; 10, 18]);
    connect(Feedback.outPort, PI1.inPort) annotation (points=[81, 50; 86, 50]);
    connect(PI1.outPort, blower3.u) annotation (points=[109, 50; 114, 50; 114, 
          -84; 18, -84; 18, -55; 14, -55; 14, -56]);
    connect(divider.Out2, RecyclePump.In) annotation (points=[40, 2; 44, 2; 44
          , -8.7; -74, -8.7]);
    connect(RecyclePump.Out, mixer.In3) annotation (points=[-94.2, -14.8; -104
          , -14.8; -104, 28]);
    connect(Feedback1.outPort, PI2.inPort) annotation (points=[41, 88; 56, 88])
      ;
    connect(NitrogenSetpoint.outPort, Feedback1.inPort1) annotation (points=[13
          , 88; 24, 88]);
    connect(PI2.outPort, RecyclePump.u) annotation (points=[79, 88; 118, 88; 
          118, -94; -70, -94; -70, -14.5; -75.1, -14.5]);
    connect(Limiter1.outPort, Feedback1.inPort2) annotation (points=[29, 58; 32
          , 58; 32, 80]);
    connect(Settler.Return, ReturnPump.In) annotation (points=[55, -4.6; 55, -
          22.7; 36, -22.7]);
    connect(ReturnPump.Out, mixer.In2) annotation (points=[16, -28; 15.5, -28; 
          15.5, -30; -112, -30; -112, 32; -104, 32]);
    connect(sensor_O2.So, Feedback.inPort2) annotation (points=[19.8, 28; 72, 
          28; 72, 42]);
    connect(Temperature.outPort, tank1.T) annotation (points=[-81.5, 56; -78, 
          56; -78, 36; -75.8, 36], style(color=3));
    connect(Temperature.outPort, tank2.T) annotation (points=[-81.5, 56; -52, 
          56; -52, 36; -48, 36], style(color=3));
    connect(Temperature.outPort, tank3.T) annotation (points=[-81.5, 56; -52, 
          56; -52, 14; -60, 14; -60, 8; -59.5, 8.4; -59.5, 8.4; -60, 8], style(
          color=3));
    connect(Temperature.outPort, tank4.T) annotation (points=[-81.5, 56; -52, 
          56; -52, 14; -32, 14; -32, 8], style(color=3));
    connect(Temperature.outPort, tank5.T) annotation (points=[-81.5, 56; -52, 
          56; -52, 14; -5.9, 14; -5.9, 8; -5.8, 8], style(color=3));
    connect(sensor_NO.Sno, FixedDelay1.inPort) annotation (points=[-22, 58; -22
          , 58], style(color=3));
    connect(FixedDelay1.outPort, Limiter1.inPort) annotation (points=[3, 58; 4
          , 58], style(color=3));
    connect(OxygenSetpoint.outPort, Feedback.inPort1) annotation (points=[58, 
          50; 64, 50], style(color=3));
    connect(Constant1.outPort, blower1.u) annotation (points=[-45, -79; -36, -
          79; -36, -55; -40.2, -55], style(color=3));
    connect(blower2.u, Constant1.outPort) annotation (points=[-12.2, -55; -9, -
          55; -9, -79; -44, -79], style(color=3));
    connect(WastePump.Out, WasteSludge.In) annotation (points=[79, -42; 87, -42
          ]);
    connect(WastePump.In, Settler.Waste) annotation (points=[59, -48; 52, -48; 
          52, -31; 62, -31; 62, -3.6]);
    connect(WastePump.u, Constant2.outPort) annotation (points=[60, -43; 46, -
          43; 46, -58; 44, -58], style(color=3));
    connect(sensor_NH1.In, Settler.Effluent) annotation (points=[72, 15; 72, 11
          ; 69, 11]);
    connect(sensor_NO1.In, Settler.Effluent) annotation (points=[89, 15; 89, 11
          ; 70, 11]);
    connect(sensor_TKN1.In, Settler.Effluent) annotation (points=[105, 14; 105
          , 11; 70, 11]);
    connect(sensor_COD1.In, Settler.Effluent) annotation (points=[105, -5; 105
          , 11; 70, 11]);
    connect(Constant2.outPort, ReturnPump.u) annotation (points=[43, -58; 46, -
          58; 46, -28.5; 34.8, -28.5], style(color=3));
    connect(divider.Out1, Settler.Feed) annotation (points=[41, 6.5; 45, 6.5; 
          45, 6.4; 49, 6.4]);
    connect(Effluent.In, Settler.Effluent) annotation (points=[88, -17; 78.5, -
          17; 78.5, 11; 69, 11]);
    
  end BenchPlant;
  model ComplexPlant "Complex ASM2d WWTP" 
    import WasteWater;
    extends Modelica.Icons.Example;
    
    annotation (
      Coordsys(
        extent=[-200, -120; 200, 120], 
        grid=[1, 1], 
        component=[20, 20]), 
      Window(
        x=0.14, 
        y=0.01, 
        width=0.66, 
        height=0.88), 
      Diagram, 
      Documentation(info="This ASM2d example plant configuration is from a real municipal wastewater treatment plant
with a size of 145.000 p.e. It is a cascade-type continuous flow plant for a mean dry
weather inflow of 28.500 m3/d. It consists of a preclarifier, an anaerobic tank,
3 denitrification and 3 nitrification tanks and a secondary settler.
This model is an example for the Wastewater library and is not adapted with its parameters
to the reality, therefore simulation results do not reflect the real plant behaviour.

Change into the directory ../ASM2d and translate the model.
Before simulating the model load initial values from the script file complex_asm2d.mos
that is provided besides the model.
A 14 days dynamic influent data file is provided. So you may simulate up to 14 days.
But start with 1 day as it may take some time for simulation.
After simulation you may have a look at internal concentrations but most interesting
are the relevant concentrations at the effluent of a plant which can be viewed via the 
sensors at the effluent of the secondary clarifier.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de
"));
    ControlledDivider2 cdivider1 annotation (extent=[-168, 65; -148, 85]);
    Modelica.Blocks.Sources.Constant Constant2(k={0.8}) annotation (extent=[-
          178, 52; -168, 62]);
    blower blower1(Q_max=162816) 
      "there exist 4 blowers of 4240 Nm3/h each, Q_max adusted according active aerated tanks"
       annotation (extent=[145, -13; 165, 7]);
    nitri nitri2(
      V=2772, 
      alpha=0.305, 
      de=5.24, 
      R_air=20) annotation (extent=[110, 18; 130, 38]);
    deni anaerob(V=1287) annotation (extent=[-138, 13; -118, 33]);
    deni deni1(V=2772) annotation (extent=[-80, 14; -60, 34]);
    deni deni3(V=2772) annotation (extent=[80, 18; 100, 38]);
    deni deni2(V=2772) annotation (extent=[-20, 14; 0, 34]);
    nitri nitri3(
      V=5602, 
      alpha=0.305, 
      de=5.24, 
      R_air=21) annotation (extent=[144, 18; 164, 38]);
    blower blower2(Q_max=81408) 
      "there exist 4 blowers of 4240 Nm3/h each, Q_max adjusted according active aerated tanks"
       annotation (extent=[111, -13; 131, 7]);
    pump ReturnPump(Q_max=60480) annotation (extent=[-54, -104; -34, -84], 
        rotation=180);
    pump RecyclePump(Q_max=60480) annotation (extent=[0, -43; 20, -23], 
        rotation=180);
    pump WastePump(Q_max=1920) annotation (extent=[128, -104; 148, -84]);
    ControlledDivider2 cdivider2 annotation (extent=[-42, 67; -22, 87]);
    EffluentSink Effluent annotation (extent=[170, -72; 190, -52]);
    SludgeSink WasteSludge annotation (extent=[170, -100; 190, -80]);
    mixer2 mixer2_1 annotation (extent=[-47, 12; -27, 32]);
    mixer2 mixer2_2 annotation (extent=[50, 17; 70, 37]);
    mixer3 mixer3_1 annotation (extent=[-106, 14; -86, 34]);
    mixer2 mixer2_5 annotation (extent=[-140, -15; -120, 5]);
    divider2 divider2_1 annotation (extent=[57, -42; 77, -22], rotation=180);
    ControlledDivider2 cdivider3 annotation (extent=[-132, -97; -112, -77], 
        rotation=180);
    Modelica.Blocks.Sources.Constant Constant4(k={0.5}) annotation (extent=[-
          148, -80; -138, -70]);
    nitri nitri1(
      V=5602, 
      alpha=0.305, 
      de=5.24, 
      R_air=21) annotation (extent=[12, 14; 32, 34]);
    blower blower3(Q_max=162816) 
      "there exist 4 blowers of max 4240 Nm3/h, Q_max adusted according active aerated tanks"
       annotation (extent=[12, -23; 32, -3]);
    Modelica.Blocks.Sources.Constant Constant7(k={0.56}) annotation (extent=[-
          66, 98; -56, 108]);
    mixer2 mixer2_3 annotation (extent=[-168, 18; -148, 38]);
    PreClar.preclar3 Preclaryfier(
      V=1372, 
      aSi=2.5/100, 
      aSf=5/100, 
      aSa=10/100, 
      aXi=48.5/100, 
      aXs=34/100, 
      aXh=0/100, 
      n_corr=2.138) annotation (extent=[-136, 68; -116, 88]);
    FlowSource FlowInput annotation (extent=[-178, 95; -158, 115]);
    ControlledDivider2 ControlledDivider2_1 annotation (extent=[-52, -46; -32, 
          -26], rotation=-180);
    Modelica.Blocks.Sources.Constant Constant6 annotation (extent=[-46, -10; -
          36, 0]);
    sensor_NO sensor_NO1 annotation (extent=[-14, 40; 6, 60]);
    sensor_NO sensor_NO3 annotation (extent=[90, -56; 110, -36]);
    sensor_NH sensor_NH2 annotation (extent=[112, -56; 132, -36]);
    sensor_TSS sensor_TSS1 annotation (extent=[-6, -86; 14, -66]);
    Modelica.Blocks.Sources.Constant Temperature(k={11.5}) annotation (extent=[
          58, 44; 78, 64]);
    precipitation precipitation1(V=22, beta=8) annotation (extent=[42, -82; 62
          , -62]);
    WasteWater.Misc.RecycleController2 RecycleController1(NO3min=1.5) 
      annotation (extent=[15, -63; 29, -49]);
    WasteWater.Misc.ReturnController ReturnController1 annotation (extent=[-28
          , -115; -14, -101]);
    sensor_Q sensor_Q1 annotation (extent=[-194, 66; -174, 86]);
    WasteWater.Misc.TwoPoint TwoPoint1(
      on=4.5, 
      off=4.0, 
      out_on=2.5, 
      out_off=1.5) annotation (extent=[-8, 100; 2, 110]);
    WasteWater.Misc.TwoPoint TwoPoint2(
      on=4.5, 
      off=4.0, 
      out_on=2.5, 
      out_off=1.5) annotation (extent=[110, 100; 120, 110]);
    WasteWater.ASM2d.sensor_NH sensor_NH1 annotation (extent=[142, 38; 162, 58]
      );
    Modelica.Blocks.Math.Feedback Feedback1 annotation (extent=[12, 100; 22, 
          110]);
    Modelica.Blocks.Math.Feedback Feedback2 annotation (extent=[127, 99; 137, 
          109]);
    WasteWater.ASM2d.sensor_O2 sensor_O2_1 annotation (extent=[164, 38; 184, 58
          ]);
    WasteWater.ASM2d.sensor_O2 sensor_O2_2 annotation (extent=[14, 38; 34, 58])
      ;
    WasteWater.ASM2d.sensor_COD sensor_COD1 annotation (extent=[134, -56; 154, 
          -36]);
    WasteWater.ASM2d.sensor_COD sensor_COD2 annotation (extent=[-116, 95; -97, 
          114]);
    WasteWater.ASM2d.Examples.JenaSecClarModTakacs Settler(hsc=3.46, Asc=3704) 
      "The depth is calculated based on V and A of the settler and not the true depth."
       annotation (extent=[68, -84; 88, -64]);
    
    WasteWater.ASM2d.sensor_TP sensor_TP1 annotation (extent=[-93, 94; -74, 114
          ]);
    WasteWater.ASM2d.sensor_TKN sensor_TKN1 annotation (extent=[68, -56; 88, -
          36]);
    WasteWater.ASM2d.sensor_TP sensor_TP2 annotation (extent=[-150, 98; -136, 
          112]);
    WasteWater.ASM2d.sensor_TP sensor_TP3 annotation (extent=[156, -54; 174, -
          36]);
    ModelicaAdditions.Tables.CombiTableTime CombiTableTime1(
      tableName="drysim130303", 
      fileName="drysim130303.txt", 
      icol={2}) annotation (extent=[-198, 97; -184, 113]);
    ModelicaAdditions.Tables.CombiTableTime CombiTableTime2(
      tableName="drysim130303", 
      fileName="drysim130303.txt", 
      icol={3,4,5,6}) annotation (extent=[-134, 96; -118, 112]);
    ModelicaAdditions.Blocks.Nonlinear.FixedDelay FixedDelay1(delayTime=1/24/6)
       annotation (extent=[-16, -63; -2, -49]);
    Modelica.Blocks.Math.Feedback Feedback3 annotation (extent=[89, -18; 79, -8
          ], rotation=-180);
    WasteWater.ASM2d.sensor_O2 sensor_O2_3 annotation (extent=[116, 40; 134, 58
          ]);
    Modelica.Blocks.Math.Gain Gain1(k={500}) annotation (extent=[29, 95; 49, 
          115]);
    Modelica.Blocks.Math.Gain Gain2(k={500}) annotation (extent=[144, 93; 164, 
          113]);
    Modelica.Blocks.Math.Gain Gain3(k={500}) annotation (extent=[94, -28; 108, 
          -14]);
    WasteWater.Misc.TwoPoint TwoPoint3(
      on=4.5, 
      off=4.0, 
      out_on=2.0, 
      out_off=1.0) annotation (extent=[63, -19; 75, -7]);
    Modelica.Blocks.Sources.Step Step1(
      height={0.125}, 
      offset={-0.5}, 
      startTime={2.375}) annotation (extent=[100, -90; 110, -80]);
  equation 
    connect(deni3.Out, nitri2.In) annotation (points=[100, 28; 110, 
          28]);
    connect(nitri2.Out, nitri3.In) annotation (points=[130, 28; 144, 28]);
    connect(nitri3.Out, divider2_1.In) annotation (points=[164, 28; 190, 28; 
          190, -32.3; 76, -32.3]);
    connect(mixer2_5.Out, mixer3_1.In3) annotation (points=[-120, -4.6; -111, -
          4.6; -111, 20.5; -107, 20.5]);
    connect(Constant4.outPort, cdivider3.u) annotation (points=[-137.5, -75; -
          122, -75; -122, -81], style(color=3));
    connect(nitri1.Out, mixer2_2.In2) annotation (points=[33, 24; 39, 24; 39, 
          25.5; 51, 25.5]);
    connect(deni2.Out, nitri1.In) annotation (points=[5.55112e-16, 24; 12, 24])
      ;
    connect(cdivider2.Out1, mixer2_2.In1) annotation (points=[-22, 78.5; 40, 
          78.5; 40, 29.5; 50, 29.5]);
    connect(cdivider3.Out2, mixer2_5.In1) annotation (points=[-132, -85.5; -172
          , -85.5; -172, -2.5; -140, -2.5]);
    connect(Constant7.outPort, cdivider2.u) annotation (points=[-55.5, 103; -
          50.5, 103; -50.5, 54; -32, 54; -32, 70], style(color=3));
    connect(cdivider3.In, ReturnPump.Out) annotation (points=[-112, -87.3; -
          86.1, -87.3; -86.1, -96.8; -54.2, -96.8]);
    connect(cdivider3.Out1, mixer2_3.In2) annotation (points=[-132, -89.5; -184
          , -89.5; -184, 26.5; -168, 26.5]);
    connect(cdivider1.Out2, mixer2_3.In1) annotation (points=[-147, 73.5; -143
          , 73.5; -143, 40; -184, 40; -184, 30.5; -168, 30.5]);
    connect(WastePump.Out, WasteSludge.In) annotation (points=[148.2, -91.2; 
          170, -91.2]);
    connect(ControlledDivider2_1.Out2, mixer2_1.In2) annotation (points=[-51, -
          34.5; -52, -34.5; -52, 20.5; -47, 20.5]);
    connect(ControlledDivider2_1.Out1, mixer2_5.In2) annotation (points=[-51, -
          38.5; -150, -38.5; -150, -6.5; -140, -6.5]);
    connect(Constant6.outPort, ControlledDivider2_1.u) annotation (points=[-36
          , -5; -31, -5; -31, -18; -41, -18; -41, -30], style(color=3));
    connect(Preclaryfier.In, cdivider1.Out1) annotation (points=[-136, 78; -
          146.5, 78; -146.5, 77.5; -147, 77.5]);
    connect(mixer2_2.Out, deni3.In) annotation (points=[70, 27.4; 70, 28; 80, 
          28]);
    connect(sensor_NO1.In, deni2.MeasurePort) annotation (points=[-4, 40; -4, 
          28.5; -4.5, 28.5]);
    connect(Temperature.outPort, anaerob.T) annotation (points=[80, 54; 94, 54
          ; 94, 34; -138, 34; -138, 27], style(color=3));
    connect(Temperature.outPort, deni1.T) annotation (points=[80, 54; 94, 54; 
          94, 34; -80, 34; -80, 28], style(color=3));
    connect(Temperature.outPort, deni2.T) annotation (points=[80, 54; 94, 54; 
          94, 34; -20, 34; -20, 28], style(color=3));
    connect(Temperature.outPort, nitri1.T) annotation (points=[80, 54; 94, 54; 
          94, 34; 12, 34; 12, 28; 12.2, 28], style(color=3));
    connect(Temperature.outPort, deni3.T) annotation (points=[80, 54; 94, 54; 
          94, 34; 80, 34; 80, 32], style(color=3));
    connect(Temperature.outPort, nitri2.T) annotation (points=[80, 54; 94, 54; 
          94, 34; 110.5, 34; 110.5, 32; 110, 32], style(color=3));
    connect(Temperature.outPort, nitri3.T) annotation (points=[80, 54; 94, 54; 
          94, 34; 144, 34; 144, 32], style(color=3));
    connect(precipitation1.In, divider2_1.Out1) annotation (points=[42, -72; 38
          , -72; 38, -34.5; 56, -34.5]);
    connect(precipitation1.T, Temperature.outPort) annotation (points=[42, -68
          ; 42, 34; 94, 34; 94, 54; 80, 54], style(color=3));
    connect(RecycleController1.out, RecyclePump.u) annotation (points=[29.7, -
          56; 34, -56; 34, -36.5; 18.8, -36.5], style(color=3));
    connect(sensor_Q1.Q, ReturnController1.in1) annotation (points=[-184, 66; -
          184, 65.5; -194, 65.5; -194, -108; -28.7, -108], style(color=3));
    connect(sensor_NH1.In, nitri3.MeasurePort) annotation (points=[152, 38; 152
          , 34; 160, 34; 160, 32.5]);
    connect(sensor_O2_2.In, nitri1.MeasurePort) annotation (points=[24, 38; 24
          , 28.5; 28, 28.5]);
    connect(Feedback1.inPort2, sensor_O2_2.So) annotation (points=[17, 101; 17
          , 83.5; 34, 83.5; 34, 48], style(color=3));
    connect(sensor_O2_1.In, nitri3.MeasurePort) annotation (points=[174, 38; 
          174, 34; 160.25, 34; 160.25, 32; 160, 32]);
    connect(Feedback2.inPort2, sensor_O2_1.So) annotation (points=[132, 101; 
          132, 81; 184, 81; 184, 48], style(color=3));
    connect(sensor_NH1.Snh, TwoPoint1.e) annotation (points=[162, 48; 162, 72; 
          -14, 72; -14, 105; -8, 105], style(color=3));
    connect(TwoPoint2.e, sensor_NH1.Snh) annotation (points=[110, 105; 100, 105
          ; 100, 72; 162, 72; 162, 48], style(color=3));
    connect(sensor_COD2.In, Preclaryfier.In) annotation (points=[-107, 95; -107
          , 78; -136, 78]);
    connect(sensor_NO3.In, Settler.Effluent) annotation (points=[100, -56; 100
          , -68.3; 88.2, -68.3]);
    connect(sensor_NH2.In, Settler.Effluent) annotation (points=[122, -56; 122
          , -68.3; 88.2, -68.3]);
    connect(precipitation1.Out, Settler.Feed) annotation (points=[62, -72; 65, 
          -72; 65, -72.6; 68, -72.6]);
    connect(WastePump.In, Settler.Waste) annotation (points=[128, -97.3; 82, -
          97.3; 82, -84]);
    connect(Settler.Return, ReturnPump.In) annotation (points=[74, -84; 74, -
          90.7; -34, -90.7]);
    connect(sensor_TSS1.In, Settler.Return) annotation (points=[4, -86; 4, -91
          ; 74, -91; 74, -84]);
    connect(sensor_TP1.In, Preclaryfier.Out) annotation (points=[-84, 94; -84, 
          78; -116, 78]);
    connect(sensor_TKN1.In, Settler.Effluent) annotation (points=[78, -56; 88, 
          -56; 88, -68]);
    connect(sensor_TP2.In, Preclaryfier.In) annotation (points=[-143, 98; -143
          , 78; -136, 78]);
    connect(Preclaryfier.MeasurePort, CombiTableTime2.outPort) annotation (
        points=[-122, 88; -122, 94; -116, 94; -116, 104; -117.2, 104], style(
          color=3));
    connect(FixedDelay1.inPort, sensor_NO1.Sno) annotation (points=[-18, -56; -
          22, -56; -22, -8; 10, -8; 10, 50; 6, 50], style(color=3));
    connect(sensor_O2_3.In, nitri2.MeasurePort) annotation (points=[125, 40; 
          125, 32.5; 126, 32.5]);
    connect(sensor_Q1.Out, cdivider1.In) annotation (points=[-174, 76; -168, 76
          ]);
    connect(cdivider2.Out2, mixer3_1.In1) annotation (points=[-22, 76; -18, 76
          ; -18, 47; -111, 47; -111, 28.5; -107, 28.5]);
    connect(mixer3_1.Out, deni1.In) annotation (points=[-87, 24; -81, 24]);
    connect(FixedDelay1.outPort, RecycleController1.in1) annotation (points=[-1
          , -56; 14.3, -56], style(color=3));
    connect(Feedback2.inPort1, TwoPoint2.u) annotation (points=[128, 105; 120, 
          105], style(color=3));
    connect(TwoPoint1.u, Feedback1.inPort1) annotation (points=[2.5, 105; 13, 
          105], style(color=3));
    connect(mixer2_3.Out, anaerob.In) annotation (points=[-148, 29; -143, 29; -
          143, 23; -138, 23]);
    connect(Gain1.inPort, Feedback1.outPort) annotation (points=[27, 104; 24, 
          104; 24, 105; 21, 105], style(color=3));
    connect(Gain2.inPort, Feedback2.outPort) annotation (points=[141, 103; 139
          , 103; 139, 104; 137, 104], style(color=3));
    connect(Feedback3.outPort, Gain3.inPort) annotation (points=[88.5, -13; 
          90.55, -13; 90.55, -21; 92.6, -21], style(color=3));
    connect(sensor_O2_3.So, Feedback3.inPort2) annotation (points=[134, 49; 139
          , 49; 139, 16; 83, 16; 83, -9], style(color=3));
    connect(TwoPoint3.u, Feedback3.inPort1) annotation (points=[75, -13; 80, -
          13], style(color=3));
    connect(TwoPoint3.e, sensor_NH1.Snh) annotation (points=[63, -13; 56, -13; 
          56, 6; 104, 6; 104, 72; 162, 72; 162, 49], style(color=3));
    connect(Step1.outPort, WastePump.u) annotation (points=[111, -85; 119, -85
          ; 119, -91; 129.2, -91], style(color=3));
    connect(blower3.AirOut, nitri1.AirIn) annotation (points=[21, -3; 21, 5.5; 
          22, 5.5; 22, 14]);
    connect(blower1.AirOut, nitri3.AirIn) annotation (points=[155, 8; 155, 13; 
          154, 5.5; 154, 18]);
    connect(Constant2.outPort, cdivider1.u) annotation (points=[-167.5, 57; -
          158, 57; -158, 69], style(color=3));
    connect(Gain1.outPort, blower3.u) annotation (points=[50, 105; 55, 105; 55
          , 83; 49, 83; 49, -15; 32, -15], style(color=3));
    connect(Gain3.outPort, blower2.u) annotation (points=[108.7, -21; 139, -21
          ; 139, -6; 130.8, -6], style(color=3));
    connect(blower1.u, Gain2.outPort) annotation (points=[165.8, -5; 195, -5; 
          195, 103; 165, 103], style(color=3));
    connect(CombiTableTime1.outPort, FlowInput.data) annotation (points=[-183.3
          , 105; -178, 105], style(color=3));
    connect(sensor_Q1.In, FlowInput.Out) annotation (points=[-194, 76; -194, 89
          ; -158, 89; -158, 98]);
    connect(ReturnPump.u, ReturnController1.out) annotation (points=[-35.2, -97
          ; -5, -97; -5, -108; -13, -108], style(color=3));
    connect(ControlledDivider2_1.In, RecyclePump.Out) annotation (points=[-32, 
          -36; 0, -36]);
    connect(divider2_1.Out2, RecyclePump.In) annotation (points=[56, -30; 20, -
          30]);
    connect(mixer2_1.In1, deni1.Out) annotation (points=[-47, 24; -60, 24]);
    connect(mixer2_1.Out, deni2.In) annotation (points=[-27, 22; -23.5, 22; -
          23.5, 24; -20, 24]);
    connect(mixer3_1.In2, anaerob.Out) annotation (points=[-107, 23; -118, 23])
      ;
    connect(cdivider2.In, Preclaryfier.Out) annotation (points=[-42, 77; -84, 
          77; -84, 78; -116, 78]);
    connect(blower2.AirOut, nitri2.AirIn) annotation (points=[120, 7; 120, 18.2
          ]);
    connect(Settler.Effluent, sensor_COD1.In) annotation (points=[89, -68; 145
          , -68; 145, -55]);
    connect(Effluent.In, Settler.Effluent) annotation (points=[170, -61; 165, -
          61; 165, -68; 88, -68]);
    connect(sensor_TP3.In, Settler.Effluent) annotation (points=[165, -54; 165
          , -68; 88, -68]);
    
  end ComplexPlant;
  model JenaSecClarModTakacs 
    "Secondary Clarifier Model based on Takacs prepared for a special plant" 
    
    extends WasteWater.Icons.SecClar;
    extends ASM2d.SecClar.Takacs.Interfaces.ratios;
    package SCP = ASM2d.SecClar.Takacs;
    package SI = Modelica.SIunits;
    package WI = ASM2d.Interfaces;
    package WWU = WasteWater.WasteWaterUnits;
    
    parameter SI.Length hsc=4.0 "height of secondary clarifier";
    parameter Integer n=10 "number of layers of SC model";
    parameter SI.Length zm=hsc/(1.0*n) 
      "height of m-th secondary clarifier layer";
    parameter SI.Area Asc=1500.0 "area of secondary clarifier";
    parameter WWU.MassConcentration Xt=3000.0 "threshold for X";
    // total sludge concentration in clarifier feed
    WWU.MassConcentration Xf;
    // layers 1 to 10
    WI.WWFlowAsm2din Feed annotation (extent=[-110, 4; -90, 24]);
    WI.WWFlowAsm2dout Effluent annotation (extent=[92, 47; 112, 67]);
    WI.WWFlowAsm2dout Return annotation (extent=[-40, -106; -20, -86]);
    WI.WWFlowAsm2dout Waste annotation (extent=[20, -106; 40, -86]);
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
    SCP.feed_layer S4(
      zm=zm, 
      Asc=Asc, 
      Xf=Xf) annotation (extent=[-36, -36; 34, -22]);
    SCP.upper_layer S5(
      zm=zm, 
      Asc=Asc, 
      Xf=Xf, 
      Xt=Xt) annotation (extent=[-36, -16; 34, -4]);
    SCP.upper_layer S6(
      zm=zm, 
      Asc=Asc, 
      Xf=Xf, 
      Xt=Xt) annotation (extent=[-36, 2; 34, 16]);
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
    
    connect(S1.Up, S2.Dn) annotation (points=[-2.22045e-15, -78; -2.22045e-15, 
          -74]);
    connect(S2.Up, S3.Dn) annotation (points=[-2.22045e-15, -59; -2.22045e-15, 
          -55]);
    connect(S7.Up, S8.Dn) annotation (points=[-2.22045e-15, 36; -2.22045e-15, 
          40]);
    connect(S9.Up, S10.Dn) annotation (points=[-2.22045e-15, 74; -2.22045e-15, 
          78]);
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.46, 
        width=0.35, 
        height=0.49), 
      Documentation(info="This component models an ASM2d 10 - layer secondary clarifier with 6 layers above the feed_layer (including top_layer)
and 3 layers below the feed_layer (including bottom_layer).

Parameters:
  hsc -  height of clarifier [m]
  n   -  number of layers
  Asc -  surface area of sec. clar. [m2]
  Xt  -  threshold value for Xtss [mg/l]
"));
    connect(S8.Up, S9.Dn) annotation (points=[-2.22045e-15, 55; -2.22045e-15, 
          59]);
    connect(S1.PQw, Waste) annotation (points=[17.5, -93; 30, -93; 30, -100]);
    connect(S10.Out, Effluent) annotation (points=[35, 85.5; 67.5, 85.5; 67.5, 
          57; 100, 57]);
    connect(S1.PQr, Return) annotation (points=[-21, -93; -30, -93; -30, -100])
      ;
    connect(S4.Dn, S3.Up) annotation (points=[0, -36; 0, -40]);
    connect(S4.Up, S5.Dn) annotation (points=[-2, -22; -2, -16]);
    connect(S5.Up, S6.Dn) annotation (points=[0, -4; 0, 2]);
    connect(S6.Up, S7.Dn) annotation (points=[0, 16; 0, 21]);
    connect(Feed, S4.In) annotation (points=[-100, 10; -67.5, 10; -67.5, -28.72
          ; -35, -28.72]);
    
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
    
  end JenaSecClarModTakacs;
end Examples;
