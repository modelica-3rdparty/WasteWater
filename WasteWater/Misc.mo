within WasteWater;
package Misc "miscellaneous"

  extends Modelica.Icons.Library;

  model TwoPoint "On-Off controller with hysteresis"
    //Two-point controller
    parameter Real on=1.0;
    parameter Real off=0.0;
    parameter Real out_on=1.0;
    parameter Real out_off=0.0;
    Boolean mode;
    Modelica.Blocks.Interfaces.RealInput e
      annotation (Placement(transformation(extent={{-120,-10},{-100,10}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput u
      annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
  algorithm
    // 0: Controller is off
    // 1: Controller is on

    when initial() then
      mode :=if e >= on then true else false;
    end when;

    when e >= on and mode == false then
      mode := true;
    end when;

    when e <= off and mode == true then
      mode := false;
    end when;

    u := if mode == true then out_on else out_off;
    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={
          Text(extent={{-150,-100},{150,-140}}, textString=
                                                    "%name"),
          Rectangle(extent={{-100,100},{100,-100}}),
          Line(points={{-70,-79},{-70,64}}, color={192,192,192}),
          Line(points={{-76,-70},{67,-70}}, color={192,192,192}),
          Polygon(
            points={{81,-70},{64,-64},{64,-76},{81,-70}},
            lineColor={192,192,192},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-70,82},{-77,64},{-63,64},{-70,82}},
            lineColor={128,128,128},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-70,-40},{-30,-40},{-30,40},{70,40}}, color={0,0,0}),
          Line(points={{-30,-40},{30,-40},{30,40}}, color={0,0,0}),
          Line(points={{-72,-40},{-68,-40}}, color={192,192,192})}),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={
          Line(points={{-70,-79},{-70,64}}, color={192,192,192}),
          Line(points={{-76,-70},{67,-70}}, color={192,192,192}),
          Polygon(
            points={{81,-70},{64,-64},{64,-76},{81,-70}},
            lineColor={192,192,192},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-70,82},{-77,64},{-63,64},{-70,82}},
            lineColor={128,128,128},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-70,-40},{-30,-40},{-30,40},{70,40}}, color={0,0,0}),
          Line(points={{-30,-40},{30,-40},{30,40}}, color={0,0,0}),
          Line(
            points={{30,-40},{30,-73}},
            color={192,192,192},
            pattern=LinePattern.Dot),
          Line(
            points={{-30,-40},{-30,-73}},
            color={192,192,192},
            pattern=LinePattern.Dot),
          Line(
            points={{-29,40},{-72,40}},
            color={192,192,192},
            pattern=LinePattern.Dot),
          Line(points={{-72,-40},{-68,-40}}, color={192,192,192}),
          Text(
            extent={{-93,47},{-72,33}},
            lineColor={192,192,192},
            textString=
                 "out_on"),
          Text(
            extent={{-94,-33},{-73,-47}},
            lineColor={192,192,192},
            textString=
                 "out_off"),
          Text(
            extent={{-90,96},{-50,82}},
            lineColor={192,192,192},
            textString=
                 "O2 Setpoint"),
          Text(
            extent={{65,-78},{95,-94}},
            lineColor={192,192,192},
            textString=
                 "NH4-N"),
          Text(
            extent={{-41,-74},{-19,-85}},
            lineColor={192,192,192},
            textString=
                 "off"),
          Text(
            extent={{20,-75},{39,-85}},
            lineColor={192,192,192},
            textString=
                 "on"),
          Text(
            extent={{-50,85},{80,45}},
            lineColor={192,192,192},
            textString=
                 "TwoPoint-Controller"),
          Line(points={{-1,-38},{3,-40},{-1,-42}}, color={0,0,0}),
          Line(points={{3,42},{-2,40},{3,38}}, color={0,0,0}),
          Line(points={{-32,2},{-30,-3},{-28,2}}, color={0,0,0}),
          Line(points={{28,-2},{30,3},{32,-2}}, color={0,0,0})}),
      Window(
        x=0.04,
        y=0.03,
        width=0.35,
        height=0.49),
      Documentation(info="This is an on-off (two-point) controller with hysteresis.
The hysteresis is the difference beetween the parameter on
and off.
When the input signal exceeds the \"on\" value, the output signal
is \"out_on\" and when the input signal drops below the
\"off\" value, the output signal is \"out_off\"."));
  end TwoPoint;

  model ReturnController "Return Sludge Controller"

    parameter Real Qmin=500 "Minimum RAS flow [m3/h]";
    parameter Real Qdry=1200
      "Dry weather inflow until RAS is ratio dependent [m3/h]";
    parameter Real Qrain=1500 "Maximum RAS flow during rain situation [m3/h]";
    parameter Real Qmax=2520 "Maximum wastewater flow to WWTP [m3/h]";
    parameter Real RAS_ratio=120 "RAS/Inflow ratio [%]";

    Real u1;
    Real u2;
    Real u3;

    Modelica.Blocks.Interfaces.RealInput in1
      annotation (Placement(transformation(extent={{-120,-10},{-100,10}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput out
      annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
  equation

    u1 = Qmin;
    u2 =in1/24*RAS_ratio/100;
    u3 =Qdry*RAS_ratio/100 + (Qrain - Qdry*RAS_ratio/100)/(Qmax - Qdry)*(in1/24
       - Qdry);

    out = 2*min(max(u1, u2), u3)/Qmax - 1;

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={
          Text(extent={{-150,-100},{150,-140}}, textString=
                                                    "%name"),
          Line(points={{-70,-85},{-70,64}}, color={192,192,192}),
          Line(points={{-76,-70},{67,-70}}, color={192,192,192}),
          Polygon(
            points={{81,-70},{64,-64},{64,-76},{81,-70}},
            lineColor={192,192,192},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-70,82},{-77,64},{-63,64},{-70,82}},
            lineColor={128,128,128},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-70,-50},{-40,-50},{10,6},{58,21}}, color={0,0,0}),
          Rectangle(extent={{-100,100},{100,-100}})}),
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={
          Line(points={{-70,-85},{-70,64}}, color={192,192,192}),
          Line(points={{-76,-70},{78,-70}}, color={192,192,192}),
          Line(
            points={{11,6},{11,-69}},
            color={192,192,192},
            pattern=LinePattern.Dot),
          Line(points={{-72,-50},{-68,-50}}, color={128,128,128}),
          Line(
            points={{54,15},{54,-71}},
            color={192,192,192},
            pattern=LinePattern.Dot),
          Line(
            points={{-67,16},{53,16}},
            color={192,192,192},
            pattern=LinePattern.Dot),
          Text(
            extent={{-49,102},{-89,80}},
            lineColor={192,192,192},
            lineThickness=1,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            textString=
                 "Q-RAS"),
          Text(
            extent={{59,-76},{101,-102}},
            lineColor={192,192,192},
            textString=
                 "Qinflow"),
          Text(
            extent={{-100,-43},{-70,-57}},
            lineColor={192,192,192},
            textString=
                 "Qmin"),
          Text(
            extent={{-100,23},{-70,9}},
            lineColor={192,192,192},
            textString=
                 "Qrain"),
          Text(
            extent={{-43,82},{79,46}},
            lineColor={192,192,192},
            pattern=LinePattern.Dash,
            lineThickness=1,
            textString=
                 "ReturnController"),
          Polygon(
            points={{-14,-2},{2,-22},{4,-20},{-12,0},{-9,2},{-16,2},{-16,-5},{
                -14,-2}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{89,-70},{72,-64},{72,-76},{89,-70}},
            lineColor={192,192,192},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-70,82},{-77,64},{-63,64},{-70,82}},
            lineColor={128,128,128},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-4,-75},{24,-89}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            textString=
                 "Qdry"),
          Text(
            extent={{31,-73},{61,-89}},
            lineColor={192,192,192},
            textString=
                 "Qmax"),
          Line(points={{-68,-50},{-40,-50},{11,7},{53,15}}, color={0,0,0}),
          Text(
            extent={{-19,-17},{51,-46}},
            lineColor={192,192,192},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            textString=
                 "RAS/Inflow Ratio")}),
      Documentation(info="Input signal is a flow measurement.
Output is a control signal between -1 and 1.

Parameters: Qmin - minimal allowed return acticated sludge (RAS) flow
            Qdry - flow until dry weather is assumed
            Qmax - maximum flow the treatment plant can handle
            Qrain- RAS flow at Qmax
            RAS_ratio - RAS/Inflow ratio during dry weather


This component is only used for the complex plant example.
Therefore no further documentation."));
  end ReturnController;

  model RecycleController1 "Recycle Sludge Controller1"

    parameter Real NO3max=2.0 "[mg/l]";
    parameter Real NO3min=1.0 "[mg/l]";
    parameter Real Pref=70 "Reference pumppower between NO3max and NO3min [%]";
    parameter Real dNO3max=30 "Reduction of the ref. pumppower at
  NO3-max by x [%]";
    parameter Real dNO3min=30 "Increase of the ref. pumppower at NO3-min
  by x [%]";

    Real u1;
    Real u2;
    Real u3;

    Modelica.Blocks.Interfaces.RealInput in1
      annotation (Placement(transformation(extent={{-120,-10},{-100,10}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput out
      annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
  equation

    //red = Pp*dNO3max/100;
    //[%]
    //inc = Pp*dNO3min/100;
    //[%]
    u1 = 2*(Pref + dNO3min)/100 - 1;
    u2 = 2*Pref/100 - 1;
    u3 = 2*(Pref - dNO3max)/100 - 1;
    out = if in1 < NO3min then u1 else if in1 < NO3max then u2 else u3;

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}),
          Text(extent={{-150,-100},{150,-140}}, textString=
                                                    "%name"),
          Line(points={{-70,-85},{-70,64}}, color={192,192,192}),
          Line(points={{-76,-70},{67,-70}}, color={192,192,192}),
          Polygon(
            points={{81,-70},{64,-64},{64,-76},{81,-70}},
            lineColor={192,192,192},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-70,82},{-77,64},{-63,64},{-70,82}},
            lineColor={128,128,128},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-70,30},{-32,30},{-32,-11},{8,-11},{8,-50},{49,-50}},
              color={0,0,0})}),
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={
          Line(points={{-70,-85},{-70,64}}, color={192,192,192}),
          Line(points={{-76,-70},{67,-70}}, color={192,192,192}),
          Line(
            points={{-32,-11},{-32,-70}},
            color={192,192,192},
            pattern=LinePattern.Dot),
          Line(
            points={{8,-50},{8,-70}},
            color={192,192,192},
            pattern=LinePattern.Dot),
          Text(
            extent={{-48,101},{-88,79}},
            lineColor={192,192,192},
            lineThickness=1,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            textString=
                 "u-Recycle"),
          Text(
            extent={{59,-76},{101,-102}},
            lineColor={192,192,192},
            textString=
                 "N03-N"),
          Polygon(
            points={{81,-70},{64,-64},{64,-76},{81,-70}},
            lineColor={192,192,192},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-70,82},{-77,64},{-63,64},{-70,82}},
            lineColor={128,128,128},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-46,-70},{-18,-84}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            textString=
                 "Min"),
          Text(
            extent={{-7,-69},{23,-85}},
            lineColor={192,192,192},
            textString=
                 "Max"),
          Line(points={{-70,30},{-32,30},{-32,-11},{8,-11},{8,-50},{49,-50}},
              color={0,0,0}),
          Line(points={{-32,-68},{-32,-72}}, color={192,192,192}),
          Line(points={{8,-68},{8,-72}}, color={192,192,192}),
          Text(
            extent={{-96,-3},{-70,-18}},
            lineColor={192,192,192},
            textString=
                 "Ref."),
          Line(
            points={{-32,-11},{-70,-11}},
            color={192,192,192},
            pattern=LinePattern.Dot),
          Text(
            extent={{-29,20},{12,2}},
            lineColor={192,192,192},
            textString=
                 "dQ(NO3-Min)"),
          Text(
            extent={{13,-21},{56,-42}},
            lineColor={192,192,192},
            textString=
                 "dQ(NO3-Max)"),
          Text(
            extent={{-47,74},{80,40}},
            lineColor={192,192,192},
            textString=
                 "RecycleController")}),
      Documentation(info="Input signal is a nitrate measurement,
output is a control signal between -1 and 1.

This component is only used for the complex plant example.
Therefore no further documentation."));
  end RecycleController1;

  model RecycleController2 "Recycle Sludge Controller2"

    parameter Real NO3max=2.0 "[mg/l]";
    parameter Real NO3min=1.0 "[mg/l]";
    parameter Real Pref=70 "Reference pumppower between NO3max and NO3min [%]";
    parameter Real dNO3max=30 "Reduction of the ref. pumppower at
  NO3-max by x [%]";
    parameter Real dNO3min=30 "Increase of the ref. pumppower at NO3-min
  by x [%]";

    Real u1;
    Real u2;
    Real u3;
    Modelica.Blocks.Interfaces.RealInput in1
      annotation (Placement(transformation(extent={{-120,-10},{-100,10}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput out
      annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
  equation

    //red = Pp*dNO3max/100;
    //[%]
    //inc = Pp*dNO3min/100;
    //[%]
    u1 = 2*(Pref + dNO3min)/100 - 1;
    //u2 = 2*Pref/100 - 1;
    u2 =2*((Pref + dNO3min)/100 - ((dNO3max + dNO3min)/100)/(NO3max - NO3min)*(
      in1 - NO3min)) - 1;
    u3 = 2*(Pref - dNO3max)/100 - 1;
    out = if in1 < NO3min then u1 else if in1 < NO3max then u2 else u3;

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}),
          Text(extent={{-150,-100},{150,-140}}, textString=
                                                    "%name"),
          Line(points={{-70,-85},{-70,64}}, color={192,192,192}),
          Line(points={{-76,-70},{67,-70}}, color={192,192,192}),
          Polygon(
            points={{81,-70},{64,-64},{64,-76},{81,-70}},
            lineColor={192,192,192},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-70,82},{-77,64},{-63,64},{-70,82}},
            lineColor={128,128,128},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-72,18},{-68,18}}, color={192,192,192}),
          Line(points={{-70,18},{-37,18},{9,-41},{44,-41}}, color={0,0,0})}),
      Window(
        x=0.25,
        y=0.46,
        width=0.35,
        height=0.49),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={
          Line(points={{-70,-85},{-70,64}}, color={192,192,192}),
          Line(points={{-76,-70},{67,-70}}, color={192,192,192}),
          Line(
            points={{-37,18},{-37,-70}},
            color={192,192,192},
            pattern=LinePattern.Dot),
          Line(
            points={{9,-41},{9,-70}},
            color={192,192,192},
            pattern=LinePattern.Dot),
          Text(
            extent={{-49,102},{-89,80}},
            lineColor={192,192,192},
            lineThickness=1,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            textString=
                 "u-Recycle"),
          Text(
            extent={{59,-76},{101,-102}},
            lineColor={192,192,192},
            textString=
                 "N03-N"),
          Polygon(
            points={{81,-70},{64,-64},{64,-76},{81,-70}},
            lineColor={192,192,192},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-70,82},{-77,64},{-63,64},{-70,82}},
            lineColor={128,128,128},
            pattern=LinePattern.None,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-51,-71},{-23,-85}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            textString=
                 "Min"),
          Text(
            extent={{-4,-70},{26,-86}},
            lineColor={192,192,192},
            textString=
                 "Max"),
          Line(points={{-72,18},{-68,18}}, color={192,192,192}),
          Line(points={{-37,-68},{-37,-72}}, color={192,192,192}),
          Text(
            extent={{-10,6},{29,-14}},
            lineColor={192,192,192},
            textString=
                 "d(NO3)"),
          Text(
            extent={{-61,69},{66,35}},
            lineColor={192,192,192},
            textString=
                 "RecycleController"),
          Line(points={{-70,18},{-37,18},{9,-41},{44,-41}}, color={0,0,0}),
          Line(points={{9,-68},{9,-72}}, color={192,192,192})}),
      Documentation(info="Input signal is a Nitrate measurement
Output is a control signal between -1 and 1.

This component is only used for the complex plant example.
Therefore no further documentation.
"));
  end RecycleController2;
  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.44,
      height=0.65,
      library=1,
      autolayout=1),
    Documentation(info="This package provides a collection of \"conrollers\" that are needed for the
complex wastewater treatment plant example.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de

Copyright (C) 2002 - 2003, Gerald Reichl
"));
end Misc;
