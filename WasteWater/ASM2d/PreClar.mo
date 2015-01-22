within WasteWater.ASM2d;
package PreClar "Primary clarifier modelling based on ASM2d"

  extends Modelica.Icons.Library;

  model preclar1 "Dynamic ASM2d Primary Clarifier Model"
    // dynamic primary clarifier tank, based on Otterpohl
    // to be used for feed forward calculation, e.g. influent data needed

    import Modelica.Math.log;
    //WWU.MassConcentration Xmep "Ferric-phosphate FePO4";

    package WWU = WasteWaterUnits;
    extends WasteWater.Icons.preclar1;
    extends Interfaces.conversion_factors;

    // tank specific parameters
    parameter Modelica.SIunits.Volume V=500 "Volume of primary clarifier tank";
    Real hrt_h "hydraulic residence time in primary sedimentation tank [h]";

      //Real hrt_min "hydraulic residence time in primary sedimentation tank [min]";
    Real n_COD "efficiency of COD removal [%]";
    Real n_X "efficiency transformed to particulate fractions [%]";

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
    //WWU.MassConcentration Xmeoh "Ferric-hydroxide Fe(OH)3";
    //WWU.MassConcentration Xtss "Particulate material as model component";

    Real CODin;
    Real CODout;
    Real XCODin;
    Real H;

    ASM2d.Interfaces.WWFlowAsm2din In annotation (Placement(transformation(
            extent={{-110,-10},{-90,10}}, rotation=0)));
    ASM2d.Interfaces.WWFlowAsm2dout Out annotation (Placement(transformation(
            extent={{90,-10},{110,10}}, rotation=0)));
    ASM2d.Interfaces.WWFlowAsm2dout MeasurePort annotation (Placement(
          transformation(extent={{32,90},{42,100}}, rotation=0)));
  equation

    // calculation of the hydraulic residence time
    hrt_h = V/In.Q*24;
    //hrt_min = V/In.Q * 24 * 60;

      // n_COD according Otterpohl and Freund 1992 "Dynamic Models for Clarifiers"
    n_COD = 2.7*(log(hrt_h*hrt_h) + 9)/100;
    // n_COD according Otterpohl 1995, Dissertation
    // n_COD = (1.45 + 6.15 * log(hrt_min))/100;

    XCODin = In.Xi + In.Xs + In.Xh + In.Xpao + In.Xpha + In.Xa;
    // particulate COD in the influent
    CODin = In.Si + In.Sf + In.Sa + XCODin;
    // total COD in the influent

    CODout = Out.Si + Out.Sf + Out.Sa + Out.Xi + Out.Xs + Out.Xh + Out.Xpao +
      Out.Xpha + Out.Xa;

    // n_X can not be greater than 1
    H = n_COD*CODin/XCODin;
    // therefore this check
    n_X = if H > 0.95 then 0.95 else if H < 0.05 then 0.05 else H;
    // in this case the model needs to be modified by a new n_COD
    // n_COD_? = (2.88*XCODin/CODin - 0.118) * n_COD;

    // volume dependent dilution term of each concentration

    der(So) = (In.So - So)*In.Q/V;
    der(Sf) = (In.Sf - Sf)*In.Q/V;
    der(Sa) = (In.Sa - Sa)*In.Q/V;
    der(Snh) = (In.Snh - Snh)*In.Q/V;
    der(Sno) = (In.Sno - Sno)*In.Q/V;
    der(Spo) = (In.Spo - Spo)*In.Q/V;
    der(Si) = (In.Si - Si)*In.Q/V;
    der(Salk) = (In.Salk - Salk)*In.Q/V;
    der(Sn2) = (In.Sn2 - Sn2)*In.Q/V;
    der(Xi) = (In.Xi - Xi)*In.Q/V;
    der(Xs) = (In.Xs - Xs)*In.Q/V;
    der(Xh) = (In.Xh - Xh)*In.Q/V;
    der(Xpao) = (In.Xpao - Xpao)*In.Q/V;
    der(Xpp) = (In.Xpp - Xpp)*In.Q/V;
    der(Xpha) = (In.Xpha - Xpha)*In.Q/V;
    der(Xa) = (In.Xa - Xa)*In.Q/V;
    //der(Xtss) = (In.Xtss - Xtss)*In.Q/V;
    //der(Xmeoh) = (In.Xmeoh - Xmeoh)*In.Q/V;
    //der(Xmep) = (In.Xmep - Xmep)*In.Q/V;

    // Outputs
    // this is just a reduction of particulate substances; n_X*X is not stored
    // so the amount of primary sludge removed can not be calculated
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
    Out.Xi = (1 - n_X)*Xi;
    Out.Xs = (1 - n_X)*Xs;
    Out.Xh = (1 - n_X)*Xh;
    Out.Xpao = (1 - n_X)*Xpao;
    Out.Xpp = Xpp;
    Out.Xpha = (1 - n_X)*Xpha;
    Out.Xa = (1 - n_X)*Xa;
    Out.Xtss = i_TSS_Xi*Out.Xi + i_TSS_Xs*Out.Xs + i_TSS_BM*(Out.Xh + Out.Xpao
       + Out.Xa) + 0.6*Out.Xpha + Out.Xmeoh + Out.Xmep + 3.23*Out.Xpp;
    Out.Xmeoh = 0.0;
    Out.Xmep = 0.0;

    MeasurePort.So = So;
    MeasurePort.Sf = Sf;
    MeasurePort.Sa = Sa;
    MeasurePort.Snh = Snh;
    MeasurePort.Sno = Sno;
    MeasurePort.Spo = Spo;
    MeasurePort.Si = Si;
    MeasurePort.Salk = Salk;
    MeasurePort.Sn2 = Sn2;
    MeasurePort.Xi = (1 - n_X)*Xi;
    MeasurePort.Xs = (1 - n_X)*Xs;
    MeasurePort.Xh = (1 - n_X)*Xh;
    MeasurePort.Xpao = (1 - n_X)*Xpao;
    MeasurePort.Xpp = Xpp;
    MeasurePort.Xpha = (1 - n_X)*Xpha;
    MeasurePort.Xa = (1 - n_X)*Xa;

      //  MeasurePort.Xtss = 0.75*Out.Xi + 0.75*Out.Xs + 0.9*Out.Xh + 0.9*Out.Xpao +
    // 0.9*Out.Xa + 0.6*Out.Xpha;
    MeasurePort.Xtss = i_TSS_Xi*Out.Xi + i_TSS_Xs*Out.Xs + i_TSS_BM*(Out.Xh +
      Out.Xpao + Out.Xa) + 0.6*Out.Xpha + Out.Xmeoh + Out.Xmep + 3.23*Out.Xpp;
    MeasurePort.Xmeoh = 0.0;
    MeasurePort.Xmep = 0.0;

    annotation (
      Window(
        x=0.36,
        y=0.02,
        width=0.6,
        height=0.6),
      Documentation(info="This is an ASM2d dynamic primary clarifier model based on the theory
by Otterpohl and Freund.

Parameter:
  V - volume of the preclarifier
"));
  end preclar1;

  model preclar2 "Static ASM2d Primary Clarifier Model"
    // static primary clarifier tank, based on Otterpohl
    // to be used for feed forward calculation, e.g. influent data needed

    import Modelica.Math.log;
    package WWU = WasteWaterUnits;
    extends WasteWater.Icons.preclar2;
    extends Interfaces.conversion_factors;

    // tank specific parameters
    parameter Modelica.SIunits.Volume V=500 "Volume of primary clarifier tank";

      //Real hrt_min "hydraulic residence time in primary sedimentation tank [min]";
    Real hrt_h "hydraulic residence time in primary sedimentation tank [h]";
    Real n_COD "efficiency of COD removal [%]";
    Real n_X "efficiency transformed to particulate fractions [%]";
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
    //WWU.MassConcentration Xmeoh "Ferric-hydroxide Fe(OH)3";
    //WWU.MassConcentration Xmep "Ferric-phosphate FePO4";
    //WWU.MassConcentration Xtss "Particulate material as model component";

    Real CODin;
    Real CODout;
    Real XCODin;
    Real H;

    ASM2d.Interfaces.WWFlowAsm2din In annotation (Placement(transformation(
            extent={{-110,-10},{-90,10}}, rotation=0)));
    ASM2d.Interfaces.WWFlowAsm2dout Out annotation (Placement(transformation(
            extent={{90,-10},{110,10}}, rotation=0)));
    ASM2d.Interfaces.WWFlowAsm2dout MeasurePort annotation (Placement(
          transformation(extent={{32,90},{42,100}}, rotation=0)));
  equation

    // calculation of the hydraulic residence time
    hrt_h = V/In.Q*24;
    //hrt_min = V/In.Q * 24 * 60;

      // n_COD according Otterpohl and Freund 1992 "Dynamic Models for Clarifiers"
    n_COD = 2.7*(log(hrt_h*hrt_h) + 9)/100;
    // n_COD according Otterpohl 1995, Dissertation
    // n_COD = (1.45 + 6.15 * log(hrt_min))/100;

    XCODin = In.Xi + In.Xs + In.Xh + In.Xpao + In.Xpha + In.Xa;
    // particulate COD in the influent
    CODin = In.Si + In.Sf + In.Sa + XCODin;
    // total COD in the influent

    CODout = Out.Si + Out.Sf + Out.Sa + Out.Xi + Out.Xs + Out.Xh + Out.Xpao +
      Out.Xpha + Out.Xa;

    H = n_COD*CODin/XCODin;
    // n_X can not be greater than 1
    // therefore this check
    n_X = if H > 0.95 then 0.95 else if H < 0.05 then 0.05 else H;
    // in this case the model needs to be modified by a new n_COD
    // n_COD_? = (2.88*XCODin/CODin - 0.118) * n_COD;

    // volume dependent dilution term of each concentration

    0 = (In.So - So)*In.Q/V;
    0 = (In.Sf - Sf)*In.Q/V;
    0 = (In.Sa - Sa)*In.Q/V;
    0 = (In.Snh - Snh)*In.Q/V;
    0 = (In.Sno - Sno)*In.Q/V;
    0 = (In.Spo - Spo)*In.Q/V;
    0 = (In.Si - Si)*In.Q/V;
    0 = (In.Salk - Salk)*In.Q/V;
    0 = (In.Sn2 - Sn2)*In.Q/V;
    0 = (In.Xi - Xi)*In.Q/V;
    0 = (In.Xs - Xs)*In.Q/V;
    0 = (In.Xh - Xh)*In.Q/V;
    0 = (In.Xpao - Xpao)*In.Q/V;
    0 = (In.Xpp - Xpp)*In.Q/V;
    0 = (In.Xpha - Xpha)*In.Q/V;
    0 = (In.Xa - Xa)*In.Q/V;
    //0 = (In.Xtss - Xtss)*In.Q/V;
    // der(Xmeoh) = (In.Xmeoh - Xmeoh)*In.Q/V;
    // der(Xmep) = (In.Xmep - Xmep)*In.Q/V;

    // Outputs
    // this is just a reduction of particulate substances; n_X*X is not stored
    // so the amount of primary sludge removed can not be calculated
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
    Out.Xi = (1 - n_X)*Xi;
    Out.Xs = (1 - n_X)*Xs;
    Out.Xh = (1 - n_X)*Xh;
    Out.Xpao = (1 - n_X)*Xpao;
    Out.Xpp = Xpp;
    Out.Xpha = (1 - n_X)*Xpha;
    Out.Xa = (1 - n_X)*Xa;
    Out.Xtss = i_TSS_Xi*Out.Xi + i_TSS_Xs*Out.Xs + i_TSS_BM*(Out.Xh + Out.Xpao
       + Out.Xa) + 0.6*Out.Xpha + Out.Xmeoh + Out.Xmep + 3.23*Out.Xpp;
    Out.Xmeoh = 0.0;
    Out.Xmep = 0.0;

    MeasurePort.So = So;
    MeasurePort.Sf = Sf;
    MeasurePort.Sa = Sa;
    MeasurePort.Snh = Snh;
    MeasurePort.Sno = Sno;
    MeasurePort.Spo = Spo;
    MeasurePort.Si = Si;
    MeasurePort.Salk = Salk;
    MeasurePort.Sn2 = Sn2;
    MeasurePort.Xi = (1 - n_X)*Xi;
    MeasurePort.Xs = (1 - n_X)*Xs;
    MeasurePort.Xh = (1 - n_X)*Xh;
    MeasurePort.Xpao = (1 - n_X)*Xpao;
    MeasurePort.Xpp = Xpp;
    MeasurePort.Xpha = (1 - n_X)*Xpha;
    MeasurePort.Xa = (1 - n_X)*Xa;
    MeasurePort.Xtss = i_TSS_Xi*Out.Xi + i_TSS_Xs*Out.Xs + i_TSS_BM*(Out.Xh +
      Out.Xpao + Out.Xa) + 0.6*Out.Xpha + Out.Xmeoh + Out.Xmep + 3.23*Out.Xpp;
    MeasurePort.Xmeoh = 0.0;
    MeasurePort.Xmep = 0.0;

    annotation (
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info="This is an ASM2d static primary clarifier model based on the theory
by Otterpohl and Freund.

Parameter:
  V - volume of the preclarifier

"));
  end preclar2;

  model preclar3 "Inverse ASM2d Static Primary Clarifier Model"
    // static primary clarifier tank
    // to be used for backward calculation, e.g. effluent data for total
    // signals need to be in the sequence COD, Snh, Spo, pH in the inputtable

    import Modelica.Math.log;
    package WWU = WasteWater.WasteWaterUnits;
    extends WasteWater.Icons.preclar2;
    extends Interfaces.conversion_factors;

    // tank specific parameters
    parameter Modelica.SIunits.Volume V=500 "Volume of primary clarifier tank";
    parameter Real aSi=5/100 "Fraction of Si of the total COD in the influent";
    parameter Real aSf=9/100 "Fraction of Sf of the total COD in the influent";
    parameter Real aSa=6/100 "Fraction of Sa of the total COD in the influent";
    parameter Real aXi=15/100 "Fraction of Xi of the total COD in the influent";
    parameter Real aXs=45/100 "Fraction of Xs of the total COD in the influent";
    parameter Real aXh=20/100 "Fraction of Xh of the total COD in the influent";
    parameter Real aXa=0/100 "Fraction of Xa of the total COD in the influent";

      // parameter Real aXp=0/100 "Fraction of Xp of the total COD in the influent";
    parameter Real aSo=0.0 "Dissolved oxygen in the inflow [mg/l]";
    // parameter Real aSnd=1/100 "Fraction Snd of Ss in the influent";
    // parameter Real aXnd=3/100 "Fraction Xnd of Xs in the influent";
    parameter Real n_corr=1.0 "Correction faktor for the efficiency function";

    Real hrt_h "hydraulic residence time in primary sedimentation tank [h]";

      //Real hrt_min "hydraulic residence time in primary sedimentation tank [min]";
    Real n_COD "efficiency of COD removal [%]";
    Real n_X "efficiency transformed to particulate fractions [%]";

      // Interfaces.MeasurePort MeasurePort annotation (extent=[32, 90; 42, 100]);

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
    //WWU.MassConcentration Xmeoh "Ferric-hydroxide Fe(OH)3";
    //WWU.MassConcentration Xmep "Ferric-phosphate FePO4";
    //WWU.MassConcentration Xtss "Particulate material as model component";

    Real COD;
    Real CODin;
    Real CODout;
    Real XCOD;
    Real H;

    ASM2d.Interfaces.WWFlowAsm2din In annotation (Placement(transformation(
            extent={{-110,-10},{-90,10}}, rotation=0)));
    ASM2d.Interfaces.WWFlowAsm2dout Out annotation (Placement(transformation(
            extent={{90,-10},{110,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput MeasurePort[4]
      annotation (Placement(transformation(
          origin={38,90},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  equation

    // calculation of the hydraulic residence time
    hrt_h = V/In.Q*24;
    // hrt_h * In.Q = V * 24;
    //hrt_min = V/In.Q * 24 * 60;

      // n_COD according Otterpohl and Freund 1992 "Dynamic Models for Clarifiers"
    n_COD = n_corr*2.7*(log(hrt_h*hrt_h) + 9)/100;
    // n_COD according Otterpohl 1995, Dissertation
    // n_COD = n_corr*(1.45 + 6.15 * log(hrt_min))/100;

    XCOD = In.Xi + In.Xs + In.Xh + In.Xpao + In.Xpha + In.Xa;
    // particulate COD in the influent
    COD = In.Si + In.Sf + In.Sa + XCOD;
    // total COD in the influent

    CODin =MeasurePort[1]/(1 - n_COD);
    // total COD in the influent
    // above two CODs sould be the same

    CODout = Out.Si + Out.Sf + Out.Sa + Out.Xi + Out.Xs + Out.Xh + Out.Xpao +
      Out.Xpha + Out.Xa;
    // this should be the same as MeasurePort.signal[1]

    // n_X can not be greater than 1
    H = n_COD*COD/XCOD;
    n_X = if H > 0.95 then 0.95 else if H < 0.05 then 0.05 else H;
    // in this case the model needs to be modified by a new n_COD
    // n_COD_? = (2.88*XCODin/CODin - 0.118) * n_COD;

    // volume dependent dilution term of each concentration

    0 = (In.So - So)*In.Q/V;
    0 = (In.Sf - Sf)*In.Q/V;
    0 = (In.Sa - Sa)*In.Q/V;
    0 = (In.Snh - Snh)*In.Q/V;
    0 = (In.Sno - Sno)*In.Q/V;
    0 = (In.Spo - Spo)*In.Q/V;
    0 = (In.Si - Si)*In.Q/V;
    0 = (In.Salk - Salk)*In.Q/V;
    0 = (In.Sn2 - Sn2)*In.Q/V;
    0 = (In.Xi - Xi)*In.Q/V;
    0 = (In.Xs - Xs)*In.Q/V;
    0 = (In.Xh - Xh)*In.Q/V;
    0 = (In.Xpao - Xpao)*In.Q/V;
    0 = (In.Xpp - Xpp)*In.Q/V;
    0 = (In.Xpha - Xpha)*In.Q/V;
    0 = (In.Xa - Xa)*In.Q/V;
    //0 = (In.Xtss - Xtss)*In.Q/V;
    //0 = (In.Xmeoh - Xmeoh)*In.Q/V;
    //0 = (In.Xmep - Xmep)*In.Q/V;

    Out.Q + In.Q = 0;

    // Inputs

    In.So = aSo;
    In.Sf = aSf*CODin;
    In.Sa = aSa*CODin;
    In.Snh =MeasurePort[2];
    In.Sno = 0.0;
    In.Spo =MeasurePort[3];
    In.Si = aSi*CODin;
    In.Salk =1.8*exp(MeasurePort[4] - 6.4);
    In.Sn2 = 0.0;
    In.Xi = aXi*CODin;
    In.Xs = aXs*CODin;
    In.Xh = aXh*CODin;
    In.Xpao = 0.0;
    // aXpao*CODin;
    In.Xpp = 0.0;
    In.Xpha = 0.0;
    // aXpha*CODin;
    In.Xa = aXa*CODin;
    In.Xtss = i_TSS_Xi*In.Xi + i_TSS_Xs*In.Xs + i_TSS_BM*(In.Xh + In.Xpao + In.
      Xa) + 0.6*In.Xpha + In.Xmeoh + In.Xmep + 3.23*In.Xpp;
    In.Xmeoh = 0.0;
    In.Xmep = 0.0;

    // Outputs
    Out.So = So;
    Out.Sf = Sf;
    Out.Sa = Sa;
    Out.Snh = Snh;
    Out.Sno = Sno;
    Out.Spo = Spo;
    Out.Si = Si;
    Out.Salk = Salk;
    Out.Sn2 = Sn2;
    Out.Xi = (1 - n_X)*Xi;
    Out.Xs = (1 - n_X)*Xs;
    Out.Xh = (1 - n_X)*Xh;
    Out.Xpao = (1 - n_X)*Xpao;
    Out.Xpp = Xpp;
    Out.Xpha = (1 - n_X)*Xpha;
    Out.Xa = (1 - n_X)*Xa;
    Out.Xtss = i_TSS_Xi*Out.Xi + i_TSS_Xs*Out.Xs + i_TSS_BM*(Out.Xh + Out.Xpao
       + Out.Xa) + 0.6*Out.Xpha + Out.Xmeoh + Out.Xmep + 3.23*Out.Xpp;
    Out.Xmeoh = 0.0;
    Out.Xmep = 0.0;

    annotation (
      Window(
        x=0.62,
        y=0.01,
        width=0.35,
        height=0.49),
      Documentation(info="This is a special case of the ASM2d static primary clarifier model.
Here measurement data at the end (effluent) of the preclarifier needs to be provided.
This is typical for some real plants. Influent is then calculated.

Parameters:
      - ASM2d conversion factors for calculation of Xtss
  V   - volume of the preclarifier
  aS* - fractions of e.g. COD in influent (soluble components)
  aX* - fractions of e.g. COD in influent (particular components)
  n_corr- correction factor for the efficiency function

Dimension of InPort is 4.
  1 - Chemical Oxygen Demand (COD) at effluent of primary clarifier
  2 - annonium nitrogen (Snh) at effluent of primary clarifier
  3 - phosphorus (Spo) at effluent of primary clarifier
  4 - pH-value at effluent of primary clarifier

"));
  end preclar3;
  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.44,
      height=0.65,
      library=1,
      autolayout=1),
    Documentation(info="This package provides one dynamic and two static ASM2d primary clarifier
models based on Otterpohl [1].

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de


Reference:

[1] R. Otterpohl and M. Freund: Dynamic models for clarifier of activated sludge
    plants with dry and wet weather flows. Water Science and Technology. 26 (1992), pp. 1391-1400.

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2001 - 2002, Gerald Reichl
"));
end PreClar;
