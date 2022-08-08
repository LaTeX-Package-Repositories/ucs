
module = "ucs"
checkengines={"pdftex"}
checkruns=2

installfiles = {"*.def","*.sty"}



mybundleunpack=bundleunpack
function bundleunpack(sources, sourcedirs)
  cp("UnicodeData.txt",string.match(kpse.lookup("UnicodeData.txt"),"(.*[/])"),".")
  mkdir("data")
  runcmd("perl -w makeunidef.pl --nocomments --targetdir=data config/*.ucf")
  rm(".","UnicodeData.txt")
  mybundleunpack(sources, sourcedirs)
end


