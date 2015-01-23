if not isPackage(WasteWater) then
  loadModel(WasteWater);
end if;
res:=simulate(WasteWater.ASM#num.Examples.#upperPlant,simflags="-overrideFile='"+Modelica.Utilities.Files.loadResource("modelica://WasteWater/Resources/ASM#num/omc_#lower.override.txt")+"'");
resultFile := res.resultFile;
getErrorString();
if resultFile == "" then
  exit(1);
end if;
