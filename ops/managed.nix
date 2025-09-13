{
  bounds = {
    polysemy-test = {
      base = {
        lower = "4.16.4.0";
        upper = "4.21";
      };
      hedgehog = {
        lower = "1.1.1";
        upper = "1.7";
      };
      incipit-core = {
        lower = "0.3.0.0";
        upper = "0.7";
      };
      path = {
        lower = "0.9.1";
        upper = "0.10";
      };
      path-io = {
        lower = "1.6.3";
        upper = "1.9";
      };
      polysemy = {
        lower = "1.6.0.0";
        upper = "1.10";
      };
      polysemy-test = {
        lower = null;
        upper = null;
      };
      tasty = {
        lower = "1.4.3";
        upper = "1.6";
      };
      tasty-hedgehog = {
        lower = "1.1.0.0";
        upper = "1.5";
      };
      transformers = {
        lower = "0.5.6.2";
        upper = "0.7";
      };
    };
  };
  versions = {
    latest = {
      base = "4.20.0.0";
      hedgehog = "1.6";
      incipit-core = "0.6.1.1";
      path = "0.9.6";
      path-io = "1.8.2";
      polysemy = "1.9.2.0";
      tasty = "1.5.3";
      tasty-hedgehog = "1.4.0.2";
      transformers = "0.6.1.1";
    };
    lower = {
      base = "4.16.4.0";
      hedgehog = "1.1.1";
      incipit-core = "0.3.0.0";
      path = "0.9.1";
      path-io = "1.6.3";
      polysemy = "1.6.0.0";
      tasty = "1.4.3";
      tasty-hedgehog = "1.1.0.0";
      transformers = "0.5.6.2";
    };
  };
  initial = {
    latest = {};
    lower = {
      hedgehog = "1.3";
      incipit-core = "0.6.0.0";
      path = "0.9.1";
      path-io = "1.8.0";
      polysemy = "1.9.1.3";
      tasty = "1.4.0.3";
      tasty-hedgehog = "1.4.0.0";
      transformers = "0.5.6.2";
    };
  };
  overrides = {
    latest = {
      QuickCheck = {
        version = "2.15.0.1";
        hash = "1dcqv7z83wrbv7wvm7hdvjapfyzi9g4wjwsh9x6zh9ff622z53lb";
        repo = "hackage.haskell.org";
      };
      aeson = {
        version = "2.2.2.0";
        hash = "12lr0rzlds8zrij140h0bcji25nawwp19dq0yyx93hz8ia9621fp";
        repo = "hackage.haskell.org";
      };
      ansi-terminal = {
        version = "1.1.2";
        hash = "1jpim6z8a074h427ah2yqbkm0krcy9yq28276fcdrxm6ji8pa302";
        repo = "hackage.haskell.org";
      };
      ansi-terminal-types = {
        version = "1.1";
        hash = "06q2ygb33a3kv8z0xk75dyc2a32si82yc8126dz97xq03pinym8h";
        repo = "hackage.haskell.org";
      };
      barbies = {
        version = "2.1.1.0";
        hash = "0sf5j8ll1iw56yjrg4pj4csfbb95spjz2jpk8qiflszn4rbszbi8";
        repo = "hackage.haskell.org";
      };
      base-orphans = {
        version = "0.9.3";
        hash = "0428rpslw0xdqm92aay0p11fa0pvdilvsg9xdirqdhc5z3rhnkmm";
        repo = "hackage.haskell.org";
      };
      bifunctors = {
        version = "5.6.2";
        hash = "1g0z6q5z04zgp7kaf917nrj2iiz1lsqh8ji5ny5ly534zr9zya2m";
        repo = "hackage.haskell.org";
      };
      cabal-doctest = {
        version = "1.0.9";
        hash = "0irxfxy1qw7sif4408xdhqycddb4hs3hcf6xfxm65glsnmnmwl2i";
        repo = "hackage.haskell.org";
      };
      comonad = {
        version = "5.0.9";
        hash = "0j7xm3vdd7icc6z557kph79g3z0c2xfi67lm3yzky0nhxgmcjckd";
        repo = "hackage.haskell.org";
      };
      concurrent-output = {
        version = "1.10.21";
        hash = "1w87rrf337s8wc4z3dkh2mk990003jsk18ry5yawv4465k4yvamw";
        repo = "hackage.haskell.org";
      };
      data-default = {
        version = "0.8.0.1";
        hash = "0j7n0hc76k7h15kkr8rd788ila914zhwknvfmijlrzxzm9dvxfkf";
        repo = "hackage.haskell.org";
      };
      distributive = {
        version = "0.6.2.1";
        hash = "1yfw2p46wbs3mcvw22b7f7x1jyrfinslb1bdx83v1v17q95aldj7";
        repo = "hackage.haskell.org";
      };
      happy = {
        version = "2.1.5";
        hash = "009gfg22ym8597zqlxpvyih36r8jr9l3hj01lbyfjiar86j85kmc";
        repo = "hackage.haskell.org";
      };
      happy-lib = {
        version = "2.1.5";
        hash = "1r70avvngv9smip563qh6hmivqirikg48f91jrp3q1al487b6daz";
        repo = "hackage.haskell.org";
      };
      haskell-lexer = {
        version = "1.2.1";
        hash = "06qwzp3xbk6l0rcvy4b4asr7hwc2fr96l3z1596agj80521fl0cx";
        repo = "hackage.haskell.org";
      };
      hedgehog = {
        version = "1.6";
        hash = "1z3lry3pbni71hlvm2qkjjnhw3spgxh8pm1slhp55aszfmk4zsp6";
        repo = "hackage.haskell.org";
      };
      hsc2hs = {
        version = "0.68.10";
        hash = "0wdg17kicnp6qbgynha216vihx7nnsglvhn5c089dqpa14hg35zw";
        repo = "hackage.haskell.org";
      };
      incipit-base = {
        version = "0.6.1.1";
        hash = "08ybv7j94yyznrxnrh744bi3i1a00sz8bf5ddfs9vfgfhhkrg8fn";
        repo = "hackage.haskell.org";
      };
      incipit-core = {
        version = "0.6.1.1";
        hash = "0qpw07f8ip6h7srqkbzfxyz1z36n75irhc6465s9xvrii1840b2k";
        repo = "hackage.haskell.org";
      };
      indexed-traversable-instances = {
        version = "0.1.2";
        hash = "05vpkasz70yjf09hsmbw7nap70sr8p5b7hrsdbmij8k8xqf3qg8r";
        repo = "hackage.haskell.org";
      };
      integer-logarithms = {
        version = "1.0.4";
        hash = "0yyj0g5xkm1pjkkr4smf25lpzc936df0fyc4nsj4bx145ggspx3k";
        repo = "hackage.haskell.org";
      };
      lifted-async = {
        version = "0.10.2.7";
        hash = "0cgzs8sfr3l7ah5nnscpp50v5mmvc4hqf02zdi4h344dbbha10fy";
        repo = "hackage.haskell.org";
      };
      lifted-base = {
        version = "0.2.3.12";
        hash = "074bfycdqnr78y05xvgmfgk09fsnjxykij68ryi4xbrx7qwzqgqm";
        repo = "hackage.haskell.org";
      };
      monad-control = {
        version = "1.0.3.1";
        hash = "150lv32h8ywx09j1shl33qvx0w68ixdxnv6yah050a3d0gq8xzks";
        repo = "hackage.haskell.org";
      };
      optparse-applicative = {
        version = "0.18.1.0";
        hash = "0wggvi67lm2amw0igmpfqs75jvy91zv42v33c12vmk9fdqkwalmg";
        repo = "hackage.haskell.org";
      };
      path = {
        version = "0.9.6";
        hash = "16hgrkvd27c9vp5447d1dv3b3fi0fv0jfig10h2j37mzk4850wg8";
        repo = "hackage.haskell.org";
      };
      path-io = {
        version = "1.8.2";
        hash = "063ma7gzqr5c6s8a1yv72jgll3xdajvgclbc8w0ddmqgcrb62x2k";
        repo = "hackage.haskell.org";
      };
      pretty-show = {
        version = "1.10";
        hash = "1q3pkp0ly221yf2r3skr6v0664bb0a6z7x82hvy6yl02ds2g9b1n";
        repo = "hackage.haskell.org";
      };
      prettyprinter-ansi-terminal = {
        version = "1.1.3";
        hash = "09m8knzfvms12576pp2nrdn7j0wikylwjfr9r3z4swgipz1r3nki";
        repo = "hackage.haskell.org";
      };
      scientific = {
        version = "0.3.8.0";
        hash = "155cbbcyaqyxl2ij7q4fwi07qw3qnhwh4a97ccvrrfpd5lpl22q9";
        repo = "hackage.haskell.org";
      };
      semialign = {
        version = "1.3.1";
        hash = "05h1ab484ghd2wzx4pdlsfwiy6rayy0lzwk9yda9il7fjwi9sj7n";
        repo = "hackage.haskell.org";
      };
      semigroupoids = {
        version = "6.0.1";
        hash = "10qd2y5f5m7jzrha1wfbwwybhhghdwkdmk9ajybdz8h88cz9ig2g";
        repo = "hackage.haskell.org";
      };
      tasty = {
        version = "1.5.3";
        hash = "1xjlmgsww34asjl9rcwbziw5l4qqbvi5l4b7qvzf4dc7hqkpq1rs";
        repo = "hackage.haskell.org";
      };
      tasty-hedgehog = {
        version = "1.4.0.2";
        hash = "04kg2qdnsqzzmj3xggy2jcgidlp21lsjkz4sfnbq7b1yhrv2vbbc";
        repo = "hackage.haskell.org";
      };
      text-iso8601 = {
        version = "0.1.1";
        hash = "0lk8y0g5p2zamkgvxy7i5lqfpa4wnic9vg2bl87s801fniwdij3m";
        repo = "hackage.haskell.org";
      };
      time-compat = {
        version = "1.9.8";
        hash = "0xnsjpcdjms1k72b7h51i37m7qkmlrx1pw4h866p23cj2gvkf717";
        repo = "hackage.haskell.org";
      };
      transformers-base = {
        version = "0.4.6";
        hash = "125mrxdarrfsl87pfa00mjw9lz6xcgib0wfjsqmsaya0kd4ikhlm";
        repo = "hackage.haskell.org";
      };
      unix-compat = {
        version = "0.7.4";
        hash = "16g6vkqbmpdrvrx8gcl6zb5wk3qc7v0l9987xckd50lm4c74xrlr";
        repo = "hackage.haskell.org";
      };
      witherable = {
        version = "0.5";
        hash = "0xm77dqyfm0zh0xvnh1srwxrkn4sl7m126lqhbzc4q9f6lziwzdx";
        repo = "hackage.haskell.org";
      };
    };
    lower = {
      aeson = {
        version = "2.1.2.1";
        hash = "1f1f6h2r60ghz4p1ddi6wnq6z3i07j60sgm77hx2rvmncz4vizp0";
      };
      ansi-terminal = {
        version = "0.11.5";
        hash = "0g7ycc2b67z8plqp7hva914yhwzjmvvhhf9mszlhj3kqxh6i732b";
      };
      atomic-primops = {
        version = "0.8.7";
        hash = "1hrzcqg0xg37xg1ihw0r106l5n9vmcr0i9zp3qbdk5v5nnrbvjd6";
      };
      attoparsec = {
        version = "0.14.4";
        hash = "0y9dph5axyvr1bfcvmz6qh50bjcp50m2ljra14960anc6g74a3c8";
      };
      bifunctors = {
        version = "5.6.2";
        hash = "1g0z6q5z04zgp7kaf917nrj2iiz1lsqh8ji5ny5ly534zr9zya2m";
      };
      cabal-doctest = {
        version = "1.0.9";
        hash = "0irxfxy1qw7sif4408xdhqycddb4hs3hcf6xfxm65glsnmnmwl2i";
      };
      comonad = {
        version = "5.0.8";
        hash = "1wwn8z9f3flqlka2k51wqw8wsjcxbp8mwg6yp3vbn6akyjrn36gc";
      };
      concurrent-output = {
        version = "1.10.21";
        hash = "1w87rrf337s8wc4z3dkh2mk990003jsk18ry5yawv4465k4yvamw";
      };
      hedgehog = {
        version = "1.1.1";
        hash = "1jw890x5cg1bqrf8b5ydxywz55x05zrlba6xp34w2r6n1b1fjz0l";
      };
      incipit-base = {
        version = "0.3.0.0";
        hash = "1078yyl5k94c9pr16rqd1i1g1fj8zx4iswhk7rcxb8f10fjqzapg";
      };
      incipit-core = {
        version = "0.3.0.0";
        hash = "0q11zmxlpdb72p8c8zvr5hd7qca9c37crm70lm16jxlzw1qxk51b";
      };
      indexed-traversable = {
        version = "0.1.4";
        hash = "061xzz9m77rs6bk5vv2hd7givyq7ln0xffc6m1cxyyhyyr6lw3k0";
      };
      indexed-traversable-instances = {
        version = "0.1.2";
        hash = "05vpkasz70yjf09hsmbw7nap70sr8p5b7hrsdbmij8k8xqf3qg8r";
      };
      optparse-applicative = {
        version = "0.18.1.0";
        hash = "0wggvi67lm2amw0igmpfqs75jvy91zv42v33c12vmk9fdqkwalmg";
      };
      path = {
        version = "0.9.1";
        hash = "0nk3rp5fk97m4y163dyd1y488062djzj071xdd90yyghi5pgvrb5";
      };
      path-io = {
        version = "1.6.3";
        hash = "05hcxgyf6kkz36mazd0fqwb6mjy2049gx3vh8qq9h93gfjkpp2vc";
      };
      polysemy = {
        version = "1.6.0.0";
        hash = "15k51ysrfcbkww1562g8zvrlzymlk2rxhcsz9ipsb0q6h571qgvf";
      };
      prettyprinter-ansi-terminal = {
        version = "1.1.3";
        hash = "09m8knzfvms12576pp2nrdn7j0wikylwjfr9r3z4swgipz1r3nki";
      };
      primitive = {
        version = "0.7.4.0";
        hash = "0n7r8al9wgz4r7jzizapn1dbnkqxwx2c4lqkgfm5q5bxj8fl7g1c";
      };
      resourcet = {
        version = "1.2.6";
        hash = "0k96r6mx6zf0nr5y7xjzyhizx80svjfa3a47hcyys10y08rgqvln";
      };
      scientific = {
        version = "0.3.7.0";
        hash = "09iwj0snmx7vj7x03l4vdcn76zylcgxd9pyz0yxkydgfnn3lvc08";
      };
      semialign = {
        version = "1.3";
        hash = "09147lz8z79ghnpr7z08y9dd0l6c9dz9hz85avfh6z330vl25r95";
      };
      semigroupoids = {
        version = "6.0.1";
        hash = "10qd2y5f5m7jzrha1wfbwwybhhghdwkdmk9ajybdz8h88cz9ig2g";
      };
      tasty = {
        version = "1.4.3";
        hash = "1vnwvsngrvh1swlnmv3hzj1srj5yc6hf3k2gccqs732fl1y9wj2c";
      };
      tasty-hedgehog = {
        version = "1.1.0.0";
        hash = "0cs96s7z5csrlwj334v8zl459j5s4ws6gmjh59cv01wwvvrrjwd9";
      };
      temporary = {
        version = "1.3";
        hash = "17nb9mzhfg07y1308qv1n018dy7rljs8rrjdkn1c22rahsqg7kk9";
      };
      th-abstraction = {
        version = "0.4.5.0";
        hash = "19nh7a9b4yif6sijp6xns6xlxcr1mcyrqx3cfbp5bdm7mkbda7a9";
      };
      type-errors = {
        version = "0.2.0.2";
        hash = "09rkyqhx8jnzqiq7gpcm5jd1xd435h0ma0b2sff18lk31qv01x6g";
      };
      unagi-chan = {
        version = "0.4.1.4";
        hash = "1glfzdm732p0zbwq6vg0syw4cg7f72k1982rc6ha8wyr46czdlmm";
      };
      vector = {
        version = "0.13.1.0";
        hash = "0c1nw2sx14y29afdbwl40sk9vznx71rja5jcg14b8986778kl32d";
      };
      witherable = {
        version = "0.4.2";
        hash = "1ga4al351kwcfvsdr1ngyzj4aypvl46w357jflmgxacad8iqx4ik";
      };
    };
  };
  solver = {
    latest = {
      incipit-base = {
        jailbreak = true;
      };
      incipit-core = {
        jailbreak = true;
      };
    };
    lower = {};
  };
  resolving = false;
}
