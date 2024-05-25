{
  bounds = {
    polysemy-test = {
      base = {
        lower = "4.16.4.0";
        upper = "4.20";
      };
      hedgehog = {
        lower = "1.2";
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
        lower = "1.4.0.0";
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
      hedgehog = "1.2";
      incipit-core = "0.6.0.0";
      path = "0.9.0";
      path-io = "1.8.0";
      polysemy = "1.9.1.3";
      tasty = "1.4.3";
      tasty-hedgehog = "1.4.0.0";
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
      tasty-hedgehog = "1.4.0.0";
      transformers = "0.5.6.2";
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
      QuickCheck = {
        version = "2.14.3";
        hash = "18451rdmih1jkrsrckdcix71zqihc4h2caic7qzizxjg4hqpapji";
      };
      StateVar = {
        version = "1.2.2";
        hash = "1grkv7sinn3wlk0xgwn4in5xxqmssrrfhp2hjxy9imhh8li40grf";
      };
      aeson = {
        version = "2.1.2.1";
        hash = "1f1f6h2r60ghz4p1ddi6wnq6z3i07j60sgm77hx2rvmncz4vizp0";
      };
      ansi-terminal = {
        version = "0.11.5";
        hash = "0g7ycc2b67z8plqp7hva914yhwzjmvvhhf9mszlhj3kqxh6i732b";
      };
      assoc = {
        version = "1.1.1";
        hash = "0v4j6bn73dm3xnpkfdx0dg7q4vypl4k31pg35vycfp8w00jv6b6q";
      };
      async = {
        version = "2.2.5";
        hash = "1y1cgzi8fy8qhyd69q7avhx46sz5h5ljggh81azr67rqrdhdyf4a";
      };
      atomic-primops = {
        version = "0.8.7";
        hash = "1hrzcqg0xg37xg1ihw0r106l5n9vmcr0i9zp3qbdk5v5nnrbvjd6";
      };
      attoparsec = {
        version = "0.14.4";
        hash = "0y9dph5axyvr1bfcvmz6qh50bjcp50m2ljra14960anc6g74a3c8";
      };
      barbies = {
        version = "2.0.5.0";
        hash = "14rqhblvmc4bylk1ry4y4hi47bkswp1slbgmamn6yj1dn1ng4awj";
      };
      base-compat-batteries = {
        version = "0.13.1";
        hash = "06fq90abnlqdsa7iqfmp1fndldmfdfjvx8n8s963nnvnmq6hxs4g";
      };
      bifunctors = {
        version = "5.6.2";
        hash = "1g0z6q5z04zgp7kaf917nrj2iiz1lsqh8ji5ny5ly534zr9zya2m";
      };
      boring = {
        version = "0.2.2";
        hash = "1bi7x3vangkq4bn0bx1yv30sz7n6f5mym1bwy2ygs9rq1szlxzkm";
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
      contravariant = {
        version = "1.5.5";
        hash = "0931bvc2iv3l29phnq8qsmmkicgz4yfk7c6hrqavs8d5c5j4zpj8";
      };
      data-fix = {
        version = "0.3.2";
        hash = "0r8k3lmy43v2rlr2j6pk27c7v7cwfasmq01dnrj0fni8rcv29ckc";
      };
      distributive = {
        version = "0.6.2.1";
        hash = "1yfw2p46wbs3mcvw22b7f7x1jyrfinslb1bdx83v1v17q95aldj7";
      };
      exceptions = {
        version = "0.10.8";
        hash = "0j4nvgfg082gkxvg4sh8qlh6ajagx8xfh351cf4csxm8zr1vg20i";
      };
      foldable1-classes-compat = {
        version = "0.1";
        hash = "04g14sdj2ac8bs1a7pcl23hd8nqjz9b99cq1cj0rdq86gz1vyvis";
      };
      hashable = {
        version = "1.3.5.0";
        hash = "19xrhz682kwklygw0xmg1qbp78sm410nva1b39x57a3fypbwh5ic";
      };
      hedgehog = {
        version = "1.2";
        hash = "1jak5p9qhnv8zq761wxbdygpj107llpi66m6d7hiaywymqq47giw";
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
      lifted-base = {
        version = "0.2.3.12";
        hash = "074bfycdqnr78y05xvgmfgk09fsnjxykij68ryi4xbrx7qwzqgqm";
      };
      mmorph = {
        version = "1.2.0";
        hash = "1nj6rvyqsh3ppxgrs1mnc6hpbib8y1wcq306qjadmsgjxdwk8smj";
      };
      monad-control = {
        version = "1.0.3.1";
        hash = "150lv32h8ywx09j1shl33qvx0w68ixdxnv6yah050a3d0gq8xzks";
      };
      mtl = {
        version = "2.3.1";
        hash = "0mrh1n5i1d00rslrjwj8fvnfjpsjx6aswixa93bx6v94kxlkkakh";
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
      prettyprinter-ansi-terminal = {
        version = "1.1.3";
        hash = "09m8knzfvms12576pp2nrdn7j0wikylwjfr9r3z4swgipz1r3nki";
      };
      primitive = {
        version = "0.8.0.0";
        hash = "0y8yw8fnfh4dg6yjny2y8b4pmvvhhr7611j2z7i1dnl8w8cvbmb3";
      };
      random = {
        version = "1.2.1.2";
        hash = "1kfa2yx3106izr0g855iy4kcjjdwm6dlv3xn36h17y71sw0axd36";
      };
      resourcet = {
        version = "1.3.0";
        hash = "0ffmm850z3n95vyj33gfqk606kfn6d50b9bnylqn8y4zrcv5yjmk";
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
      tagged = {
        version = "0.8.8";
        hash = "1m2bcf0sr1z28gnl2k8xibcsv80kd35816c9c7ji045jbxg27xd9";
      };
      tasty = {
        version = "1.4.3";
        hash = "1vnwvsngrvh1swlnmv3hzj1srj5yc6hf3k2gccqs732fl1y9wj2c";
      };
      tasty-hedgehog = {
        version = "1.4.0.0";
        hash = "131zswqfl4azl6ylxlqpr5ilr0l6qvjs2va21mf0246pgf9dvpdx";
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
      transformers = {
        version = "0.6.0.2";
        hash = "110yqhxnc2x4l1nnkn5fxmarjx24h3g90jh1nwv0dlsflqrpzrkm";
      };
      transformers-base = {
        version = "0.4.6";
        hash = "125mrxdarrfsl87pfa00mjw9lz6xcgib0wfjsqmsaya0kd4ikhlm";
      };
      transformers-compat = {
        version = "0.7.2";
        hash = "11xivvmwgb5ipfvzcpckfdw6msk0y5snpmb6kpbpyhrrb8vjypv3";
      };
      unagi-chan = {
        version = "0.4.1.4";
        hash = "1glfzdm732p0zbwq6vg0syw4cg7f72k1982rc6ha8wyr46czdlmm";
      };
      unliftio-core = {
        version = "0.2.1.0";
        hash = "1www69jaknbriryq9yqsvi959jyq71wzzq9lhb5fpyrk91sbr4is";
      };
      unordered-containers = {
        version = "0.2.19.1";
        hash = "18fcy8bs9wczk5pzcqvg3qiki4r4y09bmvhzki6i714c2ghf2dy3";
      };
      uuid-types = {
        version = "1.0.5.1";
        hash = "0kf0877vz9zd9vb9ljab2vx010s6rqq5jskbdlw3nc5b25ycsj3f";
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
  resolving = false;
}
