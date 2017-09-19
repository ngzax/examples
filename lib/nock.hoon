::  Arms accessible in :dojo after `/+  parse-sexpr` (two spaces (`gap`) in between)
::  Try in :dojo:
::
::    > test:nock
::
::::  /hoon/nock/lib
  ::
!:
|%
++  test
  :*  inc+(inc 41)
      dec+(dec 43)
      add+(add 40 2)
      sub+(sub 44 2)
      mul+(mul 6 7)
      gth+(gth 42 41)
      even+(even 42)
      goldbach+(goldbach 42)
  ==
::
++  inc
  |=  a/@                                               ::>  same as .+(a)
  ^-  *
  .*  a
  [4 0 1]
::
++  dec
  |=  a/@
  ^-  *
  ?<  =(a 0)
  .*  a
  [8 [1 0] 8 [1 6 [5 [0 7] 4 0 6] [0 6] 9 2 [0 2] [4 0 6] 0 7] 9 2 0 1]
  ::  [8
  ::    [1 0]
  ::    [8
  ::      [1
  ::        [6
  ::          [5 [0 7] [4 0 6]]
  ::          [0 6]
  ::          [9 2 [[0 2] [4 0 6] [0 7]]]
  ::        ]
  ::      ]
  ::      [9 2 0 1]
  ::    ]
  ::  ]
::
++  add
  |=  {a/@ b/@}
  ^-  *
  .*  [a b]
  [8 [[1 [1 [6 [5 [0 13] [0 14]] [0 12] [9 2 [[0 2] [[4 [0 12]] [0 13]] [[4 [0 14]] [0 15]]]]]] [1 0] [0 1]] [1 0]] [8 [9 2 [0 2]] [9 2 [[0 4] [0 7] [0 5]]]]]
  ::  [8
  ::    [[1
  ::       [1 6 [5 [0 13] 0 14] [0 12] 9 2 [0 2] [[4 0 12] 0 13] [4 0 14] 0 15]
  ::       [1 0]
  ::       [0 1]
  ::     ]
  ::     [1 0]
  ::    ]
  ::    [8
  ::      [9 2 0 2]
  ::      [9 2 [[0 4] [0 7] [0 5]]]
  ::    ]
  ::  ]
::
++  sub
  |=  {a/@ b/@}
  ?>  (gte a b)
  ^-  *
  .*  [a b]
  [8 [1 0] [8 [1 [6 [5 [0 14] [0 15]] [0 6] [9 2 [0 2] [4 0 6] [0 14] [4 0 15]]]] [9 2 [0 1]]]]
  ::  [8
  ::    [1 0]
  ::    [8
  ::      [1
  ::        [6
  ::          [5 [0 14] [0 15]]
  ::          [0 6]
  ::          [9 2 [0 2] [4 0 6] [0 14] [4 0 15]]]]
  ::      [9 2 [0 1]]]]
::
++  mul
  |=  {a/@ b/@}
  ^-  *
  .*  [a b]
  [8 [[[1 [[1 [8 [9 5 [0 15]] [6 [5 [0 29] [0 61]] [0 60] [9 2 [[0 6] [0 14] [[[9 2 [[0 4] [[[0 60] [0 28]] [0 5]]]] [4 [0 61]]] [0 31]]]]]]] [[[1 0] [1 0]] [0 1]]]] [1 [1 [6 [5 [0 13] [0 14]] [0 12] [9 2 [[0 2] [[4 [0 12]] [0 13]] [[4 [0 14]] [0 15]]]]]] [1 0] [0 1]]] [1 0]] [8 [9 4 [0 2]] [9 2 [[0 4] [0 7] [0 5]]]]]
  ::  [8
  ::     [ [ [1
  ::          [ 1
  ::              [8 [9 5 [0 15]]
  ::                 6
  ::                    [5 [0 29] [0 61]]
  ::                    [0 60]
  ::                    [9 2
  ::                       [[0 6]
  ::                       [0 14]
  ::                       [[9 2 [0 4] [[0 60] [0 28]] [0 5]] [4 [0 61]]]
  ::                       [0 31]]
  ::               ]
  ::            ]
  ::          ]
  ::          [[1 0] [1 0]]
  ::          [0 1]
  ::        ]
  ::        1
  ::            [[1 6 [5 [0 13] 0 14] [0 12] 9 2 [0 2] [[4 0 12] 0 13] [4 0 14] 0 15]
  ::            [1 0]
  ::            [0 1]]
  ::      ]
  ::      [1 0]
  ::    ]
  ::    [8
  ::        [9 4 [0 2]]
  ::        [9 2 [[0 4] [0 7] [0 5]]]
  ::    ]
  ::  ]
