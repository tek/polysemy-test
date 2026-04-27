{
  bounds = {
    polysemy-test = {
      base = {
        lower = "4.17.2.1";
        upper = "4.22";
      };
      hedgehog = {
        lower = "1.4";
        upper = "1.8";
      };
      incipit-core = {
        lower = "0.4.1.0";
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
        upper = "0.12";
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
        lower = "0.5.6.2";
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
      base = "4.17.2.1";
      hedgehog = "1.4";
      incipit-core = "0.4.1.0";
      path = "0.9.1";
      path-io = "1.6.3";
      polysemy = "1.9.1.0";
      tasty = "1.5.2";
      tasty-hedgehog = "1.4.0.2";
      transformers = "0.5.6.2";
    };
  };
  initial = {
    latest = {};
    lower = {
      hedgehog = "1.7";
      incipit-core = "0.6.0.0";
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
      hedgehog = {
        version = "1.4";
        hash = "1qxxhs720im0wpa5lsca0l8qsfmhbyphd1aq01nv96v29lgv795b";
        repo = "hackage.haskell.org";
      };
      incipit-base = {
        version = "0.4.1.0";
        hash = "17579j3hzsh3ic0272h8ly8k7gz4zm1hv5jqimdam9gcq8alahkl";
        repo = "hackage.haskell.org";
      };
      incipit-core = {
        version = "0.4.1.0";
        hash = "1fm6bf1w8mvpa9qlgxqv3ngf0lyb3057cwv5ajibgbljjaznxpxc";
        repo = "hackage.haskell.org";
      };
      indexed-traversable-instances = {
        version = "0.1.2.1";
        hash = "1issj9yfpxnshm6k7xq3wmmgrhn87cb0jalp0d1ls3zqx0qjrr03";
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
      th-abstraction = {
        version = "0.5.0.0";
        hash = "0dkilfrvk8zdn3gvyfv5zgjbwqhdf1yg90fk4byka0ib43kgkyvf";
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
  packages = {
    polysemy-test = {
      version = "0.11.0.1";
    };
  };
  resolving = false;
}
