within WasteWater.ASM2d;
package Interfaces
  "Connectors and partial ASM2d model for Waste Water Treatment Modelling"

  extends Modelica.Icons.Library;

  connector WWFlowAsm2din "Inflow connector of ASM2d components"

    package WWU = WasteWater.WasteWaterUnits;
    flow WWU.VolumeFlowRate Q;
    WWU.MassConcentration So;
    WWU.MassConcentration Sf;
    WWU.MassConcentration Sa;
    WWU.MassConcentration Snh;
    WWU.MassConcentration Sno;
    WWU.MassConcentration Spo;
    WWU.MassConcentration Si;
    WWU.Alkalinity Salk;
    WWU.MassConcentration Sn2;
    WWU.MassConcentration Xi;
    WWU.MassConcentration Xs;
    WWU.MassConcentration Xh;
    WWU.MassConcentration Xpao;
    WWU.MassConcentration Xpp;
    WWU.MassConcentration Xpha;
    WWU.MassConcentration Xa;
    WWU.MassConcentration Xtss;
    WWU.MassConcentration Xmeoh;
    WWU.MassConcentration Xmep;

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
      Documentation(info="Connectors WWFlowAsm2din and WWFlowAsm2dout are nearly identical.
The difference is in the icons to more easily identify the inflow and outflow
side of a component.
The connector consists of one flow variable and 19 potential variables (ASM2d concentrations).
"));

  end WWFlowAsm2din;

  connector WWFlowAsm2dout "Outflow connector of ASM2d components"

    package WWU = WasteWater.WasteWaterUnits;

    flow WWU.VolumeFlowRate Q;
    WWU.MassConcentration So;
    WWU.MassConcentration Sf;
    WWU.MassConcentration Sa;
    WWU.MassConcentration Snh;
    WWU.MassConcentration Sno;
    WWU.MassConcentration Spo;
    WWU.MassConcentration Si;
    WWU.Alkalinity Salk;
    WWU.MassConcentration Sn2;
    WWU.MassConcentration Xi;
    WWU.MassConcentration Xs;
    WWU.MassConcentration Xh;
    WWU.MassConcentration Xpao;
    WWU.MassConcentration Xpp;
    WWU.MassConcentration Xpha;
    WWU.MassConcentration Xa;
    WWU.MassConcentration Xtss;
    WWU.MassConcentration Xmeoh;
    WWU.MassConcentration Xmep;

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
      Documentation(info="Connectors WWFlowAsm2din and WWFlowAsm2dout are nearly identical.
The difference is in the icons to more easily identify the inflow and outflow
side of a component.
The connector consists of one flow variable and 19 potential variables (ASM2d concentrations).
"));

  end WWFlowAsm2dout;

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

  partial model conversion_factors "ASM2d conversion factors"

    // Typical conversion factors for conservation equation //
    parameter Real i_N_Si=0.01 "N content of inert soluble COD Si [gN/gCOD]";
    parameter Real i_N_Sf=0.03
      "N content of fermentable substrates Sf [gN/gCOD]";
    parameter Real i_N_Xi=0.02
      "N content of inert particulate COD Xi [gN/gCOD]";
    parameter Real i_N_Xs=0.04
      "N content of slowly biodegradable substrate Xs [gN/gCOD]";
    parameter Real i_N_BM=0.07 "N content of biomass, Xh, Xpao, Xa [gN/gCOD]";
    parameter Real i_P_Si=0.0 "P content of inert soluble COD Si [gP/gCOD]";
    parameter Real i_P_Sf=0.01
      "P content of fermentable substrates Sf [gP/gCOD]";
    parameter Real i_P_Xi=0.01
      "P content of inert particulate COD Xi [gP/gCOD]";
    parameter Real i_P_Xs=0.01
      "P content of slowly biodegradable substrate Xs [gP/gCOD]";
    parameter Real i_P_BM=0.02 "P content of biomass, Xh, Xpao, Xa [gP/gCOD]";
    parameter Real i_TSS_Xi=0.75 "TSS to COD ratio for Xi [gTSS/gCOD]";
    parameter Real i_TSS_Xs=0.75 "TSS to COD ratio for Xs [gTSS/gCOD]";
    parameter Real i_TSS_BM=0.9
      "TSS to COD ratio for biomass, Xh, Xpao, Xa [gTSS/gCOD]";
    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info=
            "This is a partial model providing the conversion factors of the ASM2d model."));

  end conversion_factors;

  partial model ASM2dbase "Base class of WWTP modelling by ASM2d"

    package WWU = WasteWater.WasteWaterUnits;

    extends Interfaces.conversion_factors;

    // Typical stoichiometric parameters //

    parameter Real f_Si=0.0 "Production of Si in hydrolysis [gCOD/gCOD]";
    parameter Real Y_H=0.625 "Yield coefficient [gCOD/gCOD]";
    parameter Real f_Xih=0.1
      "Fraction of inert COD generated in biomass lysis [gCOD/gCOD]";
    parameter Real Y_PAO=0.625 "Yield coefficient (biomass/PHA) [gCOD/gCOD]";
    parameter Real Y_PO=0.4
      "PP requirement (PO4 release) per PHA stored [gP/gCOD]";
    parameter Real Y_PHA=0.2 "PHA requirement for PP storage [gCOD/gP]";
    parameter Real f_Xip=0.1
      "Fraction of inert COD generated in biomass lysis [gCOD/gCOD]";
    parameter Real Y_A=0.24 "Yield of autotrophic biomass per NO3-N [gCOD/gN]";
    parameter Real f_Xia=0.1
      "Fraction of inert COD generated in biomass lysis [gCOD/gCOD]";

    // Stochiometric coefficients for Snh4, Spo4, Salk and Xtss //
    parameter Real v_1_NH=i_N_Xs - (1 - f_Si)*i_N_Sf - f_Si*i_N_Si;
    parameter Real v_2_NH=i_N_Xs - (1 - f_Si)*i_N_Sf - f_Si*i_N_Si;
    parameter Real v_3_NH=i_N_Xs - (1 - f_Si)*i_N_Sf - f_Si*i_N_Si;
    parameter Real v_4_NH=i_N_Sf/Y_H - i_N_BM;
    parameter Real v_5_NH=-i_N_BM;
    parameter Real v_6_NH=i_N_Sf/Y_H - i_N_BM;
    parameter Real v_7_NH=-i_N_BM;
    parameter Real v_8_NH=i_N_Sf;
    parameter Real v_9_NH=i_N_BM - f_Xih*i_N_Xi - (1 - f_Xih)*i_N_Xs;
    //parameter Real v_10_NH =0;
    //parameter Real v_11_NH =0;
    //parameter Real v_12_NH =0;
    parameter Real v_13_NH=-i_N_BM;
    parameter Real v_14_NH=-i_N_BM;
    parameter Real v_15_NH=i_N_BM - f_Xip*i_N_Xi - (1 - f_Xip)*i_N_Xs;
    //parameter Real v_16_NH =0;
    //parameter Real v_17_NH =0;
    parameter Real v_18_NH=-1/Y_A - i_N_BM;
    parameter Real v_19_NH=i_N_BM - f_Xia*i_N_Xi - (1 - f_Xia)*i_N_Xs;

    parameter Real v_1_PO=i_P_Xs - (1 - f_Si)*i_P_Sf - f_Si*i_P_Si;
    parameter Real v_2_PO=i_P_Xs - (1 - f_Si)*i_P_Sf - f_Si*i_P_Si;
    parameter Real v_3_PO=i_P_Xs - (1 - f_Si)*i_P_Sf - f_Si*i_P_Si;
    parameter Real v_4_PO=i_P_Sf/Y_H - i_P_BM;
    parameter Real v_5_PO=-i_P_BM;
    parameter Real v_6_PO=i_P_Sf/Y_H - i_P_BM;
    parameter Real v_7_PO=-i_P_BM;
    parameter Real v_8_PO=i_P_Sf;
    parameter Real v_9_PO=i_P_BM - f_Xih*i_P_Xi - (1 - f_Xih)*i_P_Xs;
    parameter Real v_15_PO=i_P_BM - f_Xip*i_P_Xi - (1 - f_Xip)*i_P_Xs;
    parameter Real v_19_PO=i_P_BM - f_Xia*i_P_Xi - (1 - f_Xia)*i_P_Xs;

    parameter Real v_12_NO=-Y_PHA/2.86;
    parameter Real v_14_NO=-(1 - Y_PAO)/(2.86*Y_PAO);
    parameter Real v_12_N2=-v_12_NO;
    parameter Real v_14_N2=-v_14_NO;

    parameter Real v_1_ALK=v_1_NH/14 + v_1_PO*(-1.5/31);
    parameter Real v_2_ALK=v_2_NH/14 + v_2_PO*(-1.5/31);
    parameter Real v_3_ALK=v_3_NH/14 + v_3_PO*(-1.5/31);
    parameter Real v_4_ALK=v_4_NH/14 + v_4_PO*(-1.5/31);
    parameter Real v_5_ALK=1/(Y_H*64) + v_5_NH/14 + v_5_PO*(-1.5/31);
    parameter Real v_6_ALK=v_6_NH/14 + (1 - Y_H)/(2.86*Y_H*14) + v_6_PO*(-1.5/
        31);
    parameter Real v_7_ALK=1/(Y_H*64) + v_7_NH/14 + (1 - Y_H)/(2.86*Y_H*14) +
        v_7_PO*(-1.5/31);
    parameter Real v_8_ALK=v_8_NH/14 + v_8_PO*(-1.5/31) - 1/64;
    parameter Real v_9_ALK=v_9_NH/14 + v_9_PO*(-1.5/31);
    parameter Real v_10_ALK=1/64 + Y_PO*(-1.5/31) - Y_PO*(-1/31);
    parameter Real v_11_ALK=(1.5 - 1)/31;
    parameter Real v_12_ALK=v_12_NO*(-1/14) + (1.5 - 1)/31;
    parameter Real v_13_ALK=v_13_NH/14 - i_P_BM*(-1.5/31);
    parameter Real v_14_ALK=v_14_NH/14 - v_14_NO/14 - i_P_BM*(-1.5/31);
    parameter Real v_15_ALK=v_15_NH/14 + v_15_PO*(-1.5/31);
    parameter Real v_16_ALK=(1 - 1.5)/31;
    parameter Real v_17_ALK=-1/64;
    parameter Real v_18_ALK=v_18_NH/14 - 1/(Y_A*14) - i_P_BM*(-1.5/31);
    parameter Real v_19_ALK=v_19_NH/14 + v_19_PO*(-1.5/31);
    parameter Real v_20_ALK=1.5/31;
    parameter Real v_21_ALK=-1.5/31;

    parameter Real v_1_TSS=-i_TSS_Xs;
    parameter Real v_2_TSS=-i_TSS_Xs;
    parameter Real v_3_TSS=-i_TSS_Xs;
    parameter Real v_4_TSS=i_TSS_BM;
    parameter Real v_5_TSS=i_TSS_BM;
    parameter Real v_6_TSS=i_TSS_BM;
    parameter Real v_7_TSS=i_TSS_BM;
    //parameter Real v_8_TSS =0;
    parameter Real v_9_TSS=f_Xih*i_TSS_Xi + (1 - f_Xih)*i_TSS_Xs - i_TSS_BM;
    parameter Real v_10_TSS=-Y_PO*3.23 + 0.6;
    parameter Real v_11_TSS=3.23 - Y_PHA*0.6;
    parameter Real v_12_TSS=3.23 - Y_PHA*0.6;
    parameter Real v_13_TSS=i_TSS_BM - 0.6/Y_PAO;
    parameter Real v_14_TSS=i_TSS_BM - 0.6/Y_PAO;
    parameter Real v_15_TSS=f_Xip*i_TSS_Xi + (1 - f_Xip)*i_TSS_Xs - i_TSS_BM;
    parameter Real v_16_TSS=-3.23;
    parameter Real v_17_TSS=-0.6;
    parameter Real v_18_TSS=i_TSS_BM;
    parameter Real v_19_TSS=f_Xia*i_TSS_Xi + (1 - f_Xia)*i_TSS_Xs - i_TSS_BM;

    parameter Real v_13_O=-(1 - Y_PAO)/Y_PAO;

    // Temperature dependency for 20 deg C = a^(T-20)
    //
    // Heterotrophs, fermentation	a=1.07
    // Nitrification			a=1.12
    // Phosphotrophs, hydrolysis	a=1.04
    // temperature dependent processes

    // Hydrolysis of particulate substrate: Xs //
    Real K_h "Hydrolysis rate [d^-1]";
    parameter Real K_h_T=3.0 "Hydrolysis rate at T=20 deg C [d^-1]";
    parameter Real eta_NO_Xs=0.6 "Anoxic hydrolysis reduction factor [-]";
    parameter Real eta_fe=0.4 "Anaerobic hydrolysis reduction factor [-]";
    parameter Real K_O_Xs=0.2
      "Saturation/inhibition coefficient for oxygen [g O2/m3]";
    parameter Real K_NO_Xs=0.5
      "Saturation/inhibition coefficient for nitrate [g N/m3]";
    parameter Real K_X=0.1
      "Saturation coefficient for particulate COD [g Xs/(g Xh)]";

    // Heterotrophic organisms: Xh //
    Real mu_H "Maximum growth rate on substrate [g Xs/(g Xh)/d]";
    parameter Real mu_H_T=6.0
      "Maximum growth rate on substrate at T=20 deg C [g Xs/(g Xh)/d]";
    Real rho_fe "Maximum rate for fermentation [g Sf/(g Xh)/d]";
    parameter Real rho_fe_T=3.0
      "Maximum rate for fermentation at T=20 deg C [g Sf/(g Xh)/d]";
    parameter Real eta_NO_Xh=0.8 "Reduction factor for denitrification [-]";
    Real b_H "Rate for lysis and decay [d^-1]";
    parameter Real b_H_T=0.4 "Rate for lysis and decay at T=20 deg C [d^-1]";
    parameter Real K_O_Xh=0.2
      "Saturation/inhibition coefficient for oxygen [g O2/m3]";
    parameter Real K_F=4.0 "Saturation coefficient for growth on Sf [g COD/m3]";
    parameter Real K_fe=4.0
      "Saturation coefficient for fermentation of Sf [g COD/m3]";
    parameter Real K_A_Xh=4.0
      "Saturation coefficient for growth on acetate Sa [g COD/m3]";
    parameter Real K_NO_Xh=0.5
      "Saturation/inhibition coefficient for nitrate [g N/m3]";
    parameter Real K_NH_Xh=0.05
      "Saturation coefficient for ammonium (nutrient) [g N/m3]";
    parameter Real K_P_Xh=0.01
      "Saturation coefficient for phosphate (nutrient) [g P/m3]";
    parameter Real K_ALK_Xh=0.1
      "Saturation coefficient for alkalinity (HCO3) [mole HCO3/m3]";

    // Phosphorus-accumulating organisms: Xpao //
    Real rho_PHA "Rate for storage of Xpha (base Xpp) [g Xpha/(g Xpao)/d]";
    parameter Real rho_PHA_T=3.0
      "Rate for storage of Xpha (base Xpp) at T=20 deg C [g Xpha/(g Xpao)/d]";
    Real rho_PP "Rate for storage of Xpp [g Xpp/(g Xpao)/d]";
    parameter Real rho_PP_T=1.5
      "Rate for storage of Xpp at T=20 deg C [g Xpp/(g Xpao)/d]";
    Real mu_PAO "Maximum growth rate of PAO [d^-1]";
    parameter Real mu_PAO_T=1.0
      "Maximum growth rate of PAO at T=20 deg C [d^-1]";
    parameter Real eta_NO_Xpao=0.6 "Reduction factor for anoxic activity [-]";
    Real b_PAO "Rate for lysis of Xpao [d^-1]";
    parameter Real b_PAO_T=0.2 "Rate for lysis of Xpao at T=20 deg C [d^-1]";
    Real b_PP "Rate for lysis of Xpp [d^-1]";
    parameter Real b_PP_T=0.2 "Rate for lysis of Xpp at T=20 dedg C [d^-1]";
    Real b_PHA "Rate for lysis of Xpha [d^-1]";
    parameter Real b_PHA_T=0.2 "Rate for lysis of Xpha at T=20 deg C [d^-1]";
    parameter Real K_O_Xpao=0.2
      "Saturation/inhibition coefficient for oxygen [g O2/m3]";
    parameter Real K_NO_Xpao=0.5
      "Saturation coefficient for nitrate, Sno3 [g N/m3]";
    parameter Real K_A_Xpao=4.0
      "Saturation coefficient for acetate, Sa [g COD/m3]";
    parameter Real K_NH_Xpao=0.05
      "Saturation coefficient for ammonium (nutrient) [g N/m3]";
    parameter Real K_PS=0.2
      "Saturation coefficient for phosphorus in storage of PP [g P/m3]";
    parameter Real K_P_Xpao=0.01
      "Saturation coefficient for phosphate (nutrient) [g P/m3]";
    parameter Real K_ALK_Xpao=0.1
      "Saturation coefficient for alkalinity (HCO3) [mole HCO3/m3]";
    parameter Real K_PP=0.01
      "Saturation coefficient for poly-phosphate [g Xpp/(g Xpao)]";
    parameter Real K_MAX=0.34 "Maximum ratio of Xpp/Xpao [g Xpp/(g Xpao)]";
    parameter Real K_IPP=0.02
      "Inhibition coefficient for PP storage [g Xpp/(g Xpao)]";
    parameter Real K_PHA=0.01
      "Saturation coefficient for PHA [g Xpha/(g Xpao)]";

    // Nitrifying organisms (autotrophic organisms): Xa //
    Real mu_AUT "Maximum growth rate of Xa [d^-1]";
    parameter Real mu_AUT_T=1.0
      "Maximum growth rate of Xa at T=20 deg C [d^-1]";
    Real b_AUT "Decay rate of Xa [d^-1]";
    parameter Real b_AUT_T=0.15 "Decay rate of Xa at T=20 deg C [d^-1]";
    parameter Real K_O_Xa=0.5 "Saturation coefficient for oxygen [g O2/m3]";
    parameter Real K_NH_Xa=1.0
      "Saturation coefficient for ammonium (substrate) [g N/m3]";
    parameter Real K_ALK_Xa=0.5
      "Saturation coefficient for alkalinity (HCO3) [mole HCO3/m3]";
    parameter Real K_P_Xa=0.01
      "Saturation coefficient for phosphate (nutrient) [g P/m3]";

    // Precipitation //
    parameter Real k_PRE=1.0
      "Rate constant for P precipitation [m3/(g Fe(OH3))/d]";
    parameter Real k_RED=0.6 "Rate constant for redissolution [d^-1]";
    parameter Real K_ALK_Pre=0.5
      "Saturation coefficient for alkalinity [mole HCO3/m3]";

    WWU.MassConcentration So "Dissolved oxygen";
    WWU.MassConcentration Sf "Readily biodegradable substrate";
    WWU.MassConcentration Sa "Fermentation products";
    WWU.MassConcentration Snh "Ammonium";
    WWU.MassConcentration Sno "Nitrate (plus nitrite)";
    WWU.MassConcentration Spo "Phosphate";
    WWU.MassConcentration Si "Inert, non biodegradable organics";
    WWU.Alkalinity Salk "Bicarbonate alkalinity";
    WWU.MassConcentration Sn2 "Dinitrogen";
    WWU.MassConcentration Xi "Inert, non biodegradable organics";
    WWU.MassConcentration Xs "Slowly biodegradable substrate";
    WWU.MassConcentration Xh "Heterotrophic biomass";
    WWU.MassConcentration Xpao "Phosphorus-accumulating organisms, PAO";
    WWU.MassConcentration Xpp "Stored poly-phosphate of PAO";
    WWU.MassConcentration Xpha "Oragnic storage products of PAO";
    WWU.MassConcentration Xa "Autotrophic, nitrifying biomass";
    WWU.MassConcentration Xmeoh "Ferric-hydroxide Fe(OH)3";
    WWU.MassConcentration Xmep "Ferric-phosphate FePO4";
    WWU.MassConcentration Xtss "Particulate material as model component";

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
    Real p13;
    Real p14;
    Real p15;
    Real p16;
    Real p17;
    Real p18;
    Real p19;
    Real p20;
    Real p21;

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
    Real r14;
    Real r15;
    Real r16;
    Real r17;
    Real r18;
    Real r19;

    Real inputSo;
    Real inputSf;
    Real inputSa;
    Real inputSnh;
    Real inputSno;
    Real inputSpo;
    Real inputSi;
    Real inputSalk;
    Real inputSn2;
    Real inputXi;
    Real inputXs;
    Real inputXh;
    Real inputXpao;
    Real inputXpp;
    Real inputXpha;
    Real inputXa;
    Real inputXtss;
    Real inputXmeoh;
    Real inputXmep;
    Real aeration;

    Interfaces.WWFlowAsm2din In annotation (Placement(transformation(extent={{
              -110,-10},{-90,10}}, rotation=0)));
    Interfaces.WWFlowAsm2dout Out annotation (Placement(transformation(extent={
              {90,-10},{110,10}}, rotation=0)));
    Interfaces.WWFlowAsm2dout MeasurePort annotation (Placement(transformation(
            extent={{50,40},{60,50}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput T annotation (Placement(transformation(
            extent={{-110,30},{-90,50}}, rotation=0)));
  equation

    // Temperature dependent Kinetic parameters based on 20 deg C //
    K_h =K_h_T*1.0414^(T - 20);
    mu_H =mu_H_T*1.07177^(T - 20);
    rho_fe =rho_fe_T*1.07177^(T - 20);
    b_H =b_H_T*1.07177^(T - 20);
    rho_PHA =rho_PHA_T*1.0414^(T - 20);
    rho_PP =rho_PP_T*1.0414^(T - 20);
    mu_PAO =mu_PAO_T*1.0409^(T - 20);
    b_PAO =b_PAO_T*1.07177^(T - 20);
    b_PP =b_PP_T*1.07177^(T - 20);
    b_PHA =b_PHA_T*1.07177^(T - 20);
    mu_AUT =mu_AUT_T*1.1107^(T - 20);
    b_AUT =b_AUT_T*1.1161^(T - 20);

    // Process Rates //

    //Hydrolysis processes Xs//
    p1 = K_h*(So/(K_O_Xs + So))*((Xs/Xh)/(K_X + Xs/Xh))*Xh;
    p2 = K_h*eta_NO_Xs*(K_O_Xs/(K_O_Xs + So))*(Sno/(K_NO_Xs + Sno))*((Xs/Xh)/(
      K_X + Xs/Xh))*Xh;
    p3 = K_h*eta_fe*(K_O_Xs/(K_O_Xs + So))*(K_NO_Xs/(K_NO_Xs + Sno))*((Xs/Xh)/(
      K_X + Xs/Xh))*Xh;

    //Heterotrophic organisms Xh//
    p4 = mu_H*(So/(K_O_Xh + So))*(Sf/(K_F + Sf))*(Sf/(Sf + Sa))*(Snh/(K_NH_Xh
       + Snh))*(Spo/(K_P_Xh + Spo))*(Salk/(K_ALK_Xh + Salk))*Xh;
    p5 = mu_H*(So/(K_O_Xh + So))*(Sa/(K_A_Xh + Sa))*(Sa/(Sf + Sa))*(Snh/(
      K_NH_Xh + Snh))*(Spo/(K_P_Xh + Spo))*(Salk/(K_ALK_Xh + Salk))*Xh;
    p6 = mu_H*eta_NO_Xh*(K_O_Xh/(K_O_Xh + So))*(Sno/(K_NO_Xh + Sno))*(Sf/(K_F
       + Sf))*(Sf/(Sf + Sa))*(Snh/(K_NH_Xh + Snh))*(Spo/(K_P_Xh + Spo))*(Salk/(
      K_ALK_Xh + Salk))*Xh;
    p7 = mu_H*eta_NO_Xh*(K_O_Xh/(K_O_Xh + So))*(Sno/(K_NO_Xh + Sno))*(Sa/(
      K_A_Xh + Sa))*(Sa/(Sf + Sa))*(Snh/(K_NH_Xh + Snh))*(Spo/(K_P_Xh + Spo))*(
      Salk/(K_ALK_Xh + Salk))*Xh;
    p8 = rho_fe*(K_O_Xh/(K_O_Xh + So))*(K_NO_Xh/(K_NO_Xh + Sno))*(Sf/(K_F + Sf))
       *(Salk/(K_ALK_Xh + Salk))*Xh;
    p9 = b_H*Xh;

    //Phosphorus-accumulating organisms Xpao//
    p10 = rho_PHA*(Sa/(K_A_Xpao + Sa))*(Salk/(K_ALK_Xpao + Salk))*((Xpp/Xpao)/(
      K_PP + Xpp/Xpao))*Xpao;
    p11 = rho_PP*(So/(K_O_Xpao + So))*(Spo/(K_PS + Spo))*(Salk/(K_ALK_Xpao +
      Salk))*((Xpha/Xpao)/(K_PHA + Xpha/Xpao))*((K_MAX - Xpp/Xpao)/(K_PP +
      K_MAX - Xpp/Xpao))*Xpao;
    p12 = p11*eta_NO_Xpao*(K_O_Xpao/So)*(Sno/(K_NO_Xpao + Sno));
    p13 = mu_PAO*(So/(K_O_Xpao + So))*(Snh/(K_NH_Xpao + Snh))*(Spo/(K_P_Xpao +
      Spo))*(Salk/(K_ALK_Xpao + Salk))*((Xpha/Xpao)/(K_PHA + Xpha/Xpao))*Xpao;
    p14 = p13*eta_NO_Xpao*(K_O_Xpao/So)*(Sno/(K_NO_Xpao + Sno));
    p15 = b_PAO*Xpao*(Salk/(K_ALK_Xpao + Salk));
    p16 = b_PP*Xpp*(Salk/(K_ALK_Xpao + Salk));
    p17 = b_PHA*Xpha*(Salk/(K_ALK_Xpao + Salk));

    //Nitirying organisms Xa//
    p18 = mu_AUT*(So/(K_O_Xa + So))*(Snh/(K_NH_Xa + Snh))*(Spo/(K_P_Xa + Spo))*
      (Salk/(K_ALK_Xa + Salk))*Xa;
    p19 = b_AUT*Xa;

    //Precipitation Pre//
    p20 = k_PRE*Spo*Xmeoh;
    p21 = k_RED*Xmep*(Salk/(K_ALK_Pre + Salk));

    // biochemical reactions //
    r1 = (1 - 1/Y_H)*p4 + (1 - 1/Y_H)*p5 - Y_PHA*p11 + v_13_O*p13 - ((4.57 -
      Y_A)/Y_A)*p18;
    r2 = (1 - f_Si)*p1 + (1 - f_Si)*p2 + (1 - f_Si)*p3 - (1/Y_H)*p4 - (1/Y_H)*
      p6 - p8;
    r3 = -(1/Y_H)*p5 - (1/Y_H)*p7 + p8 - p10 + p17;
    r4 = v_1_NH*p1 + v_2_NH*p2 + v_3_NH*p3 + v_4_NH*p4 + v_5_NH*p5 + v_6_NH*p6
       + v_7_NH*p7 + v_8_NH*p8 + v_9_NH*p9 + v_13_NH*p13 + v_14_NH*p14 +
      v_15_NH*p15 + v_18_NH*p18 + v_19_NH*p19;
    r5 = -((1 - Y_H)/(2.86*Y_H))*p6 - ((1 - Y_H)/(2.86*Y_H))*p7 + v_12_NO*p12
       + v_14_NO*p14 + (1/Y_A)*p18;
    r6 = v_1_PO*p1 + v_2_PO*p2 + v_3_PO*p3 + v_4_PO*p4 + v_5_PO*p5 + v_6_PO*p6
       + v_7_PO*p7 + v_8_PO*p8 + v_9_PO*p9 + Y_PO*p10 - p11 - p12 - i_P_BM*p13
       - i_P_BM*p14 + v_15_PO*p15 + p16 - i_P_BM*p18 + v_19_PO*p19 - p20 + p21;
    r7 = f_Si*p1 + f_Si*p2 + f_Si*p3;
    r8 = v_1_ALK*p1 + v_2_ALK*p2 + v_3_ALK*p3 + v_4_ALK*p4 + v_5_ALK*p5 +
      v_6_ALK*p6 + v_7_ALK*p7 + v_8_ALK*p8 + v_9_ALK*p9 + v_10_ALK*p10 +
      v_11_ALK*p11 + v_12_ALK*p12 + v_13_ALK*p13 + v_14_ALK*p14 + v_15_ALK*p15
       + v_16_ALK*p16 + v_17_ALK*p17 + v_18_ALK*p18 + v_19_ALK*p19 + v_20_ALK*
      p20 + v_21_ALK*p21;
    r9 = ((1 - Y_H)/(2.86*Y_H))*p6 + ((1 - Y_H)/(2.86*Y_H))*p7 + v_12_N2*p12 +
      v_14_N2*p14;
    r10 = f_Xih*p9 + f_Xip*p15 + f_Xia*p19;
    r11 = -p1 - p2 - p3 + (1 - f_Xih)*p9 + (1 - f_Xip)*p15 + (1 - f_Xia)*p19;
    r12 = p4 + p5 + p6 + p7 - p9;
    r13 = p13 + p14 - p15;
    r14 = -Y_PO*p10 + p11 + p12 - p16;
    r15 = p10 - Y_PHA*p11 - Y_PHA*p12 - (1/Y_PAO)*p13 - (1/Y_PAO)*p14 - p17;
    r16 = p18 - p19;
    r17 = v_1_TSS*p1 + v_2_TSS*p2 + v_3_TSS*p3 + v_4_TSS*p4 + v_5_TSS*p5 +
      v_6_TSS*p6 + v_7_TSS*p7 + v_9_TSS*p9 + v_10_TSS*p10 + v_11_TSS*p11 +
      v_12_TSS*p12 + v_13_TSS*p13 + v_14_TSS*p14 + v_15_TSS*p15 + v_16_TSS*p16
       + v_17_TSS*p17 + v_18_TSS*p18 + v_19_TSS*p19 + 1.42*p20 - 1.42*p21;
    r18 = -3.45*p20 + 3.45*p21;
    r19 = 4.87*p20 - 4.87*p21;

    // derivatives //
    der(So) = inputSo + r1 + aeration;
    der(Sf) = inputSf + r2;
    der(Sa) = inputSa + r3;
    der(Snh) = inputSnh + r4;
    der(Sno) = inputSno + r5;
    der(Spo) = inputSpo + r6;
    der(Si) = inputSi + r7;
    der(Salk) = inputSalk + r8;
    der(Sn2) = inputSn2 + r9;
    der(Xi) = inputXi + r10;
    der(Xs) = inputXs + r11;
    der(Xh) = inputXh + r12;
    der(Xpao) = inputXpao + r13;
    der(Xpp) = inputXpp + r14;
    der(Xpha) = inputXpha + r15;
    der(Xa) = inputXa + r16;
    der(Xtss) = inputXtss + r17;
    der(Xmeoh) = inputXmeoh + r18;
    der(Xmep) = inputXmep + r19;

    // Outputs
    Out.Q + In.Q = 0;
    Out.So = So;
    Out.Sf = Sf;
    Out.Sa = Sa;
    Out.Snh = Snh;
    Out.Sno = Sno;
    Out.Spo = Spo;
    Out.Si = Si;
    Out.Salk = Salk;
    Out.Sn2 = Sn2;
    Out.Xi = Xi;
    Out.Xs = Xs;
    Out.Xh = Xh;
    Out.Xpao = Xpao;
    Out.Xpp = Xpp;
    Out.Xpha = Xpha;
    Out.Xa = Xa;
    Out.Xtss = Xtss;
    Out.Xmeoh = Xmeoh;
    Out.Xmep = Xmep;

    MeasurePort.So = So;
    MeasurePort.Sf = Sf;
    MeasurePort.Sa = Sa;
    MeasurePort.Snh = Snh;
    MeasurePort.Sno = Sno;
    MeasurePort.Spo = Spo;
    MeasurePort.Si = Si;
    MeasurePort.Salk = Salk;
    MeasurePort.Sn2 = Sn2;
    MeasurePort.Xi = Xi;
    MeasurePort.Xs = Xs;
    MeasurePort.Xh = Xh;
    MeasurePort.Xpao = Xpao;
    MeasurePort.Xpp = Xpp;
    MeasurePort.Xpha = Xpha;
    MeasurePort.Xa = Xa;
    MeasurePort.Xtss = Xtss;
    MeasurePort.Xmeoh = Xmeoh;
    MeasurePort.Xmep = Xmep;

    annotation (
      Window(
        x=0.4,
        y=0,
        width=0.6,
        height=0.77),
      Documentation(info="This partial model provides connectors and equations that are needed in the biological 
components (nitrification and denitrification tank) for ASM2d wastewater treatment plant models.
Parameters are coded according the ASM2d [1] standard distribution.
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

Copyright (C) 2001 - 2002, Gerald Reichl
"));
  end ASM2dbase;
  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.44,
      height=0.65,
      library=1,
      autolayout=1),
    Documentation(info="This package contains connectors and interfaces (partial models) for
wastewater treatment components based on the Acticated Sludge Model No.2d (ASM2d).

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

Copyright (C) 2001 - 2002, Gerald Reichl
"));
end Interfaces;
