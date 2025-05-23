{
dev = {
};
ghc910 = {
  incipit-base = {
  meta = {
    sha256 = "0iyyvxpyyybn5ygr875pav6g5hbs00wa9jbr7qslszqpkfpy5x33";
    ver = "0.6.1.0";
  };
  drv = { mkDerivation, base, bytestring, containers, data-default, lib
, stm, text
}:
mkDerivation {
  pname = "incipit-base";
  version = "0.6.1.0";
  src = /nix/store/2k1isywgqm3pcbzdhwyp97n9250g044k-source;
  libraryHaskellDepends = [
    base bytestring containers data-default stm text
  ];
  homepage = "https://github.com/tek/incipit-core#readme";
  description = "A Prelude for Polysemy – Base Reexports";
  license = "BSD-2-Clause-Patent";
}
;
}
;
  incipit-core = {
  meta = {
    sha256 = "144c239nxl8zi2ik3ycic3901gxn8rccij3g609n2zgnn3b6zilj";
    ver = "0.6.1.0";
  };
  drv = { mkDerivation, base, incipit-base, lib, polysemy }:
mkDerivation {
  pname = "incipit-core";
  version = "0.6.1.0";
  src = /nix/store/7bfdjb94bzganyaybhhjmxjcwypnsasp-source;
  libraryHaskellDepends = [ base incipit-base polysemy ];
  homepage = "https://github.com/tek/incipit-core#readme";
  description = "A Prelude for Polysemy";
  license = "BSD-2-Clause-Patent";
}
;
}
;
};
ghc92 = {
};
ghc94 = {
};
ghc96 = {
};
ghc98 = {
};
hix-build-tools = {
};
hls = {
};
latest = {
  QuickCheck = {
  meta = {
    sha256 = "1dcqv7z83wrbv7wvm7hdvjapfyzi9g4wjwsh9x6zh9ff622z53lb";
    url = "https://hackage.haskell.org";
    ver = "2.15.0.1";
  };
  drv = { mkDerivation, base, containers, deepseq, lib, process, random
, splitmix, template-haskell, transformers
}:
mkDerivation {
  pname = "QuickCheck";
  version = "2.15.0.1";
  src = /nix/store/wszsbjjnfpbj1yfnlsp20rsa19pkfqb2-source;
  libraryHaskellDepends = [
    base containers deepseq random splitmix template-haskell
    transformers
  ];
  testHaskellDepends = [ base containers deepseq process ];
  homepage = "https://github.com/nick8325/quickcheck";
  description = "Automatic testing of Haskell programs";
  license = lib.licenses.bsd3;
}
;
}
;
  aeson = {
  meta = {
    sha256 = "12lr0rzlds8zrij140h0bcji25nawwp19dq0yyx93hz8ia9621fp";
    url = "https://hackage.haskell.org";
    ver = "2.2.2.0";
  };
  drv = { mkDerivation, base, base-compat, base-orphans, base16-bytestring
, bytestring, character-ps, containers, data-fix, deepseq, Diff
, directory, dlist, exceptions, filepath, generic-deriving
, generically, ghc-prim, hashable, indexed-traversable
, integer-conversion, integer-logarithms, lib, network-uri
, OneTuple, primitive, QuickCheck, quickcheck-instances, scientific
, semialign, strict, tagged, tasty, tasty-golden, tasty-hunit
, tasty-quickcheck, template-haskell, text, text-iso8601
, text-short, th-abstraction, these, time, time-compat
, unordered-containers, uuid-types, vector, witherable
}:
mkDerivation {
  pname = "aeson";
  version = "2.2.2.0";
  src = /nix/store/xdyc8zrazfiy1m8xnkwsxynb39wba1pv-source;
  libraryHaskellDepends = [
    base bytestring character-ps containers data-fix deepseq dlist
    exceptions generically ghc-prim hashable indexed-traversable
    integer-conversion integer-logarithms network-uri OneTuple
    primitive QuickCheck scientific semialign strict tagged
    template-haskell text text-iso8601 text-short th-abstraction these
    time time-compat unordered-containers uuid-types vector witherable
  ];
  testHaskellDepends = [
    base base-compat base-orphans base16-bytestring bytestring
    containers data-fix deepseq Diff directory dlist filepath
    generic-deriving generically ghc-prim hashable indexed-traversable
    integer-logarithms network-uri OneTuple primitive QuickCheck
    quickcheck-instances scientific strict tagged tasty tasty-golden
    tasty-hunit tasty-quickcheck template-haskell text text-short these
    time time-compat unordered-containers uuid-types vector
  ];
  homepage = "https://github.com/haskell/aeson";
  description = "Fast JSON parsing and encoding";
  license = lib.licenses.bsd3;
}
;
}
;
  ansi-terminal = {
  meta = {
    sha256 = "1jpim6z8a074h427ah2yqbkm0krcy9yq28276fcdrxm6ji8pa302";
    url = "https://hackage.haskell.org";
    ver = "1.1.2";
  };
  drv = { mkDerivation, ansi-terminal-types, base, colour, lib }:
mkDerivation {
  pname = "ansi-terminal";
  version = "1.1.2";
  src = /nix/store/i6vw5gbg444japsaj6r702xaxbw46jai-source;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ ansi-terminal-types base colour ];
  homepage = "https://github.com/UnkindPartition/ansi-terminal";
  description = "Simple ANSI terminal support";
  license = lib.licenses.bsd3;
}
;
}
;
  ansi-terminal-types = {
  meta = {
    sha256 = "06q2ygb33a3kv8z0xk75dyc2a32si82yc8126dz97xq03pinym8h";
    url = "https://hackage.haskell.org";
    ver = "1.1";
  };
  drv = { mkDerivation, base, colour, lib }:
mkDerivation {
  pname = "ansi-terminal-types";
  version = "1.1";
  src = /nix/store/kvxk9kvdlq99ar4jrrxs9dnqm3s5kbc9-source;
  libraryHaskellDepends = [ base colour ];
  homepage = "https://github.com/UnkindPartition/ansi-terminal";
  description = "Types and functions used to represent SGR aspects";
  license = lib.licenses.bsd3;
}
;
}
;
  barbies = {
  meta = {
    sha256 = "0sf5j8ll1iw56yjrg4pj4csfbb95spjz2jpk8qiflszn4rbszbi8";
    url = "https://hackage.haskell.org";
    ver = "2.1.1.0";
  };
  drv = { mkDerivation, base, distributive, lib, QuickCheck, tasty
, tasty-hunit, tasty-quickcheck, transformers
}:
mkDerivation {
  pname = "barbies";
  version = "2.1.1.0";
  src = /nix/store/yrvzpzm4yvpnhykmcy52i2l1zf9f895l-source;
  libraryHaskellDepends = [ base distributive transformers ];
  testHaskellDepends = [
    base distributive QuickCheck tasty tasty-hunit tasty-quickcheck
  ];
  homepage = "https://github.com/jcpetruzza/barbies#readme";
  description = "Classes for working with types that can change clothes";
  license = lib.licenses.bsd3;
}
;
}
;
  base-orphans = {
  meta = {
    sha256 = "0428rpslw0xdqm92aay0p11fa0pvdilvsg9xdirqdhc5z3rhnkmm";
    url = "https://hackage.haskell.org";
    ver = "0.9.3";
  };
  drv = { mkDerivation, base, ghc-prim, hspec, hspec-discover, lib
, QuickCheck
}:
mkDerivation {
  pname = "base-orphans";
  version = "0.9.3";
  src = /nix/store/9dax81d72n94fkavvswyqgsxsbrr6b01-source;
  libraryHaskellDepends = [ base ghc-prim ];
  testHaskellDepends = [ base hspec QuickCheck ];
  testToolDepends = [ hspec-discover ];
  homepage = "https://github.com/haskell-compat/base-orphans#readme";
  description = "Backwards-compatible orphan instances for base";
  license = lib.licenses.mit;
}
;
}
;
  bifunctors = {
  meta = {
    sha256 = "1g0z6q5z04zgp7kaf917nrj2iiz1lsqh8ji5ny5ly534zr9zya2m";
    url = "https://hackage.haskell.org";
    ver = "5.6.2";
  };
  drv = { mkDerivation, assoc, base, comonad, containers, hspec
, hspec-discover, lib, QuickCheck, tagged, template-haskell
, th-abstraction, transformers, transformers-compat
}:
mkDerivation {
  pname = "bifunctors";
  version = "5.6.2";
  src = /nix/store/a4rjc37gkzldsfvpg42wsldlhpmxnbzi-source;
  libraryHaskellDepends = [
    assoc base comonad containers tagged template-haskell
    th-abstraction transformers
  ];
  testHaskellDepends = [
    base hspec QuickCheck template-haskell transformers
    transformers-compat
  ];
  testToolDepends = [ hspec-discover ];
  homepage = "http://github.com/ekmett/bifunctors/";
  description = "Bifunctors";
  license = lib.licenses.bsd3;
}
;
}
;
  cabal-doctest = {
  meta = {
    sha256 = "0irxfxy1qw7sif4408xdhqycddb4hs3hcf6xfxm65glsnmnmwl2i";
    url = "https://hackage.haskell.org";
    ver = "1.0.9";
  };
  drv = { mkDerivation, base, Cabal, directory, filepath, lib }:
mkDerivation {
  pname = "cabal-doctest";
  version = "1.0.9";
  src = /nix/store/zvv4lgrqgjx826ryk6697617pd3xpr7s-source;
  libraryHaskellDepends = [ base Cabal directory filepath ];
  homepage = "https://github.com/haskellari/cabal-doctest";
  description = "A Setup.hs helper for running doctests";
  license = lib.licenses.bsd3;
}
;
}
;
  comonad = {
  meta = {
    sha256 = "0j7xm3vdd7icc6z557kph79g3z0c2xfi67lm3yzky0nhxgmcjckd";
    url = "https://hackage.haskell.org";
    ver = "5.0.9";
  };
  drv = { mkDerivation, base, containers, distributive, indexed-traversable
, lib, tagged, transformers, transformers-compat
}:
mkDerivation {
  pname = "comonad";
  version = "5.0.9";
  src = /nix/store/4sck5iys7v409aml7gdxfm13ppshhcx4-source;
  libraryHaskellDepends = [
    base containers distributive indexed-traversable tagged
    transformers transformers-compat
  ];
  homepage = "http://github.com/ekmett/comonad/";
  description = "Comonads";
  license = lib.licenses.bsd3;
}
;
}
;
  concurrent-output = {
  meta = {
    sha256 = "1w87rrf337s8wc4z3dkh2mk990003jsk18ry5yawv4465k4yvamw";
    url = "https://hackage.haskell.org";
    ver = "1.10.21";
  };
  drv = { mkDerivation, ansi-terminal, async, base, directory, exceptions
, lib, process, stm, terminal-size, text, transformers, unix
}:
mkDerivation {
  pname = "concurrent-output";
  version = "1.10.21";
  src = /nix/store/kwz3gmjbrzcw4iccsx2d0cyn85klblqy-source;
  libraryHaskellDepends = [
    ansi-terminal async base directory exceptions process stm
    terminal-size text transformers unix
  ];
  description = "Ungarble output from several threads or commands";
  license = lib.licenses.bsd2;
}
;
}
;
  data-default = {
  meta = {
    sha256 = "0j7n0hc76k7h15kkr8rd788ila914zhwknvfmijlrzxzm9dvxfkf";
    url = "https://hackage.haskell.org";
    ver = "0.8.0.1";
  };
  drv = { mkDerivation, base, containers, lib, mtl }:
mkDerivation {
  pname = "data-default";
  version = "0.8.0.1";
  src = /nix/store/zjfc5cy23rqzf6hmbp722p24icfwn9pr-source;
  libraryHaskellDepends = [ base containers ];
  testHaskellDepends = [ base containers mtl ];
  description = "A class for types with a default value";
  license = lib.licenses.bsd3;
}
;
}
;
  distributive = {
  meta = {
    sha256 = "1yfw2p46wbs3mcvw22b7f7x1jyrfinslb1bdx83v1v17q95aldj7";
    url = "https://hackage.haskell.org";
    ver = "0.6.2.1";
  };
  drv = { mkDerivation, base, base-orphans, generic-deriving, hspec
, hspec-discover, lib, tagged, transformers
}:
mkDerivation {
  pname = "distributive";
  version = "0.6.2.1";
  src = /nix/store/64vz8hgvq1w3dlivjzg5ipva396i13l5-source;
  libraryHaskellDepends = [ base base-orphans tagged transformers ];
  testHaskellDepends = [ base generic-deriving hspec ];
  testToolDepends = [ hspec-discover ];
  homepage = "http://github.com/ekmett/distributive/";
  description = "Distributive functors -- Dual to Traversable";
  license = lib.licenses.bsd3;
}
;
}
;
  happy = {
  meta = {
    sha256 = "009gfg22ym8597zqlxpvyih36r8jr9l3hj01lbyfjiar86j85kmc";
    url = "https://hackage.haskell.org";
    ver = "2.1.5";
  };
  drv = { mkDerivation, array, base, containers, happy-lib, lib, mtl
, process
}:
mkDerivation {
  pname = "happy";
  version = "2.1.5";
  src = /nix/store/pwkr1jmfbrfqd4n145sbkmli1al837r7-source;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ array base containers happy-lib mtl ];
  testHaskellDepends = [ base process ];
  homepage = "https://www.haskell.org/happy/";
  description = "Happy is a parser generator for Haskell";
  license = lib.licenses.bsd2;
  mainProgram = "happy";
}
;
}
;
  happy-lib = {
  meta = {
    sha256 = "1r70avvngv9smip563qh6hmivqirikg48f91jrp3q1al487b6daz";
    url = "https://hackage.haskell.org";
    ver = "2.1.5";
  };
  drv = { mkDerivation, array, base, containers, lib, mtl, transformers }:
mkDerivation {
  pname = "happy-lib";
  version = "2.1.5";
  src = /nix/store/w344b80m6s4i3h2895q9k9gmfwcfyll4-source;
  enableSeparateDataOutput = true;
  libraryHaskellDepends = [ array base containers mtl transformers ];
  doHaddock = false;
  homepage = "https://www.haskell.org/happy/";
  description = "Happy is a parser generator for Haskell implemented using this library";
  license = lib.licenses.bsd2;
}
;
}
;
  haskell-lexer = {
  meta = {
    sha256 = "06qwzp3xbk6l0rcvy4b4asr7hwc2fr96l3z1596agj80521fl0cx";
    url = "https://hackage.haskell.org";
    ver = "1.2.1";
  };
  drv = { mkDerivation, base, lib }:
mkDerivation {
  pname = "haskell-lexer";
  version = "1.2.1";
  src = /nix/store/d4pcsb3760z9dp0wjsd7v2bsgszr05xg-source;
  libraryHaskellDepends = [ base ];
  homepage = "https://github.com/yav/haskell-lexer";
  description = "A fully compliant Haskell 98 lexer";
  license = lib.licenses.mit;
}
;
}
;
  hedgehog = {
  meta = {
    sha256 = "1hz8xrg5p6vplvcj8c7pgidqnwqjmqahs9dla50nqpbcbdh932ll";
    url = "https://hackage.haskell.org";
    ver = "1.5";
  };
  drv = { mkDerivation, ansi-terminal, async, barbies, base, bytestring
, concurrent-output, containers, deepseq, directory, erf
, exceptions, lib, lifted-async, mmorph, monad-control, mtl
, pretty-show, primitive, random, resourcet, safe-exceptions, stm
, template-haskell, text, time, transformers, transformers-base
, wl-pprint-annotated
}:
mkDerivation {
  pname = "hedgehog";
  version = "1.5";
  src = /nix/store/asphc2qzd1cykd892r5fnhflbd8cwana-source;
  libraryHaskellDepends = [
    ansi-terminal async barbies base bytestring concurrent-output
    containers deepseq directory erf exceptions lifted-async mmorph
    monad-control mtl pretty-show primitive random resourcet
    safe-exceptions stm template-haskell text time transformers
    transformers-base wl-pprint-annotated
  ];
  testHaskellDepends = [
    base containers mmorph mtl pretty-show text transformers
  ];
  homepage = "https://hedgehog.qa";
  description = "Release with confidence";
  license = lib.licenses.bsd3;
}
;
}
;
  hsc2hs = {
  meta = {
    sha256 = "0wdg17kicnp6qbgynha216vihx7nnsglvhn5c089dqpa14hg35zw";
    url = "https://hackage.haskell.org";
    ver = "0.68.10";
  };
  drv = { mkDerivation, base, containers, directory, filepath, HUnit, lib
, process, test-framework, test-framework-hunit
}:
mkDerivation {
  pname = "hsc2hs";
  version = "0.68.10";
  src = /nix/store/14zlpg12331kakcpz0pn3f05xyg8ql8l-source;
  isLibrary = false;
  isExecutable = true;
  enableSeparateDataOutput = true;
  executableHaskellDepends = [
    base containers directory filepath process
  ];
  testHaskellDepends = [
    base HUnit test-framework test-framework-hunit
  ];
  description = "A preprocessor that helps with writing Haskell bindings to C code";
  license = lib.licenses.bsd3;
  mainProgram = "hsc2hs";
}
;
}
;
  incipit-base = {
  meta = {
    sha256 = "08ybv7j94yyznrxnrh744bi3i1a00sz8bf5ddfs9vfgfhhkrg8fn";
    url = "https://hackage.haskell.org";
    ver = "0.6.1.1";
  };
  drv = { mkDerivation, base, bytestring, containers, data-default, lib
, stm, text
}:
mkDerivation {
  pname = "incipit-base";
  version = "0.6.1.1";
  src = /nix/store/z2v8hbdbz6fvdnnqfdr713164wc7n3jj-source;
  libraryHaskellDepends = [
    base bytestring containers data-default stm text
  ];
  homepage = "https://github.com/tek/incipit-core#readme";
  description = "A Prelude for Polysemy – Base Reexports";
  license = "BSD-2-Clause-Patent";
}
;
}
;
  incipit-core = {
  meta = {
    sha256 = "0qpw07f8ip6h7srqkbzfxyz1z36n75irhc6465s9xvrii1840b2k";
    url = "https://hackage.haskell.org";
    ver = "0.6.1.1";
  };
  drv = { mkDerivation, base, incipit-base, lib, polysemy }:
mkDerivation {
  pname = "incipit-core";
  version = "0.6.1.1";
  src = /nix/store/hhmdm0brw0bh41z3lggk75mj5765flmg-source;
  libraryHaskellDepends = [ base incipit-base polysemy ];
  homepage = "https://github.com/tek/incipit-core#readme";
  description = "A Prelude for Polysemy";
  license = "BSD-2-Clause-Patent";
}
;
}
;
  indexed-traversable-instances = {
  meta = {
    sha256 = "05vpkasz70yjf09hsmbw7nap70sr8p5b7hrsdbmij8k8xqf3qg8r";
    url = "https://hackage.haskell.org";
    ver = "0.1.2";
  };
  drv = { mkDerivation, base, containers, indexed-traversable, lib
, OneTuple, QuickCheck, quickcheck-instances, tagged, tasty
, tasty-quickcheck, transformers, unordered-containers, vector
}:
mkDerivation {
  pname = "indexed-traversable-instances";
  version = "0.1.2";
  src = /nix/store/dk7n8w7k4bfq5iph1v2z0fl8mh8s3js3-source;
  libraryHaskellDepends = [
    base indexed-traversable OneTuple tagged unordered-containers
    vector
  ];
  testHaskellDepends = [
    base containers indexed-traversable OneTuple QuickCheck
    quickcheck-instances tasty tasty-quickcheck transformers
    unordered-containers vector
  ];
  description = "More instances of FunctorWithIndex, FoldableWithIndex, TraversableWithIndex";
  license = lib.licenses.bsd2;
}
;
}
;
  integer-logarithms = {
  meta = {
    sha256 = "0yyj0g5xkm1pjkkr4smf25lpzc936df0fyc4nsj4bx145ggspx3k";
    url = "https://hackage.haskell.org";
    ver = "1.0.4";
  };
  drv = { mkDerivation, array, base, ghc-bignum, ghc-prim, lib, QuickCheck
, smallcheck, tasty, tasty-hunit, tasty-quickcheck
, tasty-smallcheck
}:
mkDerivation {
  pname = "integer-logarithms";
  version = "1.0.4";
  src = /nix/store/k2lb42vrllzklhbrczbxfyq30w2kpd90-source;
  libraryHaskellDepends = [ array base ghc-bignum ghc-prim ];
  testHaskellDepends = [
    base QuickCheck smallcheck tasty tasty-hunit tasty-quickcheck
    tasty-smallcheck
  ];
  homepage = "https://github.com/haskellari/integer-logarithms";
  description = "Integer logarithms";
  license = lib.licenses.mit;
}
;
}
;
  lifted-async = {
  meta = {
    sha256 = "0cgzs8sfr3l7ah5nnscpp50v5mmvc4hqf02zdi4h344dbbha10fy";
    url = "https://hackage.haskell.org";
    ver = "0.10.2.7";
  };
  drv = { mkDerivation, async, base, constraints, deepseq, HUnit, lib
, lifted-base, monad-control, mtl, tasty, tasty-bench
, tasty-expected-failure, tasty-hunit, tasty-th, transformers-base
}:
mkDerivation {
  pname = "lifted-async";
  version = "0.10.2.7";
  src = /nix/store/7fr6j14aj5sb57yg621rc9vysc7d1qcz-source;
  libraryHaskellDepends = [
    async base constraints lifted-base monad-control transformers-base
  ];
  testHaskellDepends = [
    async base HUnit lifted-base monad-control mtl tasty
    tasty-expected-failure tasty-hunit tasty-th
  ];
  benchmarkHaskellDepends = [ async base deepseq tasty-bench ];
  homepage = "https://github.com/maoe/lifted-async";
  description = "Run lifted IO operations asynchronously and wait for their results";
  license = lib.licenses.bsd3;
}
;
}
;
  lifted-base = {
  meta = {
    sha256 = "074bfycdqnr78y05xvgmfgk09fsnjxykij68ryi4xbrx7qwzqgqm";
    url = "https://hackage.haskell.org";
    ver = "0.2.3.12";
  };
  drv = { mkDerivation, base, criterion, HUnit, lib, monad-control
, monad-peel, test-framework, test-framework-hunit, transformers
, transformers-base, transformers-compat
}:
mkDerivation {
  pname = "lifted-base";
  version = "0.2.3.12";
  src = /nix/store/496mih1jblcvz44vwrjbjdhwv30cyh2z-source;
  libraryHaskellDepends = [ base monad-control transformers-base ];
  testHaskellDepends = [
    base HUnit monad-control test-framework test-framework-hunit
    transformers transformers-base transformers-compat
  ];
  benchmarkHaskellDepends = [
    base criterion monad-control monad-peel transformers
  ];
  homepage = "https://github.com/basvandijk/lifted-base";
  description = "lifted IO operations from the base library";
  license = lib.licenses.bsd3;
}
;
}
;
  monad-control = {
  meta = {
    sha256 = "150lv32h8ywx09j1shl33qvx0w68ixdxnv6yah050a3d0gq8xzks";
    url = "https://hackage.haskell.org";
    ver = "1.0.3.1";
  };
  drv = { mkDerivation, base, lib, stm, transformers, transformers-base
, transformers-compat
}:
mkDerivation {
  pname = "monad-control";
  version = "1.0.3.1";
  src = /nix/store/h3gg4hd0898vxqfbka5b2xz4qkvqxdx6-source;
  libraryHaskellDepends = [
    base stm transformers transformers-base transformers-compat
  ];
  homepage = "https://github.com/basvandijk/monad-control";
  description = "Lift control operations, like exception catching, through monad transformers";
  license = lib.licenses.bsd3;
}
;
}
;
  optparse-applicative = {
  meta = {
    sha256 = "0wggvi67lm2amw0igmpfqs75jvy91zv42v33c12vmk9fdqkwalmg";
    url = "https://hackage.haskell.org";
    ver = "0.18.1.0";
  };
  drv = { mkDerivation, base, lib, prettyprinter
, prettyprinter-ansi-terminal, process, QuickCheck, text
, transformers, transformers-compat
}:
mkDerivation {
  pname = "optparse-applicative";
  version = "0.18.1.0";
  src = /nix/store/zpydvqgb42zkwjbh3s5jrd3z8df7w8j3-source;
  libraryHaskellDepends = [
    base prettyprinter prettyprinter-ansi-terminal process text
    transformers transformers-compat
  ];
  testHaskellDepends = [ base QuickCheck ];
  homepage = "https://github.com/pcapriotti/optparse-applicative";
  description = "Utilities and combinators for parsing command line options";
  license = lib.licenses.bsd3;
}
;
}
;
  path = {
  meta = {
    sha256 = "16hgrkvd27c9vp5447d1dv3b3fi0fv0jfig10h2j37mzk4850wg8";
    url = "https://hackage.haskell.org";
    ver = "0.9.6";
  };
  drv = { mkDerivation, aeson, base, bytestring, deepseq, exceptions
, filepath, genvalidity, genvalidity-hspec, hashable, hspec, lib
, QuickCheck, template-haskell, text, validity-bytestring
}:
mkDerivation {
  pname = "path";
  version = "0.9.6";
  src = /nix/store/17x0d7bdy3wg6nq9zw20ndi417gy13ck-source;
  libraryHaskellDepends = [
    aeson base deepseq exceptions filepath hashable template-haskell
    text
  ];
  testHaskellDepends = [
    aeson base bytestring exceptions filepath genvalidity
    genvalidity-hspec hspec QuickCheck template-haskell
    validity-bytestring
  ];
  doHaddock = false;
  description = "Support for well-typed paths";
  license = lib.licenses.bsd3;
}
;
}
;
  path-io = {
  meta = {
    sha256 = "063ma7gzqr5c6s8a1yv72jgll3xdajvgclbc8w0ddmqgcrb62x2k";
    url = "https://hackage.haskell.org";
    ver = "1.8.2";
  };
  drv = { mkDerivation, base, containers, directory, dlist, exceptions
, filepath, hspec, lib, path, temporary, time, transformers
, unix-compat
}:
mkDerivation {
  pname = "path-io";
  version = "1.8.2";
  src = /nix/store/y2n6qszdsqdfhhbw4fl146qzyj1sa7zb-source;
  libraryHaskellDepends = [
    base containers directory dlist exceptions filepath path temporary
    time transformers unix-compat
  ];
  testHaskellDepends = [ base exceptions hspec path unix-compat ];
  homepage = "https://github.com/mrkkrp/path-io";
  description = "Interface to ‘directory’ package for users of ‘path’";
  license = lib.licenses.bsd3;
}
;
}
;
  pretty-show = {
  meta = {
    sha256 = "1q3pkp0ly221yf2r3skr6v0664bb0a6z7x82hvy6yl02ds2g9b1n";
    url = "https://hackage.haskell.org";
    ver = "1.10";
  };
  drv = { mkDerivation, array, base, filepath, ghc-prim, happy
, haskell-lexer, lib, pretty, text
}:
mkDerivation {
  pname = "pretty-show";
  version = "1.10";
  src = /nix/store/hk74slj8bkqv81b7pa18lp5hfzim2f3b-source;
  isLibrary = true;
  isExecutable = true;
  enableSeparateDataOutput = true;
  libraryHaskellDepends = [
    array base filepath ghc-prim haskell-lexer pretty text
  ];
  libraryToolDepends = [ happy ];
  executableHaskellDepends = [ base ];
  homepage = "http://wiki.github.com/yav/pretty-show";
  description = "Tools for working with derived `Show` instances and generic inspection of values";
  license = lib.licenses.mit;
  mainProgram = "ppsh";
}
;
}
;
  prettyprinter-ansi-terminal = {
  meta = {
    sha256 = "09m8knzfvms12576pp2nrdn7j0wikylwjfr9r3z4swgipz1r3nki";
    url = "https://hackage.haskell.org";
    ver = "1.1.3";
  };
  drv = { mkDerivation, ansi-terminal, base, base-compat, containers
, deepseq, doctest, gauge, lib, prettyprinter, QuickCheck, text
}:
mkDerivation {
  pname = "prettyprinter-ansi-terminal";
  version = "1.1.3";
  src = /nix/store/myazyhlvjsjzmqmlx3bwyy8jg7wzl2qz-source;
  libraryHaskellDepends = [ ansi-terminal base prettyprinter text ];
  testHaskellDepends = [ base doctest ];
  benchmarkHaskellDepends = [
    base base-compat containers deepseq gauge prettyprinter QuickCheck
    text
  ];
  homepage = "http://github.com/quchen/prettyprinter";
  description = "ANSI terminal backend for the »prettyprinter« package";
  license = lib.licenses.bsd2;
}
;
}
;
  scientific = {
  meta = {
    sha256 = "155cbbcyaqyxl2ij7q4fwi07qw3qnhwh4a97ccvrrfpd5lpl22q9";
    url = "https://hackage.haskell.org";
    ver = "0.3.8.0";
  };
  drv = { mkDerivation, base, binary, bytestring, containers, criterion
, deepseq, hashable, integer-logarithms, lib, primitive, QuickCheck
, smallcheck, tasty, tasty-hunit, tasty-quickcheck
, tasty-smallcheck, template-haskell, text
}:
mkDerivation {
  pname = "scientific";
  version = "0.3.8.0";
  src = /nix/store/ap146h1jfkj4cih3kbn9vnfhymsjllxa-source;
  libraryHaskellDepends = [
    base binary bytestring containers deepseq hashable
    integer-logarithms primitive template-haskell text
  ];
  testHaskellDepends = [
    base binary bytestring QuickCheck smallcheck tasty tasty-hunit
    tasty-quickcheck tasty-smallcheck text
  ];
  benchmarkHaskellDepends = [ base criterion ];
  homepage = "https://github.com/basvandijk/scientific";
  description = "Numbers represented using scientific notation";
  license = lib.licenses.bsd3;
}
;
}
;
  semialign = {
  meta = {
    sha256 = "05h1ab484ghd2wzx4pdlsfwiy6rayy0lzwk9yda9il7fjwi9sj7n";
    url = "https://hackage.haskell.org";
    ver = "1.3.1";
  };
  drv = { mkDerivation, base, containers, hashable, indexed-traversable
, indexed-traversable-instances, lib, semigroupoids, tagged, these
, transformers, unordered-containers, vector
}:
mkDerivation {
  pname = "semialign";
  version = "1.3.1";
  src = /nix/store/9s434gyr8vwcwm44822v5zzrn2wznq7l-source;
  libraryHaskellDepends = [
    base containers hashable indexed-traversable
    indexed-traversable-instances semigroupoids tagged these
    transformers unordered-containers vector
  ];
  homepage = "https://github.com/haskellari/these";
  description = "Align and Zip type-classes from the common Semialign ancestor";
  license = lib.licenses.bsd3;
}
;
}
;
  semigroupoids = {
  meta = {
    sha256 = "10qd2y5f5m7jzrha1wfbwwybhhghdwkdmk9ajybdz8h88cz9ig2g";
    url = "https://hackage.haskell.org";
    ver = "6.0.1";
  };
  drv = { mkDerivation, base, base-orphans, bifunctors, comonad, containers
, contravariant, distributive, hashable, lib, tagged
, template-haskell, transformers, transformers-compat
, unordered-containers
}:
mkDerivation {
  pname = "semigroupoids";
  version = "6.0.1";
  src = /nix/store/gxn0kl2l6iyvffws48hbkcdsiw77nlfq-source;
  libraryHaskellDepends = [
    base base-orphans bifunctors comonad containers contravariant
    distributive hashable tagged template-haskell transformers
    transformers-compat unordered-containers
  ];
  homepage = "http://github.com/ekmett/semigroupoids";
  description = "Semigroupoids: Category sans id";
  license = lib.licenses.bsd2;
}
;
}
;
  tasty = {
  meta = {
    sha256 = "1xjlmgsww34asjl9rcwbziw5l4qqbvi5l4b7qvzf4dc7hqkpq1rs";
    url = "https://hackage.haskell.org";
    ver = "1.5.3";
  };
  drv = { mkDerivation, ansi-terminal, base, containers, lib
, optparse-applicative, stm, tagged, transformers, unix
}:
mkDerivation {
  pname = "tasty";
  version = "1.5.3";
  src = /nix/store/9028fgac7afc6vw6is37lvq4p8gqpa7m-source;
  libraryHaskellDepends = [
    ansi-terminal base containers optparse-applicative stm tagged
    transformers unix
  ];
  homepage = "https://github.com/UnkindPartition/tasty";
  description = "Modern and extensible testing framework";
  license = lib.licenses.mit;
}
;
}
;
  tasty-hedgehog = {
  meta = {
    sha256 = "04kg2qdnsqzzmj3xggy2jcgidlp21lsjkz4sfnbq7b1yhrv2vbbc";
    url = "https://hackage.haskell.org";
    ver = "1.4.0.2";
  };
  drv = { mkDerivation, base, hedgehog, lib, tagged, tasty
, tasty-expected-failure
}:
mkDerivation {
  pname = "tasty-hedgehog";
  version = "1.4.0.2";
  src = /nix/store/b9mxq4fh65sif22q9a4g041jvp847cyc-source;
  libraryHaskellDepends = [ base hedgehog tagged tasty ];
  testHaskellDepends = [
    base hedgehog tasty tasty-expected-failure
  ];
  homepage = "https://github.com/qfpl/tasty-hedgehog";
  description = "Integration for tasty and hedgehog";
  license = lib.licenses.bsd3;
}
;
}
;
  text-iso8601 = {
  meta = {
    sha256 = "0lk8y0g5p2zamkgvxy7i5lqfpa4wnic9vg2bl87s801fniwdij3m";
    url = "https://hackage.haskell.org";
    ver = "0.1.1";
  };
  drv = { mkDerivation, attoparsec, attoparsec-iso8601, base
, integer-conversion, lib, QuickCheck, quickcheck-instances, tasty
, tasty-bench, tasty-hunit, tasty-quickcheck, text, time
, time-compat
}:
mkDerivation {
  pname = "text-iso8601";
  version = "0.1.1";
  src = /nix/store/si7h80rdb1dc7vhcgiqj34lwfbxaym4y-source;
  libraryHaskellDepends = [
    base integer-conversion text time time-compat
  ];
  testHaskellDepends = [
    base QuickCheck quickcheck-instances tasty tasty-hunit
    tasty-quickcheck text time-compat
  ];
  benchmarkHaskellDepends = [
    attoparsec attoparsec-iso8601 base tasty-bench text time-compat
  ];
  homepage = "https://github.com/haskell/aeson";
  description = "Converting time to and from ISO 8601 text";
  license = lib.licenses.bsd3;
}
;
}
;
  time-compat = {
  meta = {
    sha256 = "0xnsjpcdjms1k72b7h51i37m7qkmlrx1pw4h866p23cj2gvkf717";
    url = "https://hackage.haskell.org";
    ver = "1.9.8";
  };
  drv = { mkDerivation, base, base-orphans, deepseq, hashable, HUnit, lib
, QuickCheck, random, tagged, tasty, tasty-hunit, tasty-quickcheck
, template-haskell, time
}:
mkDerivation {
  pname = "time-compat";
  version = "1.9.8";
  src = /nix/store/493f9iawqs55ahffd5vbhh6i03dpacqg-source;
  libraryHaskellDepends = [
    base base-orphans deepseq hashable template-haskell time
  ];
  testHaskellDepends = [
    base deepseq hashable HUnit QuickCheck random tagged tasty
    tasty-hunit tasty-quickcheck template-haskell time
  ];
  homepage = "https://github.com/haskellari/time-compat";
  description = "Compatibility package for time";
  license = lib.licenses.bsd3;
}
;
}
;
  transformers-base = {
  meta = {
    sha256 = "125mrxdarrfsl87pfa00mjw9lz6xcgib0wfjsqmsaya0kd4ikhlm";
    url = "https://hackage.haskell.org";
    ver = "0.4.6";
  };
  drv = { mkDerivation, base, base-orphans, lib, stm, transformers
, transformers-compat
}:
mkDerivation {
  pname = "transformers-base";
  version = "0.4.6";
  src = /nix/store/17kgi67wirn85ph4l31mm4pf2cz66hnv-source;
  libraryHaskellDepends = [
    base base-orphans stm transformers transformers-compat
  ];
  homepage = "https://github.com/mvv/transformers-base";
  description = "Lift computations from the bottom of a transformer stack";
  license = lib.licenses.bsd3;
}
;
}
;
  unix-compat = {
  meta = {
    sha256 = "16g6vkqbmpdrvrx8gcl6zb5wk3qc7v0l9987xckd50lm4c74xrlr";
    url = "https://hackage.haskell.org";
    ver = "0.7.4";
  };
  drv = { mkDerivation, base, directory, extra, hspec, HUnit, lib
, monad-parallel, temporary, unix
}:
mkDerivation {
  pname = "unix-compat";
  version = "0.7.4";
  src = /nix/store/04x41bdapy5qbzsp5m5040qa5xdk71mv-source;
  libraryHaskellDepends = [ base unix ];
  testHaskellDepends = [
    base directory extra hspec HUnit monad-parallel temporary
  ];
  homepage = "https://github.com/haskell-pkg-janitors/unix-compat";
  description = "Portable POSIX-compatibility layer";
  license = lib.licenses.bsd3;
}
;
}
;
  witherable = {
  meta = {
    sha256 = "0xm77dqyfm0zh0xvnh1srwxrkn4sl7m126lqhbzc4q9f6lziwzdx";
    url = "https://hackage.haskell.org";
    ver = "0.5";
  };
  drv = { mkDerivation, base, base-orphans, containers, hashable
, indexed-traversable, indexed-traversable-instances, lib
, QuickCheck, quickcheck-instances, tasty, tasty-quickcheck
, transformers, unordered-containers, vector
}:
mkDerivation {
  pname = "witherable";
  version = "0.5";
  src = /nix/store/gz5hm6n4glpkkrhb8n86y8xpqa8xakf8-source;
  libraryHaskellDepends = [
    base base-orphans containers hashable indexed-traversable
    indexed-traversable-instances transformers unordered-containers
    vector
  ];
  testHaskellDepends = [
    base containers hashable QuickCheck quickcheck-instances tasty
    tasty-quickcheck transformers unordered-containers vector
  ];
  homepage = "https://github.com/fumieval/witherable";
  description = "filterable traversable";
  license = lib.licenses.bsd3;
}
;
}
;
};
lower = {
  aeson = {
  meta = {
    sha256 = "1f1f6h2r60ghz4p1ddi6wnq6z3i07j60sgm77hx2rvmncz4vizp0";
    ver = "2.1.2.1";
  };
  drv = { mkDerivation, attoparsec, base, base-compat
, base-compat-batteries, base-orphans, base16-bytestring
, bytestring, containers, data-fix, deepseq, Diff, directory, dlist
, exceptions, filepath, generic-deriving, generically, ghc-prim
, hashable, indexed-traversable, integer-logarithms, lib, OneTuple
, primitive, QuickCheck, quickcheck-instances, scientific
, semialign, strict, tagged, tasty, tasty-golden, tasty-hunit
, tasty-quickcheck, template-haskell, text, text-short
, th-abstraction, these, time, time-compat, unordered-containers
, uuid-types, vector, witherable
}:
mkDerivation {
  pname = "aeson";
  version = "2.1.2.1";
  src = /nix/store/hdckfxcpamn3qv2a0xn9pfzz64k0fpvp-source;
  libraryHaskellDepends = [
    attoparsec base base-compat-batteries bytestring containers
    data-fix deepseq dlist exceptions generically ghc-prim hashable
    indexed-traversable OneTuple primitive QuickCheck scientific
    semialign strict tagged template-haskell text text-short
    th-abstraction these time time-compat unordered-containers
    uuid-types vector witherable
  ];
  testHaskellDepends = [
    attoparsec base base-compat base-orphans base16-bytestring
    bytestring containers data-fix Diff directory dlist filepath
    generic-deriving generically ghc-prim hashable indexed-traversable
    integer-logarithms OneTuple primitive QuickCheck
    quickcheck-instances scientific strict tagged tasty tasty-golden
    tasty-hunit tasty-quickcheck template-haskell text text-short these
    time time-compat unordered-containers uuid-types vector
  ];
  homepage = "https://github.com/haskell/aeson";
  description = "Fast JSON parsing and encoding";
  license = lib.licenses.bsd3;
}
;
}
;
  ansi-terminal = {
  meta = {
    sha256 = "0g7ycc2b67z8plqp7hva914yhwzjmvvhhf9mszlhj3kqxh6i732b";
    ver = "0.11.5";
  };
  drv = { mkDerivation, ansi-terminal-types, base, colour, lib }:
mkDerivation {
  pname = "ansi-terminal";
  version = "0.11.5";
  src = /nix/store/alz2mx3prxb7bhg89b0hld8xqi1b22x9-source;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ ansi-terminal-types base colour ];
  homepage = "https://github.com/UnkindPartition/ansi-terminal";
  description = "Simple ANSI terminal support, with Windows compatibility";
  license = lib.licenses.bsd3;
}
;
}
;
  atomic-primops = {
  meta = {
    sha256 = "1hrzcqg0xg37xg1ihw0r106l5n9vmcr0i9zp3qbdk5v5nnrbvjd6";
    ver = "0.8.7";
  };
  drv = { mkDerivation, base, ghc-prim, lib, primitive }:
mkDerivation {
  pname = "atomic-primops";
  version = "0.8.7";
  src = /nix/store/695slfi3hv8nmlzfpd9bacd614cv13r6-source;
  libraryHaskellDepends = [ base ghc-prim primitive ];
  homepage = "https://github.com/rrnewton/haskell-lockfree/wiki";
  description = "A safe approach to CAS and other atomic ops in Haskell";
  license = lib.licenses.bsd3;
}
;
}
;
  attoparsec = {
  meta = {
    sha256 = "0y9dph5axyvr1bfcvmz6qh50bjcp50m2ljra14960anc6g74a3c8";
    ver = "0.14.4";
  };
  drv = { mkDerivation, array, base, bytestring, case-insensitive
, containers, deepseq, directory, filepath, ghc-prim, http-types
, lib, parsec, QuickCheck, quickcheck-unicode, scientific, tasty
, tasty-bench, tasty-quickcheck, text, transformers
, unordered-containers, vector
}:
mkDerivation {
  pname = "attoparsec";
  version = "0.14.4";
  src = /nix/store/cy9l5kw9c213v64k3q07lgxaga8yai9b-source;
  libraryHaskellDepends = [
    array base bytestring containers deepseq ghc-prim scientific text
    transformers
  ];
  testHaskellDepends = [
    array base bytestring deepseq QuickCheck quickcheck-unicode
    scientific tasty tasty-quickcheck text transformers vector
  ];
  benchmarkHaskellDepends = [
    array base bytestring case-insensitive containers deepseq directory
    filepath ghc-prim http-types parsec scientific tasty-bench text
    transformers unordered-containers vector
  ];
  doHaddock = false;
  homepage = "https://github.com/bgamari/attoparsec";
  description = "Fast combinator parsing for bytestrings and text";
  license = lib.licenses.bsd3;
}
;
}
;
  bifunctors = {
  meta = {
    sha256 = "1g0z6q5z04zgp7kaf917nrj2iiz1lsqh8ji5ny5ly534zr9zya2m";
    ver = "5.6.2";
  };
  drv = { mkDerivation, assoc, base, comonad, containers
, foldable1-classes-compat, hspec, hspec-discover, lib, QuickCheck
, tagged, template-haskell, th-abstraction, transformers
, transformers-compat
}:
mkDerivation {
  pname = "bifunctors";
  version = "5.6.2";
  src = /nix/store/a4rjc37gkzldsfvpg42wsldlhpmxnbzi-source;
  libraryHaskellDepends = [
    assoc base comonad containers foldable1-classes-compat tagged
    template-haskell th-abstraction transformers
  ];
  testHaskellDepends = [
    base hspec QuickCheck template-haskell transformers
    transformers-compat
  ];
  testToolDepends = [ hspec-discover ];
  homepage = "http://github.com/ekmett/bifunctors/";
  description = "Bifunctors";
  license = lib.licenses.bsd3;
}
;
}
;
  cabal-doctest = {
  meta = {
    sha256 = "0irxfxy1qw7sif4408xdhqycddb4hs3hcf6xfxm65glsnmnmwl2i";
    ver = "1.0.9";
  };
  drv = { mkDerivation, base, Cabal, directory, filepath, lib }:
mkDerivation {
  pname = "cabal-doctest";
  version = "1.0.9";
  src = /nix/store/zvv4lgrqgjx826ryk6697617pd3xpr7s-source;
  libraryHaskellDepends = [ base Cabal directory filepath ];
  homepage = "https://github.com/haskellari/cabal-doctest";
  description = "A Setup.hs helper for running doctests";
  license = lib.licenses.bsd3;
}
;
}
;
  comonad = {
  meta = {
    sha256 = "1wwn8z9f3flqlka2k51wqw8wsjcxbp8mwg6yp3vbn6akyjrn36gc";
    ver = "5.0.8";
  };
  drv = { mkDerivation, base, containers, distributive, indexed-traversable
, lib, tagged, transformers, transformers-compat
}:
mkDerivation {
  pname = "comonad";
  version = "5.0.8";
  src = /nix/store/q541saz9silsyzf34s10fdxk9j9yniag-source;
  libraryHaskellDepends = [
    base containers distributive indexed-traversable tagged
    transformers transformers-compat
  ];
  homepage = "http://github.com/ekmett/comonad/";
  description = "Comonads";
  license = lib.licenses.bsd3;
}
;
}
;
  concurrent-output = {
  meta = {
    sha256 = "1w87rrf337s8wc4z3dkh2mk990003jsk18ry5yawv4465k4yvamw";
    ver = "1.10.21";
  };
  drv = { mkDerivation, ansi-terminal, async, base, directory, exceptions
, lib, process, stm, terminal-size, text, transformers, unix
}:
mkDerivation {
  pname = "concurrent-output";
  version = "1.10.21";
  src = /nix/store/kwz3gmjbrzcw4iccsx2d0cyn85klblqy-source;
  libraryHaskellDepends = [
    ansi-terminal async base directory exceptions process stm
    terminal-size text transformers unix
  ];
  description = "Ungarble output from several threads or commands";
  license = lib.licenses.bsd2;
}
;
}
;
  hedgehog = {
  meta = {
    sha256 = "1jw890x5cg1bqrf8b5ydxywz55x05zrlba6xp34w2r6n1b1fjz0l";
    ver = "1.1.1";
  };
  drv = { mkDerivation, ansi-terminal, async, barbies, base, bytestring
, concurrent-output, containers, deepseq, directory, erf
, exceptions, lib, lifted-async, mmorph, monad-control, mtl
, pretty-show, primitive, random, resourcet, stm, template-haskell
, text, time, transformers, transformers-base, wl-pprint-annotated
}:
mkDerivation {
  pname = "hedgehog";
  version = "1.1.1";
  src = /nix/store/574ya8g9iysr7xcpci8999lq2q1my564-source;
  libraryHaskellDepends = [
    ansi-terminal async barbies base bytestring concurrent-output
    containers deepseq directory erf exceptions lifted-async mmorph
    monad-control mtl pretty-show primitive random resourcet stm
    template-haskell text time transformers transformers-base
    wl-pprint-annotated
  ];
  testHaskellDepends = [
    base containers mmorph mtl pretty-show text transformers
  ];
  homepage = "https://hedgehog.qa";
  description = "Release with confidence";
  license = lib.licenses.bsd3;
}
;
}
;
  incipit-base = {
  meta = {
    sha256 = "1078yyl5k94c9pr16rqd1i1g1fj8zx4iswhk7rcxb8f10fjqzapg";
    ver = "0.3.0.0";
  };
  drv = { mkDerivation, base, bytestring, containers, data-default, lib
, stm, text
}:
mkDerivation {
  pname = "incipit-base";
  version = "0.3.0.0";
  src = /nix/store/w1fzzs8bgzq8fgd0586xv8makrarbh5f-source;
  libraryHaskellDepends = [
    base bytestring containers data-default stm text
  ];
  homepage = "https://github.com/tek/incipit-core#readme";
  description = "A Prelude for Polysemy – Base Reexports";
  license = "BSD-2-Clause-Patent";
}
;
}
;
  incipit-core = {
  meta = {
    sha256 = "0q11zmxlpdb72p8c8zvr5hd7qca9c37crm70lm16jxlzw1qxk51b";
    ver = "0.3.0.0";
  };
  drv = { mkDerivation, base, incipit-base, lib, polysemy }:
mkDerivation {
  pname = "incipit-core";
  version = "0.3.0.0";
  src = /nix/store/nf4ai8x4y430mava2wp59gfs5a3h51i8-source;
  libraryHaskellDepends = [ base incipit-base polysemy ];
  homepage = "https://github.com/tek/incipit-core#readme";
  description = "A Prelude for Polysemy";
  license = "BSD-2-Clause-Patent";
}
;
}
;
  indexed-traversable = {
  meta = {
    sha256 = "061xzz9m77rs6bk5vv2hd7givyq7ln0xffc6m1cxyyhyyr6lw3k0";
    ver = "0.1.4";
  };
  drv = { mkDerivation, array, base, containers, foldable1-classes-compat
, lib, transformers
}:
mkDerivation {
  pname = "indexed-traversable";
  version = "0.1.4";
  src = /nix/store/ng2979ljz7gbx6d7ar1qj6v5h2vig11h-source;
  libraryHaskellDepends = [
    array base containers foldable1-classes-compat transformers
  ];
  description = "FunctorWithIndex, FoldableWithIndex, TraversableWithIndex";
  license = lib.licenses.bsd2;
}
;
}
;
  indexed-traversable-instances = {
  meta = {
    sha256 = "05vpkasz70yjf09hsmbw7nap70sr8p5b7hrsdbmij8k8xqf3qg8r";
    ver = "0.1.2";
  };
  drv = { mkDerivation, base, containers, indexed-traversable, lib
, OneTuple, QuickCheck, quickcheck-instances, tagged, tasty
, tasty-quickcheck, transformers, unordered-containers, vector
}:
mkDerivation {
  pname = "indexed-traversable-instances";
  version = "0.1.2";
  src = /nix/store/dk7n8w7k4bfq5iph1v2z0fl8mh8s3js3-source;
  libraryHaskellDepends = [
    base indexed-traversable OneTuple tagged unordered-containers
    vector
  ];
  testHaskellDepends = [
    base containers indexed-traversable OneTuple QuickCheck
    quickcheck-instances tasty tasty-quickcheck transformers
    unordered-containers vector
  ];
  description = "More instances of FunctorWithIndex, FoldableWithIndex, TraversableWithIndex";
  license = lib.licenses.bsd2;
}
;
}
;
  optparse-applicative = {
  meta = {
    sha256 = "0wggvi67lm2amw0igmpfqs75jvy91zv42v33c12vmk9fdqkwalmg";
    ver = "0.18.1.0";
  };
  drv = { mkDerivation, base, lib, prettyprinter
, prettyprinter-ansi-terminal, process, QuickCheck, text
, transformers, transformers-compat
}:
mkDerivation {
  pname = "optparse-applicative";
  version = "0.18.1.0";
  src = /nix/store/zpydvqgb42zkwjbh3s5jrd3z8df7w8j3-source;
  libraryHaskellDepends = [
    base prettyprinter prettyprinter-ansi-terminal process text
    transformers transformers-compat
  ];
  testHaskellDepends = [ base QuickCheck ];
  homepage = "https://github.com/pcapriotti/optparse-applicative";
  description = "Utilities and combinators for parsing command line options";
  license = lib.licenses.bsd3;
}
;
}
;
  path = {
  meta = {
    sha256 = "0nk3rp5fk97m4y163dyd1y488062djzj071xdd90yyghi5pgvrb5";
    ver = "0.9.1";
  };
  drv = { mkDerivation, aeson, base, bytestring, deepseq, exceptions
, filepath, genvalidity, genvalidity-hspec, genvalidity-property
, hashable, hspec, lib, mtl, QuickCheck, template-haskell, text
, validity
}:
mkDerivation {
  pname = "path";
  version = "0.9.1";
  src = /nix/store/9pr85w0qq87ak44gdyqgnarmv5ppdqga-source;
  libraryHaskellDepends = [
    aeson base deepseq exceptions filepath hashable template-haskell
    text
  ];
  testHaskellDepends = [
    aeson base bytestring filepath genvalidity genvalidity-hspec
    genvalidity-property hspec mtl QuickCheck template-haskell validity
  ];
  description = "Support for well-typed paths";
  license = lib.licenses.bsd3;
}
;
}
;
  path-io = {
  meta = {
    sha256 = "05hcxgyf6kkz36mazd0fqwb6mjy2049gx3vh8qq9h93gfjkpp2vc";
    ver = "1.6.3";
  };
  drv = { mkDerivation, base, containers, directory, dlist, exceptions
, filepath, hspec, lib, path, temporary, time, transformers
, unix-compat
}:
mkDerivation {
  pname = "path-io";
  version = "1.6.3";
  src = /nix/store/vgfbjck2brpd6zb090ljasw6z2xgvif9-source;
  libraryHaskellDepends = [
    base containers directory dlist exceptions filepath path temporary
    time transformers unix-compat
  ];
  testHaskellDepends = [
    base directory exceptions filepath hspec path transformers
    unix-compat
  ];
  homepage = "https://github.com/mrkkrp/path-io";
  description = "Interface to ‘directory’ package for users of ‘path’";
  license = lib.licenses.bsd3;
}
;
}
;
  polysemy = {
  meta = {
    sha256 = "15k51ysrfcbkww1562g8zvrlzymlk2rxhcsz9ipsb0q6h571qgvf";
    ver = "1.6.0.0";
  };
  drv = { mkDerivation, async, base, Cabal, cabal-doctest, containers
, criterion, doctest, first-class-families, free, freer-simple
, hspec, hspec-discover, inspection-testing, lib, mtl, QuickCheck
, stm, syb, template-haskell, th-abstraction, transformers
, type-errors, unagi-chan
}:
mkDerivation {
  pname = "polysemy";
  version = "1.6.0.0";
  src = /nix/store/kmala48rqnh42ls38mb9qfx49ssbi3js-source;
  setupHaskellDepends = [ base Cabal cabal-doctest ];
  libraryHaskellDepends = [
    async base containers first-class-families mtl QuickCheck stm syb
    template-haskell th-abstraction transformers type-errors unagi-chan
  ];
  testHaskellDepends = [
    async base containers doctest first-class-families hspec
    inspection-testing mtl QuickCheck stm syb template-haskell
    th-abstraction transformers type-errors unagi-chan
  ];
  testToolDepends = [ hspec-discover ];
  benchmarkHaskellDepends = [
    async base containers criterion first-class-families free
    freer-simple mtl QuickCheck stm syb template-haskell th-abstraction
    transformers type-errors unagi-chan
  ];
  homepage = "https://github.com/polysemy-research/polysemy#readme";
  description = "Higher-order, low-boilerplate free monads";
  license = lib.licenses.bsd3;
}
;
}
;
  prettyprinter-ansi-terminal = {
  meta = {
    sha256 = "09m8knzfvms12576pp2nrdn7j0wikylwjfr9r3z4swgipz1r3nki";
    ver = "1.1.3";
  };
  drv = { mkDerivation, ansi-terminal, base, base-compat, containers
, deepseq, doctest, gauge, lib, prettyprinter, QuickCheck, text
}:
mkDerivation {
  pname = "prettyprinter-ansi-terminal";
  version = "1.1.3";
  src = /nix/store/myazyhlvjsjzmqmlx3bwyy8jg7wzl2qz-source;
  libraryHaskellDepends = [ ansi-terminal base prettyprinter text ];
  testHaskellDepends = [ base doctest ];
  benchmarkHaskellDepends = [
    base base-compat containers deepseq gauge prettyprinter QuickCheck
    text
  ];
  homepage = "http://github.com/quchen/prettyprinter";
  description = "ANSI terminal backend for the »prettyprinter« package";
  license = lib.licenses.bsd2;
}
;
}
;
  primitive = {
  meta = {
    sha256 = "0n7r8al9wgz4r7jzizapn1dbnkqxwx2c4lqkgfm5q5bxj8fl7g1c";
    ver = "0.7.4.0";
  };
  drv = { mkDerivation, base, base-orphans, deepseq, ghc-prim, lib
, QuickCheck, quickcheck-classes-base, tagged, tasty, tasty-bench
, tasty-quickcheck, template-haskell, transformers
, transformers-compat
}:
mkDerivation {
  pname = "primitive";
  version = "0.7.4.0";
  src = /nix/store/n8mj8jw45a66zwlskiky68hgd81jm3xf-source;
  libraryHaskellDepends = [
    base deepseq template-haskell transformers
  ];
  testHaskellDepends = [
    base base-orphans ghc-prim QuickCheck quickcheck-classes-base
    tagged tasty tasty-quickcheck transformers transformers-compat
  ];
  benchmarkHaskellDepends = [
    base deepseq tasty-bench transformers
  ];
  homepage = "https://github.com/haskell/primitive";
  description = "Primitive memory-related operations";
  license = lib.licenses.bsd3;
}
;
}
;
  resourcet = {
  meta = {
    sha256 = "0k96r6mx6zf0nr5y7xjzyhizx80svjfa3a47hcyys10y08rgqvln";
    ver = "1.2.6";
  };
  drv = { mkDerivation, base, containers, exceptions, hspec, lib, mtl
, primitive, transformers, unliftio-core
}:
mkDerivation {
  pname = "resourcet";
  version = "1.2.6";
  src = /nix/store/24mb99pw0jwp7smm9lwwvacnkccpr7pd-source;
  libraryHaskellDepends = [
    base containers exceptions mtl primitive transformers unliftio-core
  ];
  testHaskellDepends = [ base exceptions hspec transformers ];
  homepage = "http://github.com/snoyberg/conduit";
  description = "Deterministic allocation and freeing of scarce resources";
  license = lib.licenses.bsd3;
}
;
}
;
  scientific = {
  meta = {
    sha256 = "09iwj0snmx7vj7x03l4vdcn76zylcgxd9pyz0yxkydgfnn3lvc08";
    ver = "0.3.7.0";
  };
  drv = { mkDerivation, base, binary, bytestring, containers, criterion
, deepseq, hashable, integer-logarithms, lib, primitive, QuickCheck
, smallcheck, tasty, tasty-hunit, tasty-quickcheck
, tasty-smallcheck, template-haskell, text
}:
mkDerivation {
  pname = "scientific";
  version = "0.3.7.0";
  src = /nix/store/w1dja7k810rw0zjrx9r91il6im2gq4iv-source;
  libraryHaskellDepends = [
    base binary bytestring containers deepseq hashable
    integer-logarithms primitive template-haskell text
  ];
  testHaskellDepends = [
    base binary bytestring QuickCheck smallcheck tasty tasty-hunit
    tasty-quickcheck tasty-smallcheck text
  ];
  benchmarkHaskellDepends = [ base criterion ];
  homepage = "https://github.com/basvandijk/scientific";
  description = "Numbers represented using scientific notation";
  license = lib.licenses.bsd3;
}
;
}
;
  semialign = {
  meta = {
    sha256 = "09147lz8z79ghnpr7z08y9dd0l6c9dz9hz85avfh6z330vl25r95";
    ver = "1.3";
  };
  drv = { mkDerivation, base, containers, hashable, indexed-traversable
, indexed-traversable-instances, lib, semigroupoids, tagged, these
, transformers, unordered-containers, vector
}:
mkDerivation {
  pname = "semialign";
  version = "1.3";
  src = /nix/store/010v4lpl04wiffljasal5rg7sqqcw8sh-source;
  libraryHaskellDepends = [
    base containers hashable indexed-traversable
    indexed-traversable-instances semigroupoids tagged these
    transformers unordered-containers vector
  ];
  homepage = "https://github.com/haskellari/these";
  description = "Align and Zip type-classes from the common Semialign ancestor";
  license = lib.licenses.bsd3;
}
;
}
;
  semigroupoids = {
  meta = {
    sha256 = "10qd2y5f5m7jzrha1wfbwwybhhghdwkdmk9ajybdz8h88cz9ig2g";
    ver = "6.0.1";
  };
  drv = { mkDerivation, base, base-orphans, bifunctors, comonad, containers
, contravariant, distributive, foldable1-classes-compat, hashable
, lib, tagged, template-haskell, transformers, transformers-compat
, unordered-containers
}:
mkDerivation {
  pname = "semigroupoids";
  version = "6.0.1";
  src = /nix/store/gxn0kl2l6iyvffws48hbkcdsiw77nlfq-source;
  libraryHaskellDepends = [
    base base-orphans bifunctors comonad containers contravariant
    distributive foldable1-classes-compat hashable tagged
    template-haskell transformers transformers-compat
    unordered-containers
  ];
  homepage = "http://github.com/ekmett/semigroupoids";
  description = "Semigroupoids: Category sans id";
  license = lib.licenses.bsd2;
}
;
}
;
  tasty = {
  meta = {
    sha256 = "1vnwvsngrvh1swlnmv3hzj1srj5yc6hf3k2gccqs732fl1y9wj2c";
    ver = "1.4.3";
  };
  drv = { mkDerivation, ansi-terminal, base, containers, lib
, optparse-applicative, stm, tagged, transformers, unix
}:
mkDerivation {
  pname = "tasty";
  version = "1.4.3";
  src = /nix/store/4igv5s3b9r47h8hdbf1m1qqmah05i3y6-source;
  libraryHaskellDepends = [
    ansi-terminal base containers optparse-applicative stm tagged
    transformers unix
  ];
  homepage = "https://github.com/UnkindPartition/tasty";
  description = "Modern and extensible testing framework";
  license = lib.licenses.mit;
}
;
}
;
  tasty-hedgehog = {
  meta = {
    sha256 = "0cs96s7z5csrlwj334v8zl459j5s4ws6gmjh59cv01wwvvrrjwd9";
    ver = "1.1.0.0";
  };
  drv = { mkDerivation, base, hedgehog, lib, tagged, tasty
, tasty-expected-failure
}:
mkDerivation {
  pname = "tasty-hedgehog";
  version = "1.1.0.0";
  src = /nix/store/zgd5n9ayjd67p7665rrqbvzxl2zn4a10-source;
  libraryHaskellDepends = [ base hedgehog tagged tasty ];
  testHaskellDepends = [
    base hedgehog tasty tasty-expected-failure
  ];
  homepage = "https://github.com/qfpl/tasty-hedgehog";
  description = "Integration for tasty and hedgehog";
  license = lib.licenses.bsd3;
}
;
}
;
  temporary = {
  meta = {
    sha256 = "17nb9mzhfg07y1308qv1n018dy7rljs8rrjdkn1c22rahsqg7kk9";
    ver = "1.3";
  };
  drv = { mkDerivation, base, base-compat, directory, exceptions, filepath
, lib, random, tasty, tasty-hunit, transformers, unix
}:
mkDerivation {
  pname = "temporary";
  version = "1.3";
  src = /nix/store/5fkshcyffxxi6w1s7da9ncwm86bxsd8j-source;
  libraryHaskellDepends = [
    base directory exceptions filepath random transformers unix
  ];
  testHaskellDepends = [
    base base-compat directory filepath tasty tasty-hunit unix
  ];
  homepage = "https://github.com/feuerbach/temporary";
  description = "Portable temporary file and directory support";
  license = lib.licenses.bsd3;
}
;
}
;
  th-abstraction = {
  meta = {
    sha256 = "19nh7a9b4yif6sijp6xns6xlxcr1mcyrqx3cfbp5bdm7mkbda7a9";
    ver = "0.4.5.0";
  };
  drv = { mkDerivation, base, containers, ghc-prim, lib, template-haskell
}:
mkDerivation {
  pname = "th-abstraction";
  version = "0.4.5.0";
  src = /nix/store/60fdh9cnrz0zzin9ali21npxs10n3f51-source;
  libraryHaskellDepends = [
    base containers ghc-prim template-haskell
  ];
  testHaskellDepends = [ base containers template-haskell ];
  homepage = "https://github.com/glguy/th-abstraction";
  description = "Nicer interface for reified information about data types";
  license = lib.licenses.isc;
}
;
}
;
  type-errors = {
  meta = {
    sha256 = "09rkyqhx8jnzqiq7gpcm5jd1xd435h0ma0b2sff18lk31qv01x6g";
    ver = "0.2.0.2";
  };
  drv = { mkDerivation, base, doctest, first-class-families, lib, syb
, template-haskell, th-abstraction
}:
mkDerivation {
  pname = "type-errors";
  version = "0.2.0.2";
  src = /nix/store/kiz1m5rj1riyf995rgipyr4g9g8xlnni-source;
  libraryHaskellDepends = [
    base first-class-families syb template-haskell th-abstraction
  ];
  testHaskellDepends = [
    base doctest first-class-families syb template-haskell
    th-abstraction
  ];
  homepage = "https://github.com/isovector/type-errors#readme";
  description = "Tools for writing better type errors";
  license = lib.licenses.bsd3;
}
;
}
;
  unagi-chan = {
  meta = {
    sha256 = "1glfzdm732p0zbwq6vg0syw4cg7f72k1982rc6ha8wyr46czdlmm";
    ver = "0.4.1.4";
  };
  drv = { mkDerivation, async, atomic-primops, base, containers, criterion
, ghc-prim, lib, primitive
}:
mkDerivation {
  pname = "unagi-chan";
  version = "0.4.1.4";
  src = /nix/store/2p0881jypzjz8p12jq75cn3ynmns8rxr-source;
  libraryHaskellDepends = [ atomic-primops base ghc-prim primitive ];
  testHaskellDepends = [
    atomic-primops base containers ghc-prim primitive
  ];
  benchmarkHaskellDepends = [ async base criterion ];
  description = "Fast concurrent queues with a Chan-like API, and more";
  license = lib.licenses.bsd3;
}
;
}
;
  vector = {
  meta = {
    sha256 = "0c1nw2sx14y29afdbwl40sk9vznx71rja5jcg14b8986778kl32d";
    ver = "0.13.1.0";
  };
  drv = { mkDerivation, base, base-orphans, deepseq, doctest, HUnit, lib
, primitive, QuickCheck, random, tasty, tasty-bench, tasty-hunit
, tasty-inspection-testing, tasty-quickcheck, template-haskell
, transformers, vector-stream
}:
mkDerivation {
  pname = "vector";
  version = "0.13.1.0";
  src = /nix/store/44g0nh165fmk0mj359hiq2s03ymx3h4h-source;
  libraryHaskellDepends = [ base deepseq primitive vector-stream ];
  testHaskellDepends = [
    base base-orphans doctest HUnit primitive QuickCheck random tasty
    tasty-hunit tasty-inspection-testing tasty-quickcheck
    template-haskell transformers
  ];
  benchmarkHaskellDepends = [ base random tasty tasty-bench ];
  homepage = "https://github.com/haskell/vector";
  description = "Efficient Arrays";
  license = lib.licenses.bsd3;
}
;
}
;
  witherable = {
  meta = {
    sha256 = "1ga4al351kwcfvsdr1ngyzj4aypvl46w357jflmgxacad8iqx4ik";
    ver = "0.4.2";
  };
  drv = { mkDerivation, base, base-orphans, containers, hashable
, indexed-traversable, indexed-traversable-instances, lib
, QuickCheck, quickcheck-instances, tasty, tasty-quickcheck
, transformers, unordered-containers, vector
}:
mkDerivation {
  pname = "witherable";
  version = "0.4.2";
  src = /nix/store/khn670w6drfhl6sgppi35rwi3ql27mrg-source;
  libraryHaskellDepends = [
    base base-orphans containers hashable indexed-traversable
    indexed-traversable-instances transformers unordered-containers
    vector
  ];
  testHaskellDepends = [
    base containers hashable QuickCheck quickcheck-instances tasty
    tasty-quickcheck transformers unordered-containers vector
  ];
  homepage = "https://github.com/fumieval/witherable";
  description = "filterable traversable";
  license = lib.licenses.bsd3;
}
;
}
;
};
min = {
};
profiled = {
};
}