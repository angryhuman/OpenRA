#!/bin/bash

# Die on any error for Travis CI to automatically retry:
set -e

if [ ! -f StyleCopPlus.dll ]; then
	echo "Fetching StyleCopPlus from nuget"
	nuget install StyleCopPlus.MSBuild -Version 4.7.49.5 -ExcludeVersion
	cp ./StyleCopPlus.MSBuild/tools/StyleCopPlus.dll .
	rm -rf StyleCopPlus.MSBuild
fi

if [ ! -f StyleCop.dll ]; then
	echo "Fetching StyleCop files from nuget"
	nuget install StyleCop.MSBuild -Version 4.7.49.0 -ExcludeVersion
	cp ./StyleCop.MSBuild/tools/StyleCop*.dll .
	rm -rf StyleCop.MSBuild
fi

if [ ! -f ICSharpCode.SharpZipLib.dll ]; then
	echo "Fetching ICSharpCode.SharpZipLib from nuget"
	nuget install SharpZipLib -Version 0.86.0 -ExcludeVersion
	cp ./SharpZipLib/lib/20/ICSharpCode.SharpZipLib.dll .
	rm -rf SharpZipLib
fi

if [ ! -f MaxMind.GeoIP2.dll ]; then
	echo "Fetching MaxMind.GeoIP2 from nuget"
	nuget install MaxMind.GeoIP2 -Version 2.1.0 -ExcludeVersion
	cp ./MaxMind.Db/lib/net40/MaxMind.Db.* .
	rm -rf MaxMind.Db
	cp ./MaxMind.GeoIP2/lib/net40/MaxMind.GeoIP2* .
	rm -rf MaxMind.GeoIP2
	cp ./Newtonsoft.Json/lib/net40/Newtonsoft.Json* .
	rm -rf Newtonsoft.Json
	cp ./RestSharp/lib/net4-client/RestSharp* .
	rm -rf RestSharp
fi

if [ ! -f SharpFont.dll ]; then
	echo "Fetching SharpFont from nuget"
	nuget install SharpFont -Version 2.5.0.1 -ExcludeVersion
	cp ./SharpFont/lib/net20/SharpFont* .
	sed '/osx/s@\(dll="\)[^"]*\(" />\)@\1/Library/Frameworks/Mono.framework/Libraries/libfreetype.6.dylib\2@' ./SharpFont/Content/SharpFont.dll.config > SharpFont.dll.config
	rm -rf SharpFont
fi

if [ ! -f nunit.framework.dll ]; then
	echo "Fetching NUnit from nuget"
	nuget install NUnit -Version 2.6.4 -ExcludeVersion
	cp ./NUnit/lib/nunit.framework* .
	rm -rf NUnit
fi

if [ ! -f Mono.Nat.dll ]; then
	echo "Fetching Mono.Nat from nuget"
	nuget install Mono.Nat -Version 1.2.21 -ExcludeVersion
	cp ./Mono.Nat/lib/net40/Mono.Nat.dll .
	rm -rf Mono.Nat
fi

if [ ! -f Moq.dll ]; then
	echo "Fetching Moq from NuGet."
	nuget install Moq -Version 4.2.1502.0911 -ExcludeVersion
	cp ./Moq/lib/net40/Moq.dll .
	rm -rf Moq
fi

if [ ! -f FuzzyLogicLibrary.dll ]; then
	echo "Fetching FuzzyLogicLibrary from NuGet."
	nuget install FuzzyLogicLibrary -Version 1.2.0 -ExcludeVersion
	cp ./FuzzyLogicLibrary/bin/Release/FuzzyLogicLibrary.dll .
	rm -rf FuzzyLogicLibrary
fi
