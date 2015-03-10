within WasteWater.ASM1.SecClar;
package Simple "Simple ASM1 Secondary clarifier model"
  extends Modelica.Icons.Library;

  model SimpleSecClarMod "Simple ASM1 Secondary Clarifier Model"

    extends WasteWater.Icons.SecClarSimple;
    extends WasteWater.ASM1.SecClar.Takacs.Interfaces.ratios;
    package SI = Modelica.SIunits;
    package WI = WasteWater.ASM1.Interfaces;
    package WWU = WasteWater.WasteWaterUnits;

    parameter SI.Length hsc=4.0 "height of secondary clarifier";
    parameter SI.Area Asc=1500.0 "area of secondary clarifier";

    WWU.MassConcentration Xf "total sludge concentration in clarifier feed";
    WWU.MassConcentration X "sludge concentration in clarifier";
    WWU.MassConcentration Si "Soluble inert organic matter";
    WWU.MassConcentration Ss "Readily biodegradable substrate";
    WWU.MassConcentration So "Dissolved oxygen";
    WWU.MassConcentration Sno "Nitrate and nitrite nitrogen";
    WWU.MassConcentration Snh "Ammonium nitrogen";
    WWU.MassConcentration Snd "Soluble biodegradable organic nitrogen";
    WWU.Alkalinity Salk "Alkalinity";

    WI.WWFlowAsm1in Feed annotation (Placement(transformation(extent={{-110,4},
              {-90,24}}, rotation=0)));
    WI.WWFlowAsm1out Effluent annotation (Placement(transformation(extent={{92,
              47},{112,67}}, rotation=0)));
    WI.WWFlowAsm1out Return annotation (Placement(transformation(extent={{-40,
              -106},{-20,-86}}, rotation=0)));
    WI.WWFlowAsm1out Waste annotation (Placement(transformation(extent={{20,
              -106},{40,-86}}, rotation=0)));
  equation

    // total sludge concentration in clarifier feed
    Xf = 0.75*(Feed.Xs + Feed.Xbh + Feed.Xba + Feed.Xp + Feed.Xi);

    // ratios of solid components
    rXs = Feed.Xs/Xf;
    rXbh = Feed.Xbh/Xf;
    rXba = Feed.Xba/Xf;
    rXp = Feed.Xp/Xf;
    rXi = Feed.Xi/Xf;
    rXnd = Feed.Xnd/Xf;

    // ODE of sludge concentration
    der(X) = (Feed.Q*Xf - (-(Waste.Q + Return.Q))*X)/(Asc*hsc);

    // ODE of soluble components
    der(Si) = (Feed.Q*Feed.Si - (-Effluent.Q)*Si - (-(Waste.Q + Return.Q))*Si)/
      (Asc*hsc);
    der(Ss) = (Feed.Q*Feed.Ss - (-Effluent.Q)*Ss - (-(Waste.Q + Return.Q))*Ss)/
      (Asc*hsc);
    der(So) = (Feed.Q*Feed.So - (-Effluent.Q)*So - (-(Waste.Q + Return.Q))*So)/
      (Asc*hsc);
    der(Sno) = (Feed.Q*Feed.Sno - (-Effluent.Q)*Sno - (-(Waste.Q + Return.Q))*
      Sno)/(Asc*hsc);
    der(Snh) = (Feed.Q*Feed.Snh - (-Effluent.Q)*Snh - (-(Waste.Q + Return.Q))*
      Snh)/(Asc*hsc);
    der(Snd) = (Feed.Q*Feed.Snd - (-Effluent.Q)*Snd - (-(Waste.Q + Return.Q))*
      Snd)/(Asc*hsc);
    der(Salk) = (Feed.Q*Feed.Salk - (-Effluent.Q)*Salk - (-(Waste.Q + Return.Q))
       *Salk)/(Asc*hsc);

    // volume flow rates
    Feed.Q + Effluent.Q + Return.Q + Waste.Q = 0;

    // effluent, solid and soluble components (ASM1)
    Effluent.Si = Si;
    Effluent.Ss = Ss;
    Effluent.Xi = 0.0*X;
    Effluent.Xs = 0.0*X;
    Effluent.Xbh = 0.0*X;
    Effluent.Xba = 0.0*X;
    Effluent.Xp = 0.0*X;
    Effluent.So = So;
    Effluent.Sno = Sno;
    Effluent.Snh = Snh;
    Effluent.Snd = Snd;
    Effluent.Xnd = 0.0*X;
    Effluent.Salk = Salk;

    // return sludge flow, solid and soluble components (ASM1)
    Return.Si = Si;
    Return.Ss = Ss;
    Return.Xi = rXi*X;
    Return.Xs = rXs*X;
    Return.Xbh = rXbh*X;
    Return.Xba = rXba*X;
    Return.Xp = rXp*X;
    Return.So = So;
    Return.Sno = Sno;
    Return.Snh = Snh;
    Return.Snd = Snd;
    Return.Xnd = rXnd*X;
    Return.Salk = Salk;

    // waste sludge flow, solid and soluble components (ASM1)
    Waste.Si = Si;
    Waste.Ss = Ss;
    Waste.Xi = rXi*X;
    Waste.Xs = rXs*X;
    Waste.Xbh = rXbh*X;
    Waste.Xba = rXba*X;
    Waste.Xp = rXp*X;
    Waste.So = So;
    Waste.Sno = Sno;
    Waste.Snh = Snh;
    Waste.Snd = Snd;
    Waste.Xnd = rXnd*X;
    Waste.Salk = Salk;

    annotation (
      Window(
        x=0.1,
        y=0.07,
        width=0.35,
        height=0.49),
      Documentation(info="This component models very simple the secondary clarification process by
just using a single fully mixed tank which removes all particulate substances from the effluent
and returns the sludge. No sedimentation and compression, etc. is considered (for ASM1).

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
    Documentation(info="This package just provides a very simple ASM1 secondary clarifier model
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

Copyright (C) 2002, Gerald Reichl
"));
end Simple;
