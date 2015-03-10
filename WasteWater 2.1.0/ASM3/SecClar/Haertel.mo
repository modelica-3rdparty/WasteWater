within WasteWater.ASM3.SecClar;
package Haertel "Secondary clarifier modelling by Haertel (ASM3)"

  extends Modelica.Icons.Library;

  package Interfaces
    "Connectors and partial models for ASM3 Secondary Clarifier Model by Haertel"

    extends Modelica.Icons.Library;

    connector UpperLayerPin "Connector above influent layer"

      package WWU = WasteWater.WasteWaterUnits;

      // effluent flow
      flow WWU.VolumeFlowRate Qe;

      // sedimentation flux
      flow WWU.SedimentationFlux SedFlux;

      // total sludge concentration in (m-1)-th layer (dn=down)
      WWU.MassConcentration X_dn;

      // soluble components
      WWU.MassConcentration So;
      WWU.MassConcentration Si;
      WWU.MassConcentration Ss;
      WWU.MassConcentration Snh;
      WWU.MassConcentration Sn2;
      WWU.MassConcentration Snox;
      WWU.Alkalinity Salk;
      annotation (             Documentation(info=
              "Connector for ASM3 information and mass exchange between layers above the influent layer (feed_layer)."));

    end UpperLayerPin;

    connector LowerLayerPin "Connector below influent layer"

      package WWU = WasteWater.WasteWaterUnits;

      // return and waste sludge flow Qr, Qw
      flow WWU.VolumeFlowRate Qr;
      flow WWU.VolumeFlowRate Qw;

      // sedimentation flux
      flow WWU.SedimentationFlux SedFlux;

      // total sludge concentration in m-th layer
      WWU.MassConcentration X;

      // total sludge concentration and sink velocity in
      // (m-1)-th layer (dn=down)
      WWU.MassConcentration X_dn;
      WWU.SedimentationVelocity vS_dn;

      // soluble components
      WWU.MassConcentration So;
      WWU.MassConcentration Si;
      WWU.MassConcentration Ss;
      WWU.MassConcentration Snh;
      WWU.MassConcentration Sn2;
      WWU.MassConcentration Snox;
      WWU.Alkalinity Salk;
      annotation (
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.49),
        Documentation(info=
              "Connector for ASM3 information and mass exchange between layers below the influent layer (feed_layer)."));
    end LowerLayerPin;

    partial model SCParam "partial model providing clarifier parameters"
      package SI = Modelica.SIunits;
      package WWU = WasteWater.WasteWaterUnits;
      parameter SI.Length zm;
      parameter SI.Area Asc;
      parameter WWU.SludgeVolumeIndex ISV;

      annotation (
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.49),
        Documentation(info="partial model providing clarifier parameters"));
    end SCParam;

    partial model SCVar "partial models providing variables"
      package WWU = WasteWater.WasteWaterUnits;
      WWU.MassConcentration X "total sludge concentration in m-th layer";
      WWU.SedimentationVelocity vS "sink velocity in m-th layer";
      WWU.SedimentationFlux Jsm "sedimentation flux m-th layer";

      WWU.MassConcentration So "Dissolved oxygen";
      WWU.MassConcentration Si "Soluble inert organics";
      WWU.MassConcentration Ss "Readily biodegradable substrates";
      WWU.MassConcentration Snh "Ammonium";
      WWU.MassConcentration Sn2 "Dinitrogen, released by nitrification";
      WWU.MassConcentration Snox "Nitrite plus nitrate";
      WWU.Alkalinity Salk "Alkalinity, bicarbonate";

      annotation (
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.49),
        Documentation(info="partial models providing variables"));
    end SCVar;

    partial model ratios "partial model for ratios of solid components"
      // ratios of solid components
      Real rXi;
      Real rXs;
      Real rXh;
      Real rXsto;
      Real rXa;
      annotation (
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.49),
        Documentation(info="partial model for ASM3 ratios of solid components"));
    end ratios;

    function vSfun "Sedimentation velocity function"
      // sink velocity in m/d

      // total sludge concentration in m-th layer in g/m3 or mg/l
      input Real X;
      //Sludge Volume Index
      input Real ISV;

      output Real vS;
    protected
      Real v0 "maximum settling velocity";
      Real nv "exponent as part of the Vesilind equation";
    algorithm
      v0 := (17.4*(exp(-0.0113*ISV)) + 3.931)*24;
      //[m/d]
      nv := (-0.9834*(exp(-0.00581*ISV)) + 1.043);
      //[l/g]
      vS := v0*exp(-nv*X/1000);
      annotation (
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.49),
        Documentation(info="Sedimentation velocity function"));
    end vSfun;

    function omega "Omega correction function by Haertel"
      input Real z;
      //vertical coordinate, bottom: z=0
      input Real Xf;
      // total sludge concentration in clarifier feed
      input Real hsc;
      //height of secondary clarifier
      input Real zm;
      //height of m-th secondary clarifier layer
      input Real ISV;
      //Sludge Volume Index
      input Integer i;
      //number of layers above feed layer

      // correction function omega by Haertel based on [g/l]
      output Real omega;

    protected
      Real Xc "solids concentration at compression point";
      Real nv "exponent as part of the Vesilind equation";
      Real ht "height of transition point";
      Real hc "height of compressing point";
      Real B3;
      Real B4;

    algorithm

      Xc := 480/ISV;
      nv := 1.043 - 0.9834*exp(-0.00581*ISV);
      hc := (Xf/1000)*(hsc - zm*(i + 0.5))/Xc*(1.0 - 1.0/(Xc*nv));
      // unit change
      ht := min(2.0*hc, hsc - zm*(i + 0.5));

      B4 := 1.0 + 2.0*ISV/(100.0 + ISV);
      B3 := -((2*ISV + 100.0)/ISV)*hc^B4;

      omega := (1.0 - B3*ht^(-B4))/(1.0 - B3*z^(-B4));
      omega := min(1.0, omega);
      annotation (
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.49),
        Documentation(info=
              "This is Haertels omega correction function for the settling process."));
    end omega;
    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.44,
        height=0.65,
        library=1,
        autolayout=1),
      Documentation(info="This package contains connectors and interfaces (partial models) for
the ASM3 secondary clarifier model based on Haertel [1] (settling velocity and omega correction function).

References:

[1] L. Haertel: Modellansaetze zur dynamischen Simulation des Belebtschlammverfahrens.
    TH Darmstadt, Dissertation, 1990.

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

Copyright (C) 2002 - 2003, Gerald Reichl
"));
  end Interfaces;

  model SecClarModHaertel "ASM3 Secondary Settling Tank Model based on Haertel"

    extends WasteWater.Icons.SecClar;
    extends ASM3.SecClar.Haertel.Interfaces.ratios;
    package SCP = ASM3.SecClar.Haertel;
    package SI = Modelica.SIunits;
    package WI = ASM3.Interfaces;
    package WWU = WasteWater.WasteWaterUnits;
    parameter SI.Length hsc=4.0 "height of secondary clarifier";
    parameter Integer n=10 "number of layers of SC model";
    parameter SI.Length zm=hsc/(1.0*n)
      "height of m-th secondary clarifier layer";
    parameter SI.Area Asc=1500.0 "area of secondary clarifier";
    parameter WWU.SludgeVolumeIndex ISV=130 "Sludge Volume Index";
    parameter Integer i=2
      "number of layers above current feed layer in this model";

    // total sludge concentration in clarifier feed
    WWU.MassConcentration Xf;

    // layers 1 to 10
    SCP.bottom_layer S1(
      zm=zm,
      Asc=Asc,
      ISV=ISV,
      rXi=rXi,
      rXs=rXs,
      rXh=rXh,
      rXsto=rXsto,
      rXa=rXa) annotation (Placement(transformation(extent={{-35,-93},{35,-78}},
            rotation=0)));
    SCP.lower_layer S2(
      hsc=hsc,
      zm=zm,
      z=(zm + zm/2),
      Asc=Asc,
      ISV=ISV,
      i=i,
      Xf=Xf) annotation (Placement(transformation(extent={{-35,-74},{35,-59}},
            rotation=0)));
    SCP.lower_layer S3(
      hsc=hsc,
      zm=zm,
      z=(2*zm + zm/2),
      Asc=Asc,
      ISV=ISV,
      i=i,
      Xf=Xf) annotation (Placement(transformation(extent={{-35,-55},{35,-40}},
            rotation=0)));
    SCP.lower_layer S4(
      hsc=hsc,
      zm=zm,
      z=(3*zm + zm/2),
      Asc=Asc,
      ISV=ISV,
      i=i,
      Xf=Xf) annotation (Placement(transformation(extent={{-35,-36},{35,-21}},
            rotation=0)));
    SCP.lower_layer S5(
      hsc=hsc,
      zm=zm,
      z=(4*zm + zm/2),
      Asc=Asc,
      ISV=ISV,
      i=i,
      Xf=Xf) annotation (Placement(transformation(extent={{-35,-17},{35,-2}},
            rotation=0)));
    SCP.lower_layer S6(
      hsc=hsc,
      zm=zm,
      z=(5*zm + zm/2),
      Asc=Asc,
      ISV=ISV,
      i=i,
      Xf=Xf) annotation (Placement(transformation(extent={{-35,2},{35,17}},
            rotation=0)));
    SCP.lower_layer S7(
      hsc=hsc,
      zm=zm,
      z=(6*zm + zm/2),
      Asc=Asc,
      ISV=ISV,
      i=i,
      Xf=Xf) annotation (Placement(transformation(extent={{-35,21},{35,36}},
            rotation=0)));
    SCP.feed_layer S8(
      hsc=hsc,
      zm=zm,
      z=(7*zm + zm/2),
      Asc=Asc,
      ISV=ISV,
      i=i,
      Xf=Xf) annotation (Placement(transformation(extent={{-35,40},{35,55}},
            rotation=0)));
    SCP.upper_layer S9(
      zm=zm,
      Asc=Asc,
      ISV=ISV) annotation (Placement(transformation(extent={{-35,59},{35,74}},
            rotation=0)));
    SCP.top_layer S10(
      zm=zm,
      Asc=Asc,
      ISV=ISV,
      rXi=rXi,
      rXs=rXs,
      rXh=rXh,
      rXsto=rXsto,
      rXa=rXa) annotation (Placement(transformation(extent={{-35,78},{35,93}},
            rotation=0)));
    WI.WWFlowAsm3in Feed annotation (Placement(transformation(extent={{-110,4},
              {-90,24}}, rotation=0)));
    WI.WWFlowAsm3out Effluent annotation (Placement(transformation(extent={{92,
              47},{112,67}}, rotation=0)));
    WI.WWFlowAsm3out Return annotation (Placement(transformation(extent={{-40,
              -106},{-20,-86}}, rotation=0)));
    WI.WWFlowAsm3out Waste annotation (Placement(transformation(extent={{20,
              -106},{40,-86}}, rotation=0)));
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
    connect(Feed, S8.In) annotation (Line(points={{-98,14},{-98,47.8},{-33,47.8}}));
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
      Documentation(info="This component models an ASM3 10 - layer secondary clarifier with 4 layers above the feed_layer (including top_layer)
and 5 layers below the feed_layer (including bottom_layer) based on Haertel`s theory.

Parameters:
  hsc -  height of clarifier [m]
  n   -  number of layers
  Asc -  surface area of sec. clar. [m2]
  ISV -  Sludge Volume Index [ml/g]
  i   -  number of layers above feed layer
"),   Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49));
  end SecClarModHaertel;

  model bottom_layer "Bottom layer of Haertel`s SC model"
    package WWSC = WasteWater.ASM3.SecClar.Haertel.Interfaces;
    extends WWSC.SCParam;
    extends WWSC.SCVar;
    extends WWSC.ratios;

    ASM3.Interfaces.WWFlowAsm3out PQr annotation (Placement(transformation(
            extent={{-70,-110},{-50,-90}}, rotation=0)));
    ASM3.Interfaces.WWFlowAsm3out PQw annotation (Placement(transformation(
            extent={{40,-110},{60,-90}}, rotation=0)));
    WWSC.LowerLayerPin Up annotation (Placement(transformation(extent={{-10,90},
              {10,110}}, rotation=0)));
  equation

    // sink velocity
    vS = WWSC.vSfun(X, ISV);

    // sedimentation flux in bottom layer
    Jsm = 0.0;

    // ODE of solid component
    der(X) = ((Up.Qr + Up.Qw)/Asc*(Up.X - X) + Up.SedFlux)/zm;

    // ODEs of soluble components
    der(So) = (Up.Qr + Up.Qw)*(Up.So - So)/(Asc*zm);
    der(Si) = (Up.Qr + Up.Qw)*(Up.Si - Si)/(Asc*zm);
    der(Ss) = (Up.Qr + Up.Qw)*(Up.Ss - Ss)/(Asc*zm);
    der(Snh) = (Up.Qr + Up.Qw)*(Up.Snh - Snh)/(Asc*zm);
    der(Sn2) = (Up.Qr + Up.Qw)*(Up.Sn2 - Sn2)/(Asc*zm);
    der(Snox) = (Up.Qr + Up.Qw)*(Up.Snox - Snox)/(Asc*zm);
    der(Salk) = (Up.Qr + Up.Qw)*(Up.Salk - Salk)/(Asc*zm);

    // upward connection
    Up.vS_dn = vS;
    Up.X_dn = X;

    // return and waste sludge volume flow rates
    PQr.Q + Up.Qr = 0;
    PQw.Q + Up.Qw = 0;

    // return sludge flow, solid and soluble components (ASM3)
    PQr.So = So;
    PQr.Si = Si;
    PQr.Ss = Ss;
    PQr.Snh = Snh;
    PQr.Sn2 = Sn2;
    PQr.Snox = Snox;
    PQr.Salk = Salk;
    PQr.Xi = rXi*X;
    PQr.Xs = rXs*X;
    PQr.Xh = rXh*X;
    PQr.Xsto = rXsto*X;
    PQr.Xa = rXa*X;
    PQr.Xss = X;

    // waste sludge flow, solid and soluble components (ASM3)
    PQw.So = So;
    PQw.Si = Si;
    PQw.Ss = Ss;
    PQw.Snh = Snh;
    PQw.Sn2 = Sn2;
    PQw.Snox = Snox;
    PQw.Salk = Salk;
    PQw.Xi = rXi*X;
    PQw.Xs = rXs*X;
    PQw.Xh = rXh*X;
    PQw.Xsto = rXsto*X;
    PQw.Xa = rXa*X;
    PQw.Xss = X;

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info="This class models the lowest layer of an ASM3 secondary clarifier based on Haertel.

No sedimentation flux (mass exchange) with underneath but hydraulic and sedimentation flux (same direction)
with above layer.
From here return and waste sludge is removed.
"),   Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}),
          Polygon(
            points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                {-52,-40},{-68,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                68},{-68,68}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                68}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid)}),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}),
          Text(extent={{-100,20},{100,-20}}, textString=
                                                 "%name"),
          Polygon(
            points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                {-52,-40},{-68,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                68},{-68,68}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                68}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid)}));
  end bottom_layer;

  model lower_layer "Layer below influent of Haertel`s SC model"

    package WWSC = WasteWater.ASM3.SecClar.Haertel.Interfaces;
    extends WWSC.SCParam;
    extends WWSC.SCVar;

    WWU.MassConcentration Xf "sludge concentration in clarifier feed";
    SI.Length z "vertical coordinate of current layer";

    parameter SI.Length hsc;
    parameter Integer i "number of layers above feed layer";
    Real omega;
    WWSC.LowerLayerPin Up annotation (Placement(transformation(extent={{-10,90},
              {10,110}}, rotation=0)));
    WWSC.LowerLayerPin Dn annotation (Placement(transformation(extent={{-10,
              -110},{10,-90}}, rotation=0)));
  equation

    // sink velocity
    vS = WWSC.vSfun(X, ISV);
    omega = WWSC.omega(z, Xf, hsc, zm, ISV, i);

    // sedimentation flux in m-th layer sinking to lower layer
    Jsm = if vS < Dn.vS_dn then omega*(vS*X) else omega*min(vS*X, Dn.vS_dn*Dn.
      X_dn);

    // ODE of solid component
    der(X) = ((Up.Qr + Up.Qw)/Asc*(Up.X - X) + Up.SedFlux - Jsm)/zm;

    // ODEs of soluble components
    der(So) = (Up.Qr + Up.Qw)*(Up.So - So)/(Asc*zm);
    der(Si) = (Up.Qr + Up.Qw)*(Up.Si - Si)/(Asc*zm);
    der(Ss) = (Up.Qr + Up.Qw)*(Up.Ss - Ss)/(Asc*zm);
    der(Snh) = (Up.Qr + Up.Qw)*(Up.Snh - Snh)/(Asc*zm);
    der(Sn2) = (Up.Qr + Up.Qw)*(Up.Sn2 - Sn2)/(Asc*zm);
    der(Snox) = (Up.Qr + Up.Qw)*(Up.Snox - Snox)/(Asc*zm);
    der(Salk) = (Up.Qr + Up.Qw)*(Up.Salk - Salk)/(Asc*zm);

    // downward connections
    Dn.Qr + Up.Qr = 0;
    Dn.Qw + Up.Qw = 0;

    Dn.X = X;
    Dn.SedFlux = -Jsm;

    Dn.So = So;
    Dn.Si = Si;
    Dn.Ss = Ss;
    Dn.Snh = Snh;
    Dn.Sn2 = Sn2;
    Dn.Snox = Snox;
    Dn.Salk = Salk;

    // upward connections
    Up.vS_dn = vS;
    Up.X_dn = X;
    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info="This class models the layers between the influent layer (feed_layer) and the lowest layer (bottom_layer)
