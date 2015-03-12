within WasteWater.ASM2d.SecClar;
package Otterpohl "Secondary settling tank modelling by Otterpohl"

  extends Modelica.Icons.Library;

  package Interfaces
    "Connectors and partial ASM2d models for Secondary Clarifier Model by Otterpohl"

    extends Modelica.Icons.Library;

    connector UpperLayerPin "Connector above influent layer"

      package WWU = WasteWater.WasteWaterUnits;

      // effluent flow
      flow WWU.VolumeFlowRate Qe;

      // sedimentation flux (from micro and macro flocs)
      flow WWU.SedimentationFlux SedFlux_F;
      // caused by macro flocs
      flow WWU.SedimentationFlux SedFlux_S;
      // caused by micro flocs

        // total sludge concentration of macro and micro flocs in (m-1)-th layer (dn=down)
      WWU.MassConcentration X_dn_F;
      WWU.MassConcentration X_dn_S;

      // soluble components
      WWU.MassConcentration So;
      WWU.MassConcentration Sf;
      WWU.MassConcentration Sa;
      WWU.MassConcentration Snh;
      WWU.MassConcentration Sno;
      WWU.MassConcentration Spo;
      WWU.MassConcentration Si;
      WWU.Alkalinity Salk;
      WWU.MassConcentration Sn2;
      annotation (
        Window(
          x=0.45,
          y=0.3,
          width=0.35,
          height=0.49),
        Documentation(info=
              "Connector for ASM2d information and mass exchange between layers above the influent layer (feed_layer)."));

    end UpperLayerPin;

    connector LowerLayerPin "Connector below influent layer"

      package WWU = WasteWater.WasteWaterUnits;
      // return and waste sludge flow Qr, Qw
      flow WWU.VolumeFlowRate Qr;
      flow WWU.VolumeFlowRate Qw;

      // sedimentation flux (from micro and macro flocs)
      flow WWU.SedimentationFlux SedFlux_F;
      // caused by macro flocs
      flow WWU.SedimentationFlux SedFlux_S;
      // caused by micro flocs

      // total sludge concentration of macro and micro flocs in m-th layer
      WWU.MassConcentration X_F;
      WWU.MassConcentration X_S;

      // total sludge concentration and sink velocity in
      // (m-1)-th layer (dn=down)
      WWU.MassConcentration X_dn_F;
      WWU.MassConcentration X_dn_S;
      WWU.SedimentationVelocity vS_dn_F;

      // soluble components
      WWU.MassConcentration So;
      WWU.MassConcentration Sf;
      WWU.MassConcentration Sa;
      WWU.MassConcentration Snh;
      WWU.MassConcentration Sno;
      WWU.MassConcentration Spo;
      WWU.MassConcentration Si;
      WWU.Alkalinity Salk;
      WWU.MassConcentration Sn2;
      annotation (
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.49),
        Documentation(info=
              "Connector for ASM2d information and mass exchange between layers below the influent layer (feed_layer)."));

    end LowerLayerPin;

    partial model SCParam "partial model providing clarifier parameters"

      package SI = Modelica.SIunits;
      package WWU = WasteWater.WasteWaterUnits;
      parameter SI.Length zm;
      parameter SI.Area Asc;
      parameter WWU.SludgeVolumeIndex ISV;
      parameter WWU.SedimentationVelocity vS_S=0.24;
      // 0.01[m/h]*24 -> [m/d]
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
      WWU.MassConcentration X_F "sludge concentration of macro flocs";
      WWU.MassConcentration X_S "sludge concentration of micro flocs";
      WWU.SedimentationVelocity vS_F "sink velocity of makro flocs";
      WWU.SedimentationFlux Jsm_F "sedimentation flux of macro flocs";
      WWU.SedimentationFlux Jsm_S "sedimentation flux of micro flocs";

      WWU.MassConcentration So "Dissolved oxygen";
      WWU.MassConcentration Sf "Readily biodegradable substrate";
      WWU.MassConcentration Sa "Fermentation products";
      WWU.MassConcentration Snh "Ammonium";
      WWU.MassConcentration Sno "Nitrate (plus nitrite)";
      WWU.MassConcentration Spo "Phosphate";
      WWU.MassConcentration Si "Inert, non biodegradable organics";
      WWU.Alkalinity Salk "Bicarbonate alkalinity";
      WWU.MassConcentration Sn2 "Dinitrogen";
      annotation (
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.49),
        Documentation(info="partial models providing ASM2d variables"));

    end SCVar;

    partial model ratios "partial model for ratios of solid components"

      // ratios of solid components
      Real rXi;
      Real rXs;
      Real rXh;
      Real rXpao;
      Real rXpp;
      Real rXpha;
      Real rXa;
      Real rXmeoh;
      Real rXmep;
      annotation (
        Window(
          x=0.45,
          y=0.01,
          width=0.35,
          height=0.49),
        Documentation(info="partial model for ASM2d ratios of solid components"));

    end ratios;

    function vSfun "Sedimentation velocity function"

      // total sludge concentration in m-th layer in g/m3 or mg/l
      input Real X;
      //Sludge Volume Index
      input Real ISV;

      // sink velocity in m/d
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
the ASM2d secondary clarifier model based on Otterpohl [1] (two settling velocities for
distinction between micro and macro flocs and omega correction function).

