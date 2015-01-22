within WasteWater.ASM3.SecClar;
package Simple "Simple ASM3 Secondary clarifier model"

  extends Modelica.Icons.Library;

  model SimpleSecClarMod "Simple ASM3 Secondary Clarifier Model"

    extends WasteWater.Icons.SecClarSimple;
    extends WasteWater.ASM3.SecClar.Takacs.Interfaces.ratios;
    package SI = Modelica.SIunits;
    package WI = WasteWater.ASM3.Interfaces;
    package WWU = WasteWater.WasteWaterUnits;

    parameter SI.Length hsc=4.0 "height of secondary clarifier";
    parameter SI.Area Asc=1500.0 "area of secondary clarifier";

    WWU.MassConcentration Xf "total slduge concentration in clarifier feed";
    WWU.MassConcentration X "total sludge concentration";
    WWU.MassConcentration So "Dissolved oxygen";
    WWU.MassConcentration Si "Soluble inert organics";
    WWU.MassConcentration Ss "Readily biodegradable substrates";
    WWU.MassConcentration Snh "Ammonium";
    WWU.MassConcentration Sn2 "Dinitrogen, released by nitrification";
    WWU.MassConcentration Snox "Nitrite plus nitrate";
    WWU.Alkalinity Salk "Alkalinity, bicarbonate";

    WI.WWFlowAsm3in Feed annotation (Placement(transformation(extent={{-110,4},
              {-90,24}}, rotation=0)));
    WI.WWFlowAsm3out Effluent annotation (Placement(transformation(extent={{92,
              47},{112,67}}, rotation=0)));
    WI.WWFlowAsm3out Return annotation (Placement(transformation(extent={{-40,
              -106},{-20,-86}}, rotation=0)));
    WI.WWFlowAsm3out Waste annotation (Placement(transformation(extent={{20,
              -106},{40,-86}}, rotation=0)));
  equation

    // total sludge concentration in clarifier feed
    Xf = Feed.Xss;

    // ratios of solid components
    rXi = Feed.Xi/Xf;
    rXs = Feed.Xs/Xf;
    rXh = Feed.Xh/Xf;
    rXsto = Feed.Xsto/Xf;
    rXa = Feed.Xa/Xf;

    // ODEof sludge concentration
    der(X) = (Feed.Q*Xf - (-(Waste.Q + Return.Q))*X)/(Asc*hsc);

    // ODE of soluble components
    der(So) = (Feed.Q*Feed.So - (-Effluent.Q)*So - (-(Waste.Q + Return.Q))*So)/
      (Asc*hsc);
    der(Si) = (Feed.Q*Feed.Si - (-Effluent.Q)*Si - (-(Waste.Q + Return.Q))*Si)/
      (Asc*hsc);
    der(Ss) = (Feed.Q*Feed.Ss - (-Effluent.Q)*Ss - (-(Waste.Q + Return.Q))*Ss)/
      (Asc*hsc);
    der(Snh) = (Feed.Q*Feed.Snh - (-Effluent.Q)*Snh - (-(Waste.Q + Return.Q))*
      Snh)/(Asc*hsc);
    der(Sn2) = (Feed.Q*Feed.Sn2 - (-Effluent.Q)*Sn2 - (-(Waste.Q + Return.Q))*
      Sn2)/(Asc*hsc);
    der(Snox) = (Feed.Q*Feed.Snox - (-Effluent.Q)*Snox - (-(Waste.Q + Return.Q))
       *Snox)/(Asc*hsc);
    der(Salk) = (Feed.Q*Feed.Salk - (-Effluent.Q)*Salk - (-(Waste.Q + Return.Q))
       *Salk)/(Asc*hsc);

    // volume flow rates
    Feed.Q + Effluent.Q + Return.Q + Waste.Q = 0;

    // effluent, solid and soluble components (ASM3)
    Effluent.So = So;
    Effluent.Si = Si;
    Effluent.Ss = Ss;
    Effluent.Snh = Snh;
    Effluent.Sn2 = Sn2;
    Effluent.Snox = Snox;
    Effluent.Salk = Salk;
    Effluent.Xi = 0.0*X;
    Effluent.Xs = 0.0*X;
    Effluent.Xh = 0.0*X;
    Effluent.Xsto = 0.0*X;
    Effluent.Xa = 0.0*X;
    Effluent.Xss = 0.0*X;

    // return sludge flow, solid and soluble components (ASM3)
    Return.So = So;
    Return.Si = Si;
    Return.Ss = Ss;
    Return.Snh = Snh;
    Return.Sn2 = Sn2;
    Return.Snox = Snox;
    Return.Salk = Salk;
    Return.Xi = rXi*X;
    Return.Xs = rXs*X;
    Return.Xh = rXh*X;
    Return.Xsto = rXsto*X;
    Return.Xa = rXa*X;
    Return.Xss = X;

    // waste sludge flow, solid and soluble components (ASM3)
    Waste.So = So;
    Waste.Si = Si;
    Waste.Ss = Ss;
    Waste.Snh = Snh;
    Waste.Sn2 = Sn2;
    Waste.Snox = Snox;
    Waste.Salk = Salk;
    Waste.Xi = rXi*X;
    Waste.Xs = rXs*X;
    Waste.Xh = rXh*X;
    Waste.Xsto = rXsto*X;
    Waste.Xa = rXa*X;
    Waste.Xss = X;

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info="This component models very simple the secondary clarification process by
just using a single fully mixed tank which removes all particulate substances from the effluent
and returns the sludge. No sedimentation and compression, etc. is considered (for ASM3).