of an ASM3 secondary clarifier based on Haertel.

Hydraulic and sedimentation flux (mass exchange in same direction) with above and underneath layer.

Sedimentation flux is calculated based on the sedimentation velocity
function and the omega correction function by Haertel.
"),   Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}),
          Polygon(
            points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                68}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                -40},{52,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                68},{-68,68}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                {-52,-40},{-68,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}),
          Text(extent={{-100,20},{100,-20}}, textString=
                                                 "%name"),
          Polygon(
            points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                68}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                -40},{52,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,68},{-68,50},{-76,50},{-60,40},{-44,50},{-52,50},{-52,
                68},{-68,68}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                {-52,-40},{-68,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}));
  end lower_layer;

  model feed_layer "Influent layer of Haertel`s SC model"

    package WWSC = WasteWater.ASM3.SecClar.Haertel.Interfaces;
    extends WWSC.SCParam;
    extends WWSC.SCVar;
    WWU.MassConcentration Xf "sludge concentration in clarifier feed";
    SI.Length z "vertical coordinate of current layer";

    parameter SI.Length hsc;
    parameter Integer i "number of layers above feed layer";
    Real omega;

    WWSC.LowerLayerPin Dn annotation (Placement(transformation(extent={{-10,
              -110},{10,-90}}, rotation=0)));
    WWSC.UpperLayerPin Up annotation (Placement(transformation(extent={{-10,90},
              {10,110}}, rotation=0)));
    ASM3.Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent
            ={{-110,-6},{-90,14}}, rotation=0)));
  equation

    // sink velocity
    vS = WWSC.vSfun(X, ISV);
    omega = WWSC.omega(z, Xf, hsc, zm, ISV, i);

    // sedimentation flux in m-th layer sinking to lower layer
    Jsm = if vS < Dn.vS_dn then omega*(vS*X) else omega*min(vS*X, Dn.vS_dn*Dn.
      X_dn);

    // ODE of solid component
    der(X) = (In.Q/Asc*Xf - (-Up.Qe)/Asc*X - (-(Dn.Qr + Dn.Qw))/Asc*X + Up.
      SedFlux - Jsm)/zm;

    // ODE of soluble components
    der(So) = (In.Q*In.So - (-Up.Qe)*So - (-(Dn.Qr + Dn.Qw))*So)/(Asc*zm);
    der(Si) = (In.Q*In.Si - (-Up.Qe)*Si - (-(Dn.Qr + Dn.Qw))*Si)/(Asc*zm);
    der(Ss) = (In.Q*In.Ss - (-Up.Qe)*Ss - (-(Dn.Qr + Dn.Qw))*Ss)/(Asc*zm);
    der(Snh) = (In.Q*In.Snh - (-Up.Qe)*Snh - (-(Dn.Qr + Dn.Qw))*Snh)/(Asc*zm);
    der(Sn2) = (In.Q*In.Sn2 - (-Up.Qe)*Sn2 - (-(Dn.Qr + Dn.Qw))*Sn2)/(Asc*zm);
    der(Snox) = (In.Q*In.Snox - (-Up.Qe)*Snox - (-(Dn.Qr + Dn.Qw))*Snox)/(Asc*
      zm);
    der(Salk) = (In.Q*In.Salk - (-Up.Qe)*Salk - (-(Dn.Qr + Dn.Qw))*Salk)/(Asc*
      zm);

    // volume flow rates
    In.Q + Up.Qe + Dn.Qr + Dn.Qw = 0;

    Dn.SedFlux = -Jsm;
    Dn.X = X;

    Dn.So = So;
    Dn.Si = Si;
    Dn.Ss = Ss;
    Dn.Snh = Snh;
    Dn.Sn2 = Sn2;
    Dn.Snox = Snox;
    Dn.Salk = Salk;

    Up.X_dn = X;

    Up.So = So;
    Up.Si = Si;
    Up.Ss = Ss;
    Up.Snh = Snh;
    Up.Sn2 = Sn2;
    Up.Snox = Snox;
    Up.Salk = Salk;

    annotation (
      Window(
        x=0.57,
        y=0.01,
        width=0.35,
        height=0.49),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Documentation(info="This class models the influent layer of an ASM3 secondary clarifier based on Haertel.

It receives the wastewater stream from the biological part (feed).
Hydraulic and sedimentation flux (mass exchange in opposite directions) with above layer
and hydraulic and sedimentation flux (mass exchange in same direction) with underneath layer.

Sedimentation flux is calculated based on the sedimentation velocity
function and the omega correction function by Haertel.
"),   Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}),
          Polygon(
            points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                -40},{52,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                {-52,-40},{-68,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                40},{-68,40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                68}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid)}),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}),
          Text(extent={{-100,20},{100,-20}}, textString=
                                                 "%name"),
          Polygon(
            points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                -40},{52,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,-40},{-68,-58},{-76,-58},{-60,-68},{-44,-58},{-52,-58},
                {-52,-40},{-68,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                40},{-68,40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                68}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid)}));
  end feed_layer;

  model upper_layer "Layer above influent of Haertels`s SC"
    package WWSC = WasteWater.ASM3.SecClar.Haertel.Interfaces;
    extends WWSC.SCParam;
    extends WWSC.SCVar;

    WWSC.UpperLayerPin Dn annotation (Placement(transformation(extent={{-10,
              -110},{10,-90}}, rotation=0)));
    WWSC.UpperLayerPin Up annotation (Placement(transformation(extent={{-10,90},
              {10,110}}, rotation=0)));
  equation

    // sink velocity
    vS = WWSC.vSfun(X, ISV);

    // sedimentation flux in m-th layer sinking to lower layer
    Jsm = vS*X;

    // ODE of solid component
    der(X) = (Dn.Qe/Asc*(Dn.X_dn - X) + Up.SedFlux - Jsm)/zm;

    // ODEs of soluble components
    der(So) = Dn.Qe*(Dn.So - So)/(Asc*zm);
    der(Si) = Dn.Qe*(Dn.Si - Si)/(Asc*zm);
    der(Ss) = Dn.Qe*(Dn.Ss - Ss)/(Asc*zm);
    der(Snh) = Dn.Qe*(Dn.Snh - Snh)/(Asc*zm);
    der(Sn2) = Dn.Qe*(Dn.Sn2 - Sn2)/(Asc*zm);
    der(Snox) = Dn.Qe*(Dn.Snox - Snox)/(Asc*zm);
    der(Salk) = Dn.Qe*(Dn.Salk - Salk)/(Asc*zm);

    // downward connection
    Dn.SedFlux = -Jsm;

    // upward connections
    Up.Qe + Dn.Qe = 0;

    Up.X_dn = X;

    Up.So = So;
    Up.Si = Si;
    Up.Ss = Ss;
    Up.Snh = Snh;
    Up.Sn2 = Sn2;
    Up.Snox = Snox;
    Up.Salk = Salk;

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info="This class models the layers between the influent layer (feed_layer) and the effluent layer (top_layer)
of an ASM3 secondary clarifier based on Haertel.