References:

[1] R. Otterpohl and M. Freund: Dynamic models for clarifiers of activated sludge plants
    with dry and wet weather flows. Water Science and Technology. 26 (1992), pp 1391-1400.

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

Copyright (C) 2003, Gerald Reichl
"));
  end Interfaces;

  model SecClarModOtter "ASM2d Secondary Clarifier Model based on Otterpohl"

    extends WasteWater.Icons.SecClar;
    extends ASM2d.SecClar.Otterpohl.Interfaces.ratios;
    package SCP = ASM2d.SecClar.Otterpohl;
    package SI = Modelica.SIunits;
    package WI = ASM2d.Interfaces;
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
      rXpao=rXpao,
      rXpp=rXpp,
      rXpha=rXpha,
      rXa=rXa,
      rXmeoh=rXmeoh,
      rXmep=rXmep) annotation (Placement(transformation(extent={{-35,-93},{35,
              -78}}, rotation=0)));
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
      rXpao=rXpao,
      rXpp=rXpp,
      rXpha=rXpha,
      rXa=rXa,
      rXmeoh=rXmeoh,
      rXmep=rXmep) annotation (Placement(transformation(extent={{-35,78},{35,93}},
            rotation=0)));
    WI.WWFlowAsm2din Feed annotation (Placement(transformation(extent={{-110,4},
              {-90,24}}, rotation=0)));
    WI.WWFlowAsm2dout Effluent annotation (Placement(transformation(extent={{92,
              47},{112,67}}, rotation=0)));
    WI.WWFlowAsm2dout Return annotation (Placement(transformation(extent={{-40,
              -106},{-20,-86}}, rotation=0)));
    WI.WWFlowAsm2dout Waste annotation (Placement(transformation(extent={{20,
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
      Documentation(info="This component models an ASM2d 10 - layer secondary clarifier model with 4 layers above the feed_layer (including top_layer)
and 5 layers below the feed_layer (including bottom_layer) based on Otterpohl`s theory.

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
  end SecClarModOtter;

  model bottom_layer "Bottom layer of Otterpohls`s SC model"

    package WWSC = WasteWater.ASM2d.SecClar.Otterpohl.Interfaces;
    extends WWSC.SCParam;
    extends WWSC.SCVar;
    extends WWSC.ratios;

    ASM2d.Interfaces.WWFlowAsm2dout PQr annotation (Placement(transformation(
            extent={{-70,-110},{-50,-90}}, rotation=0)));
    ASM2d.Interfaces.WWFlowAsm2dout PQw annotation (Placement(transformation(
            extent={{40,-110},{60,-90}}, rotation=0)));
    WWSC.LowerLayerPin Up annotation (Placement(transformation(extent={{-10,90},
              {10,110}}, rotation=0)));
  equation

    // sink velocity
    vS_F = WWSC.vSfun(X_F, ISV);

    // sedimentation flux in bottom layer
    Jsm_F = 0.0;
    Jsm_S = 0.0;

    // ODE of solid component
    der(X_F) = ((Up.Qr + Up.Qw)/Asc*(Up.X_F - X_F) + Up.SedFlux_F)/zm;
    der(X_S) = ((Up.Qr + Up.Qw)/Asc*(Up.X_S - X_S) + Up.SedFlux_S)/zm;

    X = X_F + X_S;

    // ODEs of soluble components
    der(So) = (Up.Qr + Up.Qw)*(Up.So - So)/(Asc*zm);
    der(Sf) = (Up.Qr + Up.Qw)*(Up.Sf - Sf)/(Asc*zm);
    der(Sa) = (Up.Qr + Up.Qw)*(Up.Sa - Sa)/(Asc*zm);
    der(Snh) = (Up.Qr + Up.Qw)*(Up.Snh - Snh)/(Asc*zm);
    der(Sno) = (Up.Qr + Up.Qw)*(Up.Sno - Sno)/(Asc*zm);
    der(Spo) = (Up.Qr + Up.Qw)*(Up.Spo - Spo)/(Asc*zm);
    der(Si) = (Up.Qr + Up.Qw)*(Up.Si - Si)/(Asc*zm);
    der(Salk) = (Up.Qr + Up.Qw)*(Up.Salk - Salk)/(Asc*zm);
    der(Sn2) = (Up.Qr + Up.Qw)*(Up.Sn2 - Sn2)/(Asc*zm);

    // upward connection
    Up.vS_dn_F = vS_F;
    Up.X_dn_F = X_F;
    Up.X_dn_S = X_S;

    // return and waste sludge volume flow rates
    PQr.Q + Up.Qr = 0;
    PQw.Q + Up.Qw = 0;

    // return sludge flow, solid and soluble components (ASM2d)
    PQr.So = So;
    PQr.Sf = Sf;
    PQr.Sa = Sa;
    PQr.Snh = Snh;
    PQr.Sno = Sno;
    PQr.Spo = Spo;
    PQr.Si = Si;
    PQr.Salk = Salk;
    PQr.Sn2 = Sn2;
    PQr.Xi = rXi*X;
    PQr.Xs = rXs*X;
    PQr.Xh = rXh*X;
    PQr.Xpao = rXpao*X;
    PQr.Xpp = rXpp*X;
    PQr.Xpha = rXpha*X;
    PQr.Xa = rXa*X;
    PQr.Xtss = X;
    PQr.Xmeoh = rXmeoh*X;
    PQr.Xmep = rXmep*X;

    // waste sludge flow, solid and soluble components (ASM2d)
    PQw.So = So;
    PQw.Sf = Sf;
    PQw.Sa = Sa;
    PQw.Snh = Snh;
    PQw.Sno = Sno;
    PQw.Spo = Spo;
    PQw.Si = Si;
    PQw.Salk = Salk;
    PQw.Sn2 = Sn2;
    PQw.Xi = rXi*X;
    PQw.Xs = rXs*X;
    PQw.Xh = rXh*X;
    PQw.Xpao = rXpao*X;
    PQw.Xpp = rXpp*X;
    PQw.Xpha = rXpha*X;
    PQw.Xa = rXa*X;
    PQw.Xtss = X;
    PQw.Xmeoh = rXmeoh*X;
    PQw.Xmep = rXmep*X;

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info="This class models the lowest layer of an ASM2d secondary clarifier based on Otterpohl.

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

  model lower_layer "Layer below influent of Otterpohl`s SC model"

    package WWSC = WasteWater.ASM2d.SecClar.Otterpohl.Interfaces;
    extends WWSC.SCParam;
    extends WWSC.SCVar;
    WWU.MassConcentration Xf "sludge concentration in clarifier feed";
    SI.Length z "vertical coordinate of current layer";

    parameter SI.Length hsc "height of secondary clarifier";
    parameter Integer i "number of layers above feed layer";
    Real omega "correction function omega by Haertel based on [g/l]";

    WWSC.LowerLayerPin Up annotation (Placement(transformation(extent={{-10,90},
              {10,110}}, rotation=0)));
    WWSC.LowerLayerPin Dn annotation (Placement(transformation(extent={{-10,
              -110},{10,-90}}, rotation=0)));
  equation

    // sink velocity
    vS_F = WWSC.vSfun(X_F, ISV);
    omega = WWSC.omega(z, Xf, hsc, zm, ISV, i);

    // sedimentation flux in m-th layer sinking to lower layer
    Jsm_F = if vS_F < Dn.vS_dn_F then omega*(vS_F*X_F) else omega*min(vS_F*X_F,
        Dn.vS_dn_F*Dn.X_dn_F);
    Jsm_S = omega*min(vS_S*X_S, vS_S*Dn.X_dn_S);

    // ODE of solid component
    der(X_F) = ((Up.Qr + Up.Qw)/Asc*(Up.X_F - X_F) + Up.SedFlux_F - Jsm_F)/zm;
    der(X_S) = ((Up.Qr + Up.Qw)/Asc*(Up.X_S - X_S) + Up.SedFlux_S - Jsm_S)/zm;

    X = X_F + X_S;

    // ODEs of soluble components
    der(So) = (Up.Qr + Up.Qw)*(Up.So - So)/(Asc*zm);
    der(Sf) = (Up.Qr + Up.Qw)*(Up.Sf - Sf)/(Asc*zm);
    der(Sa) = (Up.Qr + Up.Qw)*(Up.Sa - Sa)/(Asc*zm);
    der(Snh) = (Up.Qr + Up.Qw)*(Up.Snh - Snh)/(Asc*zm);
    der(Sno) = (Up.Qr + Up.Qw)*(Up.Sno - Sno)/(Asc*zm);
    der(Spo) = (Up.Qr + Up.Qw)*(Up.Spo - Spo)/(Asc*zm);
    der(Si) = (Up.Qr + Up.Qw)*(Up.Si - Si)/(Asc*zm);
    der(Salk) = (Up.Qr + Up.Qw)*(Up.Salk - Salk)/(Asc*zm);
    der(Sn2) = (Up.Qr + Up.Qw)*(Up.Sn2 - Sn2)/(Asc*zm);

    // downward connections
    Dn.Qr + Up.Qr = 0;
    Dn.Qw + Up.Qw = 0;

    Dn.X_F = X_F;
    Dn.X_S = X_S;
    Dn.SedFlux_F = -Jsm_F;
    Dn.SedFlux_S = -Jsm_S;

    Dn.So = So;
    Dn.Sf = Sf;
    Dn.Sa = Sa;
    Dn.Snh = Snh;
    Dn.Sno = Sno;
    Dn.Spo = Spo;
    Dn.Si = Si;
    Dn.Salk = Salk;
    Dn.Sn2 = Sn2;

    // upward connections
    Up.vS_dn_F = vS_F;
    Up.X_dn_F = X_F;
    Up.X_dn_S = X_S;

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info="This class models the layers between the influent layer (feed_layer) and the lowest layer (bottom_layer)
of an ASM2d secondary clarifier based on Otterpohl.

Hydraulic and sedimentation flux (mass exchange in same direction) with above and underneath layer.

Sedimentation flux is calculated based on two sedimentation velocities
(for macro and micro flocs) and the omega correction function by Haertel.
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

  model feed_layer "Influent layer of Otterpohl`s SC model"

    package WWSC = WasteWater.ASM2d.SecClar.Otterpohl.Interfaces;
    extends WWSC.SCParam;
    extends WWSC.SCVar;

    WWU.MassConcentration Xf "sludge concentration in clarifier feed";
    SI.Length z "vertical coordinate of current layer";
    parameter SI.Length hsc "heigh of secondary clarifier";
    parameter Integer i "number of layers above feed layer";
    Real omega "correction function omega by Haertel based on [g/l]";
    Real fl;

    WWSC.LowerLayerPin Dn annotation (Placement(transformation(extent={{-10,
              -110},{10,-90}}, rotation=0)));
    WWSC.UpperLayerPin Up annotation (Placement(transformation(extent={{-10,90},
              {10,110}}, rotation=0)));
    ASM2d.Interfaces.WWFlowAsm2din In annotation (Placement(transformation(
            extent={{-110,-6},{-90,14}}, rotation=0)));
  equation

    // sink velocity
    vS_F = WWSC.vSfun(X_F, ISV);
    omega = WWSC.omega(z, Xf, hsc, zm, ISV, i);
    fl = (9.4/ISV)*exp(-1.07*Xf/1000);

    // sedimentation flux in m-th layer sinking to lower layer
    Jsm_F = if vS_F < Dn.vS_dn_F then omega*(vS_F*X_F) else omega*min(vS_F*X_F,
        Dn.vS_dn_F*Dn.X_dn_F);
    Jsm_S = omega*min(vS_S*X_S, vS_S*Dn.X_dn_S);

    // ODE of solid component
    der(X_F) = (In.Q/Asc*Xf*(1 - fl) - (-Up.Qe)/Asc*X_F - (-(Dn.Qr + Dn.Qw))/
      Asc*X_F + Up.SedFlux_F - Jsm_F)/zm;
    der(X_S) = (In.Q/Asc*Xf*fl - (-Up.Qe)/Asc*X_S - (-(Dn.Qr + Dn.Qw))/Asc*X_S
       + Up.SedFlux_S - Jsm_S)/zm;

    X = X_F + X_S;

    // ODE of soluble components
    der(So) = (In.Q*In.So - (-Up.Qe)*So - (-(Dn.Qr + Dn.Qw))*So)/(Asc*zm);
    der(Sf) = (In.Q*In.Sf - (-Up.Qe)*Sf - (-(Dn.Qr + Dn.Qw))*Sf)/(Asc*zm);
    der(Sa) = (In.Q*In.Sa - (-Up.Qe)*Sa - (-(Dn.Qr + Dn.Qw))*Sa)/(Asc*zm);
    der(Snh) = (In.Q*In.Snh - (-Up.Qe)*Snh - (-(Dn.Qr + Dn.Qw))*Snh)/(Asc*zm);
    der(Sno) = (In.Q*In.Sno - (-Up.Qe)*Sno - (-(Dn.Qr + Dn.Qw))*Sno)/(Asc*zm);
    der(Spo) = (In.Q*In.Spo - (-Up.Qe)*Spo - (-(Dn.Qr + Dn.Qw))*Spo)/(Asc*zm);
    der(Si) = (In.Q*In.Si - (-Up.Qe)*Si - (-(Dn.Qr + Dn.Qw))*Si)/(Asc*zm);
    der(Salk) = (In.Q*In.Salk - (-Up.Qe)*Salk - (-(Dn.Qr + Dn.Qw))*Salk)/(Asc*
      zm);
    der(Sn2) = (In.Q*In.Sn2 - (-Up.Qe)*Sn2 - (-(Dn.Qr + Dn.Qw))*Sn2)/(Asc*zm);

    // volume flow rates
    In.Q + Up.Qe + Dn.Qr + Dn.Qw = 0;

    Dn.SedFlux_F = -Jsm_F;
    Dn.SedFlux_S = -Jsm_S;
    Dn.X_F = X_F;
    Dn.X_S = X_S;

    Dn.So = So;
    Dn.Sf = Sf;
    Dn.Sa = Sa;
    Dn.Snh = Snh;
    Dn.Sno = Sno;
    Dn.Spo = Spo;
    Dn.Si = Si;
    Dn.Salk = Salk;
    Dn.Sn2 = Sn2;

    Up.X_dn_F = X_F;
    Up.X_dn_S = X_S;

    Up.So = So;
    Up.Sf = Sf;
    Up.Sa = Sa;
    Up.Snh = Snh;
    Up.Sno = Sno;
    Up.Spo = Spo;
    Up.Si = Si;
    Up.Salk = Salk;
    Up.Sn2 = Sn2;

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Documentation(info="This class models the influent layer of an ASM2d secondary clarifier based on Otterpohl.

It receives the wastewater stream from the biological part (feed).
Hydraulic and sedimentation flux (mass exchange in opposite directions) with above layer
and hydraulic and sedimentation flux (mass exchange in same direction) with underneath layer.

Sedimentation flux is calculated based on two sedimentation velocities
(for macro and micro flocs) and the omega correction function by Haertel.
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

  model upper_layer "Layer above influent of Otterpohl`s SC"

    package WWSC = WasteWater.ASM2d.SecClar.Otterpohl.Interfaces;
    extends WWSC.SCParam;
    extends WWSC.SCVar;

    WWSC.UpperLayerPin Dn annotation (Placement(transformation(extent={{-10,
              -110},{10,-90}}, rotation=0)));
    WWSC.UpperLayerPin Up annotation (Placement(transformation(extent={{-10,90},
              {10,110}}, rotation=0)));
  equation

    // sink velocity
    vS_F = WWSC.vSfun(X_F, ISV);

    // sedimentation flux in m-th layer sinking to lower layer
    Jsm_F = vS_F*X_F;
    Jsm_S = vS_S*X_S;

    // ODE of solid component
    der(X_F) = (Dn.Qe/Asc*(Dn.X_dn_F - X_F) + Up.SedFlux_F - Jsm_F)/zm;
    der(X_S) = (Dn.Qe/Asc*(Dn.X_dn_S - X_S) + Up.SedFlux_S - Jsm_S)/zm;

    X = X_F + X_S;

    // ODEs of soluble components
    der(So) = Dn.Qe*(Dn.So - So)/(Asc*zm);
    der(Sf) = Dn.Qe*(Dn.Sf - Sf)/(Asc*zm);
    der(Sa) = Dn.Qe*(Dn.Sa - Sa)/(Asc*zm);
    der(Snh) = Dn.Qe*(Dn.Snh - Snh)/(Asc*zm);
    der(Sno) = Dn.Qe*(Dn.Sno - Sno)/(Asc*zm);
    der(Spo) = Dn.Qe*(Dn.Spo - Spo)/(Asc*zm);
    der(Si) = Dn.Qe*(Dn.Si - Si)/(Asc*zm);
    der(Salk) = Dn.Qe*(Dn.Salk - Salk)/(Asc*zm);
    der(Sn2) = Dn.Qe*(Dn.Sn2 - Sn2)/(Asc*zm);

    // downward connection
    Dn.SedFlux_F = -Jsm_F;
    Dn.SedFlux_S = -Jsm_S;

    // upward connections
    Up.Qe + Dn.Qe = 0;

    Up.X_dn_F = X_F;
    Up.X_dn_S = X_S;

    Up.So = So;
    Up.Sf = Sf;
    Up.Sa = Sa;
    Up.Snh = Snh;
    Up.Sno = Sno;
    Up.Spo = Spo;
    Up.Si = Si;
    Up.Salk = Salk;
    Up.Sn2 = Sn2;

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info="This class models the layers between the influent layer (feed_layer) and the effluent layer (top_layer)
of an ASM2d secondary clarifier based on Otterpohl.

Hydraulic and sedimentation flux (mass exchange in opposite directions) with above and underneath layer.

Sedimentation flux is calculated based on two sedimentation velocities
(for macro and micro flocs)."),
      Diagram(coordinateSystem(
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

  model top_layer "Effluent layer of Otterpohl`s SC model"

    package WWSC = WasteWater.ASM2d.SecClar.Otterpohl.Interfaces;
    extends WWSC.SCParam;
    extends WWSC.SCVar;
    extends WWSC.ratios;

    WWSC.UpperLayerPin Dn annotation (Placement(transformation(extent={{-10,
              -110},{10,-90}}, rotation=0)));
    ASM2d.Interfaces.WWFlowAsm2dout Out annotation (Placement(transformation(
            extent={{90,-10},{110,10}}, rotation=0)));
  equation

    // sink velocity
    vS_F = WWSC.vSfun(X_F, ISV);

    // sedimentation flux in m-th layer sinking to lower layer
    Jsm_F = vS_F*X_F;
    Jsm_S = vS_S*X_S;

    // ODE of solid component
    der(X_F) = (Dn.Qe/Asc*(Dn.X_dn_F - X_F) - Jsm_F)/zm;
    der(X_S) = (Dn.Qe/Asc*(Dn.X_dn_S - X_S) - Jsm_S)/zm;

    X = X_F + X_S;

    // ODEs of soluble components
    der(So) = Dn.Qe*(Dn.So - So)/(Asc*zm);
    der(Sf) = Dn.Qe*(Dn.Sf - Sf)/(Asc*zm);
    der(Sa) = Dn.Qe*(Dn.Sa - Sa)/(Asc*zm);
    der(Snh) = Dn.Qe*(Dn.Snh - Snh)/(Asc*zm);
    der(Sno) = Dn.Qe*(Dn.Sno - Sno)/(Asc*zm);
    der(Spo) = Dn.Qe*(Dn.Spo - Spo)/(Asc*zm);
    der(Si) = Dn.Qe*(Dn.Si - Si)/(Asc*zm);
    der(Salk) = Dn.Qe*(Dn.Salk - Salk)/(Asc*zm);
    der(Sn2) = Dn.Qe*(Dn.Sn2 - Sn2)/(Asc*zm);

    // downward connection
    Dn.SedFlux_F = -Jsm_F;
    Dn.SedFlux_S = -Jsm_S;

    // effluent volume flow rate
    Out.Q + Dn.Qe = 0;

    // effluent, solid and soluble components (ASM2d)
    Out.So = So;
    Out.Sf = Sf;
    Out.Sa = Sa;
    Out.Snh = Snh;
    Out.Sno = Sno;
    Out.Spo = Spo;
    Out.Si = Si;
    Out.Salk = Salk;
    Out.Sn2 = Sn2;
    Out.Xi = rXi*X;
    Out.Xs = rXs*X;
    Out.Xh = rXh*X;
    Out.Xpao = rXpao*X;
    Out.Xpp = rXpp*X;
    Out.Xpha = rXpha*X;
    Out.Xa = rXa*X;
    Out.Xtss = X;
    Out.Xmeoh = rXmeoh*X;
    Out.Xmep = rXmep*X;

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info="This class models the top layer of an ASM2d secondary clarifier based on Otterpohl.

No sedimentation flux (mass exchange) with above but hydraulic and sedimentation flux
(opposite directions) underneath.
From here effluent goes to the receiving water.

Sedimentation flux is calculated based on two sedimentation velocities
(for micro and macro flocs).
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
    Documentation(info="This package contains classes (layer models) to built ASM2d secondary clarifier models, an Interfaces sub-library
and provides an ASM2d 10-layer secondary clarifier model all bases on Otterpohls`s [1] 
sedimentation velocities for macro and micro flocs and the omega correction function.

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

[1] R. Otterpohl and M. Freund: Dynamic models for clarifiers of activated sludge plants
    with dry and wet weather flows. Water Science and Technology. 26 (1992), pp 1391-1400.

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2003, Gerald Reichl
"));
end Otterpohl;
