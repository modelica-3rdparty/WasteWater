within WasteWater.ASM2d;
package Examples
  "Demonstration examples of the components of the ASM2d library"

  extends Modelica.Icons.Library;

  class SmallPlant "Small WWTP Configuration"
    import WasteWater;

    //Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark
    extends Modelica.Icons.Example;

    //Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark
    ASM2d.EffluentSink Effluent annotation (Placement(transformation(extent={{
              88,-28},{108,-8}}, rotation=0)));
    ASM2d.SludgeSink WasteSludge annotation (Placement(transformation(extent={{
              87,-51},{107,-31}}, rotation=0)));
    ASM2d.divider2 divider annotation (Placement(transformation(extent={{20,-6},
              {40,14}}, rotation=0)));
    ASM2d.nitri tank3(V=1333) annotation (Placement(transformation(extent={{-5,
              -6},{15,14}}, rotation=0)));
    ASM2d.nitri tank2(V=1333) annotation (Placement(transformation(extent={{-32,
              -6},{-12,14}}, rotation=0)));
    ASM2d.deni tank1(V=3000) annotation (Placement(transformation(extent={{-65,
              -6},{-45,14}}, rotation=0)));
    ASM2d.mixer3 mixer annotation (Placement(transformation(extent={{-104,22},{
              -84,42}}, rotation=0)));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime(
      fileName="Inf_dry.txt",
      table=[0,0; 1,1],
      columns=integer(({21,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20})),
      tableName="Inf_dry",
      tableOnFile=("Inf_dry") <> "NoName") annotation (Placement(transformation(
            extent={{-114,78},{-94,98}}, rotation=0)));
    ASM2d.WWSource WWSource annotation (Placement(transformation(extent={{-88,
              78},{-68,98}}, rotation=0)));
    ASM2d.blower blower1(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-32,-62},{-12,-42}}, rotation=0)));
    ASM2d.blower blower2(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-4,-62},{16,-42}}, rotation=0)));
    ASM2d.sensor_O2 sensor_O2 annotation (Placement(transformation(extent={{0,
              18},{20,38}}, rotation=0)));
    Modelica.Blocks.Math.Feedback Feedback annotation (Placement(transformation(
            extent={{62,40},{82,60}}, rotation=0)));
    Modelica.Blocks.Continuous.PI PI1(T=0.001, k=500)
      annotation (Placement(transformation(extent={{88,40},{108,60}}, rotation=
              0)));
    Modelica.Blocks.Sources.Constant Constant1 annotation (Placement(
          transformation(extent={{-66,-89},{-46,-69}}, rotation=0)));
    ASM2d.pump RecyclePump(Q_max=46115) annotation (Placement(transformation(
          origin={-84,-12},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM2d.pump ReturnPump(Q_max=9223) annotation (Placement(transformation(
          origin={26,-26},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM2d.pump WastePump(Q_max=193) annotation (Placement(transformation(extent
            ={{59,-55},{79,-35}}, rotation=0)));
    Modelica.Blocks.Sources.Constant Constant2 annotation (Placement(
          transformation(extent={{22,-68},{42,-48}}, rotation=0)));
    Modelica.Blocks.Sources.Constant Temperature(k=15)
      annotation (Placement(transformation(extent={{-94,50},{-82,62}}, rotation
            =0)));
    sensor_NH sensor_NH1 annotation (Placement(transformation(extent={{64,15},{
              80,31}}, rotation=0)));
    WasteWater.ASM2d.sensor_NO sensor_NO1 annotation (Placement(transformation(
            extent={{81,15},{97,31}}, rotation=0)));
    WasteWater.ASM2d.sensor_TKN sensor_TKN1 annotation (Placement(
          transformation(extent={{97,14},{113,30}}, rotation=0)));
    WasteWater.ASM2d.sensor_COD sensor_COD1 annotation (Placement(
          transformation(extent={{97,-5},{113,11}}, rotation=0)));
    Modelica.Blocks.Sources.Step OxygenSetpoint(height=1.5)
      annotation (Placement(transformation(extent={{36,40},{56,60}}, rotation=0)));
    WasteWater.ASM2d.SecClar.Krebs.SecClarModKrebs Settler annotation (Placement(
          transformation(extent={{49,-7},{69,13}}, rotation=0)));
  equation
    connect(tank3.Out, divider.In) annotation (Line(points={{15,4},{20,4}}));
    connect(tank2.Out, tank3.In) annotation (Line(points={{-12,4},{-6,4}}));
    connect(mixer.Out, tank1.In) annotation (Line(points={{-84,32},{-74.5,32},{
            -74.5,4},{-65,4}}));
    connect(mixer.In1, WWSource.Out) annotation (Line(points={{-104,36},{-104,
            74},{-68,74},{-68,81},{-68.2,81}}));
    connect(CombiTableTime.y, WWSource.data)
      annotation (Line(points={{-93,88},{-88,88}}));
    connect(blower1.AirOut, tank2.AirIn) annotation (Line(points={{-22,-42},{
            -22,-5.8}}));
    connect(blower2.AirOut, tank3.AirIn) annotation (Line(points={{5,-42},{5,
            -23.9},{5,-23.9},{5,-5.8}}));
    connect(tank3.MeasurePort, sensor_O2.In) annotation (Line(points={{10.5,8.5},
            {10,8.5},{10,18}}));
    connect(Feedback.y, PI1.u) annotation (Line(points={{81,50},{86,50}}));
    connect(PI1.y, blower2.u)
      annotation (Line(points={{109,50},{114,50},{114,-84},{18,-84},{18,-56},{
            15.8,-56}}));
    connect(divider.Out2, RecyclePump.In) annotation (Line(points={{40,2},{44,2},
            {44,-8.7},{-74,-8.7}}));
    connect(RecyclePump.Out, mixer.In3) annotation (Line(points={{-94.2,-14.8},
            {-104,-14.8},{-104,28}}));
    connect(ReturnPump.Out, mixer.In2) annotation (Line(points={{16,-28},{15.5,
            -28},{15.5,-30},{-112,-30},{-112,32},{-104,32}}));
    connect(sensor_O2.So, Feedback.u2)
      annotation (Line(points={{19.8,28},{72,28},{72,42}}));
    connect(Temperature.y, tank1.T)
      annotation (Line(points={{-81.5,56},{-69,56},{-69,8},{-65,8}}, color={0,0,
            255}));
    connect(Temperature.y, tank2.T)
      annotation (Line(points={{-81.5,56},{-32,56},{-32,8}}, color={0,0,255}));
    connect(Temperature.y, tank3.T)
      annotation (Line(points={{-81.5,56},{-5.9,56},{-5.9,8},{-5.8,8}}, color={
            0,0,255}));
    connect(OxygenSetpoint.y, Feedback.u1)
      annotation (Line(points={{58,50},{64,50}}, color={0,0,255}));
    connect(blower1.u, Constant1.y)
      annotation (Line(points={{-12.2,-55},{-9,-55},{-9,-79},{-44,-79}}, color=
            {0,0,255}));
    connect(WastePump.Out, WasteSludge.In) annotation (Line(points={{79,-42},{
            87,-42}}));
    connect(WastePump.u, Constant2.y)
      annotation (Line(points={{60,-43},{46,-43},{46,-58},{44,-58}}, color={0,0,
            255}));
    connect(tank1.Out, tank2.In) annotation (Line(points={{-44,4},{-32,4}}));
    connect(RecyclePump.u, Constant1.y)
      annotation (Line(points={{-75,-15},{-38,-15},{-38,-79},{-45,-79}}, color=
            {0,0,255}));
    connect(divider.Out1, Settler.Feed) annotation (Line(points={{40,6.6},{44,
            6.6},{44,4.4},{48,4.4}}));
    connect(Settler.Effluent, Effluent.In) annotation (Line(points={{68.2,8.7},
            {78,8.7},{78,-15},{88,-15}}));
    connect(Settler.Return, ReturnPump.In) annotation (Line(points={{55,-6.6},{
            55,-22.7},{36,-22.7}}));
    connect(WastePump.In, Settler.Waste) annotation (Line(points={{59,-48},{52,
            -48},{52,-31},{62,-31},{62,-6.6}}));
    connect(sensor_NH1.In, Settler.Effluent) annotation (Line(points={{72,15},{
            72,8.7},{69,8.7}}));
    connect(sensor_NO1.In, Settler.Effluent) annotation (Line(points={{89,15},{
            89,8.7},{68.2,8.7}}));
    connect(sensor_TKN1.In, Settler.Effluent) annotation (Line(points={{105,14},
            {105,8.7},{68.2,8.7}}));
    connect(sensor_COD1.In, Settler.Effluent) annotation (Line(points={{105,-5},
            {105,8.7},{68.2,8.7}}));
    connect(Constant2.y, ReturnPump.u)
      annotation (Line(points={{43,-58},{46,-58},{46,-28},{34.8,-28}}, color={0,
            0,255}));

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.39,
        height=0.58),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-120,-100},{120,105}},
          grid={1,1}), graphics={Line(points={{-22,58},{-22,58}}, color={0,0,
                255})}),
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
  end SmallPlant;

  class BenchPlant "COST Benchmark WWTP Configuration"
    import WasteWater;

    //Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark

    extends Modelica.Icons.Example;
    //Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark
    ASM2d.EffluentSink Effluent annotation (Placement(transformation(extent={{
              88,-28},{108,-8}}, rotation=0)));
    ASM2d.SludgeSink WasteSludge annotation (Placement(transformation(extent={{
              87,-51},{107,-31}}, rotation=0)));
    ASM2d.SecClarModTakacs Settler annotation (Placement(transformation(extent=
              {{49,-5},{69,15}}, rotation=0)));
    ASM2d.divider2 divider annotation (Placement(transformation(extent={{20,-6},
              {40,14}}, rotation=0)));
    ASM2d.nitri tank5(V=1333) annotation (Placement(transformation(extent={{-6,
              -6},{14,14}}, rotation=0)));
    ASM2d.nitri tank4(V=1333) annotation (Placement(transformation(extent={{-32,
              -6},{-12,14}}, rotation=0)));
    ASM2d.nitri tank3(V=1333) annotation (Placement(transformation(extent={{-60,
              -6},{-40,14}}, rotation=0)));
    ASM2d.deni tank2 annotation (Placement(transformation(extent={{-48,22},{-28,
              42}}, rotation=0)));
    ASM2d.deni tank1 annotation (Placement(transformation(extent={{-76,22},{-56,
              42}}, rotation=0)));
    ASM2d.mixer3 mixer annotation (Placement(transformation(extent={{-104,22},{
              -84,42}}, rotation=0)));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime(
      fileName="Inf_dry.txt",
      table=[0,0; 1,1],
      columns=integer(({2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20})),
      tableName="Inf_dry",
      tableOnFile=("Inf_dry") <> "NoName") annotation (Placement(transformation(
            extent={{-114,78},{-94,98}}, rotation=0)));
    ASM2d.WWSource WWSource annotation (Placement(transformation(extent={{-88,
              78},{-68,98}}, rotation=0)));
    ASM2d.sensor_NO sensor_NO annotation (Placement(transformation(extent={{-42,
              48},{-22,68}}, rotation=0)));
    ASM2d.blower blower1(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-60,-62},{-40,-42}}, rotation=0)));
    ASM2d.blower blower2(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-32,-62},{-12,-42}}, rotation=0)));
    ASM2d.blower blower3(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-6,-62},{14,-42}}, rotation=0)));
    ASM2d.sensor_O2 sensor_O2 annotation (Placement(transformation(extent={{0,
              18},{20,38}}, rotation=0)));
    Modelica.Blocks.Math.Feedback Feedback annotation (Placement(transformation(
            extent={{62,40},{82,60}}, rotation=0)));
    Modelica.Blocks.Continuous.PI PI1(T=0.001, k=500)
      annotation (Placement(transformation(extent={{88,40},{108,60}}, rotation=
              0)));
    Modelica.Blocks.Sources.Constant Constant1 annotation (Placement(
          transformation(extent={{-66,-89},{-46,-69}}, rotation=0)));
    ASM2d.pump RecyclePump(Q_max=92230) annotation (Placement(transformation(
          origin={-84,-12},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Continuous.PI PI2(T=0.05, k=15000)
      annotation (Placement(transformation(extent={{58,78},{78,98}}, rotation=0)));
    Modelica.Blocks.Sources.Constant NitrogenSetpoint annotation (Placement(
          transformation(extent={{-8,78},{12,98}}, rotation=0)));
    Modelica.Blocks.Math.Feedback Feedback1 annotation (Placement(
          transformation(extent={{22,78},{42,98}}, rotation=0)));
    Modelica.Blocks.Nonlinear.Limiter Limiter1(uMax=10, uMin=0.1)
      annotation (Placement(transformation(extent={{8,48},{28,68}}, rotation=0)));
    ASM2d.pump ReturnPump(Q_max=18446) annotation (Placement(transformation(
          origin={26,-26},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM2d.pump WastePump(Q_max=385) annotation (Placement(transformation(extent
            ={{59,-55},{79,-35}}, rotation=0)));
    Modelica.Blocks.Sources.Constant Constant2 annotation (Placement(
          transformation(extent={{22,-68},{42,-48}}, rotation=0)));
    Modelica.Blocks.Sources.Constant Temperature(k=15)
      annotation (Placement(transformation(extent={{-94,50},{-82,62}}, rotation
            =0)));
    Modelica.Blocks.Nonlinear.FixedDelay FixedDelay1(delayTime=1/6/24)
      annotation (Placement(transformation(extent={{-18,48},{2,68}}, rotation=0)));
    sensor_NH sensor_NH1 annotation (Placement(transformation(extent={{64,15},{
              80,31}}, rotation=0)));
    WasteWater.ASM2d.sensor_NO sensor_NO1 annotation (Placement(transformation(
            extent={{81,15},{97,31}}, rotation=0)));
    WasteWater.ASM2d.sensor_TKN sensor_TKN1 annotation (Placement(
          transformation(extent={{97,14},{113,30}}, rotation=0)));
    WasteWater.ASM2d.sensor_COD sensor_COD1 annotation (Placement(
          transformation(extent={{97,-5},{113,11}}, rotation=0)));
    Modelica.Blocks.Sources.Step OxygenSetpoint(height=2)
      annotation (Placement(transformation(extent={{36,40},{56,60}}, rotation=0)));
  equation
    connect(tank5.Out, divider.In) annotation (Line(points={{14,4},{20,4}}));
    connect(tank4.Out, tank5.In) annotation (Line(points={{-12,4},{-6,4}}));
    connect(tank3.Out, tank4.In) annotation (Line(points={{-40,4},{-32,4}}));
    connect(tank3.In, tank2.Out) annotation (Line(points={{-60,4},{-70,4},{-70,
            18},{-18,18},{-18,32},{-28,32}}));
    connect(tank1.Out, tank2.In) annotation (Line(points={{-56,32},{-48,32}}));
    connect(mixer.Out, tank1.In) annotation (Line(points={{-84,32},{-76,32}}));
    connect(mixer.In1, WWSource.Out) annotation (Line(points={{-104,36},{-104,
            74},{-68,74},{-68,81},{-68.2,81}}));
    connect(CombiTableTime.y, WWSource.data)
      annotation (Line(points={{-93,88},{-88,88}}));
    connect(sensor_NO.In, tank2.MeasurePort) annotation (Line(points={{-32,48},
            {-32,36.5},{-32.5,36.5}}));
    connect(blower1.AirOut, tank3.AirIn) annotation (Line(points={{-50,-42},{
            -50,-5.8}}));
    connect(blower2.AirOut, tank4.AirIn) annotation (Line(points={{-22,-42},{
            -22,-5.8}}));
    connect(blower3.AirOut, tank5.AirIn) annotation (Line(points={{4,-42},{4,
            -5.8}}));
    connect(tank5.MeasurePort, sensor_O2.In) annotation (Line(points={{9.5,8.5},
            {10,8.5},{10,18}}));
    connect(Feedback.y, PI1.u) annotation (Line(points={{81,50},{86,50}}));
    connect(PI1.y, blower3.u) annotation (Line(points={{109,50},{114,50},{114,
            -84},{18,-84},{18,-55},{14,-55},{14,-56}}));
    connect(divider.Out2, RecyclePump.In) annotation (Line(points={{40,2},{44,2},
            {44,-8.7},{-74,-8.7}}));
    connect(RecyclePump.Out, mixer.In3) annotation (Line(points={{-94.2,-14.8},
            {-104,-14.8},{-104,28}}));
    connect(Feedback1.y, PI2.u) annotation (Line(points={{41,88},{56,88}}));
    connect(NitrogenSetpoint.y, Feedback1.u1)
      annotation (Line(points={{13,88},{24,88}}));
    connect(PI2.y, RecyclePump.u) annotation (Line(points={{79,88},{118,88},{
            118,-94},{-70,-94},{-70,-14.5},{-75.1,-14.5}}));
    connect(Limiter1.y, Feedback1.u2) annotation (Line(points={{29,58},{32,58},
            {32,80}}));
    connect(Settler.Return, ReturnPump.In) annotation (Line(points={{55,-4.6},{
            55,-22.7},{36,-22.7}}));
    connect(ReturnPump.Out, mixer.In2) annotation (Line(points={{16,-28},{15.5,
            -28},{15.5,-30},{-112,-30},{-112,32},{-104,32}}));
    connect(sensor_O2.So, Feedback.u2)
      annotation (Line(points={{19.8,28},{72,28},{72,42}}));
    connect(Temperature.y, tank1.T)
      annotation (Line(points={{-81.5,56},{-78,56},{-78,36},{-75.8,36}}, color=
            {0,0,255}));
    connect(Temperature.y, tank2.T)
      annotation (Line(points={{-81.5,56},{-52,56},{-52,36},{-48,36}}, color={0,
            0,255}));
    connect(Temperature.y, tank3.T) annotation (Line(points={{-81.5,56},{-52,56},
            {-52,14},{-60,14},{-60,8},{-59.5,8.4},{-59.5,8.4},{-60,8}}, color={
            0,0,255}));
    connect(Temperature.y, tank4.T) annotation (Line(points={{-81.5,56},{-52,56},
            {-52,14},{-32,14},{-32,8}}, color={0,0,255}));
    connect(Temperature.y, tank5.T) annotation (Line(points={{-81.5,56},{-52,56},
            {-52,14},{-5.9,14},{-5.9,8},{-5.8,8}}, color={0,0,255}));
    connect(sensor_NO.Sno, FixedDelay1.u)
      annotation (Line(points={{-22,58},{-22,58}}, color={0,0,255}));
    connect(FixedDelay1.y, Limiter1.u)
      annotation (Line(points={{3,58},{4,58}}, color={0,0,255}));
    connect(OxygenSetpoint.y, Feedback.u1)
      annotation (Line(points={{58,50},{64,50}}, color={0,0,255}));
    connect(Constant1.y, blower1.u) annotation (Line(points={{-45,-79},{-36,-79},
            {-36,-55},{-40.2,-55}}, color={0,0,255}));
    connect(blower2.u, Constant1.y)
      annotation (Line(points={{-12.2,-55},{-9,-55},{-9,-79},{-44,-79}}, color=
            {0,0,255}));
    connect(WastePump.Out, WasteSludge.In) annotation (Line(points={{79,-42},{
            87,-42}}));
    connect(WastePump.In, Settler.Waste) annotation (Line(points={{59,-48},{52,
            -48},{52,-31},{62,-31},{62,-3.6}}));
    connect(WastePump.u, Constant2.y)
      annotation (Line(points={{60,-43},{46,-43},{46,-58},{44,-58}}, color={0,0,
            255}));
    connect(sensor_NH1.In, Settler.Effluent) annotation (Line(points={{72,15},{
            72,11},{69,11}}));
    connect(sensor_NO1.In, Settler.Effluent) annotation (Line(points={{89,15},{
            89,11},{70,11}}));
    connect(sensor_TKN1.In, Settler.Effluent) annotation (Line(points={{105,14},
            {105,11},{70,11}}));
    connect(sensor_COD1.In, Settler.Effluent) annotation (Line(points={{105,-5},
            {105,11},{70,11}}));
    connect(Constant2.y, ReturnPump.u) annotation (Line(points={{43,-58},{46,
            -58},{46,-28.5},{34.8,-28.5}}, color={0,0,255}));
    connect(divider.Out1, Settler.Feed) annotation (Line(points={{41,6.5},{45,
            6.5},{45,6.4},{49,6.4}}));
    connect(Effluent.In, Settler.Effluent) annotation (Line(points={{88,-17},{
            78.5,-17},{78.5,11},{69,11}}));

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.39,
        height=0.58),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-120,-100},{120,105}},
          grid={1,1}), graphics),
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
  end BenchPlant;

  model ComplexPlant "Complex ASM2d WWTP"
    import WasteWater;
    extends Modelica.Icons.Example;

    ControlledDivider2 cdivider1 annotation (Placement(transformation(extent={{
              -168,65},{-148,85}}, rotation=0)));
    Modelica.Blocks.Sources.Constant Constant2(k=0.8)
      annotation (Placement(transformation(extent={{-178,52},{-168,62}},
            rotation=0)));
    blower blower1(Q_max=162816)
      "there exist 4 blowers of 4240 Nm3/h each, Q_max adusted according active aerated tanks"
       annotation (Placement(transformation(extent={{145,-13},{165,7}},
            rotation=0)));
    nitri nitri2(
      V=2772,
      alpha=0.305,
      de=5.24,
      R_air=20) annotation (Placement(transformation(extent={{110,18},{130,38}},
            rotation=0)));
    deni anaerob(V=1287) annotation (Placement(transformation(extent={{-138,13},
              {-118,33}}, rotation=0)));
    deni deni1(V=2772) annotation (Placement(transformation(extent={{-80,14},{
              -60,34}}, rotation=0)));
    deni deni3(V=2772) annotation (Placement(transformation(extent={{80,18},{
              100,38}}, rotation=0)));
    deni deni2(V=2772) annotation (Placement(transformation(extent={{-20,14},{0,
              34}}, rotation=0)));
    nitri nitri3(
      V=5602,
      alpha=0.305,
      de=5.24,
      R_air=21) annotation (Placement(transformation(extent={{144,18},{164,38}},
            rotation=0)));
    blower blower2(Q_max=81408)
      "there exist 4 blowers of 4240 Nm3/h each, Q_max adjusted according active aerated tanks"
       annotation (Placement(transformation(extent={{111,-13},{131,7}},
            rotation=0)));
    pump ReturnPump(Q_max=60480) annotation (Placement(transformation(
          origin={-44,-94},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    pump RecyclePump(Q_max=60480) annotation (Placement(transformation(
          origin={10,-33},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    pump WastePump(Q_max=1920) annotation (Placement(transformation(extent={{
              128,-104},{148,-84}}, rotation=0)));
    ControlledDivider2 cdivider2 annotation (Placement(transformation(extent={{
              -42,67},{-22,87}}, rotation=0)));
    EffluentSink Effluent annotation (Placement(transformation(extent={{170,-72},
              {190,-52}}, rotation=0)));
    SludgeSink WasteSludge annotation (Placement(transformation(extent={{170,
              -100},{190,-80}}, rotation=0)));
    mixer2 mixer2_1 annotation (Placement(transformation(extent={{-47,12},{-27,
              32}}, rotation=0)));
    mixer2 mixer2_2 annotation (Placement(transformation(extent={{50,17},{70,37}},
            rotation=0)));
    mixer3 mixer3_1 annotation (Placement(transformation(extent={{-106,14},{-86,
              34}}, rotation=0)));
    mixer2 mixer2_5 annotation (Placement(transformation(extent={{-140,-15},{
              -120,5}}, rotation=0)));
    divider2 divider2_1 annotation (Placement(transformation(
          origin={67,-32},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ControlledDivider2 cdivider3 annotation (Placement(transformation(
          origin={-122,-87},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Sources.Constant Constant4(k=0.5)
      annotation (Placement(transformation(extent={{-148,-80},{-138,-70}},
            rotation=0)));
    nitri nitri1(
      V=5602,
      alpha=0.305,
      de=5.24,
      R_air=21) annotation (Placement(transformation(extent={{12,14},{32,34}},
            rotation=0)));
    blower blower3(Q_max=162816)
      "there exist 4 blowers of max 4240 Nm3/h, Q_max adusted according active aerated tanks"
       annotation (Placement(transformation(extent={{12,-23},{32,-3}}, rotation
            =0)));
    Modelica.Blocks.Sources.Constant Constant7(k=0.56)
      annotation (Placement(transformation(extent={{-66,98},{-56,108}},
            rotation=0)));
    mixer2 mixer2_3 annotation (Placement(transformation(extent={{-168,18},{
              -148,38}}, rotation=0)));
    PreClar.preclar3 Preclaryfier(
      V=1372,
      aSi=2.5/100,
      aSf=5/100,
      aSa=10/100,
      aXi=48.5/100,
      aXs=34/100,
      aXh=0/100,
      n_corr=2.138) annotation (Placement(transformation(extent={{-136,68},{
              -116,88}}, rotation=0)));
    FlowSource FlowInput annotation (Placement(transformation(extent={{-178,95},
              {-158,115}}, rotation=0)));
    ControlledDivider2 ControlledDivider2_1 annotation (Placement(
          transformation(
          origin={-42,-36},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Sources.Constant Constant6 annotation (Placement(
          transformation(extent={{-46,-10},{-36,0}}, rotation=0)));
    sensor_NO sensor_NO1 annotation (Placement(transformation(extent={{-14,40},
              {6,60}}, rotation=0)));
    sensor_NO sensor_NO3 annotation (Placement(transformation(extent={{90,-56},
              {110,-36}}, rotation=0)));
    sensor_NH sensor_NH2 annotation (Placement(transformation(extent={{112,-56},
              {132,-36}}, rotation=0)));
    sensor_TSS sensor_TSS1 annotation (Placement(transformation(extent={{-6,-86},
              {14,-66}}, rotation=0)));
    Modelica.Blocks.Sources.Constant Temperature(k=11.5)
      annotation (Placement(transformation(extent={{58,44},{78,64}}, rotation=0)));
    precipitation precipitation1(V=22, beta=8) annotation (Placement(
          transformation(extent={{42,-82},{62,-62}}, rotation=0)));
    WasteWater.Misc.RecycleController2 RecycleController1(NO3min=1.5)
      annotation (Placement(transformation(extent={{15,-63},{29,-49}}, rotation
            =0)));
    WasteWater.Misc.ReturnController ReturnController1 annotation (Placement(
          transformation(extent={{-28,-115},{-14,-101}}, rotation=0)));
    sensor_Q sensor_Q1 annotation (Placement(transformation(extent={{-194,66},{
              -174,86}}, rotation=0)));
    WasteWater.Misc.TwoPoint TwoPoint1(
      on=4.5,
      off=4.0,
      out_on=2.5,
      out_off=1.5) annotation (Placement(transformation(extent={{-8,100},{2,110}},
            rotation=0)));
    WasteWater.Misc.TwoPoint TwoPoint2(
      on=4.5,
      off=4.0,
      out_on=2.5,
      out_off=1.5) annotation (Placement(transformation(extent={{110,100},{120,
              110}}, rotation=0)));
    WasteWater.ASM2d.sensor_NH sensor_NH1 annotation (Placement(transformation(
            extent={{142,38},{162,58}}, rotation=0)));
    Modelica.Blocks.Math.Feedback Feedback1 annotation (Placement(
          transformation(extent={{12,100},{22,110}}, rotation=0)));
    Modelica.Blocks.Math.Feedback Feedback2 annotation (Placement(
          transformation(extent={{127,99},{137,109}}, rotation=0)));
    WasteWater.ASM2d.sensor_O2 sensor_O2_1 annotation (Placement(transformation(
            extent={{164,38},{184,58}}, rotation=0)));
    WasteWater.ASM2d.sensor_O2 sensor_O2_2 annotation (Placement(transformation(
            extent={{14,38},{34,58}}, rotation=0)));
    WasteWater.ASM2d.sensor_COD sensor_COD1 annotation (Placement(
          transformation(extent={{134,-56},{154,-36}}, rotation=0)));
    WasteWater.ASM2d.sensor_COD sensor_COD2 annotation (Placement(
          transformation(extent={{-116,95},{-97,114}}, rotation=0)));
    WasteWater.ASM2d.Examples.JenaSecClarModTakacs Settler(hsc=3.46, Asc=3704)
      "The depth is calculated based on V and A of the settler and not the true depth."
       annotation (Placement(transformation(extent={{68,-84},{88,-64}},
            rotation=0)));

    WasteWater.ASM2d.sensor_TP sensor_TP1 annotation (Placement(transformation(
            extent={{-93,94},{-74,114}}, rotation=0)));
    WasteWater.ASM2d.sensor_TKN sensor_TKN1 annotation (Placement(
          transformation(extent={{68,-56},{88,-36}}, rotation=0)));
    WasteWater.ASM2d.sensor_TP sensor_TP2 annotation (Placement(transformation(
            extent={{-150,98},{-136,112}}, rotation=0)));
    WasteWater.ASM2d.sensor_TP sensor_TP3 annotation (Placement(transformation(
            extent={{156,-54},{174,-36}}, rotation=0)));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime1(
      fileName="drysim130303.txt",
      table=[0,0; 1,1],
      columns=integer(({2})),
      tableName="drysim130303",
      tableOnFile=("drysim130303") <> "NoName")
      annotation (Placement(transformation(extent={{-198,97},{-184,113}},
            rotation=0)));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime2(
      fileName="drysim130303.txt",
      table=[0,0; 1,1],
      columns=integer(({3,4,5,6})),
      tableName="drysim130303",
      tableOnFile=("drysim130303") <> "NoName")
      annotation (Placement(transformation(extent={{-134,96},{-118,112}},
            rotation=0)));
    Modelica.Blocks.Nonlinear.FixedDelay FixedDelay1(delayTime=1/24/6)
      annotation (Placement(transformation(extent={{-16,-63},{-2,-49}},
            rotation=0)));
    Modelica.Blocks.Math.Feedback Feedback3 annotation (Placement(
          transformation(
          origin={84,-13},
          extent={{5,-5},{-5,5}},
          rotation=180)));
    WasteWater.ASM2d.sensor_O2 sensor_O2_3 annotation (Placement(transformation(
            extent={{116,40},{134,58}}, rotation=0)));
    Modelica.Blocks.Math.Gain Gain1(k=500) annotation (Placement(transformation(
            extent={{29,95},{49,115}}, rotation=0)));
    Modelica.Blocks.Math.Gain Gain2(k=500) annotation (Placement(transformation(
            extent={{144,93},{164,113}}, rotation=0)));
    Modelica.Blocks.Math.Gain Gain3(k=500) annotation (Placement(transformation(
            extent={{94,-28},{108,-14}}, rotation=0)));
    WasteWater.Misc.TwoPoint TwoPoint3(
      on=4.5,
      off=4.0,
      out_on=2.0,
      out_off=1.0) annotation (Placement(transformation(extent={{63,-19},{75,-7}},
            rotation=0)));
    Modelica.Blocks.Sources.Step Step1(
      height=0.125,
      offset=-0.5,
      startTime=2.375) annotation (Placement(transformation(extent={{100,-90},{
              110,-80}}, rotation=0)));
  equation
    connect(deni3.Out, nitri2.In) annotation (Line(points={{100,28},{110,28}}));
    connect(nitri2.Out, nitri3.In) annotation (Line(points={{130,28},{144,28}}));
    connect(nitri3.Out, divider2_1.In) annotation (Line(points={{164,28},{190,
            28},{190,-32.3},{76,-32.3}}));
    connect(mixer2_5.Out, mixer3_1.In3) annotation (Line(points={{-120,-4.6},{
            -111,-4.6},{-111,20.5},{-107,20.5}}));
    connect(Constant4.y, cdivider3.u)
      annotation (Line(points={{-137.5,-75},{-122,-75},{-122,-81}}, color={0,0,
            255}));
    connect(nitri1.Out, mixer2_2.In2) annotation (Line(points={{33,24},{39,24},
            {39,25.5},{51,25.5}}));
    connect(deni2.Out, nitri1.In) annotation (Line(points={{5.55112e-16,24},{12,
            24}}));
    connect(cdivider2.Out1, mixer2_2.In1) annotation (Line(points={{-22,78.5},{
            40,78.5},{40,29.5},{50,29.5}}));
    connect(cdivider3.Out2, mixer2_5.In1) annotation (Line(points={{-132,-85.5},
            {-172,-85.5},{-172,-2.5},{-140,-2.5}}));
    connect(Constant7.y, cdivider2.u) annotation (Line(points={{-55.5,103},{
            -50.5,103},{-50.5,54},{-32,54},{-32,70}}, color={0,0,255}));
    connect(cdivider3.In, ReturnPump.Out) annotation (Line(points={{-112,-87.3},
            {-86.1,-87.3},{-86.1,-96.8},{-54.2,-96.8}}));
    connect(cdivider3.Out1, mixer2_3.In2) annotation (Line(points={{-132,-89.5},
            {-184,-89.5},{-184,26.5},{-168,26.5}}));
    connect(cdivider1.Out2, mixer2_3.In1) annotation (Line(points={{-147,73.5},
            {-143,73.5},{-143,40},{-184,40},{-184,30.5},{-168,30.5}}));
    connect(WastePump.Out, WasteSludge.In) annotation (Line(points={{148.2,
            -91.2},{170,-91.2}}));
    connect(ControlledDivider2_1.Out2, mixer2_1.In2) annotation (Line(points={{
            -51,-34.5},{-52,-34.5},{-52,20.5},{-47,20.5}}));
    connect(ControlledDivider2_1.Out1, mixer2_5.In2) annotation (Line(points={{
            -51,-38.5},{-150,-38.5},{-150,-6.5},{-140,-6.5}}));
    connect(Constant6.y, ControlledDivider2_1.u) annotation (Line(points={{-36,
            -5},{-31,-5},{-31,-18},{-41,-18},{-41,-30}}, color={0,0,255}));
    connect(Preclaryfier.In, cdivider1.Out1) annotation (Line(points={{-136,78},
            {-146.5,78},{-146.5,77.5},{-147,77.5}}));
    connect(mixer2_2.Out, deni3.In) annotation (Line(points={{70,27.4},{70,28},
            {80,28}}));
    connect(sensor_NO1.In, deni2.MeasurePort) annotation (Line(points={{-4,40},
            {-4,28.5},{-4.5,28.5}}));
    connect(Temperature.y, anaerob.T) annotation (Line(points={{80,54},{94,54},
            {94,34},{-138,34},{-138,27}}, color={0,0,255}));
    connect(Temperature.y, deni1.T) annotation (Line(points={{80,54},{94,54},{
            94,34},{-80,34},{-80,28}}, color={0,0,255}));
    connect(Temperature.y, deni2.T) annotation (Line(points={{80,54},{94,54},{
            94,34},{-20,34},{-20,28}}, color={0,0,255}));
    connect(Temperature.y, nitri1.T) annotation (Line(points={{80,54},{94,54},{
            94,34},{12,34},{12,28},{12.2,28}}, color={0,0,255}));
    connect(Temperature.y, deni3.T)
      annotation (Line(points={{80,54},{94,54},{94,34},{80,34},{80,32}}, color=
            {0,0,255}));
    connect(Temperature.y, nitri2.T) annotation (Line(points={{80,54},{94,54},{
            94,34},{110.5,34},{110.5,32},{110,32}}, color={0,0,255}));
    connect(Temperature.y, nitri3.T) annotation (Line(points={{80,54},{94,54},{
            94,34},{144,34},{144,32}}, color={0,0,255}));
    connect(precipitation1.In, divider2_1.Out1) annotation (Line(points={{42,
            -72},{38,-72},{38,-34.5},{56,-34.5}}));
    connect(precipitation1.T, Temperature.y)
      annotation (Line(points={{42,-68},{42,34},{94,34},{94,54},{80,54}}, color
          ={0,0,255}));
    connect(RecycleController1.out, RecyclePump.u) annotation (Line(points={{
            29.7,-56},{34,-56},{34,-36.5},{18.8,-36.5}}, color={0,0,255}));
    connect(sensor_Q1.Q, ReturnController1.in1) annotation (Line(points={{-184,
            66},{-184,65.5},{-194,65.5},{-194,-108},{-28.7,-108}}, color={0,0,
            255}));
    connect(sensor_NH1.In, nitri3.MeasurePort) annotation (Line(points={{152,38},
            {152,34},{160,34},{160,32.5}}));
    connect(sensor_O2_2.In, nitri1.MeasurePort) annotation (Line(points={{24,38},
            {24,28.5},{28,28.5}}));
    connect(Feedback1.u2, sensor_O2_2.So)
      annotation (Line(points={{17,101},{17,83.5},{34,83.5},{34,48}}, color={0,
            0,255}));
    connect(sensor_O2_1.In, nitri3.MeasurePort) annotation (Line(points={{174,
            38},{174,34},{160.25,34},{160.25,32},{160,32}}));
    connect(Feedback2.u2, sensor_O2_1.So)
      annotation (Line(points={{132,101},{132,81},{184,81},{184,48}}, color={0,
            0,255}));
    connect(sensor_NH1.Snh, TwoPoint1.e) annotation (Line(points={{162,48},{162,
            72},{-14,72},{-14,105},{-8,105}}, color={0,0,255}));
    connect(TwoPoint2.e, sensor_NH1.Snh) annotation (Line(points={{110,105},{
            100,105},{100,72},{162,72},{162,48}}, color={0,0,255}));
    connect(sensor_COD2.In, Preclaryfier.In) annotation (Line(points={{-107,95},
            {-107,78},{-136,78}}));
    connect(sensor_NO3.In, Settler.Effluent) annotation (Line(points={{100,-56},
            {100,-68.3},{88.2,-68.3}}));
    connect(sensor_NH2.In, Settler.Effluent) annotation (Line(points={{122,-56},
            {122,-68.3},{88.2,-68.3}}));
    connect(precipitation1.Out, Settler.Feed) annotation (Line(points={{62,-72},
            {65,-72},{65,-72.6},{68,-72.6}}));
    connect(WastePump.In, Settler.Waste) annotation (Line(points={{128,-97.3},{
            82,-97.3},{82,-84}}));
    connect(Settler.Return, ReturnPump.In) annotation (Line(points={{74,-84},{
            74,-90.7},{-34,-90.7}}));
    connect(sensor_TSS1.In, Settler.Return) annotation (Line(points={{4,-86},{4,
            -91},{74,-91},{74,-84}}));
    connect(sensor_TP1.In, Preclaryfier.Out) annotation (Line(points={{-84,94},
            {-84,78},{-116,78}}));
    connect(sensor_TKN1.In, Settler.Effluent) annotation (Line(points={{78,-56},
            {88,-56},{88,-68}}));
    connect(sensor_TP2.In, Preclaryfier.In) annotation (Line(points={{-143,98},
            {-143,78},{-136,78}}));
    connect(Preclaryfier.MeasurePort, CombiTableTime2.y) annotation (Line(
          points={{-122,88},{-122,94},{-116,94},{-116,104},{-117.2,104}}, color
          ={0,0,255}));
    connect(FixedDelay1.u, sensor_NO1.Sno) annotation (Line(points={{-18,-56},{
            -22,-56},{-22,-8},{10,-8},{10,50},{6,50}}, color={0,0,255}));
    connect(sensor_O2_3.In, nitri2.MeasurePort) annotation (Line(points={{125,
            40},{125,32.5},{126,32.5}}));
    connect(sensor_Q1.Out, cdivider1.In) annotation (Line(points={{-174,76},{
            -168,76}}));
    connect(cdivider2.Out2, mixer3_1.In1) annotation (Line(points={{-22,76},{
            -18,76},{-18,47},{-111,47},{-111,28.5},{-107,28.5}}));
    connect(mixer3_1.Out, deni1.In) annotation (Line(points={{-87,24},{-81,24}}));
    connect(FixedDelay1.y, RecycleController1.in1)
      annotation (Line(points={{-1,-56},{14.3,-56}}, color={0,0,255}));
    connect(Feedback2.u1, TwoPoint2.u)
      annotation (Line(points={{128,105},{120,105}}, color={0,0,255}));
    connect(TwoPoint1.u, Feedback1.u1)
      annotation (Line(points={{2.5,105},{13,105}}, color={0,0,255}));
    connect(mixer2_3.Out, anaerob.In) annotation (Line(points={{-148,29},{-143,
            29},{-143,23},{-138,23}}));
    connect(Gain1.u, Feedback1.y)
      annotation (Line(points={{27,104},{24,104},{24,105},{21,105}}, color={0,0,
            255}));
    connect(Gain2.u, Feedback2.y)
      annotation (Line(points={{141,103},{139,103},{139,104},{137,104}}, color=
            {0,0,255}));
    connect(Feedback3.y, Gain3.u) annotation (Line(points={{88.5,-13},{90.55,
            -13},{90.55,-21},{92.6,-21}}, color={0,0,255}));
    connect(sensor_O2_3.So, Feedback3.u2) annotation (Line(points={{134,49},{
            139,49},{139,16},{83,16},{83,-9}}, color={0,0,255}));
    connect(TwoPoint3.u, Feedback3.u1)
      annotation (Line(points={{75,-13},{80,-13}}, color={0,0,255}));
    connect(TwoPoint3.e, sensor_NH1.Snh) annotation (Line(points={{63,-13},{56,
            -13},{56,6},{104,6},{104,72},{162,72},{162,49}}, color={0,0,255}));
    connect(Step1.y, WastePump.u) annotation (Line(points={{111,-85},{119,-85},
            {119,-91},{129.2,-91}}, color={0,0,255}));
    connect(blower3.AirOut, nitri1.AirIn) annotation (Line(points={{21,-3},{21,
            5.5},{22,5.5},{22,14}}));
    connect(blower1.AirOut, nitri3.AirIn) annotation (Line(points={{155,8},{155,
            13},{154,5.5},{154,18}}));
    connect(Constant2.y, cdivider1.u)
      annotation (Line(points={{-167.5,57},{-158,57},{-158,69}}, color={0,0,255}));
    connect(Gain1.y, blower3.u) annotation (Line(points={{50,105},{55,105},{55,
            83},{49,83},{49,-15},{32,-15}}, color={0,0,255}));
    connect(Gain3.y, blower2.u) annotation (Line(points={{108.7,-21},{139,-21},
            {139,-6},{130.8,-6}}, color={0,0,255}));
    connect(blower1.u, Gain2.y)
      annotation (Line(points={{165.8,-5},{195,-5},{195,103},{165,103}}, color=
            {0,0,255}));
    connect(CombiTableTime1.y[1], FlowInput.data)
      annotation (Line(points={{-183.3,105},{-178,105}}, color={0,0,255}));
    connect(sensor_Q1.In, FlowInput.Out) annotation (Line(points={{-194,76},{
            -194,89},{-158,89},{-158,98}}));
    connect(ReturnPump.u, ReturnController1.out) annotation (Line(points={{
            -35.2,-97},{-5,-97},{-5,-108},{-13,-108}}, color={0,0,255}));
    connect(ControlledDivider2_1.In, RecyclePump.Out) annotation (Line(points={
            {-32,-36},{0,-36}}));
    connect(divider2_1.Out2, RecyclePump.In) annotation (Line(points={{56,-30},
            {20,-30}}));
    connect(mixer2_1.In1, deni1.Out) annotation (Line(points={{-47,24},{-60,24}}));
    connect(mixer2_1.Out, deni2.In) annotation (Line(points={{-27,22},{-23.5,22},
            {-23.5,24},{-20,24}}));
    connect(mixer3_1.In2, anaerob.Out) annotation (Line(points={{-107,23},{-118,
            23}}));
    connect(cdivider2.In, Preclaryfier.Out) annotation (Line(points={{-42,77},{
            -84,77},{-84,78},{-116,78}}));
    connect(blower2.AirOut, nitri2.AirIn) annotation (Line(points={{120,7},{120,
            18.2}}));
    connect(Settler.Effluent, sensor_COD1.In) annotation (Line(points={{89,-68},
            {145,-68},{145,-55}}));
    connect(Effluent.In, Settler.Effluent) annotation (Line(points={{170,-61},{
            165,-61},{165,-68},{88,-68}}));
    connect(sensor_TP3.In, Settler.Effluent) annotation (Line(points={{165,-54},
            {165,-68},{88,-68}}));

    annotation (
      Window(
        x=0.14,
        y=0.01,
        width=0.66,
        height=0.88),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-200,-120},{200,120}},
          grid={1,1}), graphics),
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
    WI.WWFlowAsm2din Feed annotation (Placement(transformation(extent={{-110,4},
              {-90,24}}, rotation=0)));
    WI.WWFlowAsm2dout Effluent annotation (Placement(transformation(extent={{92,
              47},{112,67}}, rotation=0)));
    WI.WWFlowAsm2dout Return annotation (Placement(transformation(extent={{-40,
              -106},{-20,-86}}, rotation=0)));
    WI.WWFlowAsm2dout Waste annotation (Placement(transformation(extent={{20,
              -106},{40,-86}}, rotation=0)));
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
      rXmep=rXmep) annotation (Placement(transformation(extent={{-35,-93},{35,
              -78}}, rotation=0)));
    SCP.lower_layer S2(
      zm=zm,
      Asc=Asc,
      Xf=Xf) annotation (Placement(transformation(extent={{-35,-74},{35,-59}},
            rotation=0)));
    SCP.lower_layer S3(
      zm=zm,
      Asc=Asc,
      Xf=Xf) annotation (Placement(transformation(extent={{-35,-55},{35,-40}},
            rotation=0)));
    SCP.feed_layer S4(
      zm=zm,
      Asc=Asc,
      Xf=Xf) annotation (Placement(transformation(extent={{-36,-36},{34,-22}},
            rotation=0)));
    SCP.upper_layer S5(
      zm=zm,
      Asc=Asc,
      Xf=Xf,
      Xt=Xt) annotation (Placement(transformation(extent={{-36,-16},{34,-4}},
            rotation=0)));
    SCP.upper_layer S6(
      zm=zm,
      Asc=Asc,
      Xf=Xf,
      Xt=Xt) annotation (Placement(transformation(extent={{-36,2},{34,16}},
            rotation=0)));
    SCP.upper_layer S7(
      zm=zm,
      Asc=Asc,
      Xf=Xf,
      Xt=Xt) annotation (Placement(transformation(extent={{-35,21},{35,36}},
            rotation=0)));
    SCP.upper_layer S8(
      zm=zm,
      Asc=Asc,
      Xt=Xt,
      Xf=Xf) annotation (Placement(transformation(extent={{-35,40},{35,55}},
            rotation=0)));
    SCP.upper_layer S9(
      zm=zm,
      Asc=Asc,
      Xf=Xf,
      Xt=Xt) annotation (Placement(transformation(extent={{-35,59},{35,74}},
            rotation=0)));
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
      rXmep=rXmep) annotation (Placement(transformation(extent={{-35,78},{35,93}},
            rotation=0)));
  equation

    connect(S1.Up, S2.Dn) annotation (Line(points={{-2.22045e-15,-78},{
            -2.22045e-15,-74}}));
    connect(S2.Up, S3.Dn) annotation (Line(points={{-2.22045e-15,-59},{
            -2.22045e-15,-55}}));
    connect(S7.Up, S8.Dn) annotation (Line(points={{-2.22045e-15,36},{
            -2.22045e-15,40}}));
    connect(S9.Up, S10.Dn) annotation (Line(points={{-2.22045e-15,74},{
            -2.22045e-15,78}}));
    connect(S8.Up, S9.Dn) annotation (Line(points={{-2.22045e-15,55},{
            -2.22045e-15,59}}));
    connect(S1.PQw, Waste) annotation (Line(points={{17.5,-93},{30,-93},{30,
            -100}}));
    connect(S10.Out, Effluent) annotation (Line(points={{35,85.5},{67.5,85.5},{
            67.5,57},{100,57}}));
    connect(S1.PQr, Return) annotation (Line(points={{-21,-93},{-30,-93},{-30,
            -100}}));
    connect(S4.Dn, S3.Up) annotation (Line(points={{0,-36},{0,-40}}));
    connect(S4.Up, S5.Dn) annotation (Line(points={{-2,-22},{-2,-16}}));
    connect(S5.Up, S6.Dn) annotation (Line(points={{0,-4},{0,2}}));
    connect(S6.Up, S7.Dn) annotation (Line(points={{0,16},{0,21}}));
    connect(Feed, S4.In) annotation (Line(points={{-100,10},{-67.5,10},{-67.5,
            -28.72},{-35,-28.72}}));

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

    annotation (
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
  end JenaSecClarModTakacs;
  annotation (
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
end Examples;