Hydraulic and sedimentation flux (mass exchange in opposite directions) with above and underneath layer.

Sedimentation flux is calculated based on the sedimentation velocity
function by Haertel.
"),   Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}),
          Polygon(
            points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                -40},{52,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                40},{-68,40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                68}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                {-52,-70},{-68,-70}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}),
          Text(extent={{-100,20},{100,-20}}, textString=
                                                 "%name"),
          Polygon(
            points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                -40},{52,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,40},{-68,60},{-76,60},{-60,70},{-44,60},{-52,60},{-52,
                40},{-68,40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{52,68},{52,50},{44,50},{60,40},{76,50},{68,50},{68,68},{52,
                68}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                {-52,-70},{-68,-70}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}));
  end upper_layer;

  model top_layer "Effluent layer of Haertel`s SC model"
    package WWSC = WasteWater.ASM3.SecClar.Haertel.Interfaces;
    extends WWSC.SCParam;
    extends WWSC.SCVar;
    extends WWSC.ratios;

    WWSC.UpperLayerPin Dn annotation (Placement(transformation(extent={{-10,
              -110},{10,-90}}, rotation=0)));
    ASM3.Interfaces.WWFlowAsm3out Out annotation (Placement(transformation(
            extent={{90,-10},{110,10}}, rotation=0)));
  equation

    // sink velocity
    vS = WWSC.vSfun(X, ISV);

    // sedimentation flux in m-th layer sinking to lower layer
    Jsm = vS*X;

    // ODE of solid component
    der(X) = (Dn.Qe/Asc*(Dn.X_dn - X) - Jsm)/zm;

    // ODEs of soluble components
    der(So) = Dn.Qe*(Dn.So - So)/(Asc*zm);
    der(Si) = Dn.Qe*(Dn.Si - Si)/(Asc*zm);
    der(Ss) = Dn.Qe*(Dn.Ss - Ss)/(Asc*zm);
    der(Snh) = Dn.Qe*(Dn.Snh - Snh)/(Asc*zm);
    der(Sn2) = Dn.Qe*(Dn.Sn2 - Sn2)/(Asc*zm);
    der(Snox) = Dn.Qe*(Dn.Snox - Snox)/(Asc*zm);
    der(Salk) = Dn.Qe*(Dn.Salk - Salk)/(Asc*zm);

    // downward connection
    Dn.SedFlux = -Jsm;

    // effluent volume flow rate
    Out.Q + Dn.Qe = 0;

    // effluent, solid and soluble components (ASM3)
    Out.So = So;
    Out.Si = Si;
    Out.Ss = Ss;
    Out.Snh = Snh;
    Out.Sn2 = Sn2;
    Out.Snox = Snox;
    Out.Salk = Salk;

    Out.Xi = rXi*X;
    Out.Xs = rXs*X;
    Out.Xh = rXh*X;
    Out.Xsto = rXsto*X;
    Out.Xa = rXa*X;
    Out.Xss = X;

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info="This class models the top layer of an ASM3 secondary clarifier based on Haertel.

