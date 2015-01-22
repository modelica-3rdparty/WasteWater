within WasteWater.ASM3;
package Examples "Demonstration examples of the components of the ASM3 library"

  extends Modelica.Icons.Library;

  class SmallPlant "Small WWTP Configuration"

    //Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark
    //Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark

    extends Modelica.Icons.Example;

    ASM3.EffluentSink Effluent annotation (Placement(transformation(extent={{88,
              -18},{108,2}}, rotation=0)));
    ASM3.SludgeSink WasteSludge annotation (Placement(transformation(extent={{
              86,-58},{106,-38}}, rotation=0)));
    ASM3.divider2 divider annotation (Placement(transformation(extent={{20,-6},
              {40,14}}, rotation=0)));
    ASM3.nitri tank3(K_A_NH=0.4, V=1333) annotation (Placement(transformation(
            extent={{-6,-6},{14,14}}, rotation=0)));
    ASM3.nitri tank2(K_A_NH=0.4, V=1333) annotation (Placement(transformation(
            extent={{-32,-6},{-12,14}}, rotation=0)));
    ASM3.deni tank1(K_A_NH=0.4, V=3000) annotation (Placement(transformation(
            extent={{-68,-6},{-48,14}}, rotation=0)));
    ASM3.mixer3 mixer annotation (Placement(transformation(extent={{-104,22},{
              -84,42}}, rotation=0)));
    ASM3.WWSource WWSource annotation (Placement(transformation(extent={{-88,78},
              {-68,98}}, rotation=0)));
    ASM3.blower blower1(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-32,-62},{-12,-42}}, rotation=0)));
    ASM3.blower blower2(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-6,-62},{14,-42}}, rotation=0)));
    ASM3.sensor_O2 sensor_O2 annotation (Placement(transformation(extent={{0,18},
              {20,38}}, rotation=0)));
    Modelica.Blocks.Math.Feedback Feedback annotation (Placement(transformation(
            extent={{62,40},{82,60}}, rotation=0)));
    Modelica.Blocks.Continuous.PI PI1(T=0.001, k=500)
      annotation (Placement(transformation(extent={{88,40},{108,60}}, rotation=
              0)));
    Modelica.Blocks.Sources.Constant Constant1 annotation (Placement(
          transformation(extent={{-84,-86},{-64,-66}}, rotation=0)));
    ASM3.pump RecyclePump(Q_max=46115) annotation (Placement(transformation(
          origin={-84,-12},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Sources.Step OxygenSetPoint(height=1.5)
      annotation (Placement(transformation(extent={{40,40},{60,60}}, rotation=0)));
    ASM3.pump ReturnPump(Q_max=9223) annotation (Placement(transformation(
          origin={26,-26},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM3.pump WastePump(Q_max=193) annotation (Placement(transformation(extent=
              {{70,-14},{90,-34}}, rotation=0)));
    Modelica.Blocks.Sources.Constant Constant2 annotation (Placement(
          transformation(extent={{22,-68},{42,-48}}, rotation=0)));
    Modelica.Blocks.Sources.Constant Temperature(k=15)
      annotation (Placement(transformation(extent={{-94,50},{-82,62}}, rotation
            =0)));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime(
      fileName="Inf_dry.txt",
      table=[0,0; 1,1],
      columns=integer(({16,10,3,4,12,10,11,15,5,6,7,10,8})),
      tableName="Inf_dry",
      tableOnFile=("Inf_dry") <> "NoName") annotation (Placement(transformation(
            extent={{-118,78},{-98,98}}, rotation=0)));
    sensor_NH sensor_NH1 annotation (Placement(transformation(extent={{78,16},{
              94,32}}, rotation=0)));
    sensor_NO sensor_NO1 annotation (Placement(transformation(extent={{92,16},{
              108,32}}, rotation=0)));
    sensor_COD sensor_COD1 annotation (Placement(transformation(extent={{64,16},
              {80,32}}, rotation=0)));
    SecClar.Krebs.SecClarModKrebs Settler annotation (Placement(transformation(
            extent={{50,-2},{70,18}}, rotation=0)));
  equation
    connect(tank3.Out, divider.In) annotation (Line(points={{14,4},{20,4}}));
    connect(tank2.Out, tank3.In) annotation (Line(points={{-12,4},{-6,4}}));
    connect(mixer.Out, tank1.In) annotation (Line(points={{-84,32},{-79,32},{
            -79,4},{-68,4}}));
    connect(mixer.In1, WWSource.Out) annotation (Line(points={{-104,35.9},{-104,
            74},{-68,74},{-68,81},{-68.2,81}}));
    connect(blower1.AirOut, tank2.AirIn) annotation (Line(points={{-22,-42},{
            -22,-5.8}}));
    connect(blower2.AirOut, tank3.AirIn) annotation (Line(points={{4,-42},{4,
            -5.8}}));
    connect(tank3.MeasurePort, sensor_O2.In) annotation (Line(points={{9.5,8.5},
            {10,8.5},{10,18}}));
    connect(Feedback.y, PI1.u) annotation (Line(points={{81,50},{86,50}}));
    connect(PI1.y, blower2.u)
      annotation (Line(points={{109,50},{114,50},{114,-78},{18,-78},{18,-55},{
            13.9,-55}}));
    connect(divider.Out2, RecyclePump.In) annotation (Line(points={{40,2.2},{44,
            2.2},{44,-8.7},{-74,-8.7}}));
    connect(RecyclePump.Out, mixer.In3) annotation (Line(points={{-94.2,-14.9},
            {-108,-14.9},{-108,26.6},{-104,26.6},{-104,27.1}}));
    connect(OxygenSetPoint.y, Feedback.u1) annotation (Line(points={{61,50},{64,
            50}}));
    connect(ReturnPump.Out, mixer.In2) annotation (Line(points={{15.8,-28.9},{
            -112,-28.9},{-112,32},{-104,32}}));
    connect(WastePump.Out, WasteSludge.In) annotation (Line(points={{90.2,-26.9},
            {100,-26.9},{100,-34},{80,-34},{80,-49.2},{86,-49.2}}));
    connect(Constant2.y, ReturnPump.u)
      annotation (Line(points={{43,-58},{46,-58},{46,-28.5},{34.8,-28.5}}));
    connect(Constant2.y, WastePump.u)
      annotation (Line(points={{43,-58},{60,-58},{60,-26.5},{71.2,-26.5}}));
    connect(sensor_O2.So, Feedback.u2)
      annotation (Line(points={{19.8,28},{19.85,28},{19.85,34},{72,34},{72,42}}));
    connect(blower1.u, Constant1.y)
      annotation (Line(points={{-12.1,-55},{-8,-55},{-8,-76},{-63,-76}}));
    connect(Temperature.y, tank1.T) annotation (Line(points={{-81.5,56},{-74,56},
            {-74,8},{-71,8},{-71,8},{-68,8}}, color={0,0,255}));
    connect(Temperature.y, tank2.T) annotation (Line(points={{-81.5,56},{-74,56},
            {-74,14},{-32,14},{-32,8}}, color={0,0,255}));
    connect(Temperature.y, tank3.T) annotation (Line(points={{-81.5,56},{-74,56},
            {-74,14},{-5.9,14},{-5.9,8},{-5.8,8}}, color={0,0,255}));
    connect(CombiTableTime.y, WWSource.data)
      annotation (Line(points={{-97,88},{-88,88}}, color={0,0,255}));
    connect(tank1.Out, tank2.In) annotation (Line(points={{-48,4},{-32,4}}));
    connect(RecyclePump.u, Constant1.y) annotation (Line(points={{-75.2,-14},{
            -46,-14},{-46,-76},{-64,-76}}, color={0,0,255}));
    connect(Settler.Effluent, Effluent.In) annotation (Line(points={{70.2,13.7},
            {72,13.7},{72,-6},{88,-6}}));
    connect(Settler.Return, ReturnPump.In) annotation (Line(points={{57,-1.6},{
            57,-22.7},{36,-22.7}}));
    connect(Settler.Waste, WastePump.In) annotation (Line(points={{63,-1.6},{63,
            -20.7},{70,-20.7}}));
    connect(sensor_COD1.In, Settler.Effluent) annotation (Line(points={{72,16},
            {72,13.7},{70.2,13.7}}));
    connect(sensor_NH1.In, Settler.Effluent) annotation (Line(points={{86,16},{
            86,13.7},{70.2,13.7}}));
    connect(sensor_NO1.In, Settler.Effluent) annotation (Line(points={{100,16},
            {100,13.7},{70.2,13.7}}));
    connect(Settler.Feed, divider.Out1) annotation (Line(points={{50,8},{40,8}}));

    annotation (
      Window(
        x=0.13,
        y=0.08,
        width=0.39,
        height=0.58),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-118,-94},{118,98}},
          grid={2,2}), graphics={Line(points={{-93,88},{-88,88}})}),
      Documentation(info="This fictitious plant provides an ASM3 example model with a small number of equations.
It consists of one denitrification and 2 nitrification tanks and a settler.

Change into the directory ../ASM3 and translate the model.
Before simulating the model load initial values from the script file small_asm3.mos
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
    //Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark

    //Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark

    extends Modelica.Icons.Example;

    ASM3.EffluentSink Effluent annotation (Placement(transformation(extent={{90,
              -16},{110,4}}, rotation=0)));
    ASM3.SludgeSink WasteSludge annotation (Placement(transformation(extent={{
              86,-58},{106,-38}}, rotation=0)));
    ASM3.SecClarModTakacs Settler annotation (Placement(transformation(extent={
              {48,-2},{68,18}}, rotation=0)));
    ASM3.divider2 divider annotation (Placement(transformation(extent={{20,-6},
              {40,14}}, rotation=0)));
    ASM3.nitri tank5(
      K_A_NH=0.4,
      b_A_O_T=0.1,
      V=1333) annotation (Placement(transformation(extent={{-6,-6},{14,14}},
            rotation=0)));
    ASM3.nitri tank4(
      K_A_NH=0.4,
      b_A_O_T=0.1,
      V=1333) annotation (Placement(transformation(extent={{-32,-6},{-12,14}},
            rotation=0)));
    ASM3.nitri tank3(
      K_A_NH=0.4,
      b_A_O_T=0.1,
      V=1333) annotation (Placement(transformation(extent={{-60,-6},{-40,14}},
            rotation=0)));
    ASM3.deni tank2(K_A_NH=0.4, b_A_O_T=0.1) annotation (Placement(
          transformation(extent={{-48,22},{-28,42}}, rotation=0)));
    ASM3.deni tank1(K_A_NH=0.4, b_A_O_T=0.1) annotation (Placement(
          transformation(extent={{-76,22},{-56,42}}, rotation=0)));
    ASM3.mixer3 mixer annotation (Placement(transformation(extent={{-104,22},{
              -84,42}}, rotation=0)));
    ASM3.WWSource WWSource annotation (Placement(transformation(extent={{-88,78},
              {-68,98}}, rotation=0)));
    ASM3.sensor_NO sensor_NO annotation (Placement(transformation(extent={{-42,
              48},{-22,68}}, rotation=0)));
    ASM3.blower blower1(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-60,-62},{-40,-42}}, rotation=0)));
    ASM3.blower blower2(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-32,-62},{-12,-42}}, rotation=0)));
    ASM3.blower blower3(Q_max=34574.2654508612) annotation (Placement(
          transformation(extent={{-6,-62},{14,-42}}, rotation=0)));
    ASM3.sensor_O2 sensor_O2 annotation (Placement(transformation(extent={{0,18},
              {20,38}}, rotation=0)));
    Modelica.Blocks.Math.Feedback Feedback annotation (Placement(transformation(
            extent={{62,40},{82,60}}, rotation=0)));
    Modelica.Blocks.Continuous.PI PI1(T=0.001, k=500)
      annotation (Placement(transformation(extent={{88,40},{108,60}}, rotation=
              0)));
    Modelica.Blocks.Sources.Constant Constant1 annotation (Placement(
          transformation(extent={{-84,-86},{-64,-66}}, rotation=0)));
    ASM3.pump RecyclePump(Q_max=92230) annotation (Placement(transformation(
          origin={-84,-12},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Continuous.PI PI2(T=0.05, k=15000)
      annotation (Placement(transformation(extent={{58,78},{78,98}}, rotation=0)));
    Modelica.Blocks.Sources.Step OxygenSetPoint(height=2)
      annotation (Placement(transformation(extent={{40,40},{58,58}}, rotation=0)));
    Modelica.Blocks.Sources.Constant NitrogenSetpoint annotation (Placement(
          transformation(extent={{-8,78},{12,98}}, rotation=0)));
    Modelica.Blocks.Math.Feedback Feedback1 annotation (Placement(
          transformation(extent={{22,78},{42,98}}, rotation=0)));
    Modelica.Blocks.Nonlinear.Limiter Limiter1(uMax=10, uMin=0.1)
      annotation (Placement(transformation(extent={{8,48},{28,68}}, rotation=0)));
    ASM3.pump ReturnPump(Q_max=18446) annotation (Placement(transformation(
          origin={26,-26},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM3.pump WastePump(Q_max=385) annotation (Placement(transformation(extent=
              {{70,-34},{90,-14}}, rotation=0)));
    Modelica.Blocks.Sources.Constant Constant2 annotation (Placement(
          transformation(extent={{22,-68},{42,-48}}, rotation=0)));
    Modelica.Blocks.Sources.Constant Temperature(k=15)
      annotation (Placement(transformation(extent={{-94,50},{-82,62}}, rotation
            =0)));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime(
      fileName="Inf_rain.txt",
      table=[0,0; 1,1],
      columns=integer(({2,10,3,4,12,10,11,15,5,6,7,10,8})),
      tableName="Inf_rain",
      tableOnFile=("Inf_rain") <> "NoName")
      annotation (Placement(transformation(extent={{-118,78},{-98,98}},
            rotation=0)));
    Modelica.Blocks.Nonlinear.FixedDelay FixedDelay1(delayTime=1/6/24)
      annotation (Placement(transformation(extent={{-18,48},{2,68}}, rotation=0)));
    sensor_NH sensor_NH1 annotation (Placement(transformation(extent={{60,18},{
              76,34}}, rotation=0)));
    WasteWater.ASM3.sensor_NO sensor_NO1 annotation (Placement(transformation(
            extent={{92,18},{108,34}}, rotation=0)));
    WasteWater.ASM3.sensor_COD sensor_COD1 annotation (Placement(transformation(
            extent={{76,18},{92,34}}, rotation=0)));
  equation
    connect(divider.Out1, Settler.Feed) annotation (Line(points={{40,7},{40,9.4},
            {48,9.4}}));
    connect(tank5.Out, divider.In) annotation (Line(points={{14,4},{20,4}}));
    connect(tank4.Out, tank5.In) annotation (Line(points={{-12,4},{-6,4}}));
    connect(tank3.Out, tank4.In) annotation (Line(points={{-40,4},{-32,4}}));
    connect(tank3.In, tank2.Out) annotation (Line(points={{-60,4},{-70,4},{-70,
            18},{-18,18},{-18,32},{-28,32}}));
    connect(tank1.Out, tank2.In) annotation (Line(points={{-56,32},{-48,32}}));
    connect(mixer.Out, tank1.In) annotation (Line(points={{-84,32},{-76,32}}));
    connect(Settler.Effluent, Effluent.In) annotation (Line(points={{68.2,13.7},
            {72,13.7},{72,-4},{90,-4}}));
    connect(mixer.In1, WWSource.Out) annotation (Line(points={{-104,35.9},{-104,
            74},{-68,74},{-68,77.5},{-68.2,77.5},{-68.2,81}}));
    connect(blower1.AirOut, tank3.AirIn) annotation (Line(points={{-50,-42},{
            -50,-5.8}}));
    connect(blower2.AirOut, tank4.AirIn) annotation (Line(points={{-22,-42},{
            -22,-5.8}}));
    connect(blower3.AirOut, tank5.AirIn) annotation (Line(points={{4,-42},{4,
            -5.8}}));
    connect(tank5.MeasurePort, sensor_O2.In) annotation (Line(points={{9.5,8.5},
            {10,8.5},{10,18}}));
    connect(Feedback.y, PI1.u) annotation (Line(points={{81,50},{86,50}}));
    connect(PI1.y, blower3.u)
      annotation (Line(points={{109,50},{114,50},{114,-78},{18,-78},{18,-55},{
            13.9,-55}}));
    connect(Constant1.y, blower1.u)
      annotation (Line(points={{-63,-76},{-35.1,-76},{-35.1,-55},{-40.1,-55}}));
    connect(divider.Out2, RecyclePump.In) annotation (Line(points={{40,2.2},{44,
            2.2},{44,-8.7},{-74,-8.7}}));
    connect(RecyclePump.Out, mixer.In3) annotation (Line(points={{-94.2,-14.9},
            {-108,-14.9},{-108,26.6},{-104,26.6},{-104,27.1}}));
    connect(OxygenSetPoint.y, Feedback.u1)
      annotation (Line(points={{58.9,49},{62.5,49},{62.5,50},{64,50}}));
    connect(Feedback1.y, PI2.u) annotation (Line(points={{41,88},{56,88}}));
    connect(NitrogenSetpoint.y, Feedback1.u1)
      annotation (Line(points={{13,88},{24,88}}));
    connect(PI2.y, RecyclePump.u) annotation (Line(points={{79,88},{118,88},{
            118,-94},{-106,-94},{-106,-40},{-66,-40},{-66,-14.5},{-75.2,-14.5}}));
    connect(Limiter1.y, Feedback1.u2) annotation (Line(points={{29,58},{32,58},
            {32,80}}));
    connect(Settler.Return, ReturnPump.In) annotation (Line(points={{55,-1.6},{
            55,-22.7},{36,-22.7}}));
    connect(ReturnPump.Out, mixer.In2) annotation (Line(points={{15.8,-28.9},{
            -112,-28.9},{-112,32},{-104,32}}));
    connect(Settler.Waste, WastePump.In) annotation (Line(points={{61,-1.6},{61,
            -27.3},{70,-27.3}}));
    connect(WastePump.Out, WasteSludge.In) annotation (Line(points={{90.2,-21.1},
            {100,-21.1},{100,-34},{80,-34},{80,-49.2},{86,-49.2}}));
    connect(Constant2.y, ReturnPump.u)
      annotation (Line(points={{43,-58},{46,-58},{46,-28.5},{34.8,-28.5}}));
    connect(Constant2.y, WastePump.u)
      annotation (Line(points={{43,-58},{58,-58},{58,-21.5},{71.2,-21.5}}));
    connect(sensor_O2.So, Feedback.u2)
      annotation (Line(points={{19.8,28},{60,28},{60,36},{72,36},{72,42}}));
    connect(blower2.u, Constant1.y)
      annotation (Line(points={{-12.1,-55},{-8,-55},{-8,-76},{-63,-76}}));
    connect(Temperature.y, tank1.T)
      annotation (Line(points={{-81.5,56},{-78,56},{-78,36},{-75.8,36}}, color=
            {0,0,255}));
    connect(Temperature.y, tank2.T)
      annotation (Line(points={{-81.5,56},{-48,56},{-48,36}}, color={0,0,255}));
    connect(Temperature.y, tank3.T) annotation (Line(points={{-81.5,56},{-52,56},
            {-52,14},{-60,14},{-60,8},{-59.5,8.4},{-59.5,8.4},{-60,8}}, color={
            0,0,255}));
    connect(Temperature.y, tank4.T) annotation (Line(points={{-81.5,56},{-52,56},
            {-52,14},{-32,14},{-32,8}}, color={0,0,255}));
    connect(Temperature.y, tank5.T) annotation (Line(points={{-81.5,56},{-52,56},
            {-52,14},{-5.9,14},{-5.9,8},{-5.8,8}}, color={0,0,255}));
    connect(CombiTableTime.y, WWSource.data)
      annotation (Line(points={{-97,88},{-88,88}}, color={0,0,255}));
    connect(sensor_NO.In, tank2.MeasurePort) annotation (Line(points={{-32,48},
            {-32,36.5},{-32.5,36.5}}));
    connect(FixedDelay1.u, sensor_NO.Sno)
      annotation (Line(points={{-20,58},{-22,58}}, color={0,0,255}));
    connect(Limiter1.u, FixedDelay1.y)
      annotation (Line(points={{6,58},{4,58}}, color={0,0,255}));
    connect(sensor_NH1.In, Settler.Effluent) annotation (Line(points={{68,18},{
            68,13.7}}));
    connect(sensor_COD1.In, Settler.Effluent) annotation (Line(points={{84,18},
            {84,14},{68,14}}));
    connect(sensor_NO1.In, Settler.Effluent) annotation (Line(points={{100,18},
            {100,14},{68.2,14}}));

    annotation (
      Window(
        x=0.63,
        y=0.39,
        width=0.35,
        height=0.49),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-118,-94},{118,98}},
          grid={2,2}), graphics={
          Line(points={{-93,88},{-88,88}}),
          Line(points={{-22.2,58},{-20,58}}),
          Line(points={{3,58},{6,58}})}),
      Documentation(info="This ASM3 plant consists of 2 denitrification tanks (tank1 and tank2),
3 nitrification tanks (tank3 - tank5) and a secondary clarifier by Takacs.
Furthermore there are 2 control loops modelled.
This configuration corresponds to the COST simulation benchmark [1].

Change into the directory ../ASM3 and translate the model.
Before simulating the model load initial values from the script file bench_asm3.mos
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
      k_H_T=9.0,
      K_A_NH=0.4,
      b_A_O_T=0.1,
      V=2772,
      alpha=0.305,
      de=5.24,
      R_air=20) annotation (Placement(transformation(extent={{110,18},{130,38}},
            rotation=0)));
    deni anaerob(
      k_H_T=9.0,
      K_A_NH=0.4,
      b_A_O_T=0.1,
      V=1287) annotation (Placement(transformation(extent={{-138,13},{-118,33}},
            rotation=0)));
    deni deni1(
      k_H_T=9.0,
      K_A_NH=0.4,
      b_A_O_T=0.1,
      V=2772) annotation (Placement(transformation(extent={{-80,14},{-60,34}},
            rotation=0)));
    deni deni3(
      k_H_T=9.0,
      K_A_NH=0.4,
      b_A_O_T=0.1,
      V=2772) annotation (Placement(transformation(extent={{80,18},{100,38}},
            rotation=0)));
    deni deni2(
      k_H_T=9.0,
      K_A_NH=0.4,
      b_A_O_T=0.1,
      V=2772) annotation (Placement(transformation(extent={{-20,14},{0,34}},
            rotation=0)));
    nitri nitri3(
      k_H_T=9.0,
      K_A_NH=0.4,
      b_A_O_T=0.1,
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
          origin={10,-36},
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
    mixer2 mixer2_1 annotation (Placement(transformation(extent={{-45,16},{-25,
              36}}, rotation=0)));
    mixer2 mixer2_2 annotation (Placement(transformation(extent={{50,17},{70,37}},
            rotation=0)));
    mixer3 mixer3_1 annotation (Placement(transformation(extent={{-107,14},{-87,
              34}}, rotation=0)));
    mixer2 mixer2_5 annotation (Placement(transformation(extent={{-140,-15},{
              -120,5}}, rotation=0)));
    divider2 divider2_1 annotation (Placement(transformation(
          origin={57,-35},
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
      k_H_T=9.0,
      K_A_NH=0.4,
      b_A_O_T=0.1,
      V=5602,
      alpha=0.305,
      de=5.24,
      R_air=21) annotation (Placement(transformation(extent={{12,14},{32,34}},
            rotation=0)));
    blower blower3(Q_max=162816)
      "there exist 4 blowers of max 4240 Nm3/h, Q_max adusted according active aerated tanks"
       annotation (Placement(transformation(extent={{13,-23},{33,-3}}, rotation
            =0)));
    Modelica.Blocks.Sources.Constant Constant7(k=0.56)
      annotation (Placement(transformation(extent={{-66,98},{-56,108}},
            rotation=0)));
    mixer2 mixer2_3 annotation (Placement(transformation(extent={{-168,18},{
              -148,38}}, rotation=0)));
    PreClar.preclar3 Preclaryfier(V=1372, n_corr=2.138) annotation (Placement(
          transformation(extent={{-136,68},{-116,88}}, rotation=0)));
    FlowSource FlowInput annotation (Placement(transformation(extent={{-176,94},
              {-156,114}}, rotation=0)));
    ControlledDivider2 ControlledDivider2_1 annotation (Placement(
          transformation(
          origin={-41,-39},
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
    sensor_TSS sensor_TSS1 annotation (Placement(transformation(extent={{-6,-87},
              {14,-67}}, rotation=0)));
    Modelica.Blocks.Sources.Constant Temperature(k=11.5)
      annotation (Placement(transformation(extent={{58,44},{78,64}}, rotation=0)));
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
    WasteWater.ASM3.sensor_NH sensor_NH1 annotation (Placement(transformation(
            extent={{142,38},{162,58}}, rotation=0)));
    Modelica.Blocks.Math.Feedback Feedback1 annotation (Placement(
          transformation(extent={{12,100},{22,110}}, rotation=0)));
    Modelica.Blocks.Math.Feedback Feedback2 annotation (Placement(
          transformation(extent={{127,99},{137,109}}, rotation=0)));
    WasteWater.ASM3.sensor_O2 sensor_O2_1 annotation (Placement(transformation(
            extent={{164,38},{184,58}}, rotation=0)));
    WasteWater.ASM3.sensor_O2 sensor_O2_2 annotation (Placement(transformation(
            extent={{14,38},{34,58}}, rotation=0)));
    WasteWater.ASM3.sensor_COD sensor_COD1 annotation (Placement(transformation(
            extent={{134,-56},{154,-36}}, rotation=0)));
    WasteWater.ASM3.sensor_COD sensor_COD2 annotation (Placement(transformation(
            extent={{-118,94},{-98,114}}, rotation=0)));
    WasteWater.ASM3.Examples.JenaSecClarModTakacs Settler(hsc=3.46, Asc=3704)
      "The depth is calculated based on V and A of the settler and not the true depth."
       annotation (Placement(transformation(extent={{68,-84},{88,-64}},
            rotation=0)));
    WasteWater.ASM3.sensor_TKN sensor_TKN1 annotation (Placement(transformation(
            extent={{68,-56},{88,-36}}, rotation=0)));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime1(
      fileName="drysim130303.txt",
      table=[0,0; 1,1],
      columns=integer(({2})),
      tableName="drysim130303",
      tableOnFile=("drysim130303") <> "NoName")
      annotation (Placement(transformation(extent={{-198,96},{-184,112}},
            rotation=0)));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime2(
      fileName="drysim130303.txt",
      table=[0,0; 1,1],
      columns=integer(({3,7,4,6})),
      tableName="drysim130303",
      tableOnFile=("drysim130303") <> "NoName")
      annotation (Placement(transformation(extent={{-142,97},{-126,113}},
            rotation=0)));
    Modelica.Blocks.Nonlinear.FixedDelay FixedDelay1(delayTime=1/24/6)
      annotation (Placement(transformation(extent={{-16,-63},{-2,-49}},
            rotation=0)));
    Modelica.Blocks.Math.Feedback Feedback3 annotation (Placement(
          transformation(
          origin={84,-13},
          extent={{5,-5},{-5,5}},
          rotation=180)));
    WasteWater.ASM3.sensor_O2 sensor_O2_3 annotation (Placement(transformation(
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
            28},{190,-35.3},{67.1,-35.3}}));
    connect(mixer2_5.Out, mixer3_1.In3) annotation (Line(points={{-120,-4.6},{
            -111,-4.6},{-111,19.1},{-107,19.1}}));
    connect(Constant4.y, cdivider3.u)
      annotation (Line(points={{-137.5,-75},{-122,-75},{-122,-81}}, color={0,0,
            255}));
    connect(deni2.Out, nitri1.In) annotation (Line(points={{5.55112e-16,24},{12,
            24}}));
    connect(cdivider2.Out1, mixer2_2.In1) annotation (Line(points={{-22,80},{40,
            80},{40,29.5},{50,29.5}}));
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
            -51,-37.2},{-52,-38.5},{-52,24.5},{-45,24.5}}));
    connect(ControlledDivider2_1.Out1, mixer2_5.In2) annotation (Line(points={{
            -51,-42.5},{-150,-42.5},{-150,-6.5},{-140,-6.5}}));
    connect(Constant6.y, ControlledDivider2_1.u) annotation (Line(points={{-36,
            -5},{-31,-5},{-31,-18},{-41,-18},{-41,-34}}, color={0,0,255}));
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
    connect(RecycleController1.out, RecyclePump.u) annotation (Line(points={{
            29.7,-56},{34,-56},{34,-38.5},{18.8,-38.5}}, color={0,0,255}));
    connect(FlowInput.Out, sensor_Q1.In) annotation (Line(points={{-156,97},{
            -148,97},{-148,90},{-194,90},{-194,76}}));
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
    connect(sensor_COD2.In, Preclaryfier.In) annotation (Line(points={{-108,94},
            {-108,90},{-136,90},{-136,78}}));
    connect(Settler.Effluent, Effluent.In) annotation (Line(points={{88.2,-68.3},
            {108.65,-68.3},{108.65,-68},{144,-68},{144,-60},{170,-60}}));
    connect(sensor_NO3.In, Settler.Effluent) annotation (Line(points={{100,-56},
            {100,-68.3},{88.2,-68.3}}));
    connect(sensor_NH2.In, Settler.Effluent) annotation (Line(points={{122,-56},
            {122,-68.3},{88.2,-68.3}}));
    connect(WastePump.In, Settler.Waste) annotation (Line(points={{128,-97.3},{
            82,-97.3},{82,-84}}));
    connect(sensor_TKN1.In, Settler.Effluent) annotation (Line(points={{78,-56},
            {88,-56},{88,-68}}));
    connect(CombiTableTime1.y[1], FlowInput.data)
      annotation (Line(points={{-183.3,104},{-176,104}}, color={0,0,255}));
    connect(FixedDelay1.u, sensor_NO1.Sno) annotation (Line(points={{-18,-56},{
            -22,-56},{-22,-8},{10,-8},{10,50},{6,50}}, color={0,0,255}));
    connect(sensor_O2_3.In, nitri2.MeasurePort) annotation (Line(points={{125,
            40},{125,32.5},{126,32.5}}));
    connect(sensor_Q1.Out, cdivider1.In) annotation (Line(points={{-174,76},{
            -168,76}}));
    connect(cdivider2.Out2, mixer3_1.In1) annotation (Line(points={{-22,76},{
            -18,76},{-18,47},{-111,47},{-111,28.5},{-107,28.5}}));
    connect(mixer3_1.Out, deni1.In) annotation (Line(points={{-87,24},{-81,24}}));
    connect(mixer2_1.Out, deni2.In) annotation (Line(points={{-24,27},{-22.5,27},
            {-22.5,23},{-21,23}}));
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
    connect(Constant2.y, cdivider1.u)
      annotation (Line(points={{-167.5,57},{-158,57},{-158,69}}, color={0,0,255}));
    connect(Gain1.y, blower3.u) annotation (Line(points={{50,105},{55,105},{55,
            83},{49,83},{49,-15},{32,-15}}, color={0,0,255}));
    connect(Gain3.y, blower2.u) annotation (Line(points={{108.7,-21},{139,-21},
            {139,-6},{129.9,-6}}, color={0,0,255}));
    connect(blower1.u, Gain2.y)
      annotation (Line(points={{163.9,-6},{195,-6},{195,103},{165,103}}, color=
            {0,0,255}));
    connect(Settler.Feed, divider2_1.Out1) annotation (Line(points={{68,-72},{
            38.1,-72},{38.1,-38},{47.1,-38}}));
    connect(RecyclePump.Out, ControlledDivider2_1.In) annotation (Line(points={
            {0,-39},{-30,-39}}));
    connect(RecyclePump.In, divider2_1.Out2) annotation (Line(points={{21,-33},
            {47,-33}}));
    connect(ReturnController1.out, ReturnPump.u) annotation (Line(points={{-14,
            -108},{-8,-108},{-8,-97},{-35,-97}}, color={0,0,255}));
    connect(Settler.Return, ReturnPump.In) annotation (Line(points={{75,-84},{
            75,-91},{-33,-91}}));
    connect(Settler.Return, sensor_TSS1.In) annotation (Line(points={{75,-83.6},
            {75,-91},{4,-91},{4,-87}}));
    connect(sensor_COD1.In, Settler.Effluent) annotation (Line(points={{144,-57},
            {144,-68},{88,-68}}));
    connect(blower1.AirOut, nitri3.AirIn) annotation (Line(points={{154,7},{154,
            18}}));
    connect(nitri2.AirIn, blower2.AirOut) annotation (Line(points={{120,18},{
            120,7}}));
    connect(CombiTableTime2.y, Preclaryfier.MeasurePort)
      annotation (Line(points={{-125,105},{-122,105},{-122,87}}, color={0,0,255}));
    connect(cdivider2.In, Preclaryfier.Out) annotation (Line(points={{-42,78},{
            -116,78}}));
    connect(mixer2_1.In1, deni1.Out) annotation (Line(points={{-45,29},{-59,29},
            {-59,24},{-60,24}}));
    connect(mixer3_1.In2, anaerob.Out) annotation (Line(points={{-107,23},{-117,
            23}}));
    connect(nitri1.Out, mixer2_2.In2) annotation (Line(points={{32,24},{41,24},
            {41,25},{50,25}}));
    connect(blower3.AirOut, nitri1.AirIn) annotation (Line(points={{22,-3},{22,
            14.2}}));

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-200,-120},{200,120}},
          grid={1,1}), graphics),
      Documentation(info="This ASM3 example plant configuration is from a real municipal wastewater treatment plant
with a size of 145.000 p.e. It is a cascade-type continuous flow plant for a mean dry
weather inflow of 28.500 m3/d. It consists of a preclarifier, an anaerobic tank,
3 denitrification and 3 nitrification tanks and a secondary settler.
This model is an example for the Wastewater library and is not adapted with its parameters
to the reality, therefore simulation results do not reflect the real plant behaviour.

Change into the directory ../ASM3 and translate the model.
Before simulating the model load initial values from the script file complex_asm3.mos
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
    extends ASM3.SecClar.Takacs.Interfaces.ratios;
    package SCP = ASM3.SecClar.Takacs;
    package SI = Modelica.SIunits;
    package WI = ASM3.Interfaces;
    package WWU = WasteWater.WasteWaterUnits;

    parameter SI.Length hsc=4.0 "height of secondary clarifier";
    parameter Integer n=10 "number of layers of SC model";
    parameter SI.Length zm=hsc/(1.0*n)
      "height of m-th secondary clarifier layer";
    parameter SI.Area Asc=1500.0 "area of secondary clarifier";
    parameter WWU.MassConcentration Xt=3000.0 "threshold for X";
    WWU.MassConcentration Xf "total sludge concentration in clarifier feed";

    WI.WWFlowAsm3in Feed annotation (Placement(transformation(extent={{-110,4},
              {-90,24}}, rotation=0)));
    WI.WWFlowAsm3out Effluent annotation (Placement(transformation(extent={{92,
              47},{112,67}}, rotation=0)));
    WI.WWFlowAsm3out Return annotation (Placement(transformation(extent={{-40,
              -106},{-20,-86}}, rotation=0)));
    WI.WWFlowAsm3out Waste annotation (Placement(transformation(extent={{20,
              -106},{40,-86}}, rotation=0)));

    // layers 1 to 10
    SCP.bottom_layer S1(
      zm=zm,
      Asc=Asc,
      Xf=Xf,
      rXi=rXi,
      rXs=rXs,
      rXh=rXh,
      rXsto=rXsto,
      rXa=rXa) annotation (Placement(transformation(extent={{-35,-93},{35,-78}},
            rotation=0)));
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
      rXsto=rXsto,
      rXa=rXa) annotation (Placement(transformation(extent={{-35,78},{35,93}},
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
    Xf = Feed.Xss;

    // ratios of solid components
    rXi = Feed.Xi/Xf;
    rXs = Feed.Xs/Xf;
    rXh = Feed.Xh/Xf;
    rXsto = Feed.Xsto/Xf;
    rXa = Feed.Xa/Xf;

    annotation (
      Documentation(info="This component models an ASM3 10 - layer secondary clarifier with 6 layers above the feed_layer (including top_layer)
and 3 layers below the feed_layer (including bottom_layer).

Parameters:
  hsc -  height of clarifier [m]
  n   -  number of layers
  Asc -  surface area of sec. clar. [m2]
  Xt  -  threshold value for Xtss [mg/l]
"),   Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49));
  end JenaSecClarModTakacs;
  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.44,
      height=0.65,
      library=1,
      autolayout=1),
    Documentation(info="This package contains example ASM3 wastewater treatment plant models to demonstrate the usage of 
the WasteWater.ASM3 library.
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