::
++  gth
  |=  {a/@ b/@}                                         ::<  0 is yes, 1 is no
  ^-  *
  .*  [a b]
  [8 [[1 [[[1 [6 [5 [0 14] [0 15]] [1 1] [9 5 [[0 2] [[0 6] [[0 6] [0 15]]]]]]] [1 [6 [5 [4 [0 28]] [0 13]] [1 1] [6 [5 [4 [0 29]] [0 12]] [1 0] [9 5 [[0 2] [[0 6] [[[4 [0 28]] [4 [0 29]]] [0 15]]]]]]]]] [[[1 0] [1 0]] [0 1]]]] [1 0]] [8 [9 2 [0 2]] [9 4 [[0 4] [0 7] [0 5]]]]]
  ::  [8
  ::    [ [1
  ::        [ [1 6 [5 [0 14] [0 15]] [1 1] 9 5 [0 2] [0 6] [0 6] [0 15]]
  ::          1
  ::          6
  ::              [5 [4 [0 28]] [0 13]]
  ::              [1 1]
  ::              [6
  ::                  [5 [4 [0 29]] [0 12]]
  ::                  [1 0]
  ::                  [9 5 [0 2] [0 6] [[[4 [0 28]] [4 [0 29]]] [0 15]]]
  ::              ]
  ::        ]
  ::        [[1 0] [1 0]]
  ::        [0 1]
  ::      ]
  ::      [1 0]
  ::    ]
  ::     [8
  ::        [9 2 [0 2]]
  ::        [9 4 [[0 4] [0 7] [0 5]]]
  ::     ]
  ::  ]
::
++  even
  |=  a/@                                               ::<  0 is yes, 1 is no
  ^-  *
  .*  a
  [8 [1 0] [8 [1 [6 [5 [0 7] [0 6]] [1 0] [6 [5 [0 7] [4 0 6]] [1 1] [9 2 [[0 2] [4 4 0 6] [0 7]]]]]] [9 2 0 1]]]
  ::  [8
  ::    [1 0]
  ::    [8
  ::      [1
  ::         [6
  ::           [5 [0 7] [0 6]]
  ::           [1 0]
  ::           [6
  ::             [5 [0 7] [4 0 6]]
  ::             [1 1]
  ::             [9 2 [[0 2] [4 4 0 6] [0 7]]]
  ::           ]
  ::         ]
  ::      ]
  ::      [9 2 0 1]
  ::    ]
  ::  ]
