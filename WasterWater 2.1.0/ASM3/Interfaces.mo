within WasteWater.ASM3;
package Interfaces
  "Connectors and partial ASM3 model for Wastewater Treatment Modelling"

  extends Modelica.Icons.Library;

  connector WWFlowAsm3in "Inflow connector of ASM3 components"
    package WWU = WasteWater.WasteWaterUnits;

    flow WWU.VolumeFlowRate Q;
    WWU.MassConcentration So;
    WWU.MassConcentration Si;
    WWU.MassConcentration Ss;
    WWU.MassConcentration Snh;
    WWU.MassConcentration Sn2;
    WWU.MassConcentration Snox;
    WWU.Alkalinity Salk;
    WWU.MassConcentration Xi;
    WWU.MassConcentration Xs;
    WWU.MassConcentration Xh;
    WWU.MassConcentration Xsto;
    WWU.MassConcentration Xa;
    WWU.MassConcentration Xss;

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            fillColor={0,0,191},
            fillPattern=FillPattern.Solid), Text(
            extent={{-88,92},{88,-94}},
            lineColor={255,255,255},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            textString=
                 "%name")}),
      Documentation(info="Connectors WWFlowAsm3in and WWFlowAsm3out are nearly identical.
The difference is in the icons to more easily identify the inflow and outflow
side of a component.
The connector consists of one flow variable and 13 potential variables (ASM3 concentrations).
"));

  end WWFlowAsm3in;

  connector WWFlowAsm3out "Outflow connector of ASM3 components"
    package WWU = WasteWater.WasteWaterUnits;

    flow WWU.VolumeFlowRate Q;
    WWU.MassConcentration So;
    WWU.MassConcentration Si;
    WWU.MassConcentration Ss;
    WWU.MassConcentration Snh;
    WWU.MassConcentration Sn2;
    WWU.MassConcentration Snox;
    WWU.Alkalinity Salk;
    WWU.MassConcentration Xi;
    WWU.MassConcentration Xs;
    WWU.MassConcentration Xh;
    WWU.MassConcentration Xsto;
    WWU.MassConcentration Xa;
    WWU.MassConcentration Xss;

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Rectangle(extent={{-100,100},{100,-100}}),
            Text(extent={{-88,92},{94,-92}}, textString=
                           "%name")}),
      Documentation(info="Connectors WWFlowAsm3in and WWFlowAsm3out are nearly identical.
The difference is in the icons to more easily identify the inflow and outflow
side of a component.
The connector consists of one flow variable and 13 potential variables (ASM3 concentrations).
"));

  end WWFlowAsm3out;

  connector AirFlow "Airflow connector"

    package WWU = WasteWater.WasteWaterUnits;
    flow WWU.VolumeFlowRate Q_air;
    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info="The Airflow connector consits of a flow variable describing the exchange of
air between blower and nitrification tank."));

  end AirFlow;

  partial model stoichiometry "ASM3 stoichiometric coefficients"
    // Typical stoichiometric and composition parameters based on ASM3

    parameter Real f_Si=0.0
      "Production of Si in hydrolysis [g COD_Si/(g COD_Xs)]";
    parameter Real Y_STO_O=0.85
      "Aerobic yield of stored product per Ss [g COD_Xsto/(g COD_Ss)]";
    parameter Real Y_STO_NOX=0.80
      "Anoxic yield of stored product per Ss [g OD_Xsto/(g COD_Ss)]";
    parameter Real Y_H_O=0.63
      "Aerobic yield of heterotrophic biomass [g COD_Xh/(g COD_Xsto)]";
    parameter Real Y_H_NOX=0.54
      "Anoxic yield of heterotrophic biomass [g COD_Xh/(g COD_Xsto)]";
    parameter Real Y_A=0.24
      "Yield of autotrophic biomass per NO3-N [g COD_Xa/(g N_Snox)]";
    parameter Real f_Xi=0.20
      "Production of Xi in endog. respiration [g COD_Xi/(g COD_Xbm)]";
    parameter Real i_N_Si=0.01 "N content of Si [g N/(g COD_Si)]";
    parameter Real i_N_Ss=0.03 "N content of Ss [g N/(g COD_Ss)]";
    parameter Real i_N_Xi=0.02 "N content of Xi [g N/(g COD_Xi)]";
    parameter Real i_N_Xs=0.04 "N content of Xs [g N/(g COD_Xs)]";
    parameter Real i_N_BM=0.07 "N content of biomass Xh,Xa [g N/(g COD_bm)]";
    parameter Real i_SS_Xi=0.75 "SS to COD ratio for Xi [g SS/(g COD_Xi)]";
    parameter Real i_SS_Xs=0.75 "SS to COD ratio for Xs [g SS/(g COD_Xs)]";
    parameter Real i_SS_BM=0.90
      "SS to COD ratio for biomass Xh,Xa [g SS/(g COD_Xbm)]";

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info=
            "This is a partial model providing the stoichiometric coefficients of the ASM3 model."));

  end stoichiometry;

  partial model ASM3base "Base class of WWTP modelling by ASM3"

    package WWU = WasteWater.WasteWaterUnits;
    extends Interfaces.stoichiometry;

    // Stoichio. matrix coefficents x(So,Ss,Sn2,Snox),y(Snh),z(Salk),t(Xss)
    parameter Real x1=1 - f_Si;
    parameter Real x2=-(1 - Y_STO_O);
    parameter Real x3=-(1 - Y_STO_NOX)/2.86;
    parameter Real x4=-(1 - Y_H_O)/Y_H_O;
    parameter Real x5=-(1 - Y_H_NOX)/(2.86*Y_H_NOX);
    parameter Real x6=-(1 - f_Xi);
    parameter Real x7=-(1 - f_Xi)/2.86;
    parameter Real x8=-1;
    parameter Real x9=-1/2.86;
    parameter Real x10=-(4.57 - Y_A)/Y_A;
    parameter Real x11=-(1 - f_Xi);
    parameter Real x12=-(1 - f_Xi)/2.86;

    parameter Real y1=i_N_Xs - i_N_Si*f_Si - i_N_Ss*(1 - f_Si);
    parameter Real y2=i_N_Ss;
    parameter Real y3=i_N_Ss;
    parameter Real y4=-i_N_BM;
    parameter Real y6=i_N_BM - f_Xi*i_N_Xi;
    parameter Real y7=i_N_BM - f_Xi*i_N_Xi;
    parameter Real y10=-1/Y_A - i_N_BM;
    parameter Real y11=i_N_BM - f_Xi*i_N_Xi;
    parameter Real y12=i_N_BM - f_Xi*i_N_Xi;

    parameter Real z1=(i_N_Xs - i_N_Si*f_Si - i_N_Ss*(1 - f_Si))/14;
    parameter Real z2=i_N_Ss/14;
    parameter Real z3=i_N_Ss/14 + (1 - Y_STO_NOX)/(14*2.86);
    parameter Real z4=-i_N_BM/14;
    parameter Real z5=-i_N_BM/14 + (1 - Y_H_NOX)/(14*2.86*Y_H_NOX);
    parameter Real z6=i_N_BM/14 - f_Xi*i_N_Xi/14;
    parameter Real z7=i_N_BM/14 - f_Xi*i_N_Xi/14 + (1 - f_Xi)/(14*2.86);
    parameter Real z9=1/(2.86*14);
    parameter Real z10=-1/(7*Y_A) - i_N_BM/14;
    parameter Real z11=i_N_BM/14 - f_Xi*i_N_Xi/14;
    parameter Real z12=i_N_BM/14 - f_Xi*i_N_Xi/14 + (1 - f_Xi)/(14*2.86);

    parameter Real t2=0.6*Y_STO_O;
    parameter Real t3=0.6*Y_STO_NOX;
    parameter Real t4=-0.6/Y_H_O + i_SS_BM;
    parameter Real t5=-0.6/Y_H_NOX + i_SS_BM;
    parameter Real t6=f_Xi*i_SS_Xi - i_SS_BM;
    parameter Real t7=f_Xi*i_SS_Xi - i_SS_BM;
    parameter Real t8=-0.6;
    parameter Real t9=-0.6;
    parameter Real t10=i_SS_BM;
    parameter Real t11=f_Xi*i_SS_Xi - i_SS_BM;
    parameter Real t12=f_Xi*i_SS_Xi - i_SS_BM;

    // Typical values of kinetic parameters ( T = 20 deg C )
    parameter Real k_H_T=3.0
      "Hydrolysis rate constant at T=20 deg C [g COD_Xs/(g COD_Xh)/d]";
    parameter Real K_X=1.0
      "Hydrolysis saturation constant [g COD_Xs/(g COD_Xh)/d]";

    // Heterotrophic organisms Xh, aerobic and denitrifying activity
    parameter Real k_STO_T=5.0
      "Storage rate constant at T=20 deg C [g COD_Ss/(g COD_Xh)/d]";
    parameter Real eta_NOX=0.6 "Anoxic reduction factor [-]";
    parameter Real K_O=0.2 "Saturation constant for Sno [g O2/m^3]";
    parameter Real K_NOX=0.5 "Saturation constant for Snox [g NO3-N/m^3]";
    parameter Real K_S=2.0
      "Saturation constant for Substrate Ss [g COD_Ss/m^3]";
    parameter Real K_STO=1.0
      "Saturation constant for Xsto [g COD_Xsto/(g COD_Xh)]";
    parameter Real mu_H_T=2.0
      "Heterotrophic max. growth rate of Xh at T=20 deg C [1/d]";
    parameter Real K_NH=0.01 "Saturation constant for ammonium Snh [g N/m^3]";
    parameter Real K_ALK=0.1
      "Saturation constant for alkalinity for Xh [mole HCO3 /m^3]";
    parameter Real b_H_O_T=0.2
      "Aerobic endogenous respiration rate of Xh at T=20 deg C [1/d]";
    parameter Real b_H_NOX_T=0.1
      "Anoxic endogenous respiration rate of Xh at T=20 deg C[1/d]";
    parameter Real b_STO_O_T=0.2
      "Aerobic respiration rate for Xsto at T=20 deg C [1/d]";
    parameter Real b_STO_NOX_T=0.1
      "Anoxic respiration rate for Xsto at T=20 deg C [1/d]";

    // Autotrophic organisms Xa, nitrifying activity
    parameter Real mu_A_T=1.0
      "Autotrophic max growth rate of Xa at T=20 deg C [1/d]";
    parameter Real K_A_NH=1.0 "Ammonium substrate saturation for Xa [g N/m^3]";
    parameter Real K_A_O=0.5 "Oxygen saturation for nitrifiers [g O2/m^3]";
    parameter Real K_A_NOX=0.5
      "Saturation constant for Snox (similar to K_NOX) [g NO3-N/m^3]";
    parameter Real K_A_ALK=0.5
      "Bicarbonate saturation for nitrifiers [mole HCO3/m^3]";
    parameter Real b_A_O_T=0.15
      "Aerobic endogenous respiration rate of Xa at T=20 deg C [1/d]";
    parameter Real b_A_NOX_T=0.5
      "Anoxic endogenous respiration rate of Xa at T=20 deg C [1/d]";

    Real k_H "Hydrolysis rate constant [g COD_Xs/(g COD_Xh)/d]";
    Real k_STO "Storage rate constant [g COD_Ss/(g COD_Xh)/d]";
    Real mu_H "Heterotrophic max. growth rate of Xh [1/d]";
    Real b_H_O "Aerobic endogenous respiration rate of Xh [1/d]";
    Real b_H_NOX "Aerobic endogenous respiration rate of Xh [1/d]";
    Real b_STO_O "Aerobic respiration rate for Xsto [1/d]";
    Real b_STO_NOX "Anoxic respiration rate for Xsto [1/d]";
    Real mu_A "Autotrophic max growth rate of Xa [1/d]";
    Real b_A_O "Aerobic endogenous respiration rate of Xa [1/d]";
    Real b_A_NOX "Anoxic endogenous respiration rate of Xa [1/d]";

    WWU.MassConcentration So "Dissolved oxygen";
    WWU.MassConcentration Si "Soluble inert organics";
    WWU.MassConcentration Ss "Readily biodegradable substrates";
    WWU.MassConcentration Snh "Ammonium";
    WWU.MassConcentration Sn2 "Dinitrogen, released by nitrification";
    WWU.MassConcentration Snox "Nitrite plus nitrate";
    WWU.Alkalinity Salk "Alkalinity, bicarbonate";
    WWU.MassConcentration Xi "Inert particulate organics";
    WWU.MassConcentration Xs "Slowly biodegradable substrates";
    WWU.MassConcentration Xh "Heterotrophic biomass";
    WWU.MassConcentration Xsto "Organics stored by heterotrphs";
    WWU.MassConcentration Xa "Autotrophic nitrifying biomass";
    WWU.MassConcentration Xss "Total suspend solids";

    Real p1;
    Real p2;
    Real p3;
    Real p4;
    Real p5;
    Real p6;
    Real p7;
    Real p8;
    Real p9;
    Real p10;
    Real p11;
    Real p12;

    Real r1;
    Real r2;
    Real r3;
    Real r4;
    Real r5;
    Real r6;
    Real r7;
    Real r8;
    Real r9;
    Real r10;
    Real r11;
    Real r12;
    Real r13;

    Real inputSo;
    Real inputSi;
    Real inputSs;
    Real inputSnh;
    Real inputSn2;
    Real inputSnox;
    Real inputSalk;
    Real inputXi;
    Real inputXs;
    Real inputXh;
    Real inputXsto;
    Real inputXa;
    Real inputXss;
    Real aeration;

    Interfaces.WWFlowAsm3in In annotation (Placement(transformation(extent={{
              -110,-10},{-90,10}}, rotation=0)));
    Interfaces.WWFlowAsm3out Out annotation (Placement(transformation(extent={{
              90,-10},{110,10}}, rotation=0)));
    Interfaces.WWFlowAsm3out MeasurePort annotation (Placement(transformation(
            extent={{50,40},{60,50}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput T annotation (Placement(transformation(
            extent={{-110,30},{-90,50}}, rotation=0)));
  equation

    // Temperature dependent Kinetic parameters based on 20 deg C
    k_H =k_H_T*exp(0.040549*(T - 20));
    k_STO =k_STO_T*exp(0.069301*(T - 20));
    mu_H =mu_H_T*exp(0.069301*(T - 20));
    b_H_O =b_H_O_T*exp(0.069301*(T - 20));
    b_H_NOX =b_H_NOX_T*exp(0.069301*(T - 20));
    b_STO_O =b_STO_O_T*exp(0.069301*(T - 20));
    b_STO_NOX =b_STO_NOX_T*exp(0.069301*(T - 20));
    mu_A =mu_A_T*exp(0.104984*(T - 20));
    b_A_O =b_A_O_T*exp(0.109849*(T - 20));
    b_A_NOX =b_A_NOX_T*exp(0.091646*(T - 20));

    // Process Rates
    p1 = k_H*(Xs/Xh)/(K_X + (Xs/Xh))*Xh;
    p2 = k_STO*So/(K_O + So)*Ss/(K_S + Ss)*Xh;
    p3 = k_STO*eta_NOX*K_O/(K_O + So)*Snox/(K_NOX + Snox)*Ss/(K_S + Ss)*Xh;
    p4 = mu_H*So/(K_O + So)*Snh/(K_NH + Snh)*Salk/(K_ALK + Salk)*(Xsto/Xh)/(
      K_STO + (Xsto/Xh))*Xh;
    p5 = mu_H*eta_NOX*K_O/(K_O + So)*Snox/(K_NOX + Snox)*Snh/(K_NH + Snh)*Salk/
      (K_ALK + Salk)*(Xsto/Xh)/(K_STO + (Xsto/Xh))*Xh;
    p6 = b_H_O*So/(K_O + So)*Xh;
    p7 = b_H_NOX*K_O/(K_O + So)*Snox/(K_NOX + Snox)*Xh;
    p8 = b_STO_O*So/(K_O + So)*Xsto;
    p9 = b_STO_NOX*K_O/(K_O + So)*Snox/(Snox + K_NOX)*Xsto;
    p10 = mu_A*So/(K_A_O + So)*Snh/(K_A_NH + Snh)*Salk/(K_A_ALK + Salk)*Xa;
    p11 = b_A_O*So/(K_A_O + So)*Xa;
    p12 = b_A_NOX*K_A_O/(K_A_O + So)*Snox/(K_A_NOX + Snox)*Xa;

    // biochemical reactions
    r1 = x2*p2 + x4*p4 + x6*p6 + x8*p8 + x10*p10 + x11*p11;
    r2 = f_Si*p1;
    r3 = x1*p1 - p2 - p3;
    r4 = y1*p1 + y2*p2 + y3*p3 + y4*p4 + y4*p5 + y6*p6 + y7*p7 + y10*p10 + y11*
      p11 + y12*p12;
    r5 = -x3*p3 - x5*p5 - x7*p7 - x9*p9 - x12*p12;
    r6 = x3*p3 + x5*p5 + x7*p7 + x9*p9 + (1/Y_A)*p10 + x12*p12;
    r7 = z1*p1 + z2*p2 + z3*p3 + z4*p4 + z5*p5 + z6*p6 + z7*p7 + z9*p9 + z10*
      p10 + z11*p11 + z12*p12;
    r8 = f_Xi*p6 + f_Xi*p7 + f_Xi*p11 + f_Xi*p12;
    r9 = -p1;
    r10 = p4 + p5 - p6 - p7;
    r11 = Y_STO_O*p2 + Y_STO_NOX*p3 - (1/Y_H_O)*p4 - (1/Y_H_NOX)*p5 - p8 - p9;
    r12 = p10 - p11 - p12;
    r13 = -i_SS_Xs*p1 + t2*p2 + t3*p3 + t4*p4 + t5*p5 + t6*p6 + t7*p7 + t8*p8
       + t9*p9 + t10*p10 + t11*p11 + t12*p12;

    // derivatives
    der(So) = inputSo + r1 + aeration;
    der(Si) = inputSi + r2;
    der(Ss) = inputSs + r3;
    der(Snh) = inputSnh + r4;
    der(Sn2) = inputSn2 + r5;
    der(Snox) = inputSnox + r6;
    der(Salk) = inputSalk + r7;
    der(Xi) = inputXi + r8;
    der(Xs) = inputXs + r9;
    der(Xh) = inputXh + r10;
    der(Xsto) = inputXsto + r11;
    der(Xa) = inputXa + r12;
    der(Xss) = inputXss + r13;

    // Outputs
    Out.Q + In.Q = 0;
    Out.So = So;
    Out.Si = Si;
    Out.Ss = Ss;
    Out.Snh = Snh;
    Out.Sn2 = Sn2;
    Out.Snox = Snox;
    Out.Salk = Salk;
    Out.Xi = Xi;
    Out.Xs = Xs;
    Out.Xh = Xh;
    Out.Xsto = Xsto;
    Out.Xa = Xa;
    Out.Xss = Xss;

    MeasurePort.So = So;
    MeasurePort.Si = Si;
    MeasurePort.Ss = Ss;
    MeasurePort.Snh = Snh;
    MeasurePort.Sn2 = Sn2;
    MeasurePort.Snox = Snox;
    MeasurePort.Salk = Salk;
    MeasurePort.Xi = Xi;
    MeasurePort.Xs = Xs;
    MeasurePort.Xh = Xh;
    MeasurePort.Xsto = Xsto;
    MeasurePort.Xa = Xa;
    MeasurePort.Xss = Xss;

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info="This partial model provides connectors and equations that are needed in the biological 
components (nitrification and denitrification tank) for ASM3 wastewater treatment plant models.
Parameters are coded according the ASM3 [1] standard distribution.
Changes to this parameters are subject to the modeller.

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
  end ASM3base;
  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.44,
      height=0.65,
      library=1,
      autolayout=1),
    Documentation(info="This package contains connectors and interfaces (partial models) for
wastewater treatment components based on the Acticated Sludge Model No.3 (ASM3).

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