No sedimentation flux (mass exchange) with above but hydraulic and sedimentation flux
(opposite directions) underneath.
From here effluent goes to the receiving water.

Sedimentation flux is calculated based on the sedimentation velocity
function by Haertel.
"),   Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}),
          Polygon(
            points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                -40},{52,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-8,58},{-8,40},{10,40},{10,32},{22,50},{10,66},{10,58},{-8,
                58}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                {-52,-70},{-68,-70}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}),
          Text(extent={{-100,20},{100,-20}}, textString=
                                                 "%name"),
          Polygon(
            points={{52,-40},{52,-58},{44,-58},{60,-68},{76,-58},{68,-58},{68,
                -40},{52,-40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={223,191,159},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-8,58},{-8,40},{10,40},{10,32},{22,50},{10,66},{10,58},{-8,
                58}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,-70},{-68,-50},{-76,-50},{-60,-40},{-44,-50},{-52,-50},
                {-52,-70},{-68,-70}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}));
  end top_layer;
  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.44,
      height=0.65,
      library=1,
      autolayout=1),
    Documentation(info="This package contains classes (layer models) to built ASM3 secondary clarifier models, an Interfaces sub-library
and provides an ASM3 10-layer secondary clarifier model all bases on Haertel`s [1] 
sedimentation velocity and omega correction functions.

A secondary clarifier layer model needs at least a top_layer, a feed_layer and a bottom_layer
and may have several upper_layer in between above the feed_layer and several lower_layer in
between below the feed_layer.

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

[1] L. Haertel: Modellansaetze zur dynamischen Simulation des Belebtschlammverfahrens.
    TH Darmstadt, Dissertation, 1990.

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2002 - 2003, Gerald Reichl
"));
end Haertel;
