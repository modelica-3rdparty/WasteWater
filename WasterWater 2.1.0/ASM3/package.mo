within WasteWater;
package ASM3 "Component models for the Activated Sludge Model No.3"
extends Modelica.Icons.Library;



model deni "ASM3 denitrification tank"
  //denitrification tank based on the ASM3 model

  extends WasteWater.Icons.deni;
  extends Interfaces.ASM3base;

  // tank specific parameters
  parameter Modelica.SIunits.Volume V=1000 "Volume of denitrification tank";
  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-110,
            -10},{-90,10}}, rotation=0)));
  Interfaces.WWFlowAsm3out Out annotation (Placement(transformation(extent={{90,
            -10},{110,10}}, rotation=0)));
  Interfaces.WWFlowAsm3out MeasurePort annotation (Placement(transformation(
          extent={{50,40},{60,50}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput T annotation (Placement(transformation(
          extent={{-110,30},{-90,50}}, rotation=0)));
equation

  aeration = 0;
  // no aeration in this tank //

  // volume dependent dilution term of each concentration

  inputSo = (In.So - So)*In.Q/V;
  inputSi = (In.Si - Si)*In.Q/V;
  inputSs = (In.Ss - Ss)*In.Q/V;
  inputSnh = (In.Snh - Snh)*In.Q/V;
  inputSn2 = (In.Sn2 - Sn2)*In.Q/V;
  inputSnox = (In.Snox - Snox)*In.Q/V;
  inputSalk = (In.Salk - Salk)*In.Q/V;
  inputXi = (In.Xi - Xi)*In.Q/V;
  inputXs = (In.Xs - Xs)*In.Q/V;
  inputXh = (In.Xh - Xh)*In.Q/V;
  inputXsto = (In.Xsto - Xsto)*In.Q/V;
  inputXa = (In.Xa - Xa)*In.Q/V;
  inputXss = (In.Xss - Xss)*In.Q/V;

  annotation (
    Window(
      x=0.63,
      y=0.03,
      width=0.35,
      height=0.49),
    Documentation(info="This component models the ASM3 processes and reactions taking place in an unaerated (denitrification) tank
of a wastewater treatment plant.

The InPort signal gives the tank temperature to the model.

Parameters:

    - all stoichiometric and kinetic parameters of the activated sludge model No.3 (ASM3)
  V - volume of the tank [m3]
"));
end deni;


model nitri "ASM3 nitrification tank"
  // nitrification (aerated) tank, based on the ASM3 model

  extends WasteWater.Icons.nitri;
  extends Interfaces.ASM3base;

  // tank specific parameters
  parameter Modelica.SIunits.Volume V=1000 "Volume of nitrification tank";

  // aeration system dependend parameters
  parameter Real alpha=0.7 "Oxygen transfer factor";
  parameter Modelica.SIunits.Length de=4.5 "depth of aeration";
  parameter Real R_air=23.5 "specific oxygen feed factor [gO2/(m^3*m)]";
  WWU.MassConcentration So_sat "Dissolved oxygen saturation";

  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-110,
            -10},{-90,10}}, rotation=0)));
  Interfaces.WWFlowAsm3out Out annotation (Placement(transformation(extent={{90,
            -10},{110,10}}, rotation=0)));
  Interfaces.WWFlowAsm3out MeasurePort annotation (Placement(transformation(
          extent={{50,40},{60,50}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput T annotation (Placement(transformation(
          extent={{-110,30},{-90,50}}, rotation=0)));
  Interfaces.AirFlow AirIn annotation (Placement(transformation(extent={{-5,
            -103},{5,-93}}, rotation=0)));
equation

  // Temperature dependend oxygen saturation by Simba
  So_sat =13.89 + (-0.3825 + (0.007311 - 0.00006588*T)*T)*T;

  // extends the Oxygen differential equation by an aeration term
  // aeration [mgO2/l]; AirIn.Q_air needs to be in
  // Simulationtimeunit [m3/day^-1]
  aeration = (alpha*(So_sat - So)/So_sat*AirIn.Q_air*R_air*de)/V;

  // volume dependent dilution term of each concentration

  inputSo = (In.So - So)*In.Q/V;
  inputSi = (In.Si - Si)*In.Q/V;
  inputSs = (In.Ss - Ss)*In.Q/V;
  inputSnh = (In.Snh - Snh)*In.Q/V;
  inputSn2 = (In.Sn2 - Sn2)*In.Q/V;
  inputSnox = (In.Snox - Snox)*In.Q/V;
  inputSalk = (In.Salk - Salk)*In.Q/V;
  inputXi = (In.Xi - Xi)*In.Q/V;
  inputXs = (In.Xs - Xs)*In.Q/V;
  inputXh = (In.Xh - Xh)*In.Q/V;
  inputXsto = (In.Xsto - Xsto)*In.Q/V;
  inputXa = (In.Xa - Xa)*In.Q/V;
  inputXss = (In.Xss - Xss)*In.Q/V;

  annotation (
    Documentaion(info="Nitrification Tank"),
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component models the ASM3 processes and reactions taking place in an aerated (nitrification) tank
of a wastewater treatment plant.

The InPort signal gives the tank temperature to the model.

Parameters:

        - all soichiometric and kinetic parameters of the activated sludge model No.3 (ASM3)
  V     - volume of the tank [m3]
  alpha - oxygen transfer factor
  de    - depth of the aeration system [m]
  R_air - specific oxygen feed factor [g O2/(m3*m)]
"));
end nitri;


model SecClarModTakacs "ASM3 Secondary Clarifier Model based on Takacs"

  extends WasteWater.Icons.SecClar;
  extends ASM3.SecClar.Takacs.Interfaces.ratios;
  package SCP = ASM3.SecClar.Takacs;
  package SI = Modelica.SIunits;
  package WI = ASM3.Interfaces;
  package WWU = WasteWater.WasteWaterUnits;

  parameter SI.Length hsc=4.0 "height of secondary clarifier";
  parameter Integer n=10 "number of layers of SC model";
  parameter SI.Length zm=hsc/(1.0*n) "height of m-th secondary clarifier layer";
  parameter SI.Area Asc=1500.0 "area of secondary clarifier";
  parameter WWU.MassConcentration Xt=3000.0 "threshold for X";
  // total sludge concentration in clarifier feed
  WWU.MassConcentration Xf;

  WI.WWFlowAsm3in Feed annotation (Placement(transformation(extent={{-110,4},{
            -90,24}}, rotation=0)));
  WI.WWFlowAsm3out Effluent annotation (Placement(transformation(extent={{92,47},
            {112,67}}, rotation=0)));
  WI.WWFlowAsm3out Return annotation (Placement(transformation(extent={{-40,
            -106},{-20,-86}}, rotation=0)));
  WI.WWFlowAsm3out Waste annotation (Placement(transformation(extent={{20,-106},
            {40,-86}}, rotation=0)));

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
  SCP.lower_layer S4(
    zm=zm,
    Asc=Asc,
    Xf=Xf) annotation (Placement(transformation(extent={{-35,-36},{35,-21}},
          rotation=0)));
  SCP.lower_layer S5(
    zm=zm,
    Asc=Asc,
    Xf=Xf) annotation (Placement(transformation(extent={{-35,-17},{35,-2}},
          rotation=0)));
  SCP.feed_layer S6(
    zm=zm,
    Asc=Asc,
    Xf=Xf) annotation (Placement(transformation(extent={{-35,2},{35,17}},
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
  connect(S3.Up, S4.Dn) annotation (Line(points={{-2.22045e-15,-40},{
          -2.22045e-15,-36}}));
  connect(S5.Up, S6.Dn) annotation (Line(points={{-2.22045e-15,-2},{
          -2.22045e-15,2}}));
  connect(S6.Up, S7.Dn) annotation (Line(points={{-2.22045e-15,17},{
          -2.22045e-15,21}}));
  connect(S7.Up, S8.Dn) annotation (Line(points={{-2.22045e-15,36},{
          -2.22045e-15,40}}));
  connect(S9.Up, S10.Dn) annotation (Line(points={{-2.22045e-15,74},{
          -2.22045e-15,78}}));
  connect(S4.Up, S5.Dn) annotation (Line(points={{-2.22045e-15,-21},{
          -2.22045e-15,-17}}));
  connect(S8.Up, S9.Dn) annotation (Line(points={{-2.22045e-15,55},{
          -2.22045e-15,59}}));
  connect(Feed, S6.In) annotation (Line(points={{-100,10},{-67.5,10},{-67.5,9.8},
          {-35,9.8}}));
  connect(S1.PQw, Waste) annotation (Line(points={{17.5,-93},{17.5,-100},{30,
          -100}}));
  connect(S10.Out, Effluent) annotation (Line(points={{35,85.5},{67.5,85.5},{
          67.5,57},{100,57}}));
  connect(S1.PQr, Return) annotation (Line(points={{-21,-93},{-21,-100},{-30,
          -100}}));

  // total sludge concentration in clarifier feed
  Xf = Feed.Xss;

  // ratios of solid components
  rXi = Feed.Xi/Xf;
  rXs = Feed.Xs/Xf;
  rXh = Feed.Xh/Xf;
  rXsto = Feed.Xsto/Xf;
  rXa = Feed.Xa/Xf;

  annotation (
    Documentation(info="This component models an ASM3 10 - layer secondary clarifier model with 4 layers above the feed_layer (including top_layer)
and 5 layers below the feed_layer (including bottom_layer) based on Takac`s theory.

Parameters:
  hsc -  height of clarifier [m]
  n   -  number of layers
  Asc -  surface area of sec. clar. [m2]
  Xt  -  threshold value for Xtss [mg/l]

"), Window(
      x=0.63,
      y=0.38,
      width=0.35,
      height=0.49));
end SecClarModTakacs;


model blower "Blower for the aeration of the nitrification tanks"

  extends WasteWater.Icons.blower;
  package WWU = WasteWater.WasteWaterUnits;
  parameter WWU.VolumeFlowRate Q_max=20000 "maximum blower capacity";
  parameter WWU.VolumeFlowRate Q_min=0.0 "minimum blower capacity";
  Real H;
  //help variable to reduce expressions
  Interfaces.AirFlow AirOut annotation (Placement(transformation(extent={{-20,
            90},{0,110}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(
        origin={99,-30},
        extent={{-10,-10},{10,10}},
        rotation=180)));
equation

  H =0.5*(-Q_min + Q_max) + u*0.5*(-Q_min + Q_max) + Q_min;
  AirOut.Q_air = -(if H > Q_max then Q_max else if H < Q_min then Q_min else H);

  annotation (
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
end blower;


model pump "ASM3 wastewater pump"

  extends WasteWater.Icons.pump;
  package WWU = WasteWater.WasteWaterUnits;
  parameter WWU.VolumeFlowRate Q_min=0.0 "minimum pump capacity";
  parameter WWU.VolumeFlowRate Q_max=20000 "maximum pump capacity";

  Real H;
  // help variable to reduce expressions
  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-110,
            -43},{-90,-23}}, rotation=0)));
  Interfaces.WWFlowAsm3out Out annotation (Placement(transformation(extent={{90,
            19},{110,39}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          extent={{-98,15},{-78,35}}, rotation=0)));
equation

  H =0.5*(-Q_min + Q_max) + u*0.5*(-Q_min + Q_max) + Q_min;

  Out.Q = -(if H > Q_max then Q_max else if H < Q_min then Q_min else H);
  Out.Q + In.Q = 0;

  Out.So = In.So;
  Out.Si = In.Si;
  Out.Ss = In.Ss;
  Out.Snh = In.Snh;
  Out.Snox = In.Snox;
  Out.Sn2 = In.Sn2;
  Out.Salk = In.Salk;
  Out.Xi = In.Xi;
  Out.Xs = In.Xs;
  Out.Xh = In.Xh;
  Out.Xsto = In.Xsto;
  Out.Xa = In.Xa;
  Out.Xss = In.Xss;

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component models an ASM3 wastewater pump. It generates a wastewater flow
that is controlled by the signal u (-1 <= u <=1).

Parameter:

  Qmax - maximum pump capacity [m3/d], this is produced when the control signal u is 1 or greater.
  Qmin - minimum pump capacity [m3/d], this is produced when the control signal u is -1 or below.

"));
end pump;


model FlowSource "Flowsource"

  extends WasteWater.Icons.FlowSource;
  Interfaces.WWFlowAsm3out Out annotation (Placement(transformation(extent={{88,
            -80},{108,-60}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput data
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}}, rotation
          =0)));
equation

  Out.Q =-data;

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component is used to feed an ASM3 wwtp model with flow data from measurement
when e.g. concentration is measured after the primary clarifier.


The dimension of InPort is 1.

  1 volumeflowrate Q of incoming wastewater [m3/d]"),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Ellipse(
          extent={{-54,54},{56,-54}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-8,-54},{-14,-52},{-24,-48},{-32,-44},{-36,-40},{-42,-34},{
              -48,-26},{-50,-20},{52,-20},{50,-26},{46,-32},{42,-36},{38,-40},{
              34,-44},{30,-46},{26,-48},{22,-50},{16,-52},{10,-54},{4,-54},{0,
              -54},{-8,-54}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,95,191},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-54,54},{56,-54}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Rectangle(
          extent={{-4,-52},{4,-74}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,95,191},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{4,-74},{88,-68}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,95,191},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-4,-54},{-4,-74},{88,-74}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{4,-54},{4,-68},{88,-68}},
          color={0,0,0},
          thickness=0.5)}));
end FlowSource;


model WWSource "Wastewater source"

  extends WasteWater.Icons.WWSource;
  extends ASM3.Interfaces.stoichiometry;
  Interfaces.WWFlowAsm3out Out annotation (Placement(transformation(extent={{88,
            -80},{108,-60}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput data[13]
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}}, rotation
          =0)));
equation

  Out.Q =-data[1];
  Out.So =data[2];
  Out.Si =data[3];
  Out.Ss =data[4];
  Out.Snh =data[5];
  Out.Sn2 =data[6];
  Out.Snox =data[7];
  Out.Salk =data[8];
  Out.Xi =data[9];
  Out.Xs =data[10];
  Out.Xh =data[11];
  Out.Xsto =data[12];
  Out.Xa =data[13];
  Out.Xss = i_SS_Xi*Out.Xi + i_SS_Xs*Out.Xs + i_SS_BM*Out.Xh + 0.60*Out.Xsto +
    i_SS_BM*Out.Xa;
  //Out.Xss = data.signal[14];

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component provides all ASM3 data at the influent of a wastewater treatment plant.
The dimension of InPort is 13.

  1 volumeflowrate Q of incoming wastewater [m3/d]
  2 So   [g O2/m3]
  3 Si   [g COD/m3]
  4 Ss   [g COD/m3]
  5 Snh  [g N/m3]
  6 Sn2  [g N/m3]
  7 Snox [g N/m3]
  8 Salk [mmol/l]
  9 Xi   [g COD/m3]
 10 Xs   [g COD/m3]
 11 Xh   [g COD/m3]
 12 Xsto [g COD/m3]
 13 Xa   [g COD/m3]

Parameters:
   - all ASM3 conversion factors for the calculation of Xtss."));
end WWSource;


model EffluentSink "Receiving water (river)"
  //only for graphical termination in diagramm layer, no equations needed

  extends WasteWater.Icons.EffluentSink;
  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-110,
            10},{-90,30}}, rotation=0)));
  annotation (
    Window(
      x=0.65,
      y=0.09,
      width=0.35,
      height=0.49),
    Documentation(info="This component terminates an ASM3 wastewater treatment plant model e.g. the wastewater flow to the receiving water.
"));
end EffluentSink;


model SludgeSink "Wastesludge sink"
  // only for graphical termination in diagramm layer, no equations needed

  extends WasteWater.Icons.SludgeSink;
  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-110,
            -22},{-90,-2}}, rotation=0)));
  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component terminates the waste sludge stream of an ASM3 wastewater treatment plant model.
Storage or further sludge treatment is not jet considered."));
end SludgeSink;


model ControlledDivider2 "Controlled flow divider"
  // divides one flow of wastewater into 2 Flows controlled by the

  // input signal u; u=1 means Out1.Q=In.Q and u=0 means Out2.Q=In.Q
  extends WasteWater.Icons.ControlledDivider2;

  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-111,
            -6},{-91,14}}, rotation=0)));
  Interfaces.WWFlowAsm3out Out1 annotation (Placement(transformation(extent={{
            90,20},{110,40}}, rotation=0)));
  Interfaces.WWFlowAsm3out Out2 annotation (Placement(transformation(extent={{
            90,-28},{110,-8}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (
    layer="icon", Placement(transformation(
        origin={0,-60},
        extent={{-10,-10},{10,10}},
        rotation=90)));
equation

  Out1.Q =-In.Q*u;
  Out2.Q =-In.Q*(1 - u);

  Out1.So = In.So;
  Out1.Si = In.Si;
  Out1.Ss = In.Ss;
  Out1.Snh = In.Snh;
  Out1.Sn2 = In.Sn2;
  Out1.Snox = In.Snox;
  Out1.Salk = In.Salk;
  Out1.Xi = In.Xi;
  Out1.Xs = In.Xs;
  Out1.Xh = In.Xh;
  Out1.Xsto = In.Xsto;
  Out1.Xa = In.Xa;
  Out1.Xss = In.Xss;

  Out2.So = In.So;
  Out2.Si = In.Si;
  Out2.Ss = In.Ss;
  Out2.Snh = In.Snh;
  Out2.Sn2 = In.Sn2;
  Out2.Snox = In.Snox;
  Out2.Salk = In.Salk;
  Out2.Xi = In.Xi;
  Out2.Xs = In.Xs;
  Out2.Xh = In.Xh;
  Out2.Xsto = In.Xsto;
  Out2.Xa = In.Xa;
  Out2.Xss = In.Xss;

  annotation (
    Window(
      x=0.38,
      y=0.09,
      width=0.35,
      height=0.49),
    Documentation(info="This component divides one wastewater flow (ASM3) into two flows which are controlled by the signal u (0...1).
Is u.signal=1, the flow goes to output 1 (Out1) and is u.signal=0, the flow goes to output 2 (Out2).
The concentrations of the outport-flows are equal to the concentration at inport."));
end ControlledDivider2;


model divider2 "Flowdivider"

    // divides one flow of wastewater into 2 Flows; one amout needs to be specified

  extends WasteWater.Icons.divider2;
  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-111,
            -7},{-91,13}}, rotation=0)));
  Interfaces.WWFlowAsm3out Out1 annotation (Placement(transformation(extent={{
            89,20},{109,40}}, rotation=0)));
  Interfaces.WWFlowAsm3out Out2 annotation (Placement(transformation(extent={{
            90,-28},{110,-8}}, rotation=0)));
equation

  In.Q + Out1.Q + Out2.Q = 0;

  Out1.So = In.So;
  Out1.Si = In.Si;
  Out1.Ss = In.Ss;
  Out1.Snh = In.Snh;
  Out1.Sn2 = In.Sn2;
  Out1.Snox = In.Snox;
  Out1.Salk = In.Salk;
  Out1.Xi = In.Xi;
  Out1.Xs = In.Xs;
  Out1.Xh = In.Xh;
  Out1.Xsto = In.Xsto;
  Out1.Xa = In.Xa;
  Out1.Xss = In.Xss;

  Out2.So = In.So;
  Out2.Si = In.Si;
  Out2.Ss = In.Ss;
  Out2.Snh = In.Snh;
  Out2.Sn2 = In.Sn2;
  Out2.Snox = In.Snox;
  Out2.Salk = In.Salk;
  Out2.Xi = In.Xi;
  Out2.Xs = In.Xs;
  Out2.Xh = In.Xh;
  Out2.Xsto = In.Xsto;
  Out2.Xa = In.Xa;
  Out2.Xss = In.Xss;

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info=
          "This component divides one ASM3 wastewater flow into two ASM3 wastewater flows."));
end divider2;


model mixer2 "Mixer of two ASM3 characterised flows"

  extends WasteWater.Icons.mixer2;
  Interfaces.WWFlowAsm3in In1 annotation (Placement(transformation(extent={{
            -111,20},{-91,40}}, rotation=0)));
  Interfaces.WWFlowAsm3in In2 annotation (Placement(transformation(extent={{
            -111,-30},{-91,-10}}, rotation=0)));
  Interfaces.WWFlowAsm3out Out annotation (Placement(transformation(extent={{90,
            -5},{110,15}}, rotation=0)));
equation

  In1.Q + In2.Q + Out.Q = 0;

  Out.So = (In1.So*In1.Q + In2.So*In2.Q)/(In1.Q + In2.Q);
  Out.Si = (In1.Si*In1.Q + In2.Si*In2.Q)/(In1.Q + In2.Q);
  Out.Ss = (In1.Ss*In1.Q + In2.Ss*In2.Q)/(In1.Q + In2.Q);
  Out.Snh = (In1.Snh*In1.Q + In2.Snh*In2.Q)/(In1.Q + In2.Q);
  Out.Sn2 = (In1.Sn2*In1.Q + In2.Sn2*In2.Q)/(In1.Q + In2.Q);
  Out.Snox = (In1.Snox*In1.Q + In2.Snox*In2.Q)/(In1.Q + In2.Q);
  Out.Salk = (In1.Salk*In1.Q + In2.Salk*In2.Q)/(In1.Q + In2.Q);
  Out.Xi = (In1.Xi*In1.Q + In2.Xi*In2.Q)/(In1.Q + In2.Q);
  Out.Xs = (In1.Xs*In1.Q + In2.Xs*In2.Q)/(In1.Q + In2.Q);
  Out.Xh = (In1.Xh*In1.Q + In2.Xh*In2.Q)/(In1.Q + In2.Q);
  Out.Xsto = (In1.Xsto*In1.Q + In2.Xsto*In2.Q)/(In1.Q + In2.Q);
  Out.Xa = (In1.Xa*In1.Q + In2.Xa*In2.Q)/(In1.Q + In2.Q);
  Out.Xss = (In1.Xss*In1.Q + In2.Xss*In2.Q)/(In1.Q + In2.Q);

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info=
          "This component mixes two flows of wastewater (ASM3) of different concentration and different amount."));
end mixer2;


model mixer3 "Mixer of 3 ASM3 characterised flows"

    // mixes 3 flows of wastewater of different concentration and different amount

  extends WasteWater.Icons.mixer3;
  Interfaces.WWFlowAsm3in In1 annotation (Placement(transformation(extent={{
            -110,29},{-90,49}}, rotation=0)));
  Interfaces.WWFlowAsm3in In2 annotation (Placement(transformation(extent={{
            -111,-14},{-91,6}}, rotation=0)));
  Interfaces.WWFlowAsm3in In3 annotation (Placement(transformation(extent={{
            -109,-59},{-89,-39}}, rotation=0)));
  Interfaces.WWFlowAsm3out Out annotation (Placement(transformation(extent={{90,
            -13},{110,7}}, rotation=0)));
equation

  In1.Q + In2.Q + In3.Q + Out.Q = 0;
  Out.So = (In1.So*In1.Q + In2.So*In2.Q + In3.So*In3.Q)/(In1.Q + In2.Q + In3.Q);
  Out.Si = (In1.Si*In1.Q + In2.Si*In2.Q + In3.Si*In3.Q)/(In1.Q + In2.Q + In3.Q);
  Out.Ss = (In1.Ss*In1.Q + In2.Ss*In2.Q + In3.Ss*In3.Q)/(In1.Q + In2.Q + In3.Q);
  Out.Snh = (In1.Snh*In1.Q + In2.Snh*In2.Q + In3.Snh*In3.Q)/(In1.Q + In2.Q +
    In3.Q);
  Out.Sn2 = (In1.Sn2*In1.Q + In2.Sn2*In2.Q + In3.Sn2*In3.Q)/(In1.Q + In2.Q +
    In3.Q);
  Out.Snox = (In1.Snox*In1.Q + In2.Snox*In2.Q + In3.Snox*In3.Q)/(In1.Q + In2.Q
     + In3.Q);
  Out.Salk = (In1.Salk*In1.Q + In2.Salk*In2.Q + In3.Salk*In3.Q)/(In1.Q + In2.Q
     + In3.Q);
  Out.Xi = (In1.Xi*In1.Q + In2.Xi*In2.Q + In3.Xi*In3.Q)/(In1.Q + In2.Q + In3.Q);
  Out.Xs = (In1.Xs*In1.Q + In2.Xs*In2.Q + In3.Xs*In3.Q)/(In1.Q + In2.Q + In3.Q);
  Out.Xh = (In1.Xh*In1.Q + In2.Xh*In2.Q + In3.Xh*In3.Q)/(In1.Q + In2.Q + In3.Q);
  Out.Xsto = (In1.Xsto*In1.Q + In2.Xsto*In2.Q + In3.Xsto*In3.Q)/(In1.Q + In2.Q
     + In3.Q);
  Out.Xa = (In1.Xa*In1.Q + In2.Xa*In2.Q + In3.Xa*In3.Q)/(In1.Q + In2.Q + In3.Q);
  Out.Xss = (In1.Xss*In1.Q + In2.Xss*In2.Q + In3.Xss*In3.Q)/(In1.Q + In2.Q +
    In3.Q);

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info=
          "This component mixes 3 flows of wastewater (ASM3) of different concentration and different amount."));
end mixer3;


model sensor_COD "Ideal sensor to measure chemical oxygen demand (COD)"

  extends WasteWater.Icons.sensor_COD;
  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput COD annotation (Placement(
        transformation(extent={{88,-10},{108,10}}, rotation=0)));
equation

  In.Q = 0.0;
  COD = In.Si + In.Ss + In.Xi + In.Xs + In.Xh + In.Xsto + In.Xa;

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component measures the chemical oxygen demand (COD) concentration [g/m3]
of ASM3 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
end sensor_COD;


model sensor_NH "Ideal sensor to measure ammonium nitrogen"

  extends WasteWater.Icons.sensor_NH;
  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput Snh annotation (Placement(
        transformation(extent={{88,-10},{108,10}}, rotation=0)));
equation

  In.Q = 0;
  Snh = In.Snh;

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component measures the ammonium nitrogen concentration [g/m3]
of ASM3 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
end sensor_NH;


model sensor_NO "Ideal sensor to measure nitrate nitrogen"

  extends WasteWater.Icons.sensor_NO;
  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput Sno annotation (Placement(
        transformation(extent={{88,-10},{108,10}}, rotation=0)));
equation

  In.Q = 0;
  Sno = In.Snox;

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component measures the nitrate nitrogen concentration [g/m3]
of ASM3 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
end sensor_NO;


model sensor_O2 "Ideal sensor to measure dissolved oxygen concentration"

  extends WasteWater.Icons.sensor_O2;
  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput So annotation (Placement(transformation(
          extent={{88,-10},{108,10}}, rotation=0)));
equation

  In.Q = 0;
  So = In.So;

  annotation (
    Window(
      x=0.11,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component measures the dissolved oxygen concentration [g/m3]
of ASM3 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"), Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Ellipse(
          extent={{-50,50},{50,-50}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={223,223,159},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,50},{0,38}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-50,0},{38,0}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{50,0},{38,0}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-36,34},{-28,26}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{34,36},{26,28}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{0,0},{26,28}},
          color={0,0,0},
          thickness=0.5),
        Polygon(
          points={{30,32},{10,24},{24,12},{30,32}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(extent={{-36,-10},{36,-32}}, textString=
                                              "O2"),
        Line(
          points={{0,-50},{0,-90}},
          color={0,0,0},
          thickness=0.5),
        Line(points={{50,0},{88,0}}, color={0,0,0}),
        Text(extent={{-80,100},{80,60}}, textString=
                                             "%name")}));
end sensor_O2;


model sensor_Q
  "Ideal sensor to measure the flow rate of an ASM1 wastewater stream"

  extends WasteWater.Icons.sensor_Q;
  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-110,
            -10},{-90,10}}, rotation=0)));
  Interfaces.WWFlowAsm3out Out annotation (Placement(transformation(extent={{92,
            -10},{112,10}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput Q
    annotation (Placement(transformation(
        origin={0,-100},
        extent={{-10,-10},{10,10}},
        rotation=270)));
equation

  In.Q + Out.Q = 0;
  Q = In.Q;
  // eventually abs(In.Q) to be shure to have pos. signal
  In.So = Out.So;
  In.Si = Out.Si;
  In.Ss = Out.Ss;
  In.Snh = Out.Snh;
  In.Sn2 = Out.Sn2;
  In.Snox = Out.Snox;
  In.Salk = Out.Salk;
  In.Xi = Out.Xi;
  In.Xs = Out.Xs;
  In.Xh = Out.Xh;
  In.Xsto = Out.Xsto;
  In.Xa = Out.Xa;
  In.Xss = Out.Xss;

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component measures the flow of an ASM3 wastewater stream and provides
the result as output signal (to be further processed with blocks of
the Modelica.Blocks library).
"));
end sensor_Q;


model sensor_TKN "Ideal TKN and total nitrogen sensor"

  extends WasteWater.Icons.sensor_TKN;
  extends ASM3.Interfaces.stoichiometry;
  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput TKN[2]
    annotation (Placement(transformation(extent={{88,-10},{108,10}}, rotation=0)));
equation

  In.Q = 0.0;
  TKN[1] = i_N_Si*In.Si + i_N_Ss*In.Ss + In.Snh + i_N_Xi*In.Xi + i_N_Xs*In.Xs
     + i_N_BM*(In.Xh + In.Xa);
  TKN[2] = TKN[1] + In.Snox;

  annotation (
    Window(
      x=0.52,
      y=0.04,
      width=0.35,
      height=0.49),
    Documentation(info="This component measures the Total Kjeldal Nitrogen (TKN) and the
total nitrogen (N_total) concentration [g/m3] of ASM3 wastewater
and provides the result as output signal (to be further processed
with blocks of the Modelica.Blocks library).

signal[1] - TKN
signal[2] - N_total
"));
end sensor_TKN;


model sensor_TSS
  "Ideal sensor to measure total suspended solids concentration (ASM3)"

  extends WasteWater.Icons.sensor_TSS;

  Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput TSS annotation (Placement(
        transformation(extent={{88,-10},{108,10}}, rotation=0)));
equation

  In.Q = 0;
  TSS = In.Xss;

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component measures the total suspended solids concentration [g/m3]
of ASM3 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
end sensor_TSS;

annotation (
  Window(
    x=0.45,
    y=0.01,
    width=0.44,
    height=0.65,
    library=1,
    autolayout=1),
  Documentation(info="This library contains components to build models of biological municipal
wastewater treatment plants based on the Activated Sludge Model No.3 (ASM3) by the
International Association on Water Quality (IAWQ) [1].


The library currently is structured in following sub-libraries.

 - Interfaces (partial ASM3 models and connectors)
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
end ASM3;