Parameters:
  hsc -    height of clarifier [m]
  Asc -    surface area of sec. clar. [m2]  
"),   Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Polygon(
            points={{-20,-70},{20,-70},{4,-84},{-4,-84},{-20,-70}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-4,-84},{4,-92}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-80,-48},{-36,-64},{38,-64},{80,-48},{-80,-48}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-80,62},{80,-40}},
            lineColor={223,191,159},
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Text(extent={{-80,98},{80,66}}, textString=
                                              "%name"),
          Polygon(
            points={{-36,-64},{38,-64},{20,-70},{-20,-70},{-36,-64}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Line(
            points={{4,-92},{4,-84},{20,-70},{80,-48}},
            color={0,0,0},
            thickness=0.5),
          Rectangle(
            extent={{-80,-40},{80,-48}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{80,62},{92,54}},
            lineColor={0,127,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Line(
            points={{80,54},{92,54}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{-4,-92},{-4,-84},{-20,-70},{-80,-48},{-80,10}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{-80,62},{-80,16}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{-80,10},{-90,10}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{-80,16},{-90,16}},
            color={0,0,0},
            thickness=0.5),
          Rectangle(
            extent={{-20,-92},{20,-98}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-20,-92},{-4,-92}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{-20,-98},{20,-98}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{20,-92},{4,-92}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{80,-48},{80,54}},
            color={0,0,0},
            thickness=0.5),
          Text(extent={{-100,-60},{-40,-80}}, textString=
                                                  "return"),
          Text(extent={{40,-60},{100,-80}}, textString=
                                                "waste"),
          Polygon(
            points={{16,44},{33,44},{31,52},{48,42},{31,31},{33,39},{16,39},{16,
                44}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-46,32},{-29,32},{-31,40},{-14,30},{-31,19},{-29,27},{-46,
                27},{-46,32}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{18,-26},{22,-26},{22,-42},{28,-40},{20,-54},{12,-40},{18,
                -42},{18,-26}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={191,95,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-32,-10},{-28,-10},{-28,-26},{-22,-24},{-30,-38},{-38,-24},
                {-32,-26},{-32,-10}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={191,95,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-90,16},{-80,10}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid)}));
  end SimpleSecClarMod;
  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.44,
      height=0.65,
      library=1,
      autolayout=1),
    Documentation(info="This package just provides a very simple ASM3 secondary clarifier model
with no sludge storage, no sludge sedimentation and no use of layers.
The model consists of one tank removing all particulate substances.

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
end Simple;
