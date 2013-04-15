package Misc "miscellaneous" 
  
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
  model TwoPoint "On-Off controller with hysteresis" 
    //Two-point controller 
    parameter Real on=1.0;
    parameter Real off=0.0;
    parameter Real out_on=1.0;
    parameter Real out_off=0.0;
    Boolean mode;
    Modelica.Blocks.Interfaces.InPort e(final n=1) annotation (extent=[-120, -
          10; -100, 10]);
    Modelica.Blocks.Interfaces.OutPort u(final n=1) annotation (extent=[100, -
          10; 120, 10]);
    annotation (
      Icon(
        Text(extent=[-150, -100; 150, -140], string="%name"), 
        Rectangle(extent=[-100, 100; 100, -100]), 
        Line(points=[-70, -79; -70, 64], style(color=8, fillColor=0)), 
        Line(points=[-76, -70; 67, -70], style(color=8, fillColor=8)), 
        Polygon(points=[81, -70; 64, -64; 64, -76; 81, -70], style(
            color=8, 
            pattern=0, 
            fillColor=8)), 
        Polygon(points=[-70, 82; -77, 64; -63, 64; -70, 82], style(
            color=10, 
            pattern=0, 
            fillColor=8)), 
        Line(points=[-70, -40; -30, -40; -30, 40; 70, 40], style(color=0)), 
        Line(points=[-30, -40; 30, -40; 30, 40], style(color=0)), 
        Line(points=[-72, -40; -68, -40], style(color=8))), 
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[1, 1], 
        component=[20, 20]), 
      Diagram(
        Line(points=[-70, -79; -70, 64], style(color=8, fillColor=0)), 
        Line(points=[-76, -70; 67, -70], style(color=8, fillColor=8)), 
        Polygon(points=[81, -70; 64, -64; 64, -76; 81, -70], style(
            color=8, 
            pattern=0, 
            fillColor=8)), 
        Polygon(points=[-70, 82; -77, 64; -63, 64; -70, 82], style(
            color=10, 
            pattern=0, 
            fillColor=8)), 
        Line(points=[-70, -40; -30, -40; -30, 40; 70, 40], style(color=0)), 
        Line(points=[-30, -40; 30, -40; 30, 40], style(color=0)), 
        Line(points=[30, -40; 30, -73], style(color=8, pattern=3)), 
        Line(points=[-30, -40; -30, -73], style(color=8, pattern=3)), 
        Line(points=[-29, 40; -72, 40], style(color=8, pattern=3)), 
        Line(points=[-72, -40; -68, -40], style(color=8)), 
        Text(
          extent=[-93, 47; -72, 33], 
          string="out_on", 
          style(color=8)), 
        Text(
          extent=[-94, -33; -73, -47], 
          string="out_off", 
          style(color=8)), 
        Text(
          extent=[-90, 96; -50, 82], 
          string="O2 Setpoint", 
          style(color=8)), 
        Text(
          extent=[65, -78; 95, -94], 
          string="NH4-N", 
          style(color=8)), 
        Text(
          extent=[-41, -74; -19, -85], 
          string="off", 
          style(color=8)), 
        Text(
          extent=[20, -75; 39, -85], 
          string="on", 
          style(color=8)), 
        Text(
          extent=[-50, 85; 80, 45], 
          string="TwoPoint-Controller", 
          style(color=8)), 
        Line(points=[-1, -38; 3, -40; -1, -42], style(color=0)), 
        Line(points=[3, 42; -2, 40; 3, 38], style(color=0)), 
        Line(points=[-32, 2; -30, -3; -28, 2], style(color=0)), 
        Line(points=[28, -2; 30, 3; 32, -2], style(color=0))), 
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
  algorithm 
    // 0: Controller is off
    // 1: Controller is on
    
    when initial() then
      mode := if e.signal[1] >= on then true else false;
    end when;
    
    when e.signal[1] >= on and mode == false then
      mode := true;
    end when;
    
    when e.signal[1] <= off and mode == true then
      mode := false;
    end when;
    
    u.signal[1] := if mode == true then out_on else out_off;
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
    
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[1, 1], 
        component=[20, 20]), 
      Icon(
        Text(extent=[-150, -100; 150, -140], string="%name"), 
        Line(points=[-70, -85; -70, 64], style(color=8, fillColor=0)), 
        Line(points=[-76, -70; 67, -70], style(color=8, fillColor=8)), 
        Polygon(points=[81, -70; 64, -64; 64, -76; 81, -70], style(
            color=8, 
            pattern=0, 
            fillColor=8)), 
        Polygon(points=[-70, 82; -77, 64; -63, 64; -70, 82], style(
            color=10, 
            pattern=0, 
            fillColor=8)), 
        Line(points=[-70, -50; -40, -50; 10, 6; 58, 21], style(color=0)), 
        Rectangle(extent=[-100, 100; 100, -100])), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Diagram(
        Line(points=[-70, -85; -70, 64], style(color=8, fillColor=0)), 
        Line(points=[-76, -70; 78, -70], style(color=8, fillColor=8)), 
        Line(points=[11, 6; 11, -69], style(
            color=8, 
            pattern=3, 
            fillColor=10)), 
        Line(points=[-72, -50; -68, -50], style(color=10)), 
        Line(points=[54, 15; 54, -71], style(color=8, pattern=3)), 
        Line(points=[-67, 16; 53, 16], style(color=8, pattern=3)), 
        Text(
          extent=[-49, 102; -89, 80], 
          string="Q-RAS", 
          style(
            color=8, 
            thickness=4, 
            fillColor=8)), 
        Text(
          extent=[59, -76; 101, -102], 
          string="Qinflow", 
          style(color=8)), 
        Text(
          extent=[-100, -43; -70, -57], 
          string="Qmin", 
          style(color=8)), 
        Text(
          extent=[-100, 23; -70, 9], 
          string="Qrain", 
          style(color=8)), 
        Text(
          extent=[-43, 82; 79, 46], 
          string="ReturnController", 
          style(
            color=8, 
            pattern=2, 
            thickness=4)), 
        Polygon(points=[-14, -2; 2, -22; 4, -20; -12, 0; -9, 2; -16, 2; -16, -5
              ; -14, -2], style(pattern=0, fillColor=8)), 
        Polygon(points=[89, -70; 72, -64; 72, -76; 89, -70], style(
            color=8, 
            pattern=0, 
            fillColor=8)), 
        Polygon(points=[-70, 82; -77, 64; -63, 64; -70, 82], style(
            color=10, 
            pattern=0, 
            fillColor=8)), 
        Text(
          extent=[-4, -75; 24, -89], 
          string="Qdry", 
          style(color=8, fillColor=8)), 
        Text(
          extent=[31, -73; 61, -89], 
          string="Qmax", 
          style(color=8)), 
        Line(points=[-68, -50; -40, -50; 11, 7; 53, 15], style(color=0)), 
        Text(
          extent=[-19, -17; 51, -46], 
          string="RAS/Inflow Ratio", 
          style(color=8, fillColor=0))), 
      Documentation(info="Input signal is a flow measurement.
Output is a control signal between -1 and 1.

Parameters: Qmin - minimal allowed return acticated sludge (RAS) flow
            Qdry - flow until dry weather is assumed
            Qmax - maximum flow the treatment plant can handle
            Qrain- RAS flow at Qmax
            RAS_ratio - RAS/Inflow ratio during dry weather


This component is only used for the complex plant example.
Therefore no further documentation."));
    Modelica.Blocks.Interfaces.InPort in1(final n=1) annotation (extent=[-120, 
          -10; -100, 10]);
    Modelica.Blocks.Interfaces.OutPort out(final n=1) annotation (extent=[100, 
          -10; 120, 10]);
  equation 
    
    u1 = Qmin;
    u2 = in1.signal[1]/24*RAS_ratio/100;
    u3 = Qdry*RAS_ratio/100 + (Qrain - Qdry*RAS_ratio/100)/(Qmax - Qdry)*(in1.
      signal[1]/24 - Qdry);
    
    out.signal[1] = 2*min(max(u1, u2), u3)/Qmax - 1;
    
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
    
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[1, 1], 
        component=[20, 20]), 
      Icon(
        Rectangle(extent=[-100, 100; 100, -100]), 
        Text(extent=[-150, -100; 150, -140], string="%name"), 
        Line(points=[-70, -85; -70, 64], style(color=8, fillColor=0)), 
        Line(points=[-76, -70; 67, -70], style(color=8, fillColor=8)), 
        Polygon(points=[81, -70; 64, -64; 64, -76; 81, -70], style(
            color=8, 
            pattern=0, 
            fillColor=8)), 
        Polygon(points=[-70, 82; -77, 64; -63, 64; -70, 82], style(
            color=10, 
            pattern=0, 
            fillColor=8)), 
        Line(points=[-70, 30; -32, 30; -32, -11; 8, -11; 8, -50; 49, -50], 
            style(color=0))), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Diagram(
        Line(points=[-70, -85; -70, 64], style(color=8, fillColor=0)), 
        Line(points=[-76, -70; 67, -70], style(color=8, fillColor=8)), 
        Line(points=[-32, -11; -32, -70], style(
            color=8, 
            pattern=3, 
            fillColor=10)), 
        Line(points=[8, -50; 8, -70], style(color=8, pattern=3)), 
        Text(
          extent=[-48, 101; -88, 79], 
          string="u-Recycle", 
          style(
            color=8, 
            thickness=4, 
            fillColor=8)), 
        Text(
          extent=[59, -76; 101, -102], 
          string="N03-N", 
          style(color=8)), 
        Polygon(points=[81, -70; 64, -64; 64, -76; 81, -70], style(
            color=8, 
            pattern=0, 
            fillColor=8)), 
        Polygon(points=[-70, 82; -77, 64; -63, 64; -70, 82], style(
            color=10, 
            pattern=0, 
            fillColor=8)), 
        Text(
          extent=[-46, -70; -18, -84], 
          string="Min", 
          style(color=8, fillColor=8)), 
        Text(
          extent=[-7, -69; 23, -85], 
          string="Max", 
          style(color=8)), 
        Line(points=[-70, 30; -32, 30; -32, -11; 8, -11; 8, -50; 49, -50], 
            style(color=0)), 
        Line(points=[-32, -68; -32, -72], style(color=8)), 
        Line(points=[8, -68; 8, -72], style(color=8)), 
        Text(
          extent=[-96, -3; -70, -18], 
          string="Ref.", 
          style(color=8)), 
        Line(points=[-32, -11; -70, -11], style(color=8, pattern=3)), 
        Text(
          extent=[-29, 20; 12, 2], 
          string="dQ(NO3-Min)", 
          style(color=8)), 
        Text(
          extent=[13, -21; 56, -42], 
          string="dQ(NO3-Max)", 
          style(color=8)), 
        Text(
          extent=[-47, 74; 80, 40], 
          string="RecycleController", 
          style(color=8))), 
      Documentation(info="Input signal is a nitrate measurement,
output is a control signal between -1 and 1.

This component is only used for the complex plant example.
Therefore no further documentation."));
    Modelica.Blocks.Interfaces.InPort in1(final n=1) annotation (extent=[-120, 
          -10; -100, 10]);
    Modelica.Blocks.Interfaces.OutPort out(final n=1) annotation (extent=[100, 
          -10; 120, 10]);
  equation 
    
    //red = Pp*dNO3max/100;
    //[%]
    //inc = Pp*dNO3min/100;
    //[%]
    u1 = 2*(Pref + dNO3min)/100 - 1;
    u2 = 2*Pref/100 - 1;
    u3 = 2*(Pref - dNO3max)/100 - 1;
    out.signal[1] = if in1.signal[1] < NO3min then u1 else if in1.signal[1] < 
      NO3max then u2 else u3;
    
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
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[1, 1], 
        component=[20, 20]), 
      Icon(
        Rectangle(extent=[-100, 100; 100, -100]), 
        Text(extent=[-150, -100; 150, -140], string="%name"), 
        Line(points=[-70, -85; -70, 64], style(color=8, fillColor=0)), 
        Line(points=[-76, -70; 67, -70], style(color=8, fillColor=8)), 
        Polygon(points=[81, -70; 64, -64; 64, -76; 81, -70], style(
            color=8, 
            pattern=0, 
            fillColor=8)), 
        Polygon(points=[-70, 82; -77, 64; -63, 64; -70, 82], style(
            color=10, 
            pattern=0, 
            fillColor=8)), 
        Line(points=[-72, 18; -68, 18], style(color=8)), 
        Line(points=[-70, 18; -37, 18; 9, -41; 44, -41], style(color=0, 
              fillColor=0))), 
      Window(
        x=0.25, 
        y=0.46, 
        width=0.35, 
        height=0.49), 
      Diagram(
        Line(points=[-70, -85; -70, 64], style(color=8, fillColor=0)), 
        Line(points=[-76, -70; 67, -70], style(color=8, fillColor=8)), 
        Line(points=[-37, 18; -37, -70], style(
            color=8, 
            pattern=3, 
            fillColor=10)), 
        Line(points=[9, -41; 9, -70], style(color=8, pattern=3)), 
        Text(
          extent=[-49, 102; -89, 80], 
          string="u-Recycle", 
          style(
            color=8, 
            thickness=4, 
            fillColor=8)), 
        Text(
          extent=[59, -76; 101, -102], 
          string="N03-N", 
          style(color=8)), 
        Polygon(points=[81, -70; 64, -64; 64, -76; 81, -70], style(
            color=8, 
            pattern=0, 
            fillColor=8)), 
        Polygon(points=[-70, 82; -77, 64; -63, 64; -70, 82], style(
            color=10, 
            pattern=0, 
            fillColor=8)), 
        Text(
          extent=[-51, -71; -23, -85], 
          string="Min", 
          style(color=8, fillColor=8)), 
        Text(
          extent=[-4, -70; 26, -86], 
          string="Max", 
          style(color=8)), 
        Line(points=[-72, 18; -68, 18], style(color=8)), 
        Line(points=[-37, -68; -37, -72], style(color=8)), 
        Text(
          extent=[-10, 6; 29, -14], 
          string="d(NO3)", 
          style(color=8)), 
        Text(
          extent=[-61, 69; 66, 35], 
          string="RecycleController", 
          style(color=8)), 
        Line(points=[-70, 18; -37, 18; 9, -41; 44, -41], style(color=0, 
              fillColor=0)), 
        Line(points=[9, -68; 9, -72], style(color=8))), 
      Documentation(info="Input signal is a Nitrate measurement
Output is a control signal between -1 and 1.

This component is only used for the complex plant example.
Therefore no further documentation.
"));
    Modelica.Blocks.Interfaces.InPort in1(final n=1) annotation (extent=[-120, 
          -10; -100, 10]);
    Modelica.Blocks.Interfaces.OutPort out(final n=1) annotation (extent=[100, 
          -10; 120, 10]);
  equation 
    
    //red = Pp*dNO3max/100;
    //[%]
    //inc = Pp*dNO3min/100;
    //[%]
    u1 = 2*(Pref + dNO3min)/100 - 1;
    //u2 = 2*Pref/100 - 1;
    u2 = 2*((Pref + dNO3min)/100 - ((dNO3max + dNO3min)/100)/(NO3max - NO3min)*
      (in1.signal[1] - NO3min)) - 1;
    u3 = 2*(Pref - dNO3max)/100 - 1;
    out.signal[1] = if in1.signal[1] < NO3min then u1 else if in1.signal[1] < 
      NO3max then u2 else u3;
    
  end RecycleController2;
end Misc;
