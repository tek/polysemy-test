{
  bounds = {
    polysemy-test = {
      base = {
        lower = "4.16.4.0";
        upper = "4.20";
      };
      hedgehog = {
        lower = "1.3";
        upper = "1.5";
      };
      incipit-core = {
        lower = "0.6.0.0";
        upper = "0.7";
      };
      path = {
        lower = "0.9.0";
        upper = "0.10";
      };
      path-io = {
        lower = "1.8.0";
        upper = "1.9";
      };
      polysemy = {
        lower = "1.9.1.3";
        upper = "1.10";
      };
      tasty = {
        lower = "1.4.3";
        upper = "1.5";
      };
      tasty-hedgehog = {
        lower = "1.4.0.1";
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
      base = "4.19.1.0";
      hedgehog = "1.4";
      incipit-core = "0.6.0.0";
      path = "0.9.5";
      path-io = "1.8.2";
      polysemy = "1.9.1.3";
      tasty = "1.4.3";
      tasty-hedgehog = "1.4.0.2";
      transformers = "0.6.1.0";
    };
    lower = {
      base = "4.16.4.0";
      hedgehog = "1.3";
      incipit-core = "0.6.0.0";
      path = "0.9.0";
      path-io = "1.8.0";
      polysemy = "1.9.1.3";
      tasty = "1.4.3";
      tasty-hedgehog = "1.4.0.1";
      transformers = "0.5.6.2";
    };
  };
  initial = {
    latest = {};
    lower = {
      hedgehog = "1.3";
      incipit-core = "0.6.0.0";
      path = "0.9.0";
      path-io = "1.8.0";
    };
  };
  overrides = {
    latest = {
      incipit-base = {
        version = "0.6.0.0";
        hash = "1hck35yfy0dcgimgnd90w02zvv7x7k456bljrbx2mwxalnhav9gf";
      };
      incipit-core = {
        version = "0.6.0.0";
        hash = "0gmngb4pinkpbsnclrgs6x016ffnls1g4xzz0hdzg2rpyl63d5ph";
      };
      path-io = {
        version = "1.8.2";
        hash = "063ma7gzqr5c6s8a1yv72jgll3xdajvgclbc8w0ddmqgcrb62x2k";
      };
    };
    lower = {
      aeson = {
        version = "2.1.2.1";
        hash = "1f1f6h2r60ghz4p1ddi6wnq6z3i07j60sgm77hx2rvmncz4vizp0";
      };
      async = {
        version = "2.2.5";
        hash = "1y1cgzi8fy8qhyd69q7avhx46sz5h5ljggh81azr67rqrdhdyf4a";
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
      constraints = {
        version = "0.14.2";
        hash = "1nnlw9q7z2yvdaadyanvxqqwzb67kmk0n59xnc2pz0fhvqmq3yh8";
      };
      data-fix = {
        version = "0.3.2";
        hash = "0r8k3lmy43v2rlr2j6pk27c7v7cwfasmq01dnrj0fni8rcv29ckc";
      };
      hashable = {
        version = "1.3.5.0";
        hash = "19xrhz682kwklygw0xmg1qbp78sm410nva1b39x57a3fypbwh5ic";
      };
      hedgehog = {
        version = "1.3";
        hash = "1ayqg1qxxvbq4h1n801b207j378mzqhlbvhcqfgfb4ikq57lxzir";
      };
      incipit-base = {
        version = "0.6.0.0";
        hash = "1hck35yfy0dcgimgnd90w02zvv7x7k456bljrbx2mwxalnhav9gf";
      };
      incipit-core = {
        version = "0.6.0.0";
        hash = "0gmngb4pinkpbsnclrgs6x016ffnls1g4xzz0hdzg2rpyl63d5ph";
      };
      indexed-traversable = {
        version = "0.1.4";
        hash = "061xzz9m77rs6bk5vv2hd7givyq7ln0xffc6m1cxyyhyyr6lw3k0";
      };
      indexed-traversable-instances = {
        version = "0.1.2";
        hash = "05vpkasz70yjf09hsmbw7nap70sr8p5b7hrsdbmij8k8xqf3qg8r";
      };
      lifted-async = {
        version = "0.10.2.5";
        hash = "1bd00yz0f7hlxf85i5hzq1dnlqgnhd99d5zvkxb4710w0hrc28rx";
      };
      optparse-applicative = {
        version = "0.18.1.0";
        hash = "0wggvi67lm2amw0igmpfqs75jvy91zv42v33c12vmk9fdqkwalmg";
      };
      path = {
        version = "0.9.0";
        hash = "14symzl1rszvk5zivv85k79anz7xyl5gaxy0sm4vhhzsgxc59msv";
      };
      path-io = {
        version = "1.8.0";
        hash = "134nc4dnslvad6vsmlyjvp1l4y9qsnq7wnnlm79s8c27nwajj8dm";
      };
      polysemy = {
        version = "1.9.1.3";
        hash = "0y339fh1jvjdjmw6xkwizd3m9bqsgnhaj56xgkz1pcmv00pmj275";
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
      strict = {
        version = "0.5";
        hash = "02iyvrr7nd7fnivz78lzdchy8zw1cghqj1qx2yzbbb9869h1mny7";
      };
      tasty = {
        version = "1.4.3";
        hash = "1vnwvsngrvh1swlnmv3hzj1srj5yc6hf3k2gccqs732fl1y9wj2c";
      };
      tasty-hedgehog = {
        version = "1.4.0.1";
        hash = "0bxpmi2nyn84zscnhi4bnhza4l7kjgddc9z7nr227iq2q0w56l1g";
      };
      temporary = {
        version = "1.3";
        hash = "17nb9mzhfg07y1308qv1n018dy7rljs8rrjdkn1c22rahsqg7kk9";
      };
      text-short = {
        version = "0.1.5";
        hash = "0fyyp9r1qsk16kcdbqm3r4yk5nm22sd4vgzg76cyszbj0cypfvaj";
      };
      these = {
        version = "1.2";
        hash = "1iaaq1fsvg8c3l0czcicshkmbbr00hnwkdamjbkljsa1qvlilaf0";
      };
      time-compat = {
        version = "1.9.6.1";
        hash = "0ika8xx9zff8rwaabs17q5c30c1b9ii89jhbvahi5nk7rs0cd5fs";
      };
      unordered-containers = {
        version = "0.2.19.1";
        hash = "18fcy8bs9wczk5pzcqvg3qiki4r4y09bmvhzki6i714c2ghf2dy3";
      };
      uuid-types = {
        version = "1.0.5.1";
        hash = "0kf0877vz9zd9vb9ljab2vx010s6rqq5jskbdlw3nc5b25ycsj3f";
      };
      witherable = {
        version = "0.4.2";
        hash = "1ga4al351kwcfvsdr1ngyzj4aypvl46w357jflmgxacad8iqx4ik";
      };
    };
  };
  resolving = false;
}
