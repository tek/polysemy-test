{
  bounds = {
    polysemy-test = {
      base = {
        lower = "4.18.3.0";
        upper = "4.22";
      };
      hedgehog = {
        lower = "1.7";
        upper = "1.8";
      };
      incipit-core = {
        lower = "0.7.0.0";
        upper = "0.8";
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
        lower = "1.9.1.0";
        upper = "1.10";
      };
      polysemy-test = {
        lower = null;
        upper = null;
      };
      tasty = {
        lower = "1.5.2";
        upper = "1.6";
      };
      tasty-hedgehog = {
        lower = "1.4.0.2";
        upper = "1.5";
      };
      transformers = {
        lower = "0.6.1.0";
        upper = "0.7";
      };
    };
  };
  versions = {
    latest = {
      base = "4.21.0.0";
      hedgehog = "1.7";
      incipit-core = "0.7.0.0";
      path = "0.9.6";
      path-io = "1.8.2";
      polysemy = "1.9.2.0";
      tasty = "1.5.4";
      tasty-hedgehog = "1.4.0.2";
      transformers = "0.6.1.2";
    };
    lower = {
      base = "4.18.3.0";
      hedgehog = "1.7";
      incipit-core = "0.7.0.0";
      path = "0.9.1";
      path-io = "1.6.3";
      polysemy = "1.9.1.0";
      tasty = "1.5.2";
      tasty-hedgehog = "1.4.0.2";
      transformers = "0.6.1.0";
    };
  };
  initial = {
    latest = {};
    lower = {
      hedgehog = "1.7";
      incipit-core = "0.7.0.0";
      path = "0.9.1";
      path-io = "1.8.0";
      polysemy = "1.9.1.0";
      tasty = "1.5.2";
      tasty-hedgehog = "1.4.0.2";
      transformers = "0.5.6.2";
    };
  };
  overrides = {
    latest = {
      hedgehog = {
        version = "1.7";
        hash = "04cjnz4i1qs3v9bza8a3ry1czapwqgxazhywkjzq2rg1544gjmby";
        repo = "hackage.haskell.org";
      };
      incipit-core = {
        version = "0.7.0.0";
        hash = "03fbkvaabp5qf7yf4rb6fhcnxii68b60dz6667hawys6hh9zdvfs";
        repo = "hackage.haskell.org";
      };
      tasty = {
        version = "1.5.4";
        hash = "0x6khif6n0rzfgkvrbiagg1sj0lwmjfr6qarjnjwmb9ywdk7598b";
        repo = "hackage.haskell.org";
      };
      tasty-hedgehog = {
        version = "1.4.0.2";
        hash = "04kg2qdnsqzzmj3xggy2jcgidlp21lsjkz4sfnbq7b1yhrv2vbbc";
        repo = "hackage.haskell.org";
      };
    };
    lower = {
      aeson = {
        version = "2.2.4.1";
        hash = "1hf13pxldfyv49c4518s44zfspg6r54wylimca7kp59lhh5w099j";
        repo = "hackage.haskell.org";
      };
      async = {
        version = "2.2.6";
        hash = "1731pcifiskq6g1b72p34phx85l65ax7mbjw11310b3zwzk0ldyn";
        repo = "hackage.haskell.org";
      };
      bifunctors = {
        version = "5.6.3";
        hash = "0hvfzxbj181y61k14fvs5q2vjp1s7s1fay15q6kzvh1b38wg7y0l";
        repo = "hackage.haskell.org";
      };
      cabal-doctest = {
        version = "1.0.12";
        hash = "094mvqgh9bhx5v9xanzkhcm8pcxzmkaa68lr3bqpjzkdxydx81nk";
        repo = "hackage.haskell.org";
      };
      concurrent-output = {
        version = "1.10.21";
        hash = "1w87rrf337s8wc4z3dkh2mk990003jsk18ry5yawv4465k4yvamw";
        repo = "hackage.haskell.org";
      };
      constraints = {
        version = "0.14.4";
        hash = "00cjd15kn30qgq541s0g3sd2lnvrdswx3bkafk0bmrg9b0kdb6hg";
        repo = "hackage.haskell.org";
      };
      data-fix = {
        version = "0.3.4";
        hash = "0x8r2r8gmdvsclaszg90zn7gla6s8r6salbvgfsp0rscdjzj01ry";
        repo = "hackage.haskell.org";
      };
      hashable = {
        version = "1.4.7.0";
        hash = "1zfkla3kjd7b4w5bd93vv71f8gj5849vi924j3kl68cj1njk8i6a";
        repo = "hackage.haskell.org";
      };
      hedgehog = {
        version = "1.7";
        hash = "04cjnz4i1qs3v9bza8a3ry1czapwqgxazhywkjzq2rg1544gjmby";
        repo = "hackage.haskell.org";
      };
      incipit-core = {
        version = "0.7.0.0";
        hash = "03fbkvaabp5qf7yf4rb6fhcnxii68b60dz6667hawys6hh9zdvfs";
        repo = "hackage.haskell.org";
      };
      indexed-traversable-instances = {
        version = "0.1.2.1";
        hash = "1issj9yfpxnshm6k7xq3wmmgrhn87cb0jalp0d1ls3zqx0qjrr03";
        repo = "hackage.haskell.org";
      };
      lifted-async = {
        version = "0.11.0";
        hash = "0c0njy8k70swqnp16wyrrkd1bxjsf3pxi34hxka1y1ifp3haccap";
        repo = "hackage.haskell.org";
      };
      path = {
        version = "0.9.1";
        hash = "0nk3rp5fk97m4y163dyd1y488062djzj071xdd90yyghi5pgvrb5";
        repo = "hackage.haskell.org";
      };
      path-io = {
        version = "1.6.3";
        hash = "05hcxgyf6kkz36mazd0fqwb6mjy2049gx3vh8qq9h93gfjkpp2vc";
        repo = "hackage.haskell.org";
      };
      polysemy = {
        version = "1.9.1.0";
        hash = "05mhzjz6hz0dnxsn3cc0l6yyj5ch35gn8xfnx0a1gn3q8yljfg2a";
        repo = "hackage.haskell.org";
      };
      scientific = {
        version = "0.3.8.1";
        hash = "0imbwigr1m378bk51gc2d8cbrj5r8sdv3bgvn0386lc07sayp3ng";
        repo = "hackage.haskell.org";
      };
      semialign = {
        version = "1.3.1.1";
        hash = "17sfq3kzzdh28vin3kxw6l73jnrawf45cb4rhkcvajhsa9wkwsgv";
        repo = "hackage.haskell.org";
      };
      semigroupoids = {
        version = "6.0.2";
        hash = "0nc2c573inxnp4nz3pbahb66ca9750zdgashwnak7kxyrq7d763l";
        repo = "hackage.haskell.org";
      };
      strict = {
        version = "0.5.1";
        hash = "06y3ab0nsdbrkrxzc7hgy6cwxl72wcgqn52bs1vvi5lkp64v559y";
        repo = "hackage.haskell.org";
      };
      tasty = {
        version = "1.5.2";
        hash = "1jqrcmibqv03109qc6lhi2jnip4mxygcd0j4j0g1n0q0akcplica";
        repo = "hackage.haskell.org";
      };
      tasty-hedgehog = {
        version = "1.4.0.2";
        hash = "04kg2qdnsqzzmj3xggy2jcgidlp21lsjkz4sfnbq7b1yhrv2vbbc";
        repo = "hackage.haskell.org";
      };
      text-iso8601 = {
        version = "0.1.1.1";
        hash = "1ywyvvp3rk0v8hfv5gpwry5q3fdj0zn0dd7jbzzaccbs3z43m92v";
        repo = "hackage.haskell.org";
      };
      text-short = {
        version = "0.1.6.1";
        hash = "1yzyzklry9cdc12283b0zf0kpa8nb7gixmdaf3l8x7388zpxhhay";
        repo = "hackage.haskell.org";
      };
      th-abstraction = {
        version = "0.5.0.0";
        hash = "0dkilfrvk8zdn3gvyfv5zgjbwqhdf1yg90fk4byka0ib43kgkyvf";
        repo = "hackage.haskell.org";
      };
      these = {
        version = "1.2.1";
        hash = "0jqchlmycfcvkff48shhkswansnzrw57q8945m483mrd59zpg27k";
        repo = "hackage.haskell.org";
      };
      time-compat = {
        version = "1.9.9";
        hash = "02yq6qc9fbawpxkypaf4nm9vidfv5vvgidxyj4r3dxa4lb29jd2p";
        repo = "hackage.haskell.org";
      };
      type-errors = {
        version = "0.2.0.2";
        hash = "09rkyqhx8jnzqiq7gpcm5jd1xd435h0ma0b2sff18lk31qv01x6g";
        repo = "hackage.haskell.org";
      };
      unordered-containers = {
        version = "0.2.21";
        hash = "0na84q5vxxww3pmz72ihpx4j7dhk71z28r55i7j0pq7mj27jasb0";
        repo = "hackage.haskell.org";
      };
      uuid-types = {
        version = "1.0.6.1";
        hash = "1jrid43smmfcchrfwpzkxil16a4c5016y4b49yjka0sildj1lprg";
        repo = "hackage.haskell.org";
      };
      witherable = {
        version = "0.5";
        hash = "0xm77dqyfm0zh0xvnh1srwxrkn4sl7m126lqhbzc4q9f6lziwzdx";
        repo = "hackage.haskell.org";
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
  packages = {};
  resolving = false;
}
