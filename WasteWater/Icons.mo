package Icons "Icon definitions for the WasteWater library" 
  
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
    Documentation(info="This package is part of the WasteWater Library and contains
definitions for the graphical layout of components which are
used within the sub-libraries ASM1, ASM2d and ASM3.

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
  partial block deni "Icon for a denitrification tank" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Rectangle(extent=[-80, 20; 80, -80], style(color=7, fillColor=48)), 
        Line(points=[-80, -6; -80, -80; 80, -80; 80, -6], style(color=0, 
              thickness=2)), 
        Line(points=[-80, 6; -80, 20], style(color=0, thickness=2)), 
        Line(points=[80, 6; 80, 20], style(color=0, thickness=2)), 
        Rectangle(extent=[-90, 6; -80, -6], style(color=48, fillColor=48)), 
        Rectangle(extent=[80, 6; 90, -6], style(color=48, fillColor=48)), 
        Line(points=[-90, -6; -80, -6], style(color=0, thickness=2)), 
        Line(points=[-90, 6; -80, 6], style(color=0, thickness=2)), 
        Line(points=[80, 6; 90, 6], style(color=0, thickness=2)), 
        Line(points=[80, -6; 90, -6], style(color=0, thickness=2)), 
        Ellipse(extent=[-2, -34; 2, -38], style(
            color=0, 
            thickness=2, 
            fillColor=0)), 
        Line(points=[0, -34; 0, 40; 0, 44], style(
            color=0, 
            thickness=4, 
            fillColor=0)), 
        Text(extent=[-98, 100; 100, 60], string="%name"), 
        Line(points=[-2, -36; -10, -36], style(color=0, thickness=2)), 
        Line(points=[10, -36; 2, -36], style(color=0, thickness=2)), 
        Ellipse(extent=[-62, -32; -10, -40], style(
            color=0, 
            thickness=2, 
            fillColor=10)), 
        Ellipse(extent=[10, -32; 62, -40], style(
            color=0, 
            thickness=2, 
            fillColor=10)), 
        Ellipse(extent=[-72, 0; -70, -2], style(color=46, fillColor=46)), 
        Ellipse(extent=[-54, -2; -52, -4], style(color=46, fillColor=46)), 
        Ellipse(extent=[-38, 0; -36, -2], style(color=46, fillColor=46)), 
        Ellipse(extent=[-68, -16; -66, -18], style(color=46, fillColor=46)), 
        Ellipse(extent=[-44, -20; -42, -22], style(color=46, fillColor=46)), 
        Ellipse(extent=[-14, -4; -12, -6], style(color=46, fillColor=46)), 
        Ellipse(extent=[-28, -16; -26, -18], style(color=46, fillColor=46)), 
        Ellipse(extent=[10, 0; 12, -2], style(color=46, fillColor=46)), 
        Ellipse(extent=[28, -2; 30, -4], style(color=46, fillColor=46)), 
        Ellipse(extent=[44, 0; 46, -2], style(color=46, fillColor=46)), 
        Ellipse(extent=[14, -16; 16, -18], style(color=46, fillColor=46)), 
        Ellipse(extent=[38, -20; 40, -22], style(color=46, fillColor=46)), 
        Ellipse(extent=[68, -4; 70, -6], style(color=46, fillColor=46)), 
        Ellipse(extent=[61, -24; 63, -26], style(color=46, fillColor=46)), 
        Ellipse(extent=[-68, -48; -66, -50], style(color=46, fillColor=46)), 
        Ellipse(extent=[-50, -50; -48, -52], style(color=46, fillColor=46)), 
        Ellipse(extent=[-34, -48; -32, -50], style(color=46, fillColor=46)), 
        Ellipse(extent=[-64, -64; -62, -66], style(color=46, fillColor=46)), 
        Ellipse(extent=[-40, -68; -38, -70], style(color=46, fillColor=46)), 
        Ellipse(extent=[-10, -52; -8, -54], style(color=46, fillColor=46)), 
        Ellipse(extent=[-24, -64; -22, -66], style(color=46, fillColor=46)), 
        Ellipse(extent=[8, -48; 10, -50], style(color=46, fillColor=46)), 
        Ellipse(extent=[26, -50; 28, -52], style(color=46, fillColor=46)), 
        Ellipse(extent=[42, -48; 44, -50], style(color=46, fillColor=46)), 
        Ellipse(extent=[12, -64; 14, -66], style(color=46, fillColor=46)), 
        Ellipse(extent=[36, -68; 38, -70], style(color=46, fillColor=46)), 
        Ellipse(extent=[66, -52; 68, -54], style(color=46, fillColor=46)), 
        Ellipse(extent=[52, -64; 54, -66], style(color=46, fillColor=46)), 
        Ellipse(extent=[-61, -6; -51, -16], style(
            color=0, 
            thickness=2, 
            fillColor=8)), 
        Rectangle(extent=[-58, -6; -55, 40], style(color=0, fillColor=8)), 
        Line(points=[-90, 40; -55, 40], style(color=0)), 
        Rectangle(extent=[54, -6; 57, 40], style(color=0, fillColor=8)), 
        Ellipse(extent=[51, -6; 61, -16], style(
            color=0, 
            thickness=2, 
            fillColor=8))), 
      Documentation(info="Icon for a denitrification tank"), 
      Diagram(
        Rectangle(extent=[-80, 20; 80, -80], style(color=7, fillColor=48)), 
        Line(points=[-80, -6; -80, -80; 80, -80; 80, -6], style(color=0, 
              thickness=2)), 
        Line(points=[-80, 6; -80, 20], style(color=0, thickness=2)), 
        Line(points=[80, 6; 80, 20], style(color=0, thickness=2)), 
        Rectangle(extent=[-90, 6; -80, -6], style(color=48, fillColor=48)), 
        Rectangle(extent=[80, 6; 90, -6], style(color=48, fillColor=48)), 
        Line(points=[-90, -6; -80, -6], style(color=0, thickness=2)), 
        Line(points=[-90, 6; -80, 6], style(color=0, thickness=2)), 
        Line(points=[80, 6; 90, 6], style(color=0, thickness=2)), 
        Line(points=[80, -6; 90, -6], style(color=0, thickness=2)), 
        Ellipse(extent=[-2, -34; 2, -38], style(
            color=0, 
            thickness=2, 
            fillColor=0)), 
        Line(points=[0, -34; 0, 40; 0, 44], style(
            color=0, 
            thickness=4, 
            fillColor=0)), 
        Text(extent=[-100, 100; 100, 60], string="%name"), 
        Line(points=[-2, -36; -10, -36], style(color=0, thickness=2)), 
        Line(points=[10, -36; 2, -36], style(color=0, thickness=2)), 
        Ellipse(extent=[-62, -32; -10, -40], style(
            color=0, 
            thickness=2, 
            fillColor=10)), 
        Ellipse(extent=[10, -32; 62, -40], style(
            color=0, 
            thickness=2, 
            fillColor=10)), 
        Ellipse(extent=[-72, 0; -70, -2], style(color=46, fillColor=46)), 
        Ellipse(extent=[-54, -2; -52, -4], style(color=46, fillColor=46)), 
        Ellipse(extent=[-38, 0; -36, -2], style(color=46, fillColor=46)), 
        Ellipse(extent=[-68, -16; -66, -18], style(color=46, fillColor=46)), 
        Ellipse(extent=[-44, -20; -42, -22], style(color=46, fillColor=46)), 
        Ellipse(extent=[-14, -4; -12, -6], style(color=46, fillColor=46)), 
        Ellipse(extent=[-28, -16; -26, -18], style(color=46, fillColor=46)), 
        Ellipse(extent=[10, 0; 12, -2], style(color=46, fillColor=46)), 
        Ellipse(extent=[28, -2; 30, -4], style(color=46, fillColor=46)), 
        Ellipse(extent=[44, 0; 46, -2], style(color=46, fillColor=46)), 
        Ellipse(extent=[14, -16; 16, -18], style(color=46, fillColor=46)), 
        Ellipse(extent=[38, -20; 40, -22], style(color=46, fillColor=46)), 
        Ellipse(extent=[68, -4; 70, -6], style(color=46, fillColor=46)), 
        Ellipse(extent=[61, -24; 63, -26], style(color=46, fillColor=46)), 
        Ellipse(extent=[-68, -48; -66, -50], style(color=46, fillColor=46)), 
        Ellipse(extent=[-50, -50; -48, -52], style(color=46, fillColor=46)), 
        Ellipse(extent=[-34, -48; -32, -50], style(color=46, fillColor=46)), 
        Ellipse(extent=[-64, -64; -62, -66], style(color=46, fillColor=46)), 
        Ellipse(extent=[-40, -68; -38, -70], style(color=46, fillColor=46)), 
        Ellipse(extent=[-10, -52; -8, -54], style(color=46, fillColor=46)), 
        Ellipse(extent=[-24, -64; -22, -66], style(color=46, fillColor=46)), 
        Ellipse(extent=[8, -48; 10, -50], style(color=46, fillColor=46)), 
        Ellipse(extent=[26, -50; 28, -52], style(color=46, fillColor=46)), 
        Ellipse(extent=[42, -48; 44, -50], style(color=46, fillColor=46)), 
        Ellipse(extent=[12, -64; 14, -66], style(color=46, fillColor=46)), 
        Ellipse(extent=[36, -68; 38, -70], style(color=46, fillColor=46)), 
        Ellipse(extent=[66, -52; 68, -54], style(color=46, fillColor=46)), 
        Ellipse(extent=[52, -64; 54, -66], style(color=46, fillColor=46)), 
        Ellipse(extent=[-61, -6; -51, -16], style(
            color=0, 
            thickness=2, 
            fillColor=8)), 
        Rectangle(extent=[-58, -6; -55, 40], style(color=0, fillColor=8)), 
        Line(points=[-90, 40; -55, 40], style(color=0)), 
        Rectangle(extent=[54, -6; 57, 40], style(color=0, fillColor=8)), 
        Ellipse(extent=[51, -6; 61, -16], style(
            color=0, 
            thickness=2, 
            fillColor=8))));
  end deni;
  partial model nitri "Icon for a nitrification tank" 
    
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Rectangle(extent=[-80, 20; 80, -80], style(color=7, fillColor=48)), 
        Line(points=[-80, -6; -80, -80; 80, -80; 80, -6], style(color=0, 
              thickness=2)), 
        Line(points=[-80, 6; -80, 20], style(color=0, thickness=2)), 
        Line(points=[80, 6; 80, 20], style(color=0, thickness=2)), 
        Rectangle(extent=[-90, 6; -80, -6], style(color=48, fillColor=48)), 
        Rectangle(extent=[80, 6; 90, -6], style(color=48, fillColor=48)), 
        Line(points=[-90, -6; -80, -6], style(color=0, thickness=2)), 
        Line(points=[-90, 6; -80, 6], style(color=0, thickness=2)), 
        Line(points=[80, 6; 90, 6], style(color=0, thickness=2)), 
        Line(points=[80, -6; 90, -6], style(color=0, thickness=2)), 
        Text(extent=[-100, 100; 100, 60], string="%name"), 
        Line(points=[-70, -74; 70, -74], style(color=0, thickness=2)), 
        Line(points=[0, -80; 0, -74], style(color=0, thickness=2)), 
        Line(points=[0, -80; 0, -94], style(color=0, thickness=2)), 
        Polygon(points=[-70, -70; -68, -74; -62, -74; -60, -70; -70, -70], 
            style(color=73, fillColor=71)), 
        Polygon(points=[60, -70; 62, -74; 68, -74; 70, -70; 60, -70], style(
              color=73, fillColor=71)), 
        Polygon(points=[4, -70; 6, -74; 12, -74; 14, -70; 4, -70], style(color=
                73, fillColor=71)), 
        Polygon(points=[-14, -70; -12, -74; -6, -74; -4, -70; -14, -70], style(
              color=73, fillColor=71)), 
        Polygon(points=[-52, -70; -50, -74; -44, -74; -42, -70; -52, -70], 
            style(color=73, fillColor=71)), 
        Polygon(points=[-32, -70; -30, -74; -24, -74; -22, -70; -32, -70], 
            style(color=73, fillColor=71)), 
        Polygon(points=[42, -70; 44, -74; 50, -74; 52, -70; 42, -70], style(
              color=73, fillColor=71)), 
        Polygon(points=[22, -70; 24, -74; 30, -74; 32, -70; 22, -70], style(
              color=73, fillColor=71)), 
        Rectangle(extent=[-64, -56; -62, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[-62, -66; -60, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[-68, -66; -66, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[-70, -62; -68, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[-64, -62; -62, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[-68, -56; -66, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[-64, -50; -66, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[-68, -42; -66, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[-64, -36; -66, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[-68, -32; -66, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[-64, -24; -62, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[-68, -18; -66, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[-64, -8; -62, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[-68, 0; -66, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[-62, 12; -60, 10], style(color=69, fillColor=69)), 
        Polygon(points=[-70, -70; -68, -74; -62, -74; -60, -70; -70, -70], 
            style(color=73, fillColor=71)), 
        Rectangle(extent=[-64, -56; -62, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[-62, -66; -60, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[-68, -66; -66, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[-70, -62; -68, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[-64, -62; -62, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[-68, -56; -66, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[-64, -50; -66, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[-68, -42; -66, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[-64, -36; -66, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[-68, -32; -66, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[-64, -24; -62, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[-68, -18; -66, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[-64, -8; -62, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[-68, 0; -66, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[-62, 12; -60, 10], style(color=69, fillColor=69)), 
        Polygon(points=[-52, -70; -50, -74; -44, -74; -42, -70; -52, -70], 
            style(color=73, fillColor=71)), 
        Rectangle(extent=[-46, -56; -44, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[-44, -66; -42, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[-50, -66; -48, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[-52, -62; -50, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[-46, -62; -44, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[-50, -56; -48, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[-46, -50; -48, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[-50, -42; -48, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[-46, -36; -48, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[-50, -32; -48, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[-46, -24; -44, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[-50, -18; -48, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[-46, -8; -44, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[-50, 0; -48, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[-44, 12; -42, 10], style(color=69, fillColor=69)), 
        Polygon(points=[-32, -70; -30, -74; -24, -74; -22, -70; -32, -70], 
            style(color=73, fillColor=71)), 
        Rectangle(extent=[-26, -56; -24, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[-24, -66; -22, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[-30, -66; -28, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[-32, -62; -30, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[-26, -62; -24, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[-30, -56; -28, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[-26, -50; -28, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[-30, -42; -28, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[-26, -36; -28, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[-30, -32; -28, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[-26, -24; -24, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[-30, -18; -28, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[-26, -8; -24, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[-30, 0; -28, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[-24, 12; -22, 10], style(color=69, fillColor=69)), 
        Polygon(points=[-14, -70; -12, -74; -6, -74; -4, -70; -14, -70], style(
              color=73, fillColor=71)), 
        Rectangle(extent=[-8, -56; -6, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[-6, -66; -4, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[-12, -66; -10, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[-14, -62; -12, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[-8, -62; -6, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[-12, -56; -10, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[-8, -50; -10, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[-12, -42; -10, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[-8, -36; -10, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[-12, -32; -10, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[-8, -24; -6, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[-12, -18; -10, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[-8, -8; -6, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[-12, 0; -10, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[-6, 12; -4, 10], style(color=69, fillColor=69)), 
        Polygon(points=[4, -70; 6, -74; 12, -74; 14, -70; 4, -70], style(color=
                73, fillColor=71)), 
        Rectangle(extent=[10, -56; 12, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[12, -66; 14, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[6, -66; 8, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[4, -62; 6, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[10, -62; 12, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[6, -56; 8, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[10, -50; 8, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[6, -42; 8, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[10, -36; 8, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[6, -32; 8, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[10, -24; 12, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[6, -18; 8, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[10, -8; 12, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[6, 0; 8, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[12, 12; 14, 10], style(color=69, fillColor=69)), 
        Polygon(points=[22, -70; 24, -74; 30, -74; 32, -70; 22, -70], style(
              color=73, fillColor=71)), 
        Rectangle(extent=[28, -56; 30, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[30, -66; 32, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[24, -66; 26, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[22, -62; 24, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[28, -62; 30, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[24, -56; 26, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[28, -50; 26, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[24, -42; 26, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[28, -36; 26, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[24, -32; 26, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[28, -24; 30, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[24, -18; 26, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[28, -8; 30, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[24, 0; 26, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[30, 12; 32, 10], style(color=69, fillColor=69)), 
        Polygon(points=[42, -70; 44, -74; 50, -74; 52, -70; 42, -70], style(
              color=73, fillColor=71)), 
        Rectangle(extent=[48, -56; 50, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[50, -66; 52, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[44, -66; 46, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[42, -62; 44, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[48, -62; 50, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[44, -56; 46, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[48, -50; 46, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[44, -42; 46, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[48, -36; 46, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[44, -32; 46, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[48, -24; 50, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[44, -18; 46, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[40, -8; 38, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[44, 0; 46, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[50, 12; 52, 10], style(color=69, fillColor=69)), 
        Polygon(points=[60, -70; 62, -74; 68, -74; 70, -70; 60, -70], style(
              color=73, fillColor=71)), 
        Rectangle(extent=[66, -56; 68, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[68, -66; 70, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[62, -66; 64, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[60, -62; 62, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[66, -62; 68, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[62, -56; 64, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[66, -50; 64, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[62, -42; 64, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[66, -36; 64, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[62, -32; 64, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[66, -24; 68, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[62, -18; 64, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[66, -8; 68, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[62, 0; 64, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[68, 12; 70, 10], style(color=69, fillColor=69)), 
        Documentation(info="Nitrifikationsbecken"), 
        Rectangle(extent=[54, -6; 57, 40], style(color=0, fillColor=8)), 
        Ellipse(extent=[50, -6; 60, -16], style(
            color=0, 
            thickness=2, 
            fillColor=8)), 
        Rectangle(extent=[-56, -6; -53, 40], style(color=0, fillColor=8)), 
        Ellipse(extent=[-60, -6; -50, -16], style(
            color=0, 
            thickness=2, 
            fillColor=8)), 
        Line(points=[-90, 40; -53, 40], style(color=0))), 
      Documentation(info="Icon for a nitrification tank "), 
      Diagram(
        Rectangle(extent=[-80, 20; 80, -80], style(color=7, fillColor=48)), 
        Line(points=[-80, -6; -80, -80; 80, -80; 80, -6], style(color=0, 
              thickness=2)), 
        Line(points=[-80, 6; -80, 20], style(color=0, thickness=2)), 
        Line(points=[80, 6; 80, 20], style(color=0, thickness=2)), 
        Rectangle(extent=[-90, 6; -80, -6], style(color=48, fillColor=48)), 
        Rectangle(extent=[80, 6; 90, -6], style(color=48, fillColor=48)), 
        Line(points=[-90, -6; -80, -6], style(color=0, thickness=2)), 
        Line(points=[-90, 6; -80, 6], style(color=0, thickness=2)), 
        Line(points=[80, 6; 90, 6], style(color=0, thickness=2)), 
        Line(points=[80, -6; 90, -6], style(color=0, thickness=2)), 
        Text(extent=[-100, 100; 100, 60], string="%name"), 
        Line(points=[-70, -74; 70, -74], style(color=0, thickness=2)), 
        Line(points=[0, -80; 0, -74], style(color=0, thickness=2)), 
        Line(points=[0, -80; 0, -94], style(color=0, thickness=2)), 
        Polygon(points=[-70, -70; -68, -74; -62, -74; -60, -70; -70, -70], 
            style(color=73, fillColor=71)), 
        Polygon(points=[60, -70; 62, -74; 68, -74; 70, -70; 60, -70], style(
              color=73, fillColor=71)), 
        Polygon(points=[4, -70; 6, -74; 12, -74; 14, -70; 4, -70], style(color=
                73, fillColor=71)), 
        Polygon(points=[-14, -70; -12, -74; -6, -74; -4, -70; -14, -70], style(
              color=73, fillColor=71)), 
        Polygon(points=[-52, -70; -50, -74; -44, -74; -42, -70; -52, -70], 
            style(color=73, fillColor=71)), 
        Polygon(points=[-32, -70; -30, -74; -24, -74; -22, -70; -32, -70], 
            style(color=73, fillColor=71)), 
        Polygon(points=[42, -70; 44, -74; 50, -74; 52, -70; 42, -70], style(
              color=73, fillColor=71)), 
        Polygon(points=[22, -70; 24, -74; 30, -74; 32, -70; 22, -70], style(
              color=73, fillColor=71)), 
        Rectangle(extent=[-64, -56; -62, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[-62, -66; -60, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[-68, -66; -66, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[-70, -62; -68, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[-64, -62; -62, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[-68, -56; -66, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[-64, -50; -66, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[-68, -42; -66, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[-64, -36; -66, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[-68, -32; -66, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[-64, -24; -62, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[-68, -18; -66, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[-64, -8; -62, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[-68, 0; -66, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[-62, 12; -60, 10], style(color=69, fillColor=69)), 
        Polygon(points=[-70, -70; -68, -74; -62, -74; -60, -70; -70, -70], 
            style(color=73, fillColor=71)), 
        Rectangle(extent=[-64, -56; -62, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[-62, -66; -60, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[-68, -66; -66, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[-70, -62; -68, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[-64, -62; -62, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[-68, -56; -66, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[-64, -50; -66, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[-68, -42; -66, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[-64, -36; -66, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[-68, -32; -66, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[-64, -24; -62, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[-68, -18; -66, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[-64, -8; -62, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[-68, 0; -66, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[-62, 12; -60, 10], style(color=69, fillColor=69)), 
        Polygon(points=[-52, -70; -50, -74; -44, -74; -42, -70; -52, -70], 
            style(color=73, fillColor=71)), 
        Rectangle(extent=[-46, -56; -44, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[-44, -66; -42, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[-50, -66; -48, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[-52, -62; -50, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[-46, -62; -44, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[-50, -56; -48, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[-46, -50; -48, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[-50, -42; -48, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[-46, -36; -48, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[-50, -32; -48, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[-46, -24; -44, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[-50, -18; -48, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[-46, -8; -44, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[-50, 0; -48, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[-44, 12; -42, 10], style(color=69, fillColor=69)), 
        Polygon(points=[-32, -70; -30, -74; -24, -74; -22, -70; -32, -70], 
            style(color=73, fillColor=71)), 
        Rectangle(extent=[-26, -56; -24, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[-24, -66; -22, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[-30, -66; -28, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[-32, -62; -30, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[-26, -62; -24, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[-30, -56; -28, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[-26, -50; -28, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[-30, -42; -28, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[-26, -36; -28, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[-30, -32; -28, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[-26, -24; -24, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[-30, -18; -28, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[-26, -8; -24, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[-30, 0; -28, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[-24, 12; -22, 10], style(color=69, fillColor=69)), 
        Polygon(points=[-14, -70; -12, -74; -6, -74; -4, -70; -14, -70], style(
              color=73, fillColor=71)), 
        Rectangle(extent=[-8, -56; -6, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[-6, -66; -4, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[-12, -66; -10, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[-14, -62; -12, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[-8, -62; -6, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[-12, -56; -10, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[-8, -50; -10, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[-12, -42; -10, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[-8, -36; -10, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[-12, -32; -10, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[-8, -24; -6, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[-12, -18; -10, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[-8, -8; -6, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[-12, 0; -10, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[-6, 12; -4, 10], style(color=69, fillColor=69)), 
        Polygon(points=[4, -70; 6, -74; 12, -74; 14, -70; 4, -70], style(color=
                73, fillColor=71)), 
        Rectangle(extent=[10, -56; 12, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[12, -66; 14, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[6, -66; 8, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[4, -62; 6, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[10, -62; 12, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[6, -56; 8, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[10, -50; 8, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[6, -42; 8, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[10, -36; 8, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[6, -32; 8, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[10, -24; 12, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[6, -18; 8, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[10, -8; 12, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[6, 0; 8, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[12, 12; 14, 10], style(color=69, fillColor=69)), 
        Polygon(points=[22, -70; 24, -74; 30, -74; 32, -70; 22, -70], style(
              color=73, fillColor=71)), 
        Rectangle(extent=[28, -56; 30, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[30, -66; 32, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[24, -66; 26, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[22, -62; 24, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[28, -62; 30, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[24, -56; 26, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[28, -50; 26, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[24, -42; 26, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[28, -36; 26, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[24, -32; 26, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[28, -24; 30, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[24, -18; 26, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[28, -8; 30, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[24, 0; 26, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[30, 12; 32, 10], style(color=69, fillColor=69)), 
        Polygon(points=[42, -70; 44, -74; 50, -74; 52, -70; 42, -70], style(
              color=73, fillColor=71)), 
        Rectangle(extent=[48, -56; 50, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[50, -66; 52, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[44, -66; 46, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[42, -62; 44, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[48, -62; 50, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[44, -56; 46, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[48, -50; 46, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[44, -42; 46, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[48, -36; 46, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[44, -32; 46, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[48, -24; 50, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[44, -18; 46, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[40, -8; 38, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[44, 0; 46, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[50, 12; 52, 10], style(color=69, fillColor=69)), 
        Polygon(points=[60, -70; 62, -74; 68, -74; 70, -70; 60, -70], style(
              color=73, fillColor=71)), 
        Rectangle(extent=[66, -56; 68, -58], style(color=69, fillColor=70)), 
        Rectangle(extent=[68, -66; 70, -68], style(color=69, fillColor=70)), 
        Rectangle(extent=[62, -66; 64, -68], style(color=69, fillColor=69)), 
        Rectangle(extent=[60, -62; 62, -64], style(color=69, fillColor=70)), 
        Rectangle(extent=[66, -62; 68, -64], style(color=69, fillColor=69)), 
        Rectangle(extent=[62, -56; 64, -58], style(color=69, fillColor=69)), 
        Rectangle(extent=[66, -50; 64, -48], style(color=69, fillColor=69)), 
        Rectangle(extent=[62, -42; 64, -44], style(color=69, fillColor=70)), 
        Rectangle(extent=[66, -36; 64, -38], style(color=69, fillColor=73)), 
        Rectangle(extent=[62, -32; 64, -34], style(color=69, fillColor=70)), 
        Rectangle(extent=[66, -24; 68, -26], style(color=69, fillColor=69)), 
        Rectangle(extent=[62, -18; 64, -20], style(color=69, fillColor=69)), 
        Rectangle(extent=[66, -8; 68, -10], style(color=69, fillColor=70)), 
        Rectangle(extent=[62, 0; 64, -2], style(color=69, fillColor=69)), 
        Rectangle(extent=[68, 12; 70, 10], style(color=69, fillColor=69)), 
        Rectangle(extent=[54, -6; 57, 40], style(color=0, fillColor=8)), 
        Ellipse(extent=[50, -6; 60, -16], style(
            color=0, 
            thickness=2, 
            fillColor=8)), 
        Rectangle(extent=[-56, -6; -53, 40], style(color=0, fillColor=8)), 
        Ellipse(extent=[-60, -6; -50, -16], style(
            color=0, 
            thickness=2, 
            fillColor=8)), 
        Line(points=[-90, 40; -53, 40], style(color=0))));
  end nitri;
  partial model preclar1 "Icon for a dynamic preclarifier tank" 
    
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Rectangle(extent=[-90, 6; -80, -6], style(color=47, fillColor=47)), 
        Rectangle(extent=[80, 6; 90, -6], style(color=47, fillColor=47)), 
        Line(points=[-90, -6; -80, -6], style(color=0, thickness=2)), 
        Line(points=[-90, 6; -80, 6], style(color=0, thickness=2)), 
        Line(points=[80, 6; 90, 6], style(color=0, thickness=2)), 
        Line(points=[80, -6; 90, -6], style(color=0, thickness=2)), 
        Rectangle(extent=[-80, 84; 80, -80], style(gradient=2, fillColor=47)), 
        Rectangle(extent=[-90, 86; 84, 28], style(color=7, fillColor=7)), 
        Line(points=[-80, -6; -80, -80; 80, -80; 80, -6], style(color=0, 
              thickness=2)), 
        Line(points=[-44, -48; 50, -48], style(color=0)), 
        Line(points=[-38, 12; -38, -52], style(color=0)), 
        Rectangle(extent=[-80, 28; 80, 8], style(color=47, fillColor=47)), 
        Line(points=[-80, 28; -80, 6], style(color=0, thickness=2)), 
        Line(points=[80, 28; 80, 6], style(color=0, thickness=2)), 
        Line(points=[-38, -48; -36, -44; -34, -40; -32, -36; -30, -32; -26, -26
              ; -24, -24; -22, -22; -18, -18; -14, -14; -12, -12; -10, -10; -6
              , -8; -2, -6; 2, -4; 8, -2; 14, 0; 20, 0; 24, 0; 28, 0], style(
              color=0)), 
        Line(points=[38, 90; 38, 14], style(color=9)), 
        Text(extent=[-100, 80; 38, 40], string="%name")), 
      Documentation(info="Icon for a dynamic preclarifier tank "), 
      Diagram(
        Rectangle(extent=[-90, 6; -80, -6], style(color=47, fillColor=47)), 
        Rectangle(extent=[80, 6; 90, -6], style(color=47, fillColor=47)), 
        Line(points=[-90, -6; -80, -6], style(color=0, thickness=2)), 
        Line(points=[-90, 6; -80, 6], style(color=0, thickness=2)), 
        Line(points=[80, 6; 90, 6], style(color=0, thickness=2)), 
        Line(points=[80, -6; 90, -6], style(color=0, thickness=2)), 
        Rectangle(extent=[-80, 84; 80, -80], style(gradient=2, fillColor=47)), 
        Line(points=[-80, -6; -80, -80; 80, -80; 80, -6], style(color=0, 
              thickness=2)), 
        Line(points=[-44, -48; 50, -48], style(color=0)), 
        Line(points=[-38, 12; -38, -52], style(color=0)), 
        Rectangle(extent=[-80, 28; 80, 8], style(color=47, fillColor=47)), 
        Line(points=[-80, 28; -80, 6], style(color=0, thickness=2)), 
        Line(points=[80, 28; 80, 6], style(color=0, thickness=2)), 
        Line(points=[-38, -48; -36, -44; -34, -40; -32, -36; -30, -32; -26, -26
              ; -24, -24; -22, -22; -18, -18; -14, -14; -12, -12; -10, -10; -6
              , -8; -2, -6; 2, -4; 8, -2; 14, 0; 20, 0; 24, 0; 28, 0], style(
              color=0)), 
        Rectangle(extent=[-90, 86; 84, 28], style(color=7, fillColor=7)), 
        Text(extent=[-100, 80; 38, 40], string="%name"), 
        Line(points=[38, 90; 38, 14], style(color=9))));
  end preclar1;
  partial model preclar2 "Icon for a static preclarifier tank" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Rectangle(extent=[-90, 6; -80, -6], style(color=47, fillColor=47)), 
        Rectangle(extent=[80, 6; 90, -6], style(color=47, fillColor=47)), 
        Line(points=[-90, -6; -80, -6], style(color=0, thickness=2)), 
        Line(points=[-90, 6; -80, 6], style(color=0, thickness=2)), 
        Line(points=[80, 6; 90, 6], style(color=0, thickness=2)), 
        Line(points=[80, -6; 90, -6], style(color=0, thickness=2)), 
        Rectangle(extent=[-80, 84; 80, -80], style(gradient=2, fillColor=47)), 
        Rectangle(extent=[-90, 86; 84, 28], style(color=7, fillColor=7)), 
        Line(points=[-80, -6; -80, -80; 80, -80; 80, -6], style(color=0, 
              thickness=2)), 
        Line(points=[-44, -48; 50, -48], style(color=0)), 
        Line(points=[-38, 12; -38, -52], style(color=0)), 
        Rectangle(extent=[-80, 28; 80, 8], style(color=47, fillColor=47)), 
        Line(points=[-80, 28; -80, 6], style(color=0, thickness=2)), 
        Line(points=[80, 28; 80, 6], style(color=0, thickness=2)), 
        Line(points=[-38, -14; 40, -14], style(color=0, fillColor=0)), 
        Line(points=[38, 90; 38, 14], style(color=9)), 
        Text(extent=[-100, 80; 40, 40], string="%name")), 
      Documentation(info="Icon for a static preclarifier tank "), 
      Diagram(
        Rectangle(extent=[-90, 6; -80, -6], style(color=47, fillColor=47)), 
        Rectangle(extent=[80, 6; 90, -6], style(color=47, fillColor=47)), 
        Line(points=[-90, -6; -80, -6], style(color=0, thickness=2)), 
        Line(points=[-90, 6; -80, 6], style(color=0, thickness=2)), 
        Line(points=[80, 6; 90, 6], style(color=0, thickness=2)), 
        Line(points=[80, -6; 90, -6], style(color=0, thickness=2)), 
        Rectangle(extent=[-80, 84; 80, -80], style(gradient=2, fillColor=47)), 
        Rectangle(extent=[-90, 86; 84, 28], style(color=7, fillColor=7)), 
        Line(points=[-80, -6; -80, -80; 80, -80; 80, -6], style(color=0, 
              thickness=2)), 
        Line(points=[-44, -48; 50, -48], style(color=0)), 
        Line(points=[-38, 12; -38, -52], style(color=0)), 
        Rectangle(extent=[-80, 28; 80, 8], style(color=47, fillColor=47)), 
        Line(points=[-80, 28; -80, 6], style(color=0, thickness=2)), 
        Line(points=[80, 28; 80, 6], style(color=0, thickness=2)), 
        Line(points=[-38, -14; 40, -14], style(color=0, fillColor=0)), 
        Line(points=[38, 90; 38, 14], style(color=9)), 
        Text(extent=[-98, 80; 38, 40], string="%name")));
  end preclar2;
  partial model precipitation "Icon for a precipitation tank" 
    
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[1, 1], 
        component=[20, 20]), 
      Icon(
        Rectangle(extent=[-60, 20; 60, -50], style(color=7, fillColor=48)), 
        Line(points=[-60, -6; -60, -50; 60, -50; 60, -6], style(color=0, 
              thickness=2)), 
        Line(points=[-60, 6; -60, 19], style(color=0, thickness=2)), 
        Line(points=[59, 5; 59, 19], style(color=0, thickness=2)), 
        Rectangle(extent=[-90, 6; -59, -6], style(color=48, fillColor=48)), 
        Rectangle(extent=[56, 6; 90, -6], style(color=48, fillColor=48)), 
        Line(points=[-90, -6; -60, -6], style(color=0, thickness=2)), 
        Line(points=[-90, 6; -60, 6], style(color=0, thickness=2)), 
        Line(points=[59, 6; 90, 6], style(color=0, thickness=2)), 
        Line(points=[60, -6; 90, -6], style(color=0, thickness=2)), 
        Text(extent=[-100, -59; 100, -100], string="%name"), 
        Polygon(points=[-49, -36; -47, -40; -45, -40; -39, -38; -43, -36; -47, 
              -32; -49, -36], style(color=9, fillColor=9)), 
        Polygon(points=[-26, -6; -24, -10; -22, -10; -16, -8; -18, -4; -24, -2
              ; -26, -6], style(color=9, fillColor=9)), 
        Polygon(points=[-30, -28; -28, -32; -24, -32; -24, -28; -20, -26; -28, 
              -24; -30, -28], style(color=9, fillColor=9)), 
        Polygon(points=[-1, -11; 5, -7; 5, -14; 0, -1; -1, -11], style(color=9
              , fillColor=9)), 
        Polygon(points=[40, -34; 42, -38; 46, -38; 46, -34; 50, -32; 42, -30; 
              40, -34], style(color=9, fillColor=9)), 
        Polygon(points=[12, -35; 14, -39; 18, -39; 18, -35; 22, -33; 16, -33; 
              12, -35], style(color=9, fillColor=9)), 
        Polygon(points=[15, -17; 17, -23; 21, -23; 21, -17; 23, -15; 15, -15; 
              15, -17], style(color=9, fillColor=9)), 
        Rectangle(extent=[-6, 57; 6, 5], style(gradient=1, fillColor=8)), 
        Polygon(points=[-30, 85; 30, 85; 6, 57; -6, 57; -30, 85], style(color=8
              , fillColor=8)), 
        Line(points=[-30, 85; -6, 57], style(color=0)), 
        Line(points=[30, 85; 6, 57], style(color=0)), 
        Rectangle(extent=[-46, -6; -43, 40], style(color=0, fillColor=8)), 
        Ellipse(extent=[-50, -6; -40, -16], style(
            color=0, 
            thickness=2, 
            fillColor=8)), 
        Line(points=[-90, 40; -43, 40], style(color=0)), 
        Rectangle(extent=[44, -6; 47, 44], style(color=0, fillColor=8)), 
        Ellipse(extent=[41, -6; 51, -16], style(
            color=0, 
            thickness=2, 
            fillColor=8)), 
        Line(points=[44, 44; 50, 44], style(color=0))), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Diagram(
        Rectangle(extent=[-60, 20; 60, -50], style(color=7, fillColor=48)), 
        Line(points=[-60, -6; -60, -50; 60, -50; 60, -6], style(color=0, 
              thickness=2)), 
        Line(points=[-60, 6; -60, 19], style(color=0, thickness=2)), 
        Line(points=[59, 5; 59, 19], style(color=0, thickness=2)), 
        Rectangle(extent=[-90, 6; -59, -6], style(color=48, fillColor=48)), 
        Rectangle(extent=[56, 6; 90, -6], style(color=48, fillColor=48)), 
        Line(points=[-90, -6; -60, -6], style(color=0, thickness=2)), 
        Line(points=[-90, 6; -60, 6], style(color=0, thickness=2)), 
        Line(points=[59, 6; 90, 6], style(color=0, thickness=2)), 
        Line(points=[60, -6; 90, -6], style(color=0, thickness=2)), 
        Text(extent=[-101, -59; 99, -98], string="%name"), 
        Polygon(points=[-49, -36; -47, -40; -45, -40; -39, -38; -43, -36; -47, 
              -32; -49, -36], style(color=9, fillColor=9)), 
        Polygon(points=[-26, -6; -24, -10; -22, -10; -16, -8; -18, -4; -24, -2
              ; -26, -6], style(color=9, fillColor=9)), 
        Polygon(points=[-30, -28; -28, -32; -24, -32; -24, -28; -20, -26; -28, 
              -24; -30, -28], style(color=9, fillColor=9)), 
        Polygon(points=[-1, -11; 5, -7; 5, -14; 0, -1; -1, -11], style(color=9
              , fillColor=9)), 
        Polygon(points=[40, -34; 42, -38; 46, -38; 46, -34; 50, -32; 42, -30; 
              40, -34], style(color=9, fillColor=9)), 
        Polygon(points=[12, -35; 14, -39; 18, -39; 18, -35; 22, -33; 16, -33; 
              12, -35], style(color=9, fillColor=9)), 
        Polygon(points=[15, -17; 17, -23; 21, -23; 21, -17; 23, -15; 15, -15; 
              15, -17], style(color=9, fillColor=9)), 
        Rectangle(extent=[-6, 57; 6, 5], style(gradient=1, fillColor=8)), 
        Polygon(points=[-30, 85; 30, 85; 6, 57; -6, 57; -30, 85], style(color=8
              , fillColor=8)), 
        Line(points=[-30, 85; -6, 57], style(color=0)), 
        Line(points=[30, 85; 6, 57], style(color=0)), 
        Rectangle(extent=[-46, -6; -43, 40], style(color=0, fillColor=8)), 
        Ellipse(extent=[-50, -6; -40, -16], style(
            color=0, 
            thickness=2, 
            fillColor=8)), 
        Line(points=[-90, 40; -43, 40], style(color=0)), 
        Rectangle(extent=[44, -6; 47, 44], style(color=0, fillColor=8)), 
        Ellipse(extent=[41, -6; 51, -16], style(
            color=0, 
            thickness=2, 
            fillColor=8)), 
        Line(points=[44, 44; 50, 44], style(color=0))), 
      Documentation(info="Icon for a precipitation tank"));
  end precipitation;
  partial model SecClar "Icon for a secondary clarifier" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Polygon(points=[-20, -70; 20, -70; 4, -84; -4, -84; -20, -70], style(
              color=46, fillColor=46)), 
        Rectangle(extent=[-4, -84; 4, -92], style(color=46, fillColor=46)), 
        Polygon(points=[-80, -48; -36, -64; 38, -64; 80, -48; -80, -48], style(
              color=46, fillColor=46)), 
        Rectangle(extent=[-80, 62; 80, 38], style(color=69, fillColor=69)), 
        Rectangle(extent=[-80, 38; 80, 16], style(color=72, fillColor=72)), 
        Rectangle(extent=[-80, -16; 80, -40], style(color=48, fillColor=48)), 
        Text(extent=[-100, 100; 100, 60], string="%name"), 
        Polygon(points=[-36, -64; 38, -64; 20, -70; -20, -70; -36, -64], style(
              color=46, fillColor=46)), 
        Line(points=[4, -92; 4, -84; 20, -70; 80, -48], style(color=0, 
              thickness=2)), 
        Rectangle(extent=[-80, -40; 80, -48], style(color=46, fillColor=46)), 
        Rectangle(extent=[80, 62; 92, 54], style(color=69, fillColor=69)), 
        Line(points=[80, 54; 92, 54], style(color=0, thickness=2)), 
        Line(points=[-4, -92; -4, -84; -20, -70; -80, -48; -80, 10], style(
              color=0, thickness=2)), 
        Line(points=[-80, 62; -80, 16], style(
            color=0, 
            thickness=2, 
            fillColor=0)), 
        Line(points=[-80, 10; -90, 10], style(color=0, thickness=2)), 
        Line(points=[-80, 16; -90, 16], style(color=0, thickness=2)), 
        Rectangle(extent=[0, 14; 2, 12], style(color=0, fillColor=0)), 
        Rectangle(extent=[0, 6; 2, 4], style(color=0, fillColor=0)), 
        Rectangle(extent=[0, -2; 2, -4], style(color=0, fillColor=0)), 
        Rectangle(extent=[0, -10; 2, -12], style(color=0, fillColor=0)), 
        Rectangle(extent=[-20, -92; 20, -98], style(color=46, fillColor=46)), 
        Line(points=[-20, -92; -4, -92], style(
            color=0, 
            thickness=2, 
            fillColor=0)), 
        Line(points=[-20, -98; 20, -98], style(color=0, thickness=2)), 
        Line(points=[20, -92; 4, -92], style(color=0, thickness=2)), 
        Line(points=[80, -48; 80, 54], style(color=0, thickness=2)), 
        Text(extent=[-100, -60; -40, -80], string="return"), 
        Text(extent=[40, -60; 100, -80], string="waste")), 
      Documentation(info="Icon for a secondary clarifier"));
  end SecClar;
  partial model SecClarKrebs 
    "Icon for a secondary clarifier based on Krebs model" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Polygon(points=[-20, -70; 20, -70; 4, -84; -4, -84; -20, -70], style(
              pattern=0, fillColor=48)), 
        Rectangle(extent=[-4, -84; 4, -92], style(pattern=0, fillColor=48)), 
        Polygon(points=[-80, -48; -36, -64; 38, -64; 80, -48; -80, -48], style(
              pattern=0, fillColor=48)), 
        Rectangle(extent=[-80, 62; 80, 16], style(color=69, fillColor=69)), 
        Rectangle(extent=[-80, 16; 80, -40], style(color=48, fillColor=48)), 
        Text(extent=[-100, 100; 100, 60], string="%name"), 
        Polygon(points=[-36, -64; 38, -64; 20, -70; -20, -70; -36, -64], style(
              pattern=0, fillColor=48)), 
        Line(points=[4, -92; 4, -84; 20, -70; 80, -48], style(color=0, 
              thickness=2)), 
        Rectangle(extent=[-80, -40; 80, -48], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[80, 62; 92, 54], style(color=69, fillColor=69)), 
        Line(points=[80, 54; 92, 54], style(color=0, thickness=2)), 
        Line(points=[-4, -92; -4, -84; -20, -70; -80, -48; -80, 10], style(
              color=0, thickness=2)), 
        Line(points=[-80, 62; -80, 16], style(
            color=0, 
            thickness=2, 
            fillColor=0)), 
        Line(points=[-80, 10; -90, 10], style(color=0, thickness=2)), 
        Line(points=[-80, 16; -90, 16], style(color=0, thickness=2)), 
        Rectangle(extent=[-20, -92; 20, -98], style(pattern=0, fillColor=48)), 
        Line(points=[-20, -92; -4, -92], style(
            color=0, 
            thickness=2, 
            fillColor=0)), 
        Line(points=[-20, -98; 20, -98], style(color=0, thickness=2)), 
        Line(points=[20, -92; 4, -92], style(color=0, thickness=2)), 
        Line(points=[80, -48; 80, 54], style(color=0, thickness=2)), 
        Text(extent=[-100, -60; -40, -80], string="return"), 
        Text(extent=[40, -60; 100, -80], string="waste"), 
        Polygon(points=[-30, -10; -26, -10; -26, -26; -20, -24; -28, -38; -36, 
              -24; -30, -26; -30, -10], style(pattern=0, fillColor=46)), 
        Polygon(points=[18, -28; 22, -28; 22, -44; 28, -42; 20, -56; 12, -42; 
              18, -44; 18, -28], style(pattern=0, fillColor=46)), 
        Rectangle(extent=[-90, 16; -80, 10], style(pattern=0, fillColor=48))), 
      Documentation(info="Icon for a secondary clarifier"));
  end SecClarKrebs;
  partial model SecClarSimple 
    "Icon for a secondary clarifier based on simple model" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Polygon(points=[-20, -70; 20, -70; 4, -84; -4, -84; -20, -70], style(
              pattern=0, fillColor=48)), 
        Rectangle(extent=[-4, -84; 4, -92], style(pattern=0, fillColor=48)), 
        Polygon(points=[-80, -48; -36, -64; 38, -64; 80, -48; -80, -48], style(
              pattern=0, fillColor=48)), 
        Rectangle(extent=[-80, 62; 80, -40], style(color=48, fillColor=48)), 
        Text(extent=[-98, 100; 100, 60], string="%name"), 
        Polygon(points=[-36, -64; 38, -64; 20, -70; -20, -70; -36, -64], style(
              pattern=0, fillColor=48)), 
        Line(points=[4, -92; 4, -84; 20, -70; 80, -48], style(color=0, 
              thickness=2)), 
        Rectangle(extent=[-80, -40; 80, -48], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[80, 62; 92, 54], style(color=69, fillColor=69)), 
        Line(points=[80, 54; 92, 54], style(color=0, thickness=2)), 
        Line(points=[-4, -92; -4, -84; -20, -70; -80, -48; -80, 10], style(
              color=0, thickness=2)), 
        Line(points=[-80, 62; -80, 16], style(
            color=0, 
            thickness=2, 
            fillColor=0)), 
        Line(points=[-80, 10; -90, 10], style(color=0, thickness=2)), 
        Line(points=[-80, 16; -90, 16], style(color=0, thickness=2)), 
        Rectangle(extent=[-20, -92; 20, -98], style(pattern=0, fillColor=48)), 
        Line(points=[-20, -92; -4, -92], style(
            color=0, 
            thickness=2, 
            fillColor=0)), 
        Line(points=[-20, -98; 20, -98], style(color=0, thickness=2)), 
        Line(points=[20, -92; 4, -92], style(color=0, thickness=2)), 
        Line(points=[80, -48; 80, 54], style(color=0, thickness=2)), 
        Text(extent=[-100, -60; -40, -80], string="return"), 
        Text(extent=[40, -60; 100, -80], string="waste"), 
        Polygon(points=[16, 44; 33, 44; 31, 52; 48, 42; 31, 31; 33, 39; 16, 39
              ; 16, 44], style(pattern=0, fillColor=69)), 
        Polygon(points=[-46, 32; -29, 32; -31, 40; -14, 30; -31, 19; -29, 27; -
              46, 27; -46, 32], style(pattern=0, fillColor=69)), 
        Polygon(points=[18, -26; 22, -26; 22, -42; 28, -40; 20, -54; 12, -40; 
              18, -42; 18, -26], style(pattern=0, fillColor=46)), 
        Polygon(points=[-32, -10; -28, -10; -28, -26; -22, -24; -30, -38; -38, 
              -24; -32, -26; -32, -10], style(pattern=0, fillColor=46)), 
        Rectangle(extent=[-90, 16; -80, 10], style(pattern=0, fillColor=48))), 
      Documentation(info="Icon for a secondary clarifier"));
  end SecClarSimple;
  partial model blower "Icon for an air blower" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[1, 1], 
        component=[25, 25]), 
      Documentation(info="Icon for an air blower"), 
      Icon(
        Text(extent=[-101, -70; 70, -99], string="%name"), 
        Rectangle(extent=[-90, 10; -10, -68], style(gradient=1, fillColor=8)), 
        Ellipse(extent=[-87, 7; -13, -65], style(gradient=3, fillColor=10)), 
        Rectangle(extent=[-80, -74; -60, -68], style(color=0, fillColor=0)), 
        Ellipse(extent=[-84, 5; -16, -63], style(pattern=0, fillColor=71)), 
        Polygon(points=[-51, -24; -24, -9; -47, -25; -51, -24], style(color=10
              , fillColor=8)), 
        Polygon(points=[-53, -35; -73, -53; -49, -35; -53, -35], style(color=10
              , fillColor=8)), 
        Polygon(points=[-48, -29; -28, -51; -48, -33; -48, -29], style(color=10
              , fillColor=8)), 
        Polygon(points=[-56, -32; -72, -6; -56, -27; -56, -32], style(color=10
              , fillColor=8)), 
        Polygon(points=[-46, -26; -18, -33; -46, -29; -46, -26], style(
            color=10, 
            gradient=3, 
            fillColor=8)), 
        Polygon(points=[-46, -34; -50, -60; -49, -34; -46, -34], style(color=10
              , fillColor=8)), 
        Polygon(points=[-54, -35; -82, -27; -54, -32; -54, -35], style(color=10
              , fillColor=8)), 
        Polygon(points=[-56, -26; -48, 3; -52, -26; -56, -26], style(color=10, 
              fillColor=8)), 
        Ellipse(extent=[-58, -23; -44, -36], style(
            color=0, 
            gradient=3, 
            fillColor=8)), 
        Rectangle(extent=[-86, -53; -12, -55], style(gradient=2, fillColor=8))
          , 
        Rectangle(extent=[-87, -19; -12, -21], style(gradient=2, fillColor=8))
          , 
        Rectangle(extent=[-87, -2; -12, -4], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[12, 32; 48, 10], style(
            pattern=0, 
            gradient=1, 
            fillColor=8)), 
        Ellipse(extent=[12, 52; 48, 17], style(
            pattern=0, 
            gradient=3, 
            fillColor=8)), 
        Rectangle(extent=[-66, 34; -34, 16], style(pattern=0, fillColor=71)), 
        Polygon(points=[-49, 40; -52, 35; -50, 35; -50, 22; -48, 22; -48, 35; -
              46, 35; -49, 40], style(pattern=0, fillColor=68)), 
        Rectangle(extent=[-87, -38; -12, -40], style(gradient=2, fillColor=8))
          , 
        Rectangle(extent=[-68, 33; -32, 10], style(
            pattern=0, 
            gradient=1, 
            fillColor=8)), 
        Ellipse(extent=[-68, 52; -32, 18], style(
            pattern=0, 
            gradient=3, 
            fillColor=8)), 
        Ellipse(extent=[-65, 50; -34, 19], style(pattern=0, fillColor=71)), 
        Rectangle(extent=[-53, 52; 31, 29], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-54, 49; 29, 32], style(pattern=0, fillColor=71)), 
        Rectangle(extent=[-65, 35; -35, 16], style(pattern=0, fillColor=71)), 
        Rectangle(extent=[15, 34; 45, 16], style(pattern=0, fillColor=71)), 
        Rectangle(extent=[-27, 90; 7, 52], style(gradient=1, fillColor=8)), 
        Rectangle(extent=[-24, 83; 4, 48], style(pattern=0, fillColor=71)), 
        Ellipse(extent=[16, 49; 45, 19], style(pattern=0, fillColor=71)), 
        Rectangle(extent=[-10, 10; 70, -68], style(gradient=1, fillColor=8)), 
        Ellipse(extent=[-7, 7; 67, -65], style(gradient=3, fillColor=10)), 
        Rectangle(extent=[40, -74; 60, -68], style(color=0, fillColor=0)), 
        Ellipse(extent=[-4, 5; 64, -63], style(pattern=0, fillColor=71)), 
        Polygon(points=[29, -24; 56, -9; 33, -25; 29, -24], style(color=10, 
              fillColor=8)), 
        Polygon(points=[27, -35; 7, -53; 31, -35; 27, -35], style(color=10, 
              fillColor=8)), 
        Polygon(points=[32, -29; 52, -51; 32, -33; 32, -29], style(color=10, 
              fillColor=8)), 
        Polygon(points=[24, -32; 8, -6; 24, -27; 24, -32], style(color=10, 
              fillColor=8)), 
        Polygon(points=[34, -26; 62, -33; 34, -29; 34, -26], style(
            color=10, 
            gradient=3, 
            fillColor=8)), 
        Polygon(points=[34, -34; 30, -60; 31, -34; 34, -34], style(color=10, 
              fillColor=8)), 
        Polygon(points=[26, -35; -2, -27; 26, -32; 26, -35], style(color=10, 
              fillColor=8)), 
        Polygon(points=[24, -26; 32, 3; 28, -26; 24, -26], style(color=10, 
              fillColor=8)), 
        Ellipse(extent=[22, -23; 36, -36], style(
            color=0, 
            gradient=3, 
            fillColor=8)), 
        Rectangle(extent=[-8, -53; 66, -55], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-8, -19; 66, -21], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-8, -2; 66, -4], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-8, -38; 66, -40], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[70, -13; 80, -47], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[80, -27; 87, -33], style(gradient=2, fillColor=9)), 
        Rectangle(extent=[85, -21; 88, -39], style(gradient=2, fillColor=10)), 
        Polygon(points=[-49, 41; -55, 35; -51, 35; -51, 22; -48, 22; -48, 35; -
              44, 35; -49, 41], style(pattern=0, fillColor=68)), 
        Polygon(points=[29, 41; 23, 35; 27, 35; 27, 22; 30, 22; 30, 35; 34, 35
              ; 29, 41], style(pattern=0, fillColor=68)), 
        Polygon(points=[-11, 74; -16, 68; -12, 68; -12, 55; -9, 55; -9, 68; -5
              , 68; -11, 74], style(pattern=0, fillColor=68))), 
      Diagram(
        Text(extent=[-98, -70; 70, -100], string="%name"), 
        Rectangle(extent=[-90, 10; -10, -68], style(gradient=1, fillColor=8)), 
        Ellipse(extent=[-87, 7; -13, -65], style(gradient=3, fillColor=10)), 
        Rectangle(extent=[-80, -74; -60, -68], style(color=0, fillColor=0)), 
        Ellipse(extent=[-84, 5; -16, -63], style(pattern=0, fillColor=71)), 
        Polygon(points=[-51, -24; -24, -9; -47, -25; -51, -24], style(color=10
              , fillColor=8)), 
        Polygon(points=[-53, -35; -73, -53; -49, -35; -53, -35], style(color=10
              , fillColor=8)), 
        Polygon(points=[-48, -29; -28, -51; -48, -33; -48, -29], style(color=10
              , fillColor=8)), 
        Polygon(points=[-56, -32; -72, -6; -56, -27; -56, -32], style(color=10
              , fillColor=8)), 
        Polygon(points=[-46, -26; -18, -33; -46, -29; -46, -26], style(
            color=10, 
            gradient=3, 
            fillColor=8)), 
        Polygon(points=[-46, -34; -50, -60; -49, -34; -46, -34], style(color=10
              , fillColor=8)), 
        Polygon(points=[-54, -35; -82, -27; -54, -32; -54, -35], style(color=10
              , fillColor=8)), 
        Polygon(points=[-56, -26; -48, 3; -52, -26; -56, -26], style(color=10, 
              fillColor=8)), 
        Ellipse(extent=[-58, -23; -44, -36], style(
            color=0, 
            gradient=3, 
            fillColor=8)), 
        Rectangle(extent=[-86, -53; -12, -55], style(gradient=2, fillColor=8))
          , 
        Rectangle(extent=[-87, -19; -12, -21], style(gradient=2, fillColor=8))
          , 
        Rectangle(extent=[-87, -2; -12, -4], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[12, 32; 48, 10], style(
            pattern=0, 
            gradient=1, 
            fillColor=8)), 
        Ellipse(extent=[12, 52; 48, 17], style(
            pattern=0, 
            gradient=3, 
            fillColor=8)), 
        Rectangle(extent=[-66, 34; -34, 16], style(pattern=0, fillColor=71)), 
        Polygon(points=[-49, 40; -52, 35; -50, 35; -50, 22; -48, 22; -48, 35; -
              46, 35; -49, 40], style(pattern=0, fillColor=68)), 
        Rectangle(extent=[-87, -38; -12, -40], style(gradient=2, fillColor=8))
          , 
        Rectangle(extent=[-68, 33; -32, 10], style(
            pattern=0, 
            gradient=1, 
            fillColor=8)), 
        Ellipse(extent=[-68, 52; -32, 18], style(
            pattern=0, 
            gradient=3, 
            fillColor=8)), 
        Ellipse(extent=[-65, 50; -34, 19], style(pattern=0, fillColor=71)), 
        Rectangle(extent=[-53, 52; 31, 29], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-54, 49; 29, 32], style(pattern=0, fillColor=71)), 
        Rectangle(extent=[-65, 35; -35, 16], style(pattern=0, fillColor=71)), 
        Rectangle(extent=[15, 34; 45, 16], style(pattern=0, fillColor=71)), 
        Rectangle(extent=[-27, 90; 7, 52], style(gradient=1, fillColor=8)), 
        Rectangle(extent=[-24, 83; 4, 48], style(pattern=0, fillColor=71)), 
        Ellipse(extent=[16, 49; 45, 19], style(pattern=0, fillColor=71)), 
        Rectangle(extent=[-10, 10; 70, -68], style(gradient=1, fillColor=8)), 
        Ellipse(extent=[-7, 7; 67, -65], style(gradient=3, fillColor=10)), 
        Rectangle(extent=[40, -74; 60, -68], style(color=0, fillColor=0)), 
        Ellipse(extent=[-4, 5; 64, -63], style(pattern=0, fillColor=71)), 
        Polygon(points=[29, -24; 56, -9; 33, -25; 29, -24], style(color=10, 
              fillColor=8)), 
        Polygon(points=[27, -35; 7, -53; 31, -35; 27, -35], style(color=10, 
              fillColor=8)), 
        Polygon(points=[32, -29; 52, -51; 32, -33; 32, -29], style(color=10, 
              fillColor=8)), 
        Polygon(points=[24, -32; 8, -6; 24, -27; 24, -32], style(color=10, 
              fillColor=8)), 
        Polygon(points=[34, -26; 62, -33; 34, -29; 34, -26], style(
            color=10, 
            gradient=3, 
            fillColor=8)), 
        Polygon(points=[34, -34; 30, -60; 31, -34; 34, -34], style(color=10, 
              fillColor=8)), 
        Polygon(points=[26, -35; -2, -27; 26, -32; 26, -35], style(color=10, 
              fillColor=8)), 
        Polygon(points=[24, -26; 32, 3; 28, -26; 24, -26], style(color=10, 
              fillColor=8)), 
        Ellipse(extent=[22, -23; 36, -36], style(
            color=0, 
            gradient=3, 
            fillColor=8)), 
        Rectangle(extent=[-8, -53; 66, -55], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-8, -19; 66, -21], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-8, -2; 66, -4], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-8, -38; 66, -40], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[70, -13; 80, -47], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[80, -27; 87, -33], style(gradient=2, fillColor=9)), 
        Rectangle(extent=[85, -21; 88, -39], style(gradient=2, fillColor=10)), 
        Polygon(points=[-49, 41; -55, 35; -51, 35; -51, 22; -48, 22; -48, 35; -
              44, 35; -49, 41], style(pattern=0, fillColor=68)), 
        Polygon(points=[29, 41; 23, 35; 27, 35; 27, 22; 30, 22; 30, 35; 34, 35
              ; 29, 41], style(pattern=0, fillColor=68)), 
        Polygon(points=[-11, 74; -16, 68; -12, 68; -12, 55; -9, 55; -9, 68; -5
              , 68; -11, 74], style(pattern=0, fillColor=68))), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49));
  end blower;
  partial model pump "Icon for a wastewater pump" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[1, 1], 
        component=[20, 20]), 
      Documentation(info="Icon for a wastewater pump "), 
      Icon(
        Text(extent=[-90, 99; 90, 59], string="%name"), 
        Rectangle(extent=[-60, 55; 60, -55], style(gradient=1, fillColor=9)), 
        Rectangle(extent=[-90, -50; 0, -15], style(gradient=2, fillColor=0)), 
        Rectangle(extent=[0, 46; 90, 10], style(gradient=2, fillColor=0)), 
        Ellipse(extent=[-51, 50; 51, -51], style(gradient=3, fillColor=10)), 
        Ellipse(extent=[-48, 47; 48, -48], style(color=0, fillColor=48)), 
        Rectangle(extent=[-90, -18; 0, -47], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[0, 43; 90, 13], style(pattern=0, fillColor=48)), 
        Polygon(points=[4, 9; 40, 20; 8, 7; 4, 9], style(color=10, fillColor=8)
          ), 
        Polygon(points=[-7, -11; -34, -28; -1, -11; -7, -11], style(color=10, 
              fillColor=8)), 
        Polygon(points=[8, -2; 22, -37; 8, -10; 8, -2], style(color=10, 
              fillColor=8)), 
        Polygon(points=[-10, -1; -24, 34; -10, 6; -10, -1], style(color=10, 
              fillColor=8)), 
        Polygon(points=[10, 3; 41, -13; 11, -1; 10, 3], style(
            color=10, 
            gradient=3, 
            fillColor=8)), 
        Polygon(points=[6, -10; -8, -43; 1, -12; 6, -10], style(color=10, 
              fillColor=8)), 
        Polygon(points=[-7, -8; -43, 8; -9, -3; -7, -8], style(color=10, 
              fillColor=8)), 
        Polygon(points=[-7, 3; 8, 41; -2, 6; -7, 3], style(color=10, fillColor=
                8)), 
        Ellipse(extent=[-14, 11; 13, -14], style(
            color=0, 
            gradient=3, 
            fillColor=8)), 
        Ellipse(extent=[-3, 1; 2, -4], style(
            color=0, 
            gradient=3, 
            fillColor=0)), 
        Rectangle(extent=[-40, -60; -20, -55], style(color=0, fillColor=0)), 
        Rectangle(extent=[20, -60; 40, -55], style(color=0, fillColor=0)), 
        Rectangle(extent=[-70, 41; -60, 9], style(gradient=2, fillColor=8)), 
        Polygon(points=[-80, -30; -63, -30; -65, -22; -48, -32; -65, -43; -63, 
              -35; -80, -35; -80, -30], style(pattern=0, fillColor=46)), 
        Rectangle(extent=[-40, 55; -20, 60], style(color=0, fillColor=0)), 
        Rectangle(extent=[20, 55; 40, 60], style(color=0, fillColor=0)), 
        Rectangle(extent=[-74, 28; -70, 22], style(gradient=2, fillColor=10)), 
        Rectangle(extent=[-78, 33; -74, 17], style(gradient=3, fillColor=10)), 
        Polygon(points=[51, 31; 68, 31; 65, 40; 83, 29; 65, 17; 68, 26; 51, 26
              ; 51, 31], style(pattern=0, fillColor=46))), 
      Diagram(
        Text(extent=[-90, 99; 90, 59], string="%name"), 
        Rectangle(extent=[-60, 55; 60, -55], style(gradient=1, fillColor=9)), 
        Rectangle(extent=[-90, -50; 0, -15], style(gradient=2, fillColor=0)), 
        Rectangle(extent=[0, 46; 90, 10], style(gradient=2, fillColor=0)), 
        Ellipse(extent=[-51, 50; 51, -51], style(gradient=3, fillColor=10)), 
        Ellipse(extent=[-48, 47; 48, -48], style(color=0, fillColor=48)), 
        Rectangle(extent=[-90, -18; 0, -47], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[0, 43; 90, 13], style(pattern=0, fillColor=48)), 
        Polygon(points=[4, 9; 40, 20; 8, 7; 4, 9], style(color=10, fillColor=8)
          ), 
        Polygon(points=[-7, -11; -34, -28; -1, -11; -7, -11], style(color=10, 
              fillColor=8)), 
        Polygon(points=[8, -2; 22, -37; 8, -10; 8, -2], style(color=10, 
              fillColor=8)), 
        Polygon(points=[-10, -1; -24, 34; -10, 6; -10, -1], style(color=10, 
              fillColor=8)), 
        Polygon(points=[10, 3; 41, -13; 11, -1; 10, 3], style(
            color=10, 
            gradient=3, 
            fillColor=8)), 
        Polygon(points=[6, -10; -8, -43; 1, -12; 6, -10], style(color=10, 
              fillColor=8)), 
        Polygon(points=[-7, -8; -43, 8; -9, -3; -7, -8], style(color=10, 
              fillColor=8)), 
        Polygon(points=[-7, 3; 8, 41; -2, 6; -7, 3], style(color=10, fillColor=
                8)), 
        Ellipse(extent=[-14, 11; 13, -14], style(
            color=0, 
            gradient=3, 
            fillColor=8)), 
        Ellipse(extent=[-3, 1; 2, -4], style(
            color=0, 
            gradient=3, 
            fillColor=0)), 
        Rectangle(extent=[-40, -60; -20, -55], style(color=0, fillColor=0)), 
        Rectangle(extent=[20, -60; 40, -55], style(color=0, fillColor=0)), 
        Rectangle(extent=[-70, 41; -60, 9], style(gradient=2, fillColor=8)), 
        Polygon(points=[-80, -30; -63, -30; -65, -22; -48, -32; -65, -43; -63, 
              -35; -80, -35; -80, -30], style(pattern=0, fillColor=46)), 
        Rectangle(extent=[-40, 55; -20, 60], style(color=0, fillColor=0)), 
        Rectangle(extent=[20, 55; 40, 60], style(color=0, fillColor=0)), 
        Rectangle(extent=[-74, 28; -70, 22], style(gradient=2, fillColor=10)), 
        Rectangle(extent=[-78, 33; -74, 17], style(gradient=3, fillColor=10)), 
        Polygon(points=[51, 31; 68, 31; 65, 40; 83, 29; 65, 17; 68, 26; 51, 26
              ; 51, 31], style(pattern=0, fillColor=46))), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49));
  end pump;
  partial model FlowSource "Icon for a flow source" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Icon(
        Ellipse(extent=[-54, 54; 56, -54], style(color=8, fillColor=8)), 
        Polygon(points=[-8, -54; -14, -52; -24, -48; -32, -44; -36, -40; -42, -
              34; -48, -26; -50, -20; 52, -20; 50, -26; 46, -32; 42, -36; 38, -
              40; 34, -44; 30, -46; 26, -48; 22, -50; 16, -52; 10, -54; 4, -54
              ; 0, -54; -8, -54], style(pattern=0, fillColor=70)), 
        Ellipse(extent=[-54, 54; 56, -54], style(color=0, thickness=2)), 
        Rectangle(extent=[-4, -52; 4, -74], style(pattern=0, fillColor=70)), 
        Rectangle(extent=[4, -74; 88, -68], style(pattern=0, fillColor=70)), 
        Line(points=[-4, -54; -4, -74; 88, -74], style(color=0, thickness=2)), 
        Line(points=[4, -54; 4, -68; 88, -68], style(color=0, thickness=2)), 
        Text(extent=[-98, 98; 98, 60], string="%name")), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Documentation(info="Icon for a flow source"), 
      Diagram(
        Ellipse(extent=[-54, 54; 56, -54], style(color=8, fillColor=8)), 
        Polygon(points=[-8, -54; -14, -52; -24, -48; -32, -44; -36, -40; -42, -
              34; -48, -26; -50, -20; 52, -20; 50, -26; 46, -32; 42, -36; 38, -
              40; 34, -44; 30, -46; 26, -48; 22, -50; 16, -52; 10, -54; 4, -54
              ; 0, -54; -8, -54], style(pattern=0, fillColor=70)), 
        Ellipse(extent=[-54, 54; 56, -54], style(color=0, thickness=2)), 
        Rectangle(extent=[-4, -52; 4, -74], style(pattern=0, fillColor=70)), 
        Rectangle(extent=[4, -74; 88, -68], style(pattern=0, fillColor=70)), 
        Line(points=[-4, -54; -4, -74; 88, -74], style(color=0, thickness=2)), 
        Line(points=[4, -54; 4, -68; 88, -68], style(color=0, thickness=2)), 
        Text(extent=[-98, 98; 98, 60], string="%name")));
  end FlowSource;
  partial model WWSource "Icon for a wastewater source" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Ellipse(extent=[-54, 54; 56, -54], style(color=8, fillColor=8)), 
        Polygon(points=[-8, -54; -14, -52; -24, -48; -32, -44; -36, -40; -42, -
              34; -48, -26; -50, -20; 52, -20; 50, -26; 46, -32; 42, -36; 38, -
              40; 34, -44; 30, -46; 26, -48; 22, -50; 16, -52; 10, -54; 4, -54
              ; 0, -54; -8, -54], style(color=46, fillColor=46)), 
        Ellipse(extent=[-54, 54; 56, -54], style(color=0, thickness=2)), 
        Rectangle(extent=[-4, -52; 4, -74], style(color=46, fillColor=46)), 
        Rectangle(extent=[4, -74; 88, -68], style(color=46, fillColor=46)), 
        Line(points=[-4, -54; -4, -74; 88, -74], style(color=0, thickness=2)), 
        Line(points=[4, -54; 4, -68; 88, -68], style(color=0, thickness=2)), 
        Text(extent=[-98, 98; 98, 60], string="%name")), 
      Documentation(info="Icon for a wastewater source"), 
      Diagram(
        Ellipse(extent=[-54, 54; 56, -54], style(color=8, fillColor=8)), 
        Polygon(points=[-8, -54; -14, -52; -24, -48; -32, -44; -36, -40; -42, -
              34; -48, -26; -50, -20; 52, -20; 50, -26; 46, -32; 42, -36; 38, -
              40; 34, -44; 30, -46; 26, -48; 22, -50; 16, -52; 10, -54; 4, -54
              ; 0, -54; -8, -54], style(color=46, fillColor=46)), 
        Ellipse(extent=[-54, 54; 56, -54], style(color=0, thickness=2)), 
        Rectangle(extent=[-4, -52; 4, -74], style(color=46, fillColor=46)), 
        Rectangle(extent=[4, -74; 88, -68], style(color=46, fillColor=46)), 
        Line(points=[-4, -54; -4, -74; 88, -74], style(color=0, thickness=2)), 
        Line(points=[4, -54; 4, -68; 88, -68], style(color=0, thickness=2)), 
        Text(extent=[-98, 98; 98, 60], string="%name")));
  end WWSource;
  partial model EffluentSink "Icon for a water sink e.g. receiving water" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Rectangle(extent=[-90, 38; 0, 0], style(gradient=2, fillColor=8)), 
        Polygon(points=[-80, -20; -60, -80; 60, -80; 80, -20; -80, -20], style(
              color=69, fillColor=69)), 
        Line(points=[0, 14; 8, 4; 10, 0; 12, -8; 12, -16; 12, -22], style(color
              =69, thickness=4)), 
        Line(points=[0, 20; 6, 14; 8, 12; 10, 8; 12, 2; 14, -2; 16, -6; 16, -10
              ; 16, -16; 16, -22], style(color=69, thickness=4)), 
        Line(points=[0, 8; 4, 6; 6, 2; 8, -2; 8, -6; 10, -14; 10, -20], style(
              color=69, thickness=4)), 
        Polygon(points=[-80, -20; -94, -20; -94, -80; -60, -80; -80, -20; -80, 
              -20], style(color=58, fillColor=58)), 
        Polygon(points=[80, -20; 94, -20; 94, -80; 60, -80; 80, -20], style(
              color=58, fillColor=58)), 
        Rectangle(extent=[-94, -80; 94, -94], style(color=58, fillColor=58)), 
        Polygon(points=[-52, 58; -52, 42; -40, 50; -52, 58], style(color=0, 
              fillColor=0)), 
        Polygon(points=[-40, 50; -30, 58; -30, 42; -40, 50], style(color=0, 
              fillColor=0)), 
        Line(points=[-40, 50; -40, 38], style(color=0, thickness=4)), 
        Text(extent=[-100, 100; 100, 60], string="%name")), 
      Documentation(info="Icon for a water sink e.g. receiving water "), 
      Diagram(
        Rectangle(extent=[-90, 38; 0, 0], style(gradient=2, fillColor=8)), 
        Polygon(points=[-80, -20; -60, -80; 60, -80; 80, -20; -80, -20], style(
              color=69, fillColor=69)), 
        Line(points=[0, 14; 8, 4; 10, 0; 12, -8; 12, -16; 12, -22], style(color
              =69, thickness=4)), 
        Line(points=[0, 20; 6, 14; 8, 12; 10, 8; 12, 2; 14, -2; 16, -6; 16, -10
              ; 16, -16; 16, -22], style(color=69, thickness=4)), 
        Line(points=[0, 8; 4, 6; 6, 2; 8, -2; 8, -6; 10, -14; 10, -20], style(
              color=69, thickness=4)), 
        Polygon(points=[-80, -20; -94, -20; -94, -80; -60, -80; -80, -20; -80, 
              -20], style(color=58, fillColor=58)), 
        Polygon(points=[80, -20; 94, -20; 94, -80; 60, -80; 80, -20], style(
              color=58, fillColor=58)), 
        Rectangle(extent=[-94, -80; 94, -94], style(color=58, fillColor=58)), 
        Polygon(points=[-52, 58; -52, 42; -40, 50; -52, 58], style(color=0, 
              fillColor=0)), 
        Polygon(points=[-40, 50; -30, 58; -30, 42; -40, 50], style(color=0, 
              fillColor=0)), 
        Line(points=[-40, 50; -40, 38], style(color=0, thickness=4)), 
        Text(extent=[-100, 100; 98, 60], string="%name")));
  end EffluentSink;
  partial model SludgeSink "Icon for a wastewater sink" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[1, 1], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Rectangle(extent=[-90, 6; -36, -30], style(gradient=2, fillColor=8)), 
        Polygon(points=[-72, 26; -72, 10; -60, 18; -72, 26], style(color=0, 
              fillColor=0)), 
        Polygon(points=[-60, 18; -50, 26; -50, 10; -60, 18], style(color=0, 
              fillColor=0)), 
        Line(points=[-60, 18; -60, 6], style(color=0, thickness=4)), 
        Text(extent=[-100, 100; 99, 60], string="%name"), 
        Ellipse(extent=[-36, 60; 80, -40], style(
            color=0, 
            thickness=2, 
            fillColor=8)), 
        Rectangle(extent=[-36, 6; 81, -81], style(pattern=0, fillColor=8)), 
        Rectangle(extent=[-36, -44; 80, -80], style(color=46, fillColor=46)), 
        Line(points=[-36, -30; -36, -80; 80, -80; 80, 6], style(color=0, 
              thickness=2)), 
        Line(points=[-36, -14; -32, -16; -28, -18; -26, -22; -24, -26; -22, -30
              ; -20, -34; -18, -40; -18, -44], style(color=46, thickness=4)), 
        Line(points=[-36, -10; -28, -12; -24, -16; -20, -20; -16, -26; -12, -34
              ; -12, -44], style(color=46, thickness=4)), 
        Polygon(points=[42, -36; 52, -50; 62, -36; 42, -36], style(color=0, 
              fillColor=9)), 
        Line(points=[62, -36; 80, -36], style(color=0)), 
        Rectangle(extent=[-100, -80; 100, -100], style(color=9, fillColor=9)))
        , 
      Documentation(info="Icon for a wastewater sink"), 
      Diagram(
        Rectangle(extent=[-90, 6; -36, -30], style(gradient=2, fillColor=8)), 
        Polygon(points=[-72, 26; -72, 10; -60, 18; -72, 26], style(color=0, 
              fillColor=0)), 
        Polygon(points=[-60, 18; -50, 26; -50, 10; -60, 18], style(color=0, 
              fillColor=0)), 
        Line(points=[-60, 18; -60, 6], style(color=0, thickness=4)), 
        Text(extent=[-99, 100; 100, 59], string="%name"), 
        Ellipse(extent=[-36, 60; 80, -40], style(
            color=0, 
            thickness=2, 
            fillColor=8)), 
        Rectangle(extent=[-36, 6; 81, -81], style(pattern=0, fillColor=8)), 
        Rectangle(extent=[-36, -44; 80, -80], style(color=46, fillColor=46)), 
        Line(points=[-36, -30; -36, -80; 80, -80; 80, 6], style(color=0, 
              thickness=2)), 
        Line(points=[-36, -14; -32, -16; -28, -18; -26, -22; -24, -26; -22, -30
              ; -20, -34; -18, -40; -18, -44], style(color=46, thickness=4)), 
        Line(points=[-36, -10; -28, -12; -24, -16; -20, -20; -16, -26; -12, -34
              ; -12, -44], style(color=46, thickness=4)), 
        Polygon(points=[42, -36; 52, -50; 62, -36; 42, -36], style(color=0, 
              fillColor=9)), 
        Line(points=[62, -36; 80, -36], style(color=0)), 
        Rectangle(extent=[-100, -80; 100, -100], style(color=9, fillColor=9))))
      ;
  end SludgeSink;
  partial model ControlledDivider2 "Icon for a controlled divider into 2 flows"
     
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[1, 1], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Rectangle(extent=[-45, 47; 47, -37], style(gradient=1, fillColor=10)), 
        Rectangle(extent=[90, 40; 2, 10], style(
            pattern=0, 
            gradient=2, 
            fillColor=8)), 
        Rectangle(extent=[90, 0; 3, -30], style(
            pattern=0, 
            gradient=2, 
            fillColor=8)), 
        Ellipse(extent=[-40, 40; 40, -30], style(gradient=3, fillColor=8)), 
        Rectangle(extent=[-91, 20; 8, -14], style(gradient=2, fillColor=8)), 
        Ellipse(extent=[-38, 38; 38, -28], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[3, 37; 90, 13], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[5, -3; 90, -27], style(pattern=0, fillColor=48)), 
        Polygon(points=[-29, -3; 29, 18; 29, 15; -29, -6; -29, -3], style(color
              =0, fillColor=8)), 
        Rectangle(extent=[-2, 38; 2, -28], style(gradient=1, fillColor=10)), 
        Rectangle(extent=[-3, -48; 3, -44], style(gradient=1, fillColor=10)), 
        Rectangle(extent=[-10, -47; 10, -50], style(gradient=3, fillColor=9)), 
        Rectangle(extent=[-91, 16; -32, -10], style(pattern=0, fillColor=48)), 
        Polygon(points=[24, -21; 43, -21; 42, -19; 48, -22; 42, -25; 43, -23; 
              24, -23; 24, -21], style(pattern=0, fillColor=46)), 
        Polygon(points=[59, 23; 78, 23; 77, 25; 83, 22; 77, 19; 78, 21; 59, 21
              ; 59, 23], style(pattern=0, fillColor=46)), 
        Polygon(points=[51, -8; 70, -8; 69, -6; 75, -9; 69, -12; 70, -10; 51, -
              10; 51, -8], style(pattern=0, fillColor=46)), 
        Polygon(points=[-46, 11; -27, 11; -28, 13; -22, 10; -28, 7; -27, 9; -46
              , 9; -46, 11], style(pattern=0, fillColor=46)), 
        Polygon(points=[-81, 1; -62, 1; -63, 3; -57, 0; -63, -3; -62, -1; -81, 
              -1; -81, 1], style(pattern=0, fillColor=46)), 
        Polygon(points=[17, 32; 36, 32; 35, 34; 41, 31; 35, 28; 36, 30; 17, 30
              ; 17, 32], style(pattern=0, fillColor=46)), 
        Rectangle(extent=[-20, -37; 20, -44], style(gradient=1, fillColor=8)), 
        Text(extent=[-100, 90; 99, 51], string="%name"), 
        Documentation(info="Icon for a controlled divider into 2 flows")), 
      Window(
        x=0.4, 
        y=0.31, 
        width=0.6, 
        height=0.6), 
      Diagram(
        Rectangle(extent=[-45, 47; 47, -37], style(gradient=1, fillColor=10)), 
        Rectangle(extent=[90, 40; 2, 10], style(
            pattern=0, 
            gradient=2, 
            fillColor=8)), 
        Rectangle(extent=[90, 0; 3, -30], style(
            pattern=0, 
            gradient=2, 
            fillColor=8)), 
        Ellipse(extent=[-40, 40; 40, -30], style(gradient=3, fillColor=8)), 
        Rectangle(extent=[-91, 20; 8, -14], style(gradient=2, fillColor=8)), 
        Ellipse(extent=[-38, 38; 38, -28], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[3, 37; 90, 13], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[5, -3; 90, -27], style(pattern=0, fillColor=48)), 
        Polygon(points=[-29, -3; 29, 18; 29, 15; -29, -6; -29, -3], style(color
              =0, fillColor=8)), 
        Rectangle(extent=[-2, 38; 2, -28], style(gradient=1, fillColor=10)), 
        Rectangle(extent=[-3, -48; 3, -44], style(gradient=1, fillColor=10)), 
        Rectangle(extent=[-10, -47; 10, -50], style(gradient=3, fillColor=9)), 
        Rectangle(extent=[-91, 16; -32, -10], style(pattern=0, fillColor=48)), 
        Polygon(points=[24, -21; 43, -21; 42, -19; 48, -22; 42, -25; 43, -23; 
              24, -23; 24, -21], style(pattern=0, fillColor=46)), 
        Polygon(points=[59, 23; 78, 23; 77, 25; 83, 22; 77, 19; 78, 21; 59, 21
              ; 59, 23], style(pattern=0, fillColor=46)), 
        Polygon(points=[51, -8; 70, -8; 69, -6; 75, -9; 69, -12; 70, -10; 51, -
              10; 51, -8], style(pattern=0, fillColor=46)), 
        Polygon(points=[-46, 11; -27, 11; -28, 13; -22, 10; -28, 7; -27, 9; -46
              , 9; -46, 11], style(pattern=0, fillColor=46)), 
        Polygon(points=[-81, 1; -62, 1; -63, 3; -57, 0; -63, -3; -62, -1; -81, 
              -1; -81, 1], style(pattern=0, fillColor=46)), 
        Polygon(points=[17, 32; 36, 32; 35, 34; 41, 31; 35, 28; 36, 30; 17, 30
              ; 17, 32], style(pattern=0, fillColor=46)), 
        Rectangle(extent=[-20, -37; 20, -44], style(gradient=1, fillColor=8)), 
        Text(extent=[-99, 90; 100, 50], string="%name")), 
      Documentation(info="Icon for a controlled divider into 2 flows"));
  end ControlledDivider2;
  partial model divider2 "Icon for a flow divider into 2 flows" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[1, 1], 
        component=[20, 20]), 
      Documentation(info="Icon for a flow divider into 2 flows"), 
      Icon(
        Text(extent=[-99, 98; 97, 53], string="%name"), 
        Rectangle(extent=[-45, 47; 47, -37], style(gradient=1, fillColor=10)), 
        Rectangle(extent=[90, 40; 2, 10], style(
            pattern=0, 
            gradient=2, 
            fillColor=8)), 
        Rectangle(extent=[90, 0; 3, -30], style(
            pattern=0, 
            gradient=2, 
            fillColor=8)), 
        Ellipse(extent=[-40, 40; 40, -30], style(gradient=3, fillColor=8)), 
        Rectangle(extent=[-91, 20; 8, -14], style(gradient=2, fillColor=8)), 
        Ellipse(extent=[-38, 38; 38, -28], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[3, 37; 90, 13], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[5, -3; 90, -27], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[-91, 16; -32, -10], style(pattern=0, fillColor=48)), 
        Polygon(points=[3, -11; 22, -11; 21, -9; 27, -12; 21, -15; 22, -13; 3, 
              -13; 3, -11], style(pattern=0, fillColor=46)), 
        Polygon(points=[47, 31; 66, 31; 65, 33; 71, 30; 65, 27; 66, 29; 47, 29
              ; 47, 31], style(pattern=0, fillColor=46)), 
        Polygon(points=[48, -18; 67, -18; 66, -16; 72, -19; 66, -22; 67, -20; 
              48, -20; 48, -18], style(pattern=0, fillColor=46)), 
        Polygon(points=[-42, 0; -23, 0; -24, 2; -18, -1; -24, -4; -23, -2; -42
              , -2; -42, 0], style(pattern=0, fillColor=46)), 
        Polygon(points=[-80, 12; -61, 12; -62, 14; -56, 11; -62, 8; -61, 10; -
              80, 10; -80, 12], style(pattern=0, fillColor=46)), 
        Polygon(points=[-12, 24; 7, 24; 6, 26; 12, 23; 6, 20; 7, 22; -12, 22; -
              12, 24], style(pattern=0, fillColor=46))), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Diagram(
        Text(extent=[-99, 98; 98, 52], string="%name"), 
        Rectangle(extent=[-45, 47; 47, -37], style(gradient=1, fillColor=10)), 
        Rectangle(extent=[90, 40; 2, 10], style(
            pattern=0, 
            gradient=2, 
            fillColor=8)), 
        Rectangle(extent=[90, 0; 3, -30], style(
            pattern=0, 
            gradient=2, 
            fillColor=8)), 
        Ellipse(extent=[-40, 40; 40, -30], style(gradient=3, fillColor=8)), 
        Rectangle(extent=[-91, 20; 8, -14], style(gradient=2, fillColor=8)), 
        Ellipse(extent=[-38, 38; 38, -28], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[3, 37; 90, 13], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[5, -3; 90, -27], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[-91, 16; -32, -10], style(pattern=0, fillColor=48)), 
        Polygon(points=[3, -11; 22, -11; 21, -9; 27, -12; 21, -15; 22, -13; 3, 
              -13; 3, -11], style(pattern=0, fillColor=46)), 
        Polygon(points=[47, 31; 66, 31; 65, 33; 71, 30; 65, 27; 66, 29; 47, 29
              ; 47, 31], style(pattern=0, fillColor=46)), 
        Polygon(points=[48, -18; 67, -18; 66, -16; 72, -19; 66, -22; 67, -20; 
              48, -20; 48, -18], style(pattern=0, fillColor=46)), 
        Polygon(points=[-42, 0; -23, 0; -24, 2; -18, -1; -24, -4; -23, -2; -42
              , -2; -42, 0], style(pattern=0, fillColor=46)), 
        Polygon(points=[-80, 12; -61, 12; -62, 14; -56, 11; -62, 8; -61, 10; -
              80, 10; -80, 12], style(pattern=0, fillColor=46)), 
        Polygon(points=[-12, 24; 7, 24; 6, 26; 12, 23; 6, 20; 7, 22; -12, 22; -
              12, 24], style(pattern=0, fillColor=46))));
  end divider2;
  partial model mixer2 "Icon for a mixer of 2 flows" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[1, 1], 
        component=[20, 20]), 
      Documentation(info="Icon for a mixer of 2 flows"), 
      Icon(
        Text(extent=[-99, 98; 99, 50], string="%name"), 
        Rectangle(extent=[-46, 47; 45, -37], style(gradient=1, fillColor=10)), 
        Rectangle(extent=[-2, 40; -90, 10], style(
            pattern=0, 
            gradient=2, 
            fillColor=8)), 
        Rectangle(extent=[-3, 0; -90, -30], style(
            pattern=0, 
            gradient=2, 
            fillColor=8)), 
        Ellipse(extent=[-40, 40; 40, -30], style(gradient=3, fillColor=8)), 
        Rectangle(extent=[10, 21; 90, -12], style(gradient=2, fillColor=8)), 
        Ellipse(extent=[-38, 38; 38, -28], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[-90, 37; -4, 13], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[-90, -3; -5, -27], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[31, 18; 90, -9], style(pattern=0, fillColor=48)), 
        Polygon(points=[-74, -19; -55, -19; -56, -17; -50, -20; -56, -23; -55, 
              -21; -74, -21; -74, -19], style(pattern=0, fillColor=46)), 
        Polygon(points=[-18, 24; 1, 24; 0, 26; 6, 23; 0, 20; 1, 22; -18, 22; -
              18, 24], style(pattern=0, fillColor=46)), 
        Polygon(points=[-28, -12; -9, -12; -10, -10; -4, -13; -10, -16; -9, -14
              ; -28, -14; -28, -12], style(pattern=0, fillColor=46)), 
        Polygon(points=[22, 10; 41, 10; 40, 12; 46, 9; 40, 6; 41, 8; 22, 8; 22
              , 10], style(pattern=0, fillColor=46)), 
        Polygon(points=[57, -2; 76, -2; 75, 0; 81, -3; 75, -6; 76, -4; 57, -4; 
              57, -2], style(pattern=0, fillColor=46)), 
        Polygon(points=[-74, 30; -55, 30; -56, 32; -50, 29; -56, 26; -55, 28; -
              74, 28; -74, 30], style(pattern=0, fillColor=46))), 
      Window(
        x=0.46, 
        y=0.09, 
        width=0.35, 
        height=0.49), 
      Diagram(
        Text(extent=[-98, 99; 99, 51], string="%name"), 
        Rectangle(extent=[-46, 47; 45, -37], style(gradient=1, fillColor=10)), 
        Rectangle(extent=[-2, 40; -90, 10], style(
            pattern=0, 
            gradient=2, 
            fillColor=8)), 
        Rectangle(extent=[-3, 0; -90, -30], style(
            pattern=0, 
            gradient=2, 
            fillColor=8)), 
        Ellipse(extent=[-40, 40; 40, -30], style(gradient=3, fillColor=8)), 
        Rectangle(extent=[10, 21; 90, -12], style(gradient=2, fillColor=8)), 
        Ellipse(extent=[-38, 38; 38, -28], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[-90, 37; -4, 13], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[-90, -3; -5, -27], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[31, 18; 90, -9], style(pattern=0, fillColor=48)), 
        Polygon(points=[-74, -19; -55, -19; -56, -17; -50, -20; -56, -23; -55, 
              -21; -74, -21; -74, -19], style(pattern=0, fillColor=46)), 
        Polygon(points=[-18, 24; 1, 24; 0, 26; 6, 23; 0, 20; 1, 22; -18, 22; -
              18, 24], style(pattern=0, fillColor=46)), 
        Polygon(points=[-28, -12; -9, -12; -10, -10; -4, -13; -10, -16; -9, -14
              ; -28, -14; -28, -12], style(pattern=0, fillColor=46)), 
        Polygon(points=[22, 10; 41, 10; 40, 12; 46, 9; 40, 6; 41, 8; 22, 8; 22
              , 10], style(pattern=0, fillColor=46)), 
        Polygon(points=[57, -2; 76, -2; 75, 0; 81, -3; 75, -6; 76, -4; 57, -4; 
              57, -2], style(pattern=0, fillColor=46)), 
        Polygon(points=[-74, 30; -55, 30; -56, 32; -50, 29; -56, 26; -55, 28; -
              74, 28; -74, 30], style(pattern=0, fillColor=46))));
  end mixer2;
  partial model mixer3 "Icon for a mixer of 3 flows" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[1, 1], 
        component=[20, 20]), 
      Documentation(info="Icon for a mixer of 3 flows"), 
      Icon(
        Text(extent=[-100, 99; 99, 59], string="%name"), 
        Rectangle(extent=[-60, 56; 60, -65], style(gradient=1, fillColor=9)), 
        Rectangle(extent=[30, 20; 90, -30], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-90, 50; 0, 20], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-90, -30; 0, -60], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-90, 10; 0, -20], style(gradient=2, fillColor=8)), 
        Ellipse(extent=[-50, 50; 50, -41], style(gradient=3, fillColor=8)), 
        Ellipse(extent=[-50, 31; 50, -60], style(gradient=3, fillColor=8)), 
        Ellipse(extent=[-47, 48; 47, -38], style(pattern=0, fillColor=48)), 
        Ellipse(extent=[-47, 28; 47, -58], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[-90, 47; 2, 23], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[-90, 7; 2, -17], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[-90, -33; 0, -57], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[11, 16; 90, -26], style(pattern=0, fillColor=48)), 
        Polygon(points=[-20, -7; -1, -7; -2, -5; 4, -8; -2, -11; -1, -9; -20, -
              9; -20, -7], style(pattern=0, fillColor=46)), 
        Polygon(points=[10, 14; 29, 14; 28, 16; 34, 13; 28, 10; 29, 12; 10, 12
              ; 10, 14], style(pattern=0, fillColor=46)), 
        Polygon(points=[11, -28; 30, -28; 29, -26; 35, -29; 29, -32; 30, -30; 
              11, -30; 11, -28], style(pattern=0, fillColor=46)), 
        Polygon(points=[-75, -1; -56, -1; -57, 1; -51, -2; -57, -5; -56, -3; -
              75, -3; -75, -1], style(pattern=0, fillColor=46)), 
        Polygon(points=[-74, 41; -55, 41; -56, 43; -50, 40; -56, 37; -55, 39; -
              74, 39; -74, 41], style(pattern=0, fillColor=46)), 
        Polygon(points=[-71, -49; -52, -49; -53, -47; -47, -50; -53, -53; -52, 
              -51; -71, -51; -71, -49], style(pattern=0, fillColor=46)), 
        Polygon(points=[-30, 33; -11, 33; -12, 35; -6, 32; -12, 29; -11, 31; -
              30, 31; -30, 33], style(pattern=0, fillColor=46)), 
        Polygon(points=[-28, -42; -9, -42; -10, -40; -4, -43; -10, -46; -9, -44
              ; -28, -44; -28, -42], style(pattern=0, fillColor=46)), 
        Polygon(points=[44, -7; 63, -7; 62, -5; 68, -8; 62, -11; 63, -9; 44, -9
              ; 44, -7], style(pattern=0, fillColor=46))), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Diagram(
        Text(extent=[-99, 98; 99, 60], string="%name"), 
        Rectangle(extent=[-60, 56; 60, -65], style(gradient=1, fillColor=9)), 
        Rectangle(extent=[30, 20; 90, -30], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-90, 50; 0, 20], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-90, -30; 0, -60], style(gradient=2, fillColor=8)), 
        Rectangle(extent=[-90, 10; 0, -20], style(gradient=2, fillColor=8)), 
        Ellipse(extent=[-50, 50; 50, -41], style(gradient=3, fillColor=8)), 
        Ellipse(extent=[-50, 31; 50, -60], style(gradient=3, fillColor=8)), 
        Ellipse(extent=[-47, 48; 47, -38], style(pattern=0, fillColor=48)), 
        Ellipse(extent=[-47, 28; 47, -58], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[-90, 47; 2, 23], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[-90, 7; 2, -17], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[-90, -33; 0, -57], style(pattern=0, fillColor=48)), 
        Rectangle(extent=[11, 16; 90, -26], style(pattern=0, fillColor=48)), 
        Polygon(points=[-20, -7; -1, -7; -2, -5; 4, -8; -2, -11; -1, -9; -20, -
              9; -20, -7], style(pattern=0, fillColor=46)), 
        Polygon(points=[10, 14; 29, 14; 28, 16; 34, 13; 28, 10; 29, 12; 10, 12
              ; 10, 14], style(pattern=0, fillColor=46)), 
        Polygon(points=[11, -28; 30, -28; 29, -26; 35, -29; 29, -32; 30, -30; 
              11, -30; 11, -28], style(pattern=0, fillColor=46)), 
        Polygon(points=[-75, -1; -56, -1; -57, 1; -51, -2; -57, -5; -56, -3; -
              75, -3; -75, -1], style(pattern=0, fillColor=46)), 
        Polygon(points=[-74, 41; -55, 41; -56, 43; -50, 40; -56, 37; -55, 39; -
              74, 39; -74, 41], style(pattern=0, fillColor=46)), 
        Polygon(points=[-71, -49; -52, -49; -53, -47; -47, -50; -53, -53; -52, 
              -51; -71, -51; -71, -49], style(pattern=0, fillColor=46)), 
        Polygon(points=[-30, 33; -11, 33; -12, 35; -6, 32; -12, 29; -11, 31; -
              30, 31; -30, 33], style(pattern=0, fillColor=46)), 
        Polygon(points=[-28, -42; -9, -42; -10, -40; -4, -43; -10, -46; -9, -44
              ; -28, -44; -28, -42], style(pattern=0, fillColor=46)), 
        Polygon(points=[44, -7; 63, -7; 62, -5; 68, -8; 62, -11; 63, -9; 44, -9
              ; 44, -7], style(pattern=0, fillColor=46))));
  end mixer3;
  partial model sensor_COD "Icon for a chemical oxygen demand sensor" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-100, 100; 100, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="COD"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))), 
      Documentation(info="Icon for a chemical oxygen demand sensor "), 
      Diagram(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-100, 100; 100, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="COD"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))));
  end sensor_COD;
  partial model sensor_NH "Icon for an ammonium nitrogen sensor" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-98, 98; 98, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="NH"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))), 
      Documentation(info="Icon for an ammonium nitrogen sensor "), 
      Diagram(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-100, 100; 100, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="NH"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))));
  end sensor_NH;
  partial model sensor_NO "Icon for a nitrate nitrogen sensor" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-100, 100; 100, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="NO"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))), 
      Documentation(info="Icon for a nitrate nitrogen sensor "), 
      Diagram(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-100, 100; 100, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="NO"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))));
  end sensor_NO;
  partial model sensor_O2 "Icon for an oxygen sensor" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-98, 98; 100, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="O2"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))), 
      Documentation(info="Icon for an oxygen sensor "), 
      Diagram(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-98, 100; 100, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="O2"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))));
  end sensor_O2;
  partial model sensor_PO "Icon for a phosphate sensor" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-98, 98; 98, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="PO"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))), 
      Documentation(info="Icon for a phosphate sensor "), 
      Diagram(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-98, 98; 100, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="PO"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))));
  end sensor_PO;
  partial model sensor_Q "Icon for a flow sensor" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-98, 98; 98, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="Q"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[-90, 0; -2, 0], style(color=0, thickness=2)), 
        Line(points=[4, 0; 92, 0], style(color=0, thickness=2))), 
      Documentation(info="Icon for a flow sensor"), 
      Diagram(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-98, 98; 98, 62], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="Q"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[-90, 0; -2, 0], style(color=0, thickness=2)), 
        Line(points=[4, 0; 92, 0], style(color=0, thickness=2))));
  end sensor_Q;
  partial model sensor_TKN 
    "Icon for a Kjeldal nitrogen and total nitrogen sensor" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-98, 100; 100, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="TKN"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))), 
      Documentation(info=
            "Icon for a Kjeldal nitrogen and total nitrogen sensor "), 
      Diagram(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-98, 98; 100, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="TKN"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))));
  end sensor_TKN;
  partial model sensor_TP "Icon for a total phosphorus sensor" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-100, 100; 98, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="TP"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))), 
      Documentation(info="Icon for a total phosphorus sensor "), 
      Diagram(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-98, 100; 98, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="TP"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))));
  end sensor_TP;
  partial model sensor_TSS "Icon for a total suspended solids sensor" 
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100], 
        grid=[2, 2], 
        component=[20, 20]), 
      Window(
        x=0.45, 
        y=0.01, 
        width=0.35, 
        height=0.49), 
      Icon(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-100, 100; 100, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="TSS"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))), 
      Documentation(info="Icon for a total suspended solids sensor "), 
      Diagram(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0, 
            thickness=2, 
            fillColor=52)), 
        Text(extent=[-98, 100; 100, 60], string="%name"), 
        Line(points=[0, 50; 0, 38], style(color=0, thickness=2)), 
        Line(points=[-50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[50, 0; 38, 0], style(color=0, thickness=2)), 
        Line(points=[-36, 34; -28, 26], style(color=0, thickness=2)), 
        Line(points=[34, 36; 26, 28], style(color=0, thickness=2)), 
        Line(points=[0, 0; 26, 28], style(color=0, thickness=2)), 
        Polygon(points=[30, 32; 10, 24; 24, 12; 30, 32], style(color=0, 
              fillColor=0)), 
        Text(extent=[-36, -10; 36, -32], string="TSS"), 
        Line(points=[0, -50; 0, -90], style(color=0, thickness=2)), 
        Line(points=[50, 0; 88, 0], style(color=0))));
  end sensor_TSS;
end Icons;