::
++  goldbach                                            ::>  a=0 runs forever if
  |=  a/@                                               ::<  conjecture is true
  ^-  *                                                 ::<  a>0 produces y or n
  .*  a
  [8 [[[[[[[[[[1 [[[1 [8 [9 513 [0 7]] [6 [5 [0 14] [1 0]] [9 13 [0 1]] [9 4 [[0 4] [0 14] [0 5]]]]]] [1 [6 [5 [9 4 [[0 4] [0 14] [0 5]]] [1 0]] [0 14] [9 13 [[0 2] [0 6] [4 [4 [0 14]]] [0 15]]]]]] [0 1]]] [1 [[[1 [8 [9 257 [0 15]] [8 [9 17 [0 31]] [8 [9 65 [0 63]] [8 [9 129 [0 127]] [6 [9 4 [[0 28] [[[1 3] [0 126]] [0 29]]]] [1 1] [6 [9 2 [[0 4] [[0 126] [0 5]]]] [9 125 [[0 2] [0 6] [0 14] [0 30] [0 62] [0 126] [[0 508] [9 2 [[0 60] [9 2 [[0 60] [0 126] [0 61]]] [0 61]]]] [0 255]]] [1 1]]]]]]]] [1 [6 [9 2 [[0 12] [0 254] [0 13]]] [[0 254] [1 1]] [6 [5 [4 [4 [0 508]]] [0 126]] [1 0] [9 125 [[0 2] [0 6] [0 14] [0 30] [0 62] [0 126] [[4 [0 508]] [9 2 [[0 60] [0 509] [0 61]]]] [0 255]]]]]]] [[[1 2] [1 0]] [0 1]]]]] [1 [[1 [6 [5 [4 [0 14]] [0 6]] [0 14] [9 2 [[0 2] [[0 6] [[4 [0 14]] [0 15]]]]]]] [[1 0] [0 1]]]]] [1 [[1 [6 [5 [0 28] [0 6]] [1 0] [6 [5 [0 29] [0 6]] [1 1] [9 2 [[0 2] [[0 6] [[[4 [4 [0 28]]] [4 [4 [0 29]]]] [0 15]]]]]]]] [[[1 0] [1 1]] [0 1]]]]] [1 [[1 [8 [9 33 [0 7]] [6 [9 4 [[0 4] [0 28] [0 5]]] [6 [9 4 [[0 4] [0 29] [0 5]]] [1 0] [1 1]] [1 1]]]] [0 1]]]] [1 [[[1 [8 [9 9 [0 15]] [8 [9 17 [0 31]] [8 [9 129 [0 63]] [6 [5 [0 62] [1 0]] [1 1] [6 [5 [0 62] [1 1]] [1 1] [6 [5 [0 62] [1 2]] [1 0] [6 [5 [0 62] [1 3]] [1 0] [6 [9 2 [[0 4] [0 62] [0 5]]] [1 1] [9 61 [0 1]]]]]]]]]]] [1 [6 [5 [9 2 [[0 28] [[0 126] [0 29]]]] [0 62]] [1 1] [6 [5 [4 [0 253]] [0 62]] [6 [9 4 [[0 12] [[[9 2 [[0 28] [[0 126] [0 29]]]] [0 62]] [0 13]]]] [1 0] [9 61 [[0 2] [0 6] [0 14] [0 30] [0 62] [[4 [0 252]] [0 253]] [0 127]]]] [6 [9 4 [[0 12] [[[9 2 [[0 28] [[0 126] [0 29]]]] [0 62]] [0 13]]]] [9 61 [[0 2] [0 6] [0 14] [0 30] [0 62] [[1 2] [4 [0 253]]] [0 127]]] [9 61 [[0 2] [0 6] [0 14] [0 30] [0 62] [[4 [0 252]] [0 253]] [0 127]]]]]]]] [[[1 2] [1 2]] [0 1]]]]] [1 [[[1 [6 [5 [0 14] [0 15]] [1 1] [9 5 [[0 2] [[0 6] [[0 6] [0 15]]]]]]] [1 [6 [5 [4 [0 28]] [0 13]] [1 1] [6 [5 [4 [0 29]] [0 12]] [1 0] [9 5 [[0 2] [[0 6] [[[4 [0 28]] [4 [0 29]]] [0 15]]]]]]]]] [[[1 0] [1 0]] [0 1]]]]] [1 [[1 [8 [9 5 [0 15]] [6 [5 [0 29] [0 61]] [0 60] [9 2 [[0 6] [0 14] [[[9 2 [[0 4] [[[0 60] [0 28]] [0 5]]]] [4 [0 61]]] [0 31]]]]]]] [[[1 0] [1 0]] [0 1]]]]] [1 [1 [6 [5 [0 13] [0 14]] [0 12] [9 2 [[0 2] [[4 [0 12]] [0 13]] [[4 [0 14]] [0 15]]]]]] [1 0] [0 1]]] [1 0]] [8 [9 512 [0 2]] [9 4 [[0 4] [0 7] [0 5]]]]]
  ::  [ 8
  ::    [ [ [ [ [ [ [ [ [ [ 1
  ::                        [ [ 1
  ::                            8
  ::                            [9 513 0 7]
  ::                            6
  ::                                [5 [0 14] 1 0]
  ::                              [9 13 0 1]
  ::                            9 4 [0 4] [0 14] [0 5]
  ::                          ]
  ::                          1
  ::                          6
  ::                              [5 [9 4 [0 4] [0 14] 0 5] 1 0]
  ::                            [0 14]
  ::                          9 13 [0 2] [0 6] [4 4 0 14] [0 15]
  ::                        ]
  ::                        [0 1]
  ::                      ]
  ::                      1
  ::                     [ [ 1
  ::                          8
  ::                          [9 257 0 15]
  ::                          8
  ::                          [9 17 0 31]
  ::                          8
  ::                          [9 65 0 63]
  ::                          8
  ::                          [9 129 0 127]
  ::                          6
  ::                              [9 4 [0 28] [[1 3] 0 126] 0 29]
  ::                            [1 1]
  ::                          6
  ::                              [9 2 [0 4] [0 126] 0 5]
  ::                            [ 9 125 [0 2] [0 6] [0 14] [0 30] [0 62] [0 126] [[0 508] 9 2 [0 60] [9 2 [0 60] [0 126] 0 61] 0 61] [0 255]
  ::                          ]
  ::                          [1 1]
  ::                        ]
  ::                        1
  ::                        6
  ::                            [9 2 [0 12] [0 254] 0 13]
  ::                          [[0 254] 1 1]
  ::                        6
  ::                            [5 [4 4 0 508] 0 126]
  ::                          [1 0]
  ::                        9 125 [0 2] [0 6] [0 14] [0 30] [0 62] [0 126] [[4 0 508] 9 2 [0 60] [0 509] 0 61] [0 255]
  ::                      ]
  ::                      [[1 2] 1 0]
  ::                      [0 1]
  ::                    ]
  ::                    1
  ::                    [1 6 [5 [4 0 14] 0 6] [0 14] 9 2 [0 2] [0 6] [4 0 14] 0 15]
  ::                    [1 0]
  ::                    [0 1]
  ::                  ]
  ::                  1
  ::                  [ 1
  ::                    6
  ::                        [5 [0 28] 0 6]
  ::                      [1 0]
  ::                    6
  ::                        [5 [0 29] 0 6]
  ::                      [1 1]
  ::                    9 2 [0 2] [0 6] [[4 4 0 28] 4 4 0 29] [0 15]
  ::                  ]
  ::                  [[1 0] 1 1]
  ::                  [0 1]
  ::                ]
  ::                1
  ::                [ 1
  ::                  8
  ::                  [9 33 0 7]
  ::                  6
  ::                      [9 4 [0 4] [0 28] 0 5]
  ::                    [6 [9 4 [0 4] [0 29] 0 5] [1 0] 1 1]
  ::                  [1 1]
  ::                ]
  ::                [0 1]
  ::              ]
  ::              1
  ::              [ [ 1
  ::                  8
  ::                  [9 9 0 15]
  ::                  8
  ::                  [9 17 0 31]
  ::                  8
  ::                  [9 129 0 63]
  ::                  6
  ::                      [5 [0 62] 1 0]
  ::                    [1 1]
  ::                  6
  ::                      [5 [0 62] 1 1]
  ::                    [1 1]
  ::                  6
  ::                      [5 [0 62] 1 2]
  ::                    [1 0]
  ::                  6
  ::                      [5 [0 62] 1 3]
  ::                    [1 0]
  ::                  6
  ::                      [9 2 [0 4] [0 62] 0 5]
  ::                    [1 1]
  ::                  9 61 [0 1]
  ::                ]
  ::                1
  ::                6
  ::                    [5 [9 2 [0 28] [0 126] 0 29] 0 62]
  ::                  [1 1]
  ::                6
  ::                    [5 [4 0 253] 0 62]
  ::                  [ 6
  ::                      [9 4 [0 12] [[9 2 [0 28] [0 126] 0 29] 0 62] 0 13]
  ::                    [1 0]
  ::                  9 61 [0 2] [0 6] [0 14] [0 30] [0 62] [[4 0 252] 0 253] [0 127]
  ::                ]
  ::                6
  ::                    [9 4 [0 12] [[9 2 [0 28] [0 126] 0 29] 0 62] 0 13]
  ::                  [9 61 [0 2] [0 6] [0 14] [0 30] [0 62] [[1 2] 4 0 253] 0 127]
  ::                9 61 [0 2] [0 6] [0 14] [0 30] [0 62] [[4 0 252] 0 253] [0 127]
  ::              ]
  ::              [[1 2] 1 2]
  ::              [0 1]
  ::            ]
  ::            1
  ::            [ [1 6 [5 [0 14] 0 15] [1 1] 9 5 [0 2] [0 6] [0 6] 0 15]
  ::              1
  ::              6
  ::                  [5 [4 0 28] 0 13]
  ::                [1 1]
  ::              6
  ::                  [5 [4 0 29] 0 12]
  ::                [1 0]
  ::              9 5 [0 2] [0 6] [[4 0 28] 4 0 29] [0 15]
  ::             ]
  ::            [[1 0] 1 0]
  ::            [0 1]
  ::          ]
  ::          1
  ::          [ 1
  ::            8
  ::            [9 5 0 15]
  ::            6
  ::                [5 [0 29] 0 61]
  ::              [0 60]
  ::            9 2 [0 6] [0 14] [[9 2 [0 4] [[0 60] 0 28] 0 5] 4 0 61] [0 31]
  ::          ]
  ::          [[1 0] 1 0]
  ::          [0 1]
  ::        ]
  ::        1
  ::        [1 6 [5 [0 13] 0 14] [0 12] 9 2 [0 2] [[4 0 12] 0 13] [4 0 14] 0 15]
  ::        [1 0]
  ::        [0 1]
  ::      ]
  ::      [1 0]
  ::    ]
  ::    8
  ::    [9 512 0 2]
  ::    9 4 [0 4] [0 7] [0 5]
  ::  ]
::
--
