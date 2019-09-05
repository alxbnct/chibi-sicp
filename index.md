
# Table of Contents

1.  [noweb + common](#org74803f4)
    1.  [Setting chibi arguments. DANGEROUS](#org5fc2155):dangerous:elisp:
    2.  [Some common code blocks](#org41ab692)
2.  [SICP <code>[15%]</code>](#org2e20637)
    1.  [Chapter 1: Building abstractions with procedures <code>[57/61]</code>](#org07a4dfc)
        1.  [Snippet](#org36dcb55)
        2.  [Thought](#orge8787e5)
        3.  [Figure 1.1 Tree representation, showing the value of each subcombination](#orgc6e8738)
        4.  [Snippet](#org6b4b93f)
        5.  [Exercise 1.1 Interpreter result](#org72ed0d3)
        6.  [Exercise 1.2 Prefix form](#orgf4cb6dc)
        7.  [Exercise 1.3 Sum of squares](#org02e2797)
        8.  [Exercise 1.4 Compound expressions](#org7c33a8e)
        9.  [Exercise 1.5 Ben's test](#org5565d99)
        10. [Exercise 1.6 If is a special form](#orgd38c0f1)
        11. [Exercise 1.7 Good enough?](#org8811bb8)
        12. [Exercise 1.8 Newton's method](#orged9e753)
        13. [Figure 1.2 Procedural decomposition of the sqrt program](#org19d8332)
        14. [Figure 1.3 A linear recursive process for computing <img src="ltximg/index_636e4355c14eb884455ca87f34a1d1626764c4bf.png" alt="index_636e4355c14eb884455ca87f34a1d1626764c4bf.png" />.](#org22e61c8)
        15. [Figure 1.4 A linear iterative process for computing <img src="ltximg/index_636e4355c14eb884455ca87f34a1d1626764c4bf.png" alt="index_636e4355c14eb884455ca87f34a1d1626764c4bf.png" />.](#org2be185f)
        16. [Exercise 1.9 Iterative or recursive?](#org1898f50):macro:er_macro_transformer:chicken:
        17. [Exercise 1.10 Ackermann's function](#org7de10b4)
        18. [Figure 1.5 The tree-recursive process generated in computing (fib 5)](#org045b84e)
        19. [Exercise 1.11 Recursive vs iterative](#org3b8e73e)
        20. [Exercise 1.12 Recursive Pascal's triangle](#org621cc36)
        21. [Exercise 1.13 Fibonacci](#org77e2ca4)
        22. [Exercise 1.14 count-change](#org06e7e0d):macro:er_macro_transformer:
        23. [I found a bug in ob-scheme while doing this Exercise.](#org6a22a1b)
        24. [Exercise 1.15 sine](#org6b9b434):macro:er_macro_transformer:
        25. [Exercise 1.16 Iterative exponentiation](#orge7c9959)
        26. [Exercise 1.17 Fast multiplication](#org31145bf)
        27. [Exercise 1.18 Iterative multiplication](#org8f5c667)
        28. [Exercise 1.19 Logarithmic Fibonacci](#org6f000bb)
        29. [**Interjection** ir-macro-transformer.](#orge05aa23)
        30. [Exercise 1.20 GCD applicative vs normal](#org65f37d7):er_macro_transformer:macro:
        31. [Exercise 1.21 smallest-divisor](#org1ec4364)
        32. [Exercise 1.22 timed-prime-test](#org04404cf)
        33. [Exercise 1.23 (next test-divisor)](#org1e2eebb)
        34. [Exercise 1.24 Fermat method](#org09b2134)
        35. [Exercise 1.25 expmod](#org59f0b0b)
        36. [Exercise 1.26 square vs mul](#orgaaf2d91)
        37. [Exercise 1.27 Carmichael numbers](#org13a6aca)
        38. [Exercise 1.28 Miller-Rabin](#org9c909d0)
        39. [Exercise 1.29 Simpson's integral](#orgdb26018)
        40. [Exercise 1.30 Iterative sum](#org38461cc)
        41. [Exercise 1.31 Product](#org9fc60ca)
        42. [Exercise 1.32 Accumulator](#org93a1be0)
        43. [Exercise 1.33 filtered-accumulate](#orgc4cc60f)
        44. [Exercise 1.34 lambda](#org969faa3)
        45. [Exercise 1.35 fixed-point](#org4803ac6)
        46. [Exercise 1.36 fixed-point-with-dampening](#orgafc9691)
        47. [Exercise 1.37 cont-frac](#org484c53a)
        48. [Exercise 1.38 euler constant](#orgb7dd4b2)
        49. [Exercise 1.39 tan-cf](#orga9246ec)
        50. [Exercise 1.40 newtons-method](#orgfcb2f0a)
        51. [Exercise 1.41 double-double](#org0f069ed)
        52. [Exercise 1.42 compose](#orgaa3c85b)
        53. [Exercise 1.43 repeated](#orgb5b3275)
        54. [Exercise 1.44 smoothing](#org022406b)
        55. [Exercise 1.45 nth-root](#org1cb0d79)
        56. [Exercise 1.46 iterative-improve](#org8ad7f67)
    2.  [Chapter 2: Building abstractions with Data <code>[0/97]</code>](#org875092d)
        1.  [Exercise 2.1](#org836038a)
        2.  [Exercise 2.2](#orgc390bdc)
        3.  [Exercise 2.3](#org3f1ae7e)
        4.  [Exercise 2.4](#org9ac4702)
        5.  [Exercise 2.5](#orge8eb8ef)
        6.  [Exercise 2.6](#org65782b6)
        7.  [Exercise 2.7](#org00daba1)
        8.  [Exercise 2.8](#orgb2e30bf)
        9.  [Exercise 2.9](#org48219d5)
        10. [Exercise 2.10](#orgaf1d726)
        11. [Exercise 2.11](#org47c382c)
        12. [Exercise 2.12](#org90ab116)
        13. [Exercise 2.13](#orgffffb70)
        14. [Exercise 2.14](#orgcbfb92e)
        15. [Exercise 2.15](#org36fcd2b)
        16. [Exercise 2.16](#org701616a)
        17. [Exercise 2.17](#org0a42477)
        18. [Exercise 2.18](#orgba35e97)
        19. [Exercise 2.19](#org8534dfb)
        20. [Exercise 2.20](#org7d68ee6)
        21. [Exercise 2.21](#org6ccb486)
        22. [Exercise 2.22](#orga788750)
        23. [Exercise 2.23](#org5badb0d)
        24. [Exercise 2.24](#org31cccc4)
        25. [Exercise 2.25](#org1ddc91c)
        26. [Exercise 2.26](#orgc2810fa)
        27. [Exercise 2.27](#orga912f1f)
        28. [Exercise 2.28](#org83e1f16)
        29. [Exercise 2.29](#org66e1aaa)
        30. [Exercise 2.30](#orgba0b53e)
        31. [Exercise 2.31](#org13b7148)
        32. [Exercise 2.32](#org8869325)
        33. [Exercise 2.33](#org08afee6)
        34. [Exercise 2.34](#org121ab24)
        35. [Exercise 2.35](#org6d591f8)
        36. [Exercise 2.36](#orgfa555fd)
        37. [Exercise 2.37](#orgfde0adc)
        38. [Exercise 2.38](#orgfe1009f)
        39. [Exercise 2.39](#org714a01b)
        40. [Exercise 2.40](#orgbccf5a7)
        41. [Exercise 2.41](#orgd662d0a)
        42. [Exercise 2.42](#orgfa85aca)
        43. [Exercise 2.43](#orgd77e327)
        44. [Exercise 2.44](#orgc6d6e8f)
        45. [Exercise 2.45](#org39097cb)
        46. [Exercise 2.46](#org9844b09)
        47. [Exercise 2.47](#org19d64c6)
        48. [Exercise 2.48](#org0a98f2d)
        49. [Exercise 2.49](#org630566a)
        50. [Exercise 2.50](#org84b06e7)
        51. [Exercise 2.51](#org0bf6788)
        52. [Exercise 2.52](#orgc0ce858)
        53. [Exercise 2.53](#orgd4f7a5f)
        54. [Exercise 2.54](#org6bb2e1b)
        55. [Exercise 2.55](#org7b21255)
        56. [Exercise 2.56](#org13ba3c8)
        57. [Exercise 2.57](#orga3ab72f)
        58. [Exercise 2.58](#org9adf575)
        59. [Exercise 2.59](#orge5f74f4)
        60. [Exercise 2.60](#orgeb69c40)
        61. [Exercise 2.61](#org6cc2714)
        62. [Exercise 2.62](#orgef94799)
        63. [Exercise 2.63](#orgcf8f30d)
        64. [Exercise 2.64](#org8bbf93c)
        65. [Exercise 2.65](#orgc647d4b)
        66. [Exercise 2.66](#orga4da822)
        67. [Exercise 2.67](#orgd5a09a9)
        68. [Exercise 2.68](#org011b2ff)
        69. [Exercise 2.69](#org306db0b)
        70. [Exercise 2.70](#orgfd0ca65)
        71. [Exercise 2.71](#orgdb2c1a0)
        72. [Exercise 2.72](#org50181fd)
        73. [Exercise 2.73](#org199f67e)
        74. [Exercise 2.74](#org59e1371)
        75. [Exercise 2.75](#org05a1c11)
        76. [Exercise 2.76](#orgee79d8b)
        77. [Exercise 2.77](#orgaa7314b)
        78. [Exercise 2.78](#orgc692e9d)
        79. [Exercise 2.79](#orge5a9dab)
        80. [Exercise 2.80](#org54e9f03)
        81. [Exercise 2.81](#orgf90b315)
        82. [Exercise 2.82](#orgb9150b3)
        83. [Exercise 2.83](#orgca607b9)
        84. [Exercise 2.84](#org861bc07)
        85. [Exercise 2.85](#orgb07f70f)
        86. [Exercise 2.86](#orgfcce34b)
        87. [Exercise 2.87](#orgeef9f0a)
        88. [Exercise 2.88](#orgdd86bf3)
        89. [Exercise 2.89](#org8d755bd)
        90. [Exercise 2.90](#org9f35103)
        91. [Exercise 2.91](#org312de71)
        92. [Exercise 2.92](#orgec364f7)
        93. [Exercise 2.93](#org2ec9bbb)
        94. [Exercise 2.94](#org6056cda)
        95. [Exercise 2.95](#org5a3f9e5)
        96. [Exercise 2.96](#org7845b6c)
        97. [Exercise 2.97](#orgf796354)
    3.  [Chapter 3: Modularity, Objects and State <code>[0/82]</code>](#org29f1aa5)
        1.  [Exercise 3.1](#orgf9ec929)
        2.  [Exercise 3.2](#org51936cd)
        3.  [Exercise 3.3](#org1a08d5c)
        4.  [Exercise 3.4](#org83deca8)
        5.  [Exercise 3.5](#orga917547)
        6.  [Exercise 3.6](#orga64c3f5)
        7.  [Exercise 3.7](#orgdeb88ce)
        8.  [Exercise 3.8](#orga2484ff)
        9.  [Exercise 3.9](#org9983f60)
        10. [Exercise 3.10](#orgfee24ff)
        11. [Exercise 3.11](#org0476769)
        12. [Exercise 3.12](#org816a6d4)
        13. [Exercise 3.13](#org6aa1fb8)
        14. [Exercise 3.14](#org52bc159)
        15. [Exercise 3.15](#org0e368c3)
        16. [Exercise 3.16](#org49a5e98)
        17. [Exercise 3.17](#orga766dbb)
        18. [Exercise 3.18](#orgd42cdf5)
        19. [Exercise 3.19](#org5d4c446)
        20. [Exercise 3.20](#org68647f4)
        21. [Exercise 3.21](#org0205e15)
        22. [Exercise 3.22](#org89fa519)
        23. [Exercise 3.23](#orgb1c94ed)
        24. [Exercise 3.24](#orga6591a8)
        25. [Exercise 3.25](#org88d3212)
        26. [Exercise 3.26](#org8394bc2)
        27. [Exercise 3.27](#org375b4b9)
        28. [Exercise 3.28](#org6b8af26)
        29. [Exercise 3.29](#orga61bd0c)
        30. [Exercise 3.30](#org651f885)
        31. [Exercise 3.31](#org86b61b8)
        32. [Exercise 3.32](#org89aa0fc)
        33. [Exercise 3.33](#org2767ef9)
        34. [Exercise 3.34](#org5e41f92)
        35. [Exercise 3.35](#org95d4e26)
        36. [Exercise 3.36](#org03d7ee4)
        37. [Exercise 3.37](#org28cf3de)
        38. [Exercise 3.38](#orgcca45b3)
        39. [Exercise 3.39](#org9440430)
        40. [Exercise 3.40](#org92f625d)
        41. [Exercise 3.41](#orgda5477b)
        42. [Exercise 3.42](#orga191fd9)
        43. [Exercise 3.43](#org3c92e97)
        44. [Exercise 3.44](#org463a5bd)
        45. [Exercise 3.45](#org2e0bd1b)
        46. [Exercise 3.46](#orgf2515fa)
        47. [Exercise 3.47](#orgcfdf1ee)
        48. [Exercise 3.48](#org978a78f)
        49. [Exercise 3.49](#orgb4c99f2)
        50. [Exercise 3.50](#orgc1f2855)
        51. [Exercise 3.51](#org977bfff)
        52. [Exercise 3.52](#org8f7def9)
        53. [Exercise 3.53](#org570d086)
        54. [Exercise 3.54](#org76c9e29)
        55. [Exercise 3.55](#org9fcd10a)
        56. [Exercise 3.56](#org37fdb13)
        57. [Exercise 3.57](#orgd718720)
        58. [Exercise 3.58](#org4d48828)
        59. [Exercise 3.59](#orgf6b34ff)
        60. [Exercise 3.60](#org302171d)
        61. [Exercise 3.61](#org7f9dbd3)
        62. [Exercise 3.62](#orge153a7f)
        63. [Exercise 3.63](#orgdd3d35b)
        64. [Exercise 3.64](#org67b48b5)
        65. [Exercise 3.65](#org528748c)
        66. [Exercise 3.66](#org122007e)
        67. [Exercise 3.67](#org27f5cf1)
        68. [Exercise 3.68](#org5410f30)
        69. [Exercise 3.69](#org901f901)
        70. [Exercise 3.70](#org78fa8e2)
        71. [Exercise 3.71](#org34d3fcd)
        72. [Exercise 3.72](#orgca8ea41)
        73. [Exercise 3.73](#orga010030)
        74. [Exercise 3.74](#orgbcd5c2d)
        75. [Exercise 3.75](#org1bc5385)
        76. [Exercise 3.76](#org75fd271)
        77. [Exercise 3.77](#org9b457ed)
        78. [Exercise 3.78](#orgc0e6d3d)
        79. [Exercise 3.79](#org0a7f9c0)
        80. [Exercise 3.80](#orgcacd0aa)
        81. [Exercise 3.81](#orgf87b228)
        82. [Exercise 3.82](#org620861e)
    4.  [Chapter 4: Metalinguistic Abstraction <code>[0/79]</code>](#orgb251955)
        1.  [Exercise 4.1](#orgc0b5bb9)
        2.  [Exercise 4.2](#org67f2643)
        3.  [Exercise 4.3](#orgd5c58f8)
        4.  [Exercise 4.4](#org4d54e74)
        5.  [Exercise 4.5](#org2668c5a)
        6.  [Exercise 4.6](#org237fd06)
        7.  [Exercise 4.7](#orgf165291)
        8.  [Exercise 4.8](#orgfce28d1)
        9.  [Exercise 4.9](#org024c976)
        10. [Exercise 4.10](#orgfb84074)
        11. [Exercise 4.11](#org549626b)
        12. [Exercise 4.12](#org3936d57)
        13. [Exercise 4.13](#orgbf5aed3)
        14. [Exercise 4.14](#org7614340)
        15. [Exercise 4.15](#org69b4f51)
        16. [Exercise 4.16](#orge5ef032)
        17. [Exercise 4.17](#orgb0bbd8a)
        18. [Exercise 4.18](#org9619fee)
        19. [Exercise 4.19](#org1e2f897)
        20. [Exercise 4.20](#org1165b7b)
        21. [Exercise 4.21](#org6480227)
        22. [Exercise 4.22](#orgf49e56b)
        23. [Exercise 4.23](#org4c5f2a8)
        24. [Exercise 4.24](#orgbf86f38)
        25. [Exercise 4.25](#orgd61e0d0)
        26. [Exercise 4.26](#org80a1801)
        27. [Exercise 4.27](#org03bce13)
        28. [Exercise 4.28](#org9d5fc4d)
        29. [Exercise 4.29](#orgfb02599)
        30. [Exercise 4.30](#orgc3586ca)
        31. [Exercise 4.31](#org3094077)
        32. [Exercise 4.32](#org8e29895)
        33. [Exercise 4.33](#org660815b)
        34. [Exercise 4.34](#org84200e3)
        35. [Exercise 4.35](#orgd33420c)
        36. [Exercise 4.36](#org5c8362f)
        37. [Exercise 4.37](#org847f5b3)
        38. [Exercise 4.38](#orgeb32931)
        39. [Exercise 4.39](#org08d1b7b)
        40. [Exercise 4.40](#org0393f30)
        41. [Exercise 4.41](#org6880dba)
        42. [Exercise 4.42](#org58fea77)
        43. [Exercise 4.43](#org3d87dee)
        44. [Exercise 4.44](#orgadc2519)
        45. [Exercise 4.45](#org9f9856b)
        46. [Exercise 4.46](#org5ff5065)
        47. [Exercise 4.47](#org9eaa58d)
        48. [Exercise 4.48](#org4e3b38e)
        49. [Exercise 4.49](#orgd50be9d)
        50. [Exercise 4.50](#org4de3fb8)
        51. [Exercise 4.51](#org5d14a2a)
        52. [Exercise 4.52](#org8c25da1)
        53. [Exercise 4.53](#org181b6cf)
        54. [Exercise 4.54](#orga835e6e)
        55. [Exercise 4.55](#orgd3bd0f6)
        56. [Exercise 4.56](#org69764f7)
        57. [Exercise 4.57](#org1cbb180)
        58. [Exercise 4.58](#org01038a8)
        59. [Exercise 4.59](#orge525706)
        60. [Exercise 4.60](#org1661bd4)
        61. [Exercise 4.61](#org76ec517)
        62. [Exercise 4.62](#orgf49f206)
        63. [Exercise 4.63](#org69a738b)
        64. [Exercise 4.64](#org4188521)
        65. [Exercise 4.65](#orgf41d14d)
        66. [Exercise 4.66](#org12686fb)
        67. [Exercise 4.67](#org66d9277)
        68. [Exercise 4.68](#org6a71074)
        69. [Exercise 4.69](#org7fa7b88)
        70. [Exercise 4.70](#orgde41c92)
        71. [Exercise 4.71](#org99f6ec8)
        72. [Exercise 4.72](#org400d645)
        73. [Exercise 4.73](#orgc52cc19)
        74. [Exercise 4.74](#org5de5d3e)
        75. [Exercise 4.75](#orgf556383)
        76. [Exercise 4.76](#org31bfef5)
        77. [Exercise 4.77](#org3488ada)
        78. [Exercise 4.78](#org252043e)
        79. [Exercise 4.79](#org0ab832b)
    5.  [Chapter 5: Computing with Register Machines <code>[0/52]</code>](#org9d679b3)
        1.  [Exercise 5.1](#org2ef12a5)
        2.  [Exercise 5.2](#orgff8d8fb)
        3.  [Exercise 5.3](#orgb6ee8cf)
        4.  [Exercise 5.4](#org468c8f7)
        5.  [Exercise 5.5](#org8300657)
        6.  [Exercise 5.6](#org441baf8)
        7.  [Exercise 5.7](#org27676a0)
        8.  [Exercise 5.8](#orga65cbc1)
        9.  [Exercise 5.9](#orgc5f4389)
        10. [Exercise 5.10](#org02a86bf)
        11. [Exercise 5.11](#orgc046a41)
        12. [Exercise 5.12](#org346c2ba)
        13. [Exercise 5.13](#org1a37ea9)
        14. [Exercise 5.14](#org158e312)
        15. [Exercise 5.15](#org6d1df44)
        16. [Exercise 5.16](#orgc3aa706)
        17. [Exercise 5.17](#org9b7360c)
        18. [Exercise 5.18](#org55ec814)
        19. [Exercise 5.19](#org0554626)
        20. [Exercise 5.20](#orgf2da27f)
        21. [Exercise 5.21](#orgb2877c0)
        22. [Exercise 5.22](#org9bf947c)
        23. [Exercise 5.23](#orgea8053e)
        24. [Exercise 5.24](#org97cc429)
        25. [Exercise 5.25](#orga13343f)
        26. [Exercise 5.26](#orgd6be7a7)
        27. [Exercise 5.27](#org8bb25a2)
        28. [Exercise 5.28](#org16c012c)
        29. [Exercise 5.29](#org8f3e64d)
        30. [Exercise 5.30](#orgac903d8)
        31. [Exercise 5.31](#orgdd0d89b)
        32. [Exercise 5.32](#org237bd7e)
        33. [Exercise 5.33](#orgd5c8d14)
        34. [Exercise 5.34](#org0255c4d)
        35. [Exercise 5.35](#org0df5504)
        36. [Exercise 5.36](#org5ee0681)
        37. [Exercise 5.37](#org2f25663)
        38. [Exercise 5.38](#org54bbc2c)
        39. [Exercise 5.39](#org9e1d0be)
        40. [Exercise 5.40](#orge138ea4)
        41. [Exercise 5.41](#orgd7b9aa1)
        42. [Exercise 5.42](#org187d781)
        43. [Exercise 5.43](#org1888ca3)
        44. [Exercise 5.44](#orgd586ddf)
        45. [Exercise 5.45](#org76136cd)
        46. [Exercise 5.46](#org3481fa3)
        47. [Exercise 5.47](#orgcb4c108)
        48. [Exercise 5.48](#org593bbbe)
        49. [Exercise 5.49](#org3dc09ec)
        50. [Exercise 5.50](#orgbb692c1)
        51. [Exercise 5.51](#orgc7e9fd8)
        52. [Exercise 5.52](#org9f7c91d)



<a id="org74803f4"></a>

# noweb + common


<a id="org5fc2155"></a>

## Setting chibi arguments. DANGEROUS     :dangerous:elisp:

    (setq geiser-chibi-extra-command-line-parameters
       '("-m" "chibi" "-m" "chibi show" "-m" "chibi show pretty"
         "-m" "chibi ast" "-m" "chibi time" "-m" "srfi 27"))


<a id="org41ab692"></a>

## Some common code blocks

    (import (chibi ast))
    (import (chibi show))
     (define (disp sexp)
       (display sexp)
       (newline))


<a id="org2e20637"></a>

# SICP <code>[15%]</code>


<a id="org07a4dfc"></a>

## TODO Chapter 1: Building abstractions with procedures <code>[57/61]</code>


<a id="org36dcb55"></a>

### Snippet

    (* (+ 2 (* 4 6))
       (+ 3 5 7))

    390


<a id="orge8787e5"></a>

### Thought

Tree accumulation is the process of computing a thing by traversing a tree.


<a id="orgc6e8738"></a>

### DONE Figure 1.1 Tree representation, showing the value of each subcombination

For the sake of pedagogical clarity, I have formatted it as a picture.

    @startmindmap
    skinparam monochrome true
    +_ 390
    ++_ *
    ++_ 26
    +++_ +
    +++_ 2
    +++_ 24
    ++++_ *
    ++++_ 4
    ++++_ 6
    ++_ 15
    +++_ +
    +++_ 3
    +++_ 5
    +++_ 7
    @endmindmap

![img](figure-1-1-mm.png)
;

    @startdot
    graph g {
    	node [shape=plaintext];
    	A1 [label="390"];
    
    	B1 [label="*"];
    	B2 [label="26"];
    	B3 [label="15"];
    
    	C1 [label="+"];
    	C2 [label="2"];
    	C3 [label="24"];
    
    	D1 [label="*"];
    	D2 [label="4"];
    	D3 [label="6"];
    
    	E1 [label="+"];
    	E2 [label="3"];
    	E3 [label="5"];
    	E4 [label="7"];
    
    // edges
    	A1 -- B1;
    	A1 -- B2;
    	A1 -- B3;
    
    	B2 -- C1;
    	B2 -- C2;
    	B2 -- C3;
    
    	C3 -- D1;
    	C3 -- D2;
    	C3 -- D3;
    
    	B3 -- E1;
    	B3 -- E2;
    	B3 -- E3;
    	B3 -- E4;
    
    //	B1 -> B3 [label="(g o f)'" tailport=s headport=s];
    
    	{ rank=same; A1 }
    	{ rank=same; B1 B2 B3 } 
    	{ rank=same; C1 C2 C3 }
    	{ rank=same; D1 D2 D3 }
    	{ rank=same; E1 E2 E3 E4 }
    } 
    @enddot

![img](figure-1-1-dot.png)


<a id="org6b4b93f"></a>

### Snippet

\#+name square

    (define (square x) (* x x))
    (define (sum-of-squares x y)
      (+ (square x) (square y)))
    (sum-of-squares 3 4)

    25


<a id="org72ed0d3"></a>

### DONE Exercise 1.1 Interpreter result

    (define (disp sexp)
      (display sexp)
      (newline))
    (disp 10)
    (disp (+ 2 3 4))
    (disp (- 9 1))
    (disp (/ 6 2))
    (disp (+ (* 2 4) (- 4 6)))
    (define a 3)
    (define b (+ a 1))
    (disp (+ a b (* a b)))
    (disp (= a b))
    (disp
     (if (and (> b a) (< b (* a b )))
         b
         a))
    (disp (cond ((= a 4) 6)
         ((= b 4) (+ 6 7 a))
         (else 25)))
    (disp (+ 2 (if (< b a) b a)))
    (disp (* (cond ((> a b) a)
    	    ((< a b) b)
    	    (else -1)) 
    	 (+ a 1)))

    10
    9
    8
    3
    6
    19
    #f
    4
    16
    5
    16


<a id="orgf4cb6dc"></a>

### DONE Exercise 1.2 Prefix form

    (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

    -37/150


<a id="org02e2797"></a>

### DONE Exercise 1.3 Sum of squares

    (define (sum-of-squares x y)
      (+ (square x) (square y)))
    (import (srfi 95))
    (define (sum-of-two-max a b c)
      (let ((num_list (sort (list a b c) (lambda (a b) (if (> a b) a b)))))
       (sum-of-squares (car num_list) (cadr num_list))))
    (sum-of-two-max 1 2 3)

    13


<a id="org7c33a8e"></a>

### DONE Exercise 1.4 Compound expressions

    (define (a-plus-abs-b a b)
      ((if (> b 0) + -) a b))
    (disp (a-plus-abs-b  3 4))
    (disp (a-plus-abs-b  3 -4))

    7
    7


<a id="org5565d99"></a>

### DONE Exercise 1.5 Ben's test

    (define (p) (p))
    (define (test x y)
      (if (= x 0) 0 y))
    (test 0 (p))

On my interpreter this code goes into an infinite recursion, which
makes sense, I guess, since the second argument to (test) is evaluated
before executing (test). However, if we only substitute *p* into the
application of test and try to traverse the tree depth-first, this
code should be able to terminate successfully?


<a id="orgd38c0f1"></a>

### DONE Exercise 1.6 If is a special form

The problem with this Alyssa's (new-if) is that both arguments would
be computed, so this (new-if) would be either very inefficient or even
not working at all in the case when one of the arguments is
infeasible.
Consider:

    (import (chibi ast))
    (import (chibi show))
     (define (disp sexp)
       (display sexp)
       (newline))
    (define (new-if predicate then-clause else-clause)
      (cond (predicate then-clause)
    	(else else-clause)))
    (define a 1)
    (define b 0)
    (disp (if (not (= b 0)) (/ a b) a))
    (new-if (not (= b 0)) (/ a b) a)

    1
    {Exception #19 user "divide by zero" () #<procedure #f> (#f . 841)}

However, this issue can be solved using scheme macros.

    (import (chibi ast))
    (import (chibi show))
     (define (disp sexp)
       (display sexp)
       (newline))
    (define-syntax new-if
      (syntax-rules ()
        ( (new-if predicate then-clause else-clause)
          (cond (predicate then-clause)
    	    (else else-clause))
        )
      )
    )
    (define a 1)
    (define b 0)
    (disp (if (not (= b 0)) (/ a b) a))
    (disp (new-if (not (= b 0)) (/ a b) a))

    1
    1

The code above works as expected, because the macro does not evaluate
its arguments, and (cond) is a special form.


<a id="org8811bb8"></a>

### DONE Exercise 1.7 Good enough?

This exercise is a very misleading one. On the first glance is seems
that this is just about formulating a good criterion. Make no mistake,
practically solving this task means really writing all this code
carefully.

The function we are interested in is:


<div class="figure">
<p><img src="ltximg/index_1f2b5b60b9c2bcc6a3c92ae2320f53172198bd1b.png" alt="index_1f2b5b60b9c2bcc6a3c92ae2320f53172198bd1b.png" /></p>
</div>

The code given in the chapter before is equivalent to the following
Newton's method formula, where <img src="ltximg/index_0e11215e836ddfacc1869b884556488a1d1a62d0.png" alt="index_0e11215e836ddfacc1869b884556488a1d1a62d0.png" /> denotes the next guess:


<div class="figure">
<p><img src="ltximg/index_2dac860ba84eeeb5d1e545505c4b021fb8e188cb.png" alt="index_2dac860ba84eeeb5d1e545505c4b021fb8e188cb.png" /></p>
</div>

How on Earth does this formula even appear? Let's remember some
mathematics, namely, the Taylor series (variables unbound):


<div class="figure">
<p><img src="ltximg/index_8ebade304c727f351c98d85d9351f0b6d3f7705d.png" alt="index_8ebade304c727f351c98d85d9351f0b6d3f7705d.png" /></p>
</div>

Let us call \`true' value of <img src="ltximg/index_4dd10ed3bbbc2a8c4d4ac77598c7c460c2d73378.png" alt="index_4dd10ed3bbbc2a8c4d4ac77598c7c460c2d73378.png" />. Let us call our first guess
<img src="ltximg/index_aff1d2d49a72552f682fb0d4f5b1a17e588d05d6.png" alt="index_aff1d2d49a72552f682fb0d4f5b1a17e588d05d6.png" />. What is the value of the difference (error) between them?
Clearly, <img src="ltximg/index_917a12776c1a469350caf195cc125359cb9706db.png" alt="index_917a12776c1a469350caf195cc125359cb9706db.png" />. Well, the problem is — we don't know <img src="ltximg/index_458ea7beb064b06c71bf0139a6e7c352a773b6ff.png" alt="index_458ea7beb064b06c71bf0139a6e7c352a773b6ff.png" />. But we do
know <img src="ltximg/index_3adacc51296eed5b165aa30cccf542dcfa20f6fa.png" alt="index_3adacc51296eed5b165aa30cccf542dcfa20f6fa.png" />. Therefore <img src="ltximg/index_dd25b3d0545d1d50e693cb5fe16d19562716f466.png" alt="index_dd25b3d0545d1d50e693cb5fe16d19562716f466.png" /> is a number we know. What will be the
error on the next step of the algorithm? Let's find <img src="ltximg/index_5af799f6b36b63b3d4358c3968b3d6f7ea64bf33.png" alt="index_5af799f6b36b63b3d4358c3968b3d6f7ea64bf33.png" /> as
<img src="ltximg/index_07854fcfd07291fc835df20593766c441a0e6f74.png" alt="index_07854fcfd07291fc835df20593766c441a0e6f74.png" />. If <img src="ltximg/index_b8ed45411d7cbe7699c3ab1fc429842ff3076d32.png" alt="index_b8ed45411d7cbe7699c3ab1fc429842ff3076d32.png" /> is not too big, we can use the Taylor
expansion from ref:eq:1 <img src="ltximg/index_b8ed45411d7cbe7699c3ab1fc429842ff3076d32.png" alt="index_b8ed45411d7cbe7699c3ab1fc429842ff3076d32.png" />.


<div class="figure">
<p><img src="ltximg/index_57ecd827ba14e6324b5f916698f4eea19d39a422.png" alt="index_57ecd827ba14e6324b5f916698f4eea19d39a422.png" /></p>
</div>

Be careful. What I expanded here is not the function value. It is the
<span class="underline">error</span> value. Now, clearly we want our error to be as small as
possible, desirably as little as machine precision would allow. So
assuming <img src="ltximg/index_8dfa7271060137e4da301c5fbd321710fd90b840.png" alt="index_8dfa7271060137e4da301c5fbd321710fd90b840.png" />, we get an equation to solve:


<div class="figure">
<p><img src="ltximg/index_4f3fdcf3f21faa1cfd2c2ecc87697b604a991afb.png" alt="index_4f3fdcf3f21faa1cfd2c2ecc87697b604a991afb.png" /></p>
</div>

Remember though that we don't need just <img src="ltximg/index_b8ed45411d7cbe7699c3ab1fc429842ff3076d32.png" alt="index_b8ed45411d7cbe7699c3ab1fc429842ff3076d32.png" /> here. We actually need
<img src="ltximg/index_5af799f6b36b63b3d4358c3968b3d6f7ea64bf33.png" alt="index_5af799f6b36b63b3d4358c3968b3d6f7ea64bf33.png" />. But <img src="ltximg/index_5af799f6b36b63b3d4358c3968b3d6f7ea64bf33.png" alt="index_5af799f6b36b63b3d4358c3968b3d6f7ea64bf33.png" /> is just <img src="ltximg/index_3d78eec4503b442a510a72a90dfe95e5a0457368.png" alt="index_3d78eec4503b442a510a72a90dfe95e5a0457368.png" />.


<div class="figure">
<p><img src="ltximg/index_79fd195ff2fe3ac27367b33ff86be71c5c3cfb89.png" alt="index_79fd195ff2fe3ac27367b33ff86be71c5c3cfb89.png" /></p>
</div>

Now if you rearrange this formula, you will get exactly the formula
ref:eq:1.

The code below is copied from SICP verbatim and implements the
algorithm above.

    (define (sqrt-iter guess x)
      (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

    #<undef>

    (define (improve guess x)
      (average guess (/ x guess)))

    #<undef>

    (define (good-enough? guess x)
      (< (abs (- (square guess) x)) 0.001))
    (define (improve guess x)
      (average guess (/ x guess)))
    (define (average x y)
      (/ (+ x y) 2))
    (define (sqrt x)
      (sqrt-iter 1.0 x))

    #<undef>

\#+name simple-newton

    (import (chibi ast))
    (import (chibi show))
     (define (disp sexp)
       (display sexp)
       (newline))
    (define (square x)
     (* x x))
    (define (sqrt-iter guess x)
      (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
    (define (good-enough? guess x)
      (< (abs (- (square guess) x)) 0.001))
    (define (improve guess x)
      (average guess (/ x guess)))
    (define (average x y)
      (/ (+ x y) 2))
    (define (sqrt x)
      (sqrt-iter 1.0 x))
    
    (sqrt 9)

    3.00009155413138

An example of how this fails on small numbers:

    
    (square (sqrt 0.0004))

    0.0004

An example of why this fails on big numbers I didn't manage to
craft. Perhaps chibi-scheme has some clever way to deal with rounding?
Anyway — here is the code:

    
    (square (sqrt 9999999999.0))

    9999999999.0

Why exactly this is not very good algorithms is a good question. The
derivative of the square is well-defined near the 0, although the
derivative of the square root is not. Therefore, the equation ref:eq:8
become very imprecise. As we see, big number seem to be working fine
in my scheme implementation.

Let us write a better sqrt-iter?.

    (define (sqrt-iter guess x)
     (let ((better-guess (improve guess x)))
      (if (good-enough? guess (square better-guess))
          better-guess
          (sqrt-iter better-guess x))))

    #<undef>

    (import (chibi ast))
    (import (chibi show))
     (define (disp sexp)
       (display sexp)
       (newline))
    (define (square x)
     (* x x))
    (define (sqrt-iter guess x)
     (let ((better-guess (improve guess x)))
      (if (good-enough? guess (square better-guess))
          better-guess
          (sqrt-iter better-guess x))))
    (define (good-enough? guess x)
      (< (abs (- (square guess) x)) 0.001))
    (define (improve guess x)
      (average guess (/ x guess)))
    (define (average x y)
      (/ (+ x y) 2))
    (define (sqrt x)
      (sqrt-iter 1.0 x))

    #<undef>

    (import (chibi ast))
    (import (chibi show))
     (define (disp sexp)
       (display sexp)
       (newline))
    (define (square x)
     (* x x))
    (define (sqrt-iter guess x)
     (let ((better-guess (improve guess x)))
      (if (good-enough? guess (square better-guess))
          better-guess
          (sqrt-iter better-guess x))))
    (define (good-enough? guess x)
      (< (abs (- (square guess) x)) 0.001))
    (define (improve guess x)
      (average guess (/ x guess)))
    (define (average x y)
      (/ (+ x y) 2))
    (define (sqrt x)
      (sqrt-iter 1.0 x))
    
    (square (sqrt 0.0004))

    0.0005452233379244715

Works faster and gives a better result. Seemingly. QED<sup><a id="fnr.1" class="footref" href="#fn.1">1</a></sup>.


<a id="orged9e753"></a>

### DONE Exercise 1.8 Newton's method

This exercise is not very hard. The only difference is that the
\`improve' function is not derived from a derivative of a square but
rather from a derivative of a cube.

    (define (cube-improve guess x)
        (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

    #<undef>

    (define (cube-good-enough? guess x)
      (< (abs (- (cube guess) x)) 0.001))

    #<undef>

    (define (cube-root-iter guess x)
      (let ((better-guess (cube-improve guess x)))
        (disp better-guess)
        (if (cube-good-enough? better-guess (cube guess))
    	better-guess
    	(cube-root-iter better-guess x))))

    #<undef>

    (import (chibi ast))
    (import (chibi show))
     (define (disp sexp)
       (display sexp)
       (newline))
    (define (cube x)
      (* x x x))
    (define (cube-improve guess x)
        (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
    (define (cube-good-enough? guess x)
      (< (abs (- (cube guess) x)) 0.001))
    (define (cube-root-iter guess x)
      (let ((better-guess (cube-improve guess x)))
        (disp better-guess)
        (if (cube-good-enough? better-guess (cube guess))
    	better-guess
    	(cube-root-iter better-guess x))))
    (cube-root-iter 1.0 27.0)

    9.666666666666666
    6.540758356453956
    4.570876778578707
    3.4780192333867963
    3.0626891086275365
    3.001274406506175
    3.0000005410641766
    3.0000000000000977


<a id="org19d8332"></a>

### TODO Figure 1.2 Procedural decomposition of the sqrt program

TODO


<a id="org22e61c8"></a>

### TODO Figure 1.3 A linear recursive process for computing <img src="ltximg/index_636e4355c14eb884455ca87f34a1d1626764c4bf.png" alt="index_636e4355c14eb884455ca87f34a1d1626764c4bf.png" />.

TODO


<a id="org2be185f"></a>

### TODO Figure 1.4 A linear iterative process for computing <img src="ltximg/index_636e4355c14eb884455ca87f34a1d1626764c4bf.png" alt="index_636e4355c14eb884455ca87f34a1d1626764c4bf.png" />.

TODO


<a id="org1898f50"></a>

### DONE Exercise 1.9 Iterative or recursive?     :macro:er_macro_transformer:chicken:

I didn't find (inc) and (dec) in my scheme, so I define them myself.

I still don't want to overload the "+" and "-" symbols, so I will call
them \`plus' and \`minus'.

      (define (inc x)
        (+ 1 x))
      (define (dec x)
        (- x 1))
      (define-syntax plusF
        (er-macro-transformer
         (lambda (form rename compare?)
           (let ((a (cadr form))
    	     (b (caddr form)))
    n	 (if (= a 0) b `(inc (plusF ,(dec a) ,b)))))))
      (macroexpand '(plusF 4 5))

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">inc</td>
<td class="org-left">(inc (inc (inc 5)))</td>
</tr>
</tbody>
</table>

We can see that the macro expander has expanded the computation in to
a tree of length 4. This happens because the algorithm is genuinely
recursive, the return value is not produced by a call to itself, and
therefore recursion cannot be tail-optimized. 

    (define (inc x)
      (+ 1 x))
    (define (dec x)
      (- x 1))
    (define-syntax plusS
      (er-macro-transformer
       (lambda (form rename compare?)
         (let ((a (cadr form))
    	   (b (caddr form)))
           (if (= a 0) b `(plusS ,(dec a) ,(inc b)))))))
    (macroexpand '(plusS 4 5))

    9

We can clearly see the difference. The first macro is genuinely
recursive, it expands to a series of calls, and needs to keep the
information about this calls on the stack. The second one is actually
iterative. The macro call only happens as the last step, and no
information is kept, as the return value will be just the last result,
so this macro is expanded until it's just a number.


<a id="org7de10b4"></a>

### DONE Exercise 1.10 Ackermann's function

Let's run the demos first:

    (import (chibi ast))
    (import (chibi show))
     (define (disp sexp)
       (display sexp)
       (newline))
    (define (A x y)
      (cond ((= y 0.0) 0.0)
    	((= x 0.0) (* 2.0 y))
    	((= y 1.0) 2.0)
    	(else (A (- x 1.0) (A x (- y 1.0))))))
    (disp (A 1 10))
    (disp (A 2 4))
    (disp (A 3 3))

    1024.0
    65536.0
    65536.0

    1024.0
    65536.0
    65536.0

The values of these expressions are listed above.

    (define (f n) (A 0 n))
    (define (g n) (A 1 n))
    (define (h n) (A 2 n))
    (define (k n) (* 5 n n))

    #<undef>

The mathematical expressions for these formulae are:


<div class="figure">
<p><img src="ltximg/index_025408110c2a34eb2dc4ecb5b9afe3274e61602e.png" alt="index_025408110c2a34eb2dc4ecb5b9afe3274e61602e.png" /></p>
</div>

Actually this is not the Ackermann's function as it is most often
defined, for example, see
<http://mathworld.wolfram.com/AckermannFunction.html>. But the
recurrent relation is the same. This version of the Ackermann's
function seems to be equivalent to the powers tower.

I may have lied with the coefficients, but essentially, the
Ackermann's function with parameters <img src="ltximg/index_2151baceed443bea4772931fb19a95f5f1e314c3.png" alt="index_2151baceed443bea4772931fb19a95f5f1e314c3.png" /> and <img src="ltximg/index_844c939cb84ae408dcd9303822c43048129155c7.png" alt="index_844c939cb84ae408dcd9303822c43048129155c7.png" /> works by applying the
n-the hyperoperator m times to 2. A hyperoperator is a generalization
of the standard matematical operator sequence \`+', \`\*', \`^', see
<https://googology.wikia.org/wiki/Hyper_operator>


<a id="org045b84e"></a>

### TODO Figure 1.5 The tree-recursive process generated in computing (fib 5)


<a id="org3b8e73e"></a>

### DONE Exercise 1.11 Recursive vs iterative


<div class="figure">
<p><img src="ltximg/index_b9515a189de86612dc90ea41fb5c8bda61e1745e.png" alt="index_b9515a189de86612dc90ea41fb5c8bda61e1745e.png" /></p>
</div>

    (define (f-recursive n)
      (cond ((< n 3) n)
    	(else
    	 (+
    	  (f-recursive (- n 1))
    	  (* 2 (f-recursive (- n 2)))
    	  (* 3 (f-recursive (- n 3)))))))
    (f-recursive 7)

    142

    (define (f-iter m n fn-1 fn-2 fn-3)
      (let ((fn (+ fn-1 (* 2 fn-2) (* 3 fn-3))))
        (cond ((= m n) fn)
    	   (else (f-iter m (+ n 1) fn fn-1 fn-2)))))
    
    (define (f-iterative n)
      (cond ((< n 3) n)
    	(else (f-iter n 3 2 1 0))))
    
    (f-iterative 7)

    142


<a id="org621cc36"></a>

### DONE Exercise 1.12 Recursive Pascal's triangle


<div class="figure">
<p><img src="ltximg/index_d56932b6c19b1e9cd7d1bd4f163f4f9b3a3badc7.png" alt="index_d56932b6c19b1e9cd7d1bd4f163f4f9b3a3badc7.png" /></p>
</div>

    (define (pascal-number line-number column-number)
      (cond ((= line-number 1) 1)
    	((= line-number 2) 1)
    	((= column-number 1) 1)
    	((= column-number line-number) 1)
    	(else (+
    	       (pascal-number (- line-number 1) (- column-number 1))
    	       (pascal-number (- line-number 1) column-number)))))
    (pascal-number 5 3)


<a id="org77e2ca4"></a>

### DONE Exercise 1.13 Fibonacci


<div class="figure">
<p><img src="ltximg/index_d1e768a50ae6173484e3b23b5808d06e73b38640.png" alt="index_d1e768a50ae6173484e3b23b5808d06e73b38640.png" /></p>
</div>

Abelson and Sussman define <img src="ltximg/index_6503197011351f4eb70061321e1cab0f095d5a1b.png" alt="index_6503197011351f4eb70061321e1cab0f095d5a1b.png" /> and <img src="ltximg/index_cd47c9d70d4343d03d989f5ea4deb7475c1dfc88.png" alt="index_cd47c9d70d4343d03d989f5ea4deb7475c1dfc88.png" />.

Knowing that <img src="ltximg/index_ac773292cb43ee407db60065cf6f23688ed84543.png" alt="index_ac773292cb43ee407db60065cf6f23688ed84543.png" /> is almost all the
problem done, because <img src="ltximg/index_17f05239da0ef7a80389626648c17fa9d452af64.png" alt="index_17f05239da0ef7a80389626648c17fa9d452af64.png" /> is clearly less than <img src="ltximg/index_af3230dcf98c207d1c76d8af16b6f94492ad6203.png" alt="index_af3230dcf98c207d1c76d8af16b6f94492ad6203.png" />, so for large
<img src="ltximg/index_4f45d79f0382087e2c65f5b95fb96c34bb78911d.png" alt="index_4f45d79f0382087e2c65f5b95fb96c34bb78911d.png" /> it will be exponentially close to <img src="ltximg/index_62cd5ba144328e080d7fb3e8dcd9bda311c6359c.png" alt="index_62cd5ba144328e080d7fb3e8dcd9bda311c6359c.png" />, and this is where the
\`\`closest integer'' comes from.

Let us prove the rest by induction.


<div class="figure">
<p><img src="ltximg/index_466e2f3bc12876b144050c86ed4b1b799c030815.png" alt="index_466e2f3bc12876b144050c86ed4b1b799c030815.png" /></p>
</div>

This proves that the recurrent relation for <img src="ltximg/index_19386b2015c1244a9ef6e5f7977ab2d20e386b86.png" alt="index_19386b2015c1244a9ef6e5f7977ab2d20e386b86.png" /> is the
same as for the Fibonacci sequence. Then if we prove that there exist
such <img src="ltximg/index_4f45d79f0382087e2c65f5b95fb96c34bb78911d.png" alt="index_4f45d79f0382087e2c65f5b95fb96c34bb78911d.png" /> and <img src="ltximg/index_6a760a910d135681b143eb6e73559272f2133e06.png" alt="index_6a760a910d135681b143eb6e73559272f2133e06.png" /> so that <img src="ltximg/index_e7f5a6c6539ae72afb44e752588be6a593a24ab7.png" alt="index_e7f5a6c6539ae72afb44e752588be6a593a24ab7.png" />, then we're done.

Indeed, let's have a look at <img src="ltximg/index_e1155a10fe60f5022d288f0146d5e14ff8f21f94.png" alt="index_e1155a10fe60f5022d288f0146d5e14ff8f21f94.png" />: <img src="ltximg/index_b78dba481bcddfb765c1bdd15e899833e161df40.png" alt="index_b78dba481bcddfb765c1bdd15e899833e161df40.png" />; and <img src="ltximg/index_d49fcd30ed8c39059fda6d675bc4f747e6e5e1b5.png" alt="index_d49fcd30ed8c39059fda6d675bc4f747e6e5e1b5.png" />: <img src="ltximg/index_a4193b4812354271dcd127ce459c8250aa6a3fb3.png" alt="index_a4193b4812354271dcd127ce459c8250aa6a3fb3.png" />.


<a id="org06e7e0d"></a>

### DONE Exercise 1.14 count-change     :macro:er_macro_transformer:

Let us use the non-standard but common er-macro-transformer to plot
the execution tree.

      (define-syntax cc
        (er-macro-transformer
         (lambda (form rename compare?)
           (let ((amount (cadr form))
    	     (kinds-of-coins (caddr form)))
    	 (cond ((= amount 0) 1)
    	       ((or (< amount 0) (= kinds-of-coins 0)) 0)
    	       (`(+ (cc ,amount
    			,(- kinds-of-coins 1))
    		    (cc ,(- amount
    			    (first-denomination
    			     kinds-of-coins))
    			,kinds-of-coins))))))))
      (define (first-denomination kinds-of-coins)
        (cond ((= kinds-of-coins 1) 1)
    	  ((= kinds-of-coins 2) 5)
    	  ((= kinds-of-coins 3) 10)
    	  ((= kinds-of-coins 4) 25)
    	  ((= kinds-of-coins 5) 50)))
    (show #t " "(pretty (macroexpand '(cc 11 5))))

    (+
     (+
      (+
       (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1)))))))))))
          (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1)))))) (+ (+ 0 1) 0)))
       (+ (+ (+ 0 1) 0) 0))
      0)
     0)

Initially I wrote the same code in Emacs Lisp, I am leaving it here
for future reference.

      (defmacro cc (amount kinds-of-coins)
        (cond ((= amount 0) 1)
    	  ((or (< amount 0) (= kinds-of-coins 0)) 0)
    	  (`(+ (cc ,amount
    		  ,(- kinds-of-coins 1))
    	      (cc ,(- amount
    		     (first-denomination
    		      kinds-of-coins))
    		  ,kinds-of-coins)))))
    (defun first-denomination (kinds-of-coins)
      (cond ((= kinds-of-coins 1) 1)
    	((= kinds-of-coins 2) 5)
    	((= kinds-of-coins 3) 10)
    	((= kinds-of-coins 4) 25)
    	((= kinds-of-coins 5) 50)))
    (pp (macroexpand-all '(cc 11 5)))

    (+
     (+
      (+
       (+
        (+ 0
           (+ 0
    	  (+ 0
    	     (+ 0
    		(+ 0
    		   (+ 0
    		      (+ 0
    			 (+ 0
    			    (+ 0
    			       (+ 0
    				  (+ 0 1)))))))))))
        (+
         (+ 0
    	(+ 0
    	   (+ 0
    	      (+ 0
    		 (+ 0
    		    (+ 0 1))))))
         (+
          (+ 0 1)
          0)))
       (+
        (+
         (+ 0 1)
         0)
        0))
      0)
     0)

    (+
     (+
      (+
       (+
        (+ 0
           (+ 0
    	  (+ 0
    	     (+ 0
    		(+ 0
    		   (+ 0
    		      (+ 0
    			 (+ 0
    			    (+ 0
    			       (+ 0
    				  (+ 0 1)))))))))))
        (+
         (+ 0
    	(+ 0
    	   (+ 0
    	      (+ 0
    		 (+ 0
    		    (+ 0 1))))))
         (+
          (+ 0 1)
          0)))
       (+
        (+
         (+ 0 1)
         0)
        0))
      0)
     0)

The space complexity of the algorithm will be dominated by the depth
of the tree — that is the value to be changed, as there is no need to
keep any additional information.

The time complexity can be estimated as follows: for every additional
value the algorithm will have to go through all passes of the
algorithm without an additional denomination, times the amount divided
by the value of an additional denomination. We can consider the
additional denomination value as a constant, and the amount of steps
for the simplest case of only one denomination is the
amount. Therefore, the algorithm is linear in amount and exponential
in the number of denominations.


<div class="figure">
<p><img src="ltximg/index_92cc3503d995faa18496b4479889be3d46e05f8d.png" alt="index_92cc3503d995faa18496b4479889be3d46e05f8d.png" /></p>
</div>


<a id="org6a22a1b"></a>

### I found a bug in ob-scheme while doing this Exercise.

<span class="underline">In process I have found a bug in org-babel!</span>

    (display "(+ 0) ")

    0

    (display "(+ 0)")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-right" />
</colgroup>
<tbody>
<tr>
<td class="org-left">+</td>
<td class="org-right">0</td>
</tr>
</tbody>
</table>

(org-babel-script-escape "(+ 0)") (org-babel-script-escape "(+ 0) ")


<a id="org6b9b434"></a>

### DONE Exercise 1.15 sine     :macro:er_macro_transformer:

First let us code this thing:

Loop version:

    (define niter 0)
    (define (cube x) (* x x x))
    (define (p x)
      (set! niter (+ niter 1))
      (- (* 3 x) (* 4 (cube x))))
    (define (sine angle)
      (if (not (> (abs angle) 0.1))
          angle
          (p (sine (/ angle 3.0)))))
    (display "sine=" )
    (display (sine 12.15))
    (display " niter=")
    (display niter)

    sine=-0.39980345741334 niter=5

Let's have the macro system expand this for us.

    (define (cube x)
      (* x x x))
    (define (p x)
      (- (* 3  x)
         (* 4 (cube x))))
    (define-syntax sine
      (er-macro-transformer
       (lambda (form rename compare?)
         (let ((a (cadr form)))
           (if (< (abs a) 0.1)
    	   a
    	   `(p (sine ,(/ a 3))))))))
    (show #t " " (pretty (macroexpand '(sine 12.15))))

    (p (p (p (p (p 0.05)))))

Theoretically, we can expand everything at once. 

    (define-syntax cube
      (er-macro-transformer
       (lambda (form rename compare?)
         (let ((x (cadr form)))
           `(* ,x ,x ,x)))))
    (define-syntax p
      (er-macro-transformer
       (lambda (form rename compare?)
         (let ((x (cadr form)))
           `(- (* 3 ,x)
    	   (* 4 (cube ,x)))))))
    (define-syntax sine
      (er-macro-transformer
       (lambda (form rename compare?)
         (let ((a (cadr form)))
           (if (< (abs a) 0.1)
    	   a
    	   `(p (sine ,(/ a 3))))))))
    (show #t " " (pretty (macroexpand '(sine 12.15))))

    (-
     (* 3
        (-
         (* 3
            (-
             (* 3
                (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                   (* 4
                      (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                         (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                         (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
             (* 4
                (*
                 (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                    (* 4
                       (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                 (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                    (* 4
                       (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                 (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                    (* 4
                       (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))))))
         (* 4
            (*
             (-
              (* 3
                 (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                    (* 4
                       (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
              (* 4
                 (*
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))))
             (-
              (* 3
                 (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                    (* 4
                       (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
              (* 4
                 (*
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))))
             (-
              (* 3
                 (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                    (* 4
                       (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
              (* 4
                 (*
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))))))))
     (* 4
        (*
         (-
          (* 3
             (-
              (* 3
                 (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                    (* 4
                       (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
              (* 4
                 (*
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))))))
          (* 4
             (*
              (-
               (* 3
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
               (* 4
                  (*
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))))
              (-
               (* 3
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
               (* 4
                  (*
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))))
              (-
               (* 3
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
               (* 4
                  (*
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))))))))
         (-
          (* 3
             (-
              (* 3
                 (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                    (* 4
                       (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
              (* 4
                 (*
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))))))
          (* 4
             (*
              (-
               (* 3
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
               (* 4
                  (*
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))))
              (-
               (* 3
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
               (* 4
                  (*
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))))
              (-
               (* 3
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
               (* 4
                  (*
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))))))))
         (-
          (* 3
             (-
              (* 3
                 (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                    (* 4
                       (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                          (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
              (* 4
                 (*
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))))))
          (* 4
             (*
              (-
               (* 3
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
               (* 4
                  (*
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))))
              (-
               (* 3
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
               (* 4
                  (*
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))))
              (-
               (* 3
                  (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                     (* 4
                        (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                           (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))
               (* 4
                  (*
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))))
                   (- (* 3 (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05))))
                      (* 4
                         (* (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))
                            (- (* 3 0.05) (* 4 (* 0.05 0.05 0.05)))))))))))))))

As seen from the code above, the amount of steps is 5. It is easily
seen from the fact that the application of `p` starts when **x** is
sufficiently small, and that requires <img src="ltximg/index_c7c48f4ad5a6c27066e010487d400eadfe70a1b6.png" alt="index_c7c48f4ad5a6c27066e010487d400eadfe70a1b6.png" /> steps.

`(sine x)` is expandable in constant space and time, `(cube x)` is
expandable in constant space and time if multiplication is an
elementary operation. Therefore the only operation left is
`p`. Therefore, time and space are of equal order of magnitude.

-   <img src="ltximg/index_7b711c28668b78883c1b5fdf65d4556f229aad86.png" alt="index_7b711c28668b78883c1b5fdf65d4556f229aad86.png" />
-   <img src="ltximg/index_b7dedfa75860abc8566436e17552032f3520dab1.png" alt="index_b7dedfa75860abc8566436e17552032f3520dab1.png" /> where <img src="ltximg/index_c6a7c4ebc65644f4ae8b43525489d6fabab57d36.png" alt="index_c6a7c4ebc65644f4ae8b43525489d6fabab57d36.png" /> is the angle and <img src="ltximg/index_604296e727077712cdce273b2fa6448440155a87.png" alt="index_604296e727077712cdce273b2fa6448440155a87.png" /> is precision


<a id="orge7c9959"></a>

### DONE Exercise 1.16 Iterative exponentiation

For the start, let's input the code.

    (define (expt b n)
      (if (= n 0)
          1
          (* b (expt b (- n 1)))))

    #<undef>

    (define (expt b n)
      (expt-iter b n 1))
    (define (expt-iter b counter product)
      (if (= counter 0)
          product
          (expt-iter b
    		 (- counter 1)
    		 (* b counter product))))

    #<undef>

    (define (fast-expt b n)
      (cond ((= n 0) 1)
    	((even? n) (square (fast-expt b (/ n 2))))
    	(else (* b (fast-expt b (- n 1))))))
    (define (even? n)
      (= (remainder n 2) 0))
    (fast-expt 2 10)

    1024

    (define (fast-expt b n a)
      (cond ((= n 0) a)
    	((even? n)  (fast-expt (square b) (/ n 2) a))
    	(else (fast-expt b (- n 1) (* a b)))))
    (define (even? n)
      (= (remainder n 2) 0))
    (define (faster-expt b n)
      (fast-expt b n 1))
    (faster-expt 2 10)

    1024

The answer is the code block above. We just collect some data and put
it into the state variable **a**.


<a id="org31145bf"></a>

### DONE Exercise 1.17 Fast multiplication

    (define (double a)
      (* 2 a))
    (define (halve a)
      (if (even? a)
          (/ a 2)
          (raise "Error: a not even.")))
    (define (even? n)
          (= (remainder n 2) 0))
    (define (* a b)
      (cond 
       ((= b 0) 0)
       ((even? b) (double (* a (halve b))))
       (else (+ a (* a (- b 1))))))
    (* 137 17)

    2329

The procedure above uses logarithmic time and space, because for every
subtraction there is also at least one division, so the total
convergence speed is exponential. This could be reformulated as an
iterative procedure, with an accumulator variable, but I am too lazy.


<a id="org8f5c667"></a>

### DONE Exercise 1.18 Iterative multiplication

In Exercise 1.17 I said that I was too lazy to design an iterative
procedure. Well, now I do it in this exercise.

    (define (double a)
      (* 2 a))
    (define (halve a)
      (if (even? a)
          (/ a 2)
          (raise "Error: a not even.")))
    (define (even? n)
          (= (remainder n 2) 0))
    (define (mul a b accumulator)
      (cond 
       ((= b 0) accumulator)
       ((even? b) (mul (double a) (halve b)))
       (else (mul a (- b 1) (+ a accumulator)))))
    (* 137 17)

    2329

The idea here is exactly the same as in the previous Exercise 1.18.


<a id="org6f000bb"></a>

### DONE Exercise 1.19 Logarithmic Fibonacci

As usualy, let's first copy the code of `fib-iter`.

    (define (fib n)
      (fib-iter 1 0 n))
    (define (fib-iter a b count)
      (if (= count 0)
          b
          (fib-iter (+ a b) a (- count 1))))
    (fib 10)

    55

The formula for <img src="ltximg/index_3e6820c2014d80de6b868ff35e57888d7459ec74.png" alt="index_3e6820c2014d80de6b868ff35e57888d7459ec74.png" /> is the following:


<div class="figure">
<p><img src="ltximg/index_9a106f9ba3309473a9fd1b115746bd85dada30f5.png" alt="index_9a106f9ba3309473a9fd1b115746bd85dada30f5.png" /></p>
</div>

From here we can easily see the values for <img src="ltximg/index_8aa420ca728e649bce323ae97db45712536a1765.png" alt="index_8aa420ca728e649bce323ae97db45712536a1765.png" /> and <img src="ltximg/index_6b97f2e7f6bb00c3230c2ded5db0354317483d0d.png" alt="index_6b97f2e7f6bb00c3230c2ded5db0354317483d0d.png" />:

<img src="ltximg/index_f05fc37f4c0522b22437da1143e7c44b2a09a199.png" alt="index_f05fc37f4c0522b22437da1143e7c44b2a09a199.png" />, <img src="ltximg/index_d7f54263f5fa51cb7ca8df4fa2c597d6142f904b.png" alt="index_d7f54263f5fa51cb7ca8df4fa2c597d6142f904b.png" />

Let us substitute them into the code given by Abelson and Sussman.

    (define (fib n)
      (fib-iter 1 0 0 1 n))
    (define (fib-iter a b p q count)
      (cond ((= count 0) b)
    	((even? count)
    	 (fib-iter a
    		   b
    		   (+ (* p p) (* q q))
    		   (+ (* 2 p q) (* q q))
    		   (/ count 2)))
    	(else (fib-iter (+ (* b q) (* a q) (* a p))
    			(+ (* b p) (* a q))
    			p
    			q
    			(- count 1)))))
    (fib 10)

    55

Works.


<a id="orge05aa23"></a>

### **Interjection** ir-macro-transformer.

    (define-syntax swap!
      (ir-macro-transformer
       (lambda (form inject compare?)
         (let ((a (cadr form))
    	   (b (caddr form))
    	   (tmp (cadr form)))
    	   (set! a b)
    	   (set! b tmp)))))
    (define x 4)
    (define y 5)
    (swap! x y)
    (list x y)


<a id="org65f37d7"></a>

### DONE Exercise 1.20 GCD applicative vs normal     :er_macro_transformer:macro:

The exercise urges us to recall the difference between the normal
order and the applicative order of evaluation.

 **Normal**: fully expand the computation tree until obtained an
expression involving only primitive operators.

**Applicative**: evaluate the arguments and then apply.

First let us print the execution tree of the normal order.

    (define-syntax gcd-normal
      (er-macro-transformer
       (lambda (form rename compare?)
         (let ((a (cadr form))
    	   (b (caddr form)))
           (if (= b 0)
    	    `(if (= ,b 0)
    		 ,a
    		 (remainder ,a ,b))
    	    `(if (= ,b 0)
    		 (,a (remainder ,a ,b))
    		 (gcd-normal ,b ,(remainder a b))))))))
      (display (show #f " " (pretty (macroexpand '(gcd-normal 206 40)))))

    (if (= 40 0)
        (206 (remainder 206 40))
        (if (= 6 0)
            (40 (remainder 40 6))
            (if (= 4 0)
                (6 (remainder 6 4))
                (if (= 2 0) (4 (remainder 4 2)) (if (= 0 0) 2 (remainder 2 0))))))

Now let us show the applicative order.

    (define-syntax gcd-normal
      (er-macro-transformer
       (lambda (form rename compare?)
         (let ((a (cadr form))
    	   (b (caddr form)))
           (if (= b 0)
    	    `(if (= ,b 0)
    		 ,a
    		 'division-by-zero)
    	    `(if (= ,b 0)
    		 (,a (remainder ,a ,b))
    		 (gcd-normal ,b ,(remainder a b))))))))
      (display (show #f " " (pretty (macroexpand '(gcd-normal 206 40)))))

    (if (= 40 0)
        (206 (remainder 206 40))
        (if
         (= 6 0)
         (40 (remainder 40 6))
         (if (= 4 0)
             (6 (remainder 6 4))
             (if (= 2 0) (4 (remainder 4 2)) (if (= 0 0) 2 'division-by-zero)))))

The problem here would arise, if the `(if)` form had a normal
evaluation order, because the last division, `(remainder 2 0)` may be
a forbidden operation, involving a division by zero. On the other
hand, the evaluation of `(remainder x 0)` could be defined as **x**, and
then the algorithm would evaluate one more (useless) remainder.


<a id="org1ec4364"></a>

### DONE Exercise 1.21 smallest-divisor

As usual, let us first copy the code for the `smallest-divisor`.

    (define (smallest-divisor n)
      (find-divisor n 2))
    (define (find-divisor n test-divisor)
      (cond ((> (square test-divisor) n) n)
    	((divides? test-divisor n) test-divisor)
    	(else (find-divisor n (+ test-divisor 1)))))
    (define (divides? a b) (= (remainder b a) 0))
    
    (define (prime? n)
      (= n (smallest-divisor n)))

    (define (smallest-divisor n)
      (find-divisor n 2))
    (define (find-divisor n test-divisor)
      (cond ((> (square test-divisor) n) n)
    	((divides? test-divisor n) test-divisor)
    	(else (find-divisor n (+ test-divisor 1)))))
    (define (divides? a b) (= (remainder b a) 0))
    
    (define (prime? n)
      (= n (smallest-divisor n)))
    (display (smallest-divisor 199))
    (newline)
    (display (smallest-divisor 1999))
    (newline)
    (display (smallest-divisor 19999))
    (newline)
    (display (/ 19999 7))
    (newline)

    199
    1999
    7
    2857

Well, this problem doesn't look too complicated on the first glance.


<a id="org04404cf"></a>

### DONE Exercise 1.22 timed-prime-test

    (define (runtime) (* 1000 (current-second)))
    
    (define (timed-prime-test n)
      (newline)
      (display n)
      (start-prime-test n (runtime)))
    
    (define (start-prime-test n start-time)
      (if (prime? n)
          (report-prime (- (runtime) start-time))))
    
    (define (report-prime elapsed-time)
      (display " *** ")
      (display elapsed-time))
    (define (search-for-primes start finish)
      (timed-prime-test start)
      (if (< (+ 1 start) finish)
          (if (even? start)
    	  (search-for-primes (+ start 1) finish)
    	  (search-for-primes (+ start 2) finish))))

    (define (smallest-divisor n)
      (find-divisor n 2))
    (define (find-divisor n test-divisor)
      (cond ((> (square test-divisor) n) n)
    	((divides? test-divisor n) test-divisor)
    	(else (find-divisor n (+ test-divisor 1)))))
    (define (divides? a b) (= (remainder b a) 0))
    
    (define (prime? n)
      (= n (smallest-divisor n)))
    (define (runtime) (* 1000 (current-second)))
    
    (define (timed-prime-test n)
      (newline)
      (display n)
      (start-prime-test n (runtime)))
    
    (define (start-prime-test n start-time)
      (if (prime? n)
          (report-prime (- (runtime) start-time))))
    
    (define (report-prime elapsed-time)
      (display " *** ")
      (display elapsed-time))
    (define (search-for-primes start finish)
      (timed-prime-test start)
      (if (< (+ 1 start) finish)
          (if (even? start)
    	  (search-for-primes (+ start 1) finish)
    	  (search-for-primes (+ start 2) finish))))
    (search-for-primes 1000 1020)
    (newline)
    (search-for-primes 10000 10038)
    (newline)
    (search-for-primes 100000 100044)
    (newline)
    (search-for-primes 1000000 1000038)

    
    1000
    1001
    1003
    1005
    1007
    1009 *** 0.007080078125
    1011
    1013 *** 0.007080078125
    1015
    1017
    1019 *** 0.006103515625
    
    10000
    10001
    10003
    10005
    10007 *** 0.01904296875
    10009 *** 0.01806640625
    10011
    10013
    10015
    10017
    10019
    10021
    10023
    10025
    10027
    10029
    10031
    10033
    10035
    10037 *** 0.01904296875
    
    100000
    100001
    100003 *** 0.05615234375
    100005
    100007
    100009
    100011
    100013
    100015
    100017
    100019 *** 0.06689453125
    100021
    100023
    100025
    100027
    100029
    100031
    100033
    100035
    100037
    100039
    100041
    100043 *** 0.05712890625
    
    1000000
    1000001
    1000003 *** 0.202392578125
    1000005
    1000007
    1000009
    1000011
    1000013
    1000015
    1000017
    1000019
    1000021
    1000023
    1000025
    1000027
    1000029
    1000031
    1000033 *** 0.18505859375
    1000035
    1000037 *** 0.222900390625

-   Write the procedure: done.
-   Find the smallest three primes greater than 1000   : found.
-   Find the smallest three primes greater than 10000  : found.
-   Find the smallest three primes greater than 100000 : found.
-   Find the smallest three primes greater than 1000000: found.
-   The timing data confirms the prediction. <img src="ltximg/index_43aa51bd2e42d1f2908e2ccf198ebbb774248407.png" alt="index_43aa51bd2e42d1f2908e2ccf198ebbb774248407.png" />, <img src="ltximg/index_f126af073ccc838dc9e0a3fe0cdf45180c71f7ce.png" alt="index_f126af073ccc838dc9e0a3fe0cdf45180c71f7ce.png" />.
-   The execution time per step for testing 1.000.000 is 1.63e-07. The
    execution time per step for testing 100.000 5.3199e-07. At least on
    my machine the claim doesn't seem to hold very well.


<a id="org1e2eebb"></a>

### DONE Exercise 1.23 (next test-divisor)

    (define (next x)
      (if (= 2 x)
          3
          (+ x 2)))
    (define (smallest-divisor n)
      (find-divisor n 2))
    (define (find-divisor n test-divisor)
      (cond ((> (square test-divisor) n) n)
    	((divides? test-divisor n) test-divisor)
    	(else (find-divisor n (next test-divisor)))))
    (define (divides? a b) (= (remainder b a) 0))
    
    (define (prime? n)
      (= n (smallest-divisor n)))

    #<undef>

    (define (next x)
      (if (= 2 x)
          3
          (+ x 2)))
    (define (smallest-divisor n)
      (find-divisor n 2))
    (define (find-divisor n test-divisor)
      (cond ((> (square test-divisor) n) n)
    	((divides? test-divisor n) test-divisor)
    	(else (find-divisor n (next test-divisor)))))
    (define (divides? a b) (= (remainder b a) 0))
    
    (define (prime? n)
      (= n (smallest-divisor n)))
    
    (define (runtime) (* 1000 (current-second)))
    
    (define (timed-prime-test n)
      (newline)
      (display n)
      (start-prime-test n (runtime)))
    
    (define (start-prime-test n start-time)
      (if (prime? n)
          (report-prime (- (runtime) start-time))))
    
    (define (report-prime elapsed-time)
      (display " *** ")
      (display elapsed-time))
    (define (search-for-primes start finish)
      (timed-prime-test start)
      (if (< (+ 1 start) finish)
          (if (even? start)
    	  (search-for-primes (+ start 1) finish)
    	  (search-for-primes (+ start 2) finish))))
    (timed-prime-test 1009)
    (timed-prime-test 1013)
    (timed-prime-test 1019)
    (timed-prime-test 10007)
    (timed-prime-test 10009)
    (timed-prime-test 10037)
    (timed-prime-test 100003)
    (timed-prime-test 100019)
    (timed-prime-test 100043)
    (timed-prime-test 1000003)
    (timed-prime-test 1000033)
    (timed-prime-test 1000037)

    
    1009 *** 0.011962890625
    1013 *** 0.005859375
    1019 *** 0.0048828125
    10007 *** 0.014892578125
    10009 *** 0.010009765625
    10037 *** 0.06982421875
    100003 *** 0.123046875
    100019 *** 0.123046875
    100043 *** 0.123046875
    1000003 *** 0.236083984375
    1000033 *** 0.14501953125
    1000037 *** 0.14599609375

We can see that the test does show a speed improvement, although not
as impressive as 2 times. We can observe that the number of steps is
not really halved, since `(+ a b)` requires one operation, and `(if (=
2 x) 3 else (+ 3 2))` requires three operations, so the speed should
improve by 3/2, which we can observe.


<a id="org09b2134"></a>

### DONE Exercise 1.24 Fermat method

Firstly we need the `(fast-prime?)` procedure.

    (define (random x)
      (random-integer x))

    #<undef>

    (define (expmod base exp m)
      (cond ((= exp 0) 1)
    	((even? exp)
    	 (remainder
    	  (square (expmod base (/ exp 2) m))
    	  m))
    	(else
    	 (remainder
    	  (* base (expmod base (- exp 1) m))
    	  m))))

    #<undef>

    (define (random x)
      (random-integer x))
      (define (fermat-test n)
        (define (try-it a)
          (= (expmod a n n) a))
        (try-it (+ 1 (random (- n 1)))))
      (define prime-test fermat-test)

    #<undef>

    (define (fast-prime? n times)
      (cond ((= times 0) true)
    	((prime-test n) (fast-prime? n (- times 1)))
    	(else false)))
    (define true #t)
    (define false #f)
    (define (prime? x)
      (fast-prime? x 10))

    #<undef>

    (define (expmod base exp m)
      (cond ((= exp 0) 1)
    	((even? exp)
    	 (remainder
    	  (square (expmod base (/ exp 2) m))
    	  m))
    	(else
    	 (remainder
    	  (* base (expmod base (- exp 1) m))
    	  m))))
    (define (random x)
      (random-integer x))
      (define (fermat-test n)
        (define (try-it a)
          (= (expmod a n n) a))
        (try-it (+ 1 (random (- n 1)))))
      (define prime-test fermat-test)
    (define (fast-prime? n times)
      (cond ((= times 0) true)
    	((prime-test n) (fast-prime? n (- times 1)))
    	(else false)))
    (define true #t)
    (define false #f)
    (define (prime? x)
      (fast-prime? x 10))
    (define (runtime) (* 1000 (current-second)))
    
    (define (timed-prime-test n)
      (newline)
      (display n)
      (start-prime-test n (runtime)))
    
    (define (start-prime-test n start-time)
      (if (prime? n)
          (report-prime (- (runtime) start-time))))
    
    (define (report-prime elapsed-time)
      (display " *** ")
      (display elapsed-time))
    (define (search-for-primes start finish)
      (timed-prime-test start)
      (if (< (+ 1 start) finish)
          (if (even? start)
    	  (search-for-primes (+ start 1) finish)
    	  (search-for-primes (+ start 2) finish))))
    (timed-prime-test 1009)
    (timed-prime-test 1013)
    (timed-prime-test 1019)
    (timed-prime-test 10007)
    (timed-prime-test 10009)
    (timed-prime-test 10037)
    (timed-prime-test 100003)
    (timed-prime-test 100019)
    (timed-prime-test 100043)
    (timed-prime-test 1000003)
    (timed-prime-test 1000033)
    (timed-prime-test 1000037)
    (timed-prime-test 1000)
    (timed-prime-test 6601)

    
    1009 *** 0.05615234375
    1013 *** 0.045654296875
    1019 *** 0.0478515625
    10007 *** 0.057861328125
    10009 *** 0.055908203125
    10037 *** 0.05712890625
    100003 *** 0.066162109375
    100019 *** 0.068115234375
    100043 *** 0.06787109375
    1000003 *** 0.07568359375
    1000033 *** 0.075927734375
    1000037 *** 0.077880859375
    1000
    6601 *** 0.052734375

Firstly, observe that the interpreter seems to be doing some black magic, so
that the test for 1009 takes more time than the test for 1013.

Secondly, observe that indeed, the speed seems to have reduced its dependence
on the length of a number, and if we want to test even bigger numbers, the
dependency should become even smaller, as <img src="ltximg/index_e9540a0edc1260cec9d61caa1f9198bd3e4e8e80.png" alt="index_e9540a0edc1260cec9d61caa1f9198bd3e4e8e80.png" /> grows very slowly. In
particular, comparing the range around 1000 and 1000.000, the ratio of
<img src="ltximg/index_0e26ee17db715ccb65f2080170061e2177206484.png" alt="index_0e26ee17db715ccb65f2080170061e2177206484.png" />. This doesn't seem
to be completely the case, but hey, there may be some constants involved, as
well as some interpreter dark magic.


<a id="org59f0b0b"></a>

### DONE Exercise 1.25 expmod

Well, in principle, Alyssa's algorithm should work. The problem here really
is that we would have to store the number <img src="ltximg/index_0a76ac4945391db84381646682b020f168e1fb7e.png" alt="index_0a76ac4945391db84381646682b020f168e1fb7e.png" />, which is a very big number,
especially because we are interested in testing primality of very large
numbers (e.g., 512-bit long cryptography keys), and <img src="ltximg/index_9739484b3fa9a2038ca18864e5ab37f0ab568934.png" alt="index_9739484b3fa9a2038ca18864e5ab37f0ab568934.png" />
is a very large number.


<a id="orgaaf2d91"></a>

### DONE Exercise 1.26 square vs mul

The hint here lies in the name of the person helping Louis. Eva Lu Ator
sounds similar to "evaluator", and the reason for Louis's problem really lies
in the optimization capabilities of the interpreter. That is, if the
evaluating algorithm uses applicative order, then the `expmod` is evaluated
twice per step, which makes `(/ exp 2)` useless. If, however, the interpreter
can memoize the results, his algorithm would be just as good.


<a id="org13a6aca"></a>

### DONE Exercise 1.27 Carmichael numbers

First let us recall some Carmichael numbers.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-right" />

<col  class="org-right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-right">#</th>
<th scope="col" class="org-right">&#xa0;</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-right">1</td>
<td class="org-right">561</td>
</tr>


<tr>
<td class="org-right">2</td>
<td class="org-right">1105</td>
</tr>


<tr>
<td class="org-right">3</td>
<td class="org-right">1729</td>
</tr>


<tr>
<td class="org-right">4</td>
<td class="org-right">2465</td>
</tr>


<tr>
<td class="org-right">5</td>
<td class="org-right">2821</td>
</tr>


<tr>
<td class="org-right">6</td>
<td class="org-right">6601</td>
</tr>
</tbody>
</table>

We already have a procedure that computes <img src="ltximg/index_4076593056acd69b776973e6b64c22b41ec50921.png" alt="index_4076593056acd69b776973e6b64c22b41ec50921.png" />, and a procedure that
computes <img src="ltximg/index_9eec5ed53b7fb7b6ffe31eaee5953afeb8ac1570.png" alt="index_9eec5ed53b7fb7b6ffe31eaee5953afeb8ac1570.png" /> is even a scheme primitive. Moreover, we even have all
the code that does the comparison, with the single difference - our existing
code takes an initial guess uniformly at random, whereas we need to check all
<img src="ltximg/index_d64f0539974f06a5ba6e8eae83b804ed1dac2796.png" alt="index_d64f0539974f06a5ba6e8eae83b804ed1dac2796.png" />.

    (define (expmod base exp m)
      (cond ((= exp 0) 1)
    	((even? exp)
    	 (remainder
    	  (square (expmod base (/ exp 2) m))
    	  m))
    	(else
    	 (remainder
    	  (* base (expmod base (- exp 1) m))
    	  m))))
      (define (congruent? a n)
        (= (expmod a n n) a))
      (define (carmichael-iter a n)
        (cond ((= a n) #t)
    	  ((not (congruent? a n)) #f)
    	  (else (carmichael-iter (+ 1 a) n))))
      (define (carmichael-or-prime? n)
        (carmichael-iter 1 n))
      (define (test-carmichael n)
        (display "Testing ")
        (display n)
        (display ": ")
        (if (carmichael-or-prime? n)
          (display "true")
          (display "false"))
        (newline))
      (test-carmichael 561)
      (test-carmichael 1105)
      (test-carmichael 1729)
      (test-carmichael 2465)
      (test-carmichael 2821)
      (test-carmichael 6601)
      (test-carmichael 20)
      (test-carmichael 7)

    Testing 561: true
    Testing 1105: true
    Testing 1729: true
    Testing 2465: true
    Testing 2821: true
    Testing 6601: true
    Testing 20: false
    Testing 7: true


<a id="org9c909d0"></a>

### DONE Exercise 1.28 Miller-Rabin

    (define (expmod base exp m)
      (cond ((= exp 0) 1)
    	((even? exp)
    	 (let* ((root (expmod base (/ exp 2) m))
    		(sq (square root)))
    	   (if (and (= (remainder sq m) 1) (not (or (= root 1) (= root (- m 1)))))
    	    0
    	    (remainder sq m))))
    	(else
    	 (remainder
    	  (* base (expmod base (- exp 1) m))
    	  m))))

    #<undef>

    (define (random x)
      (random-integer x))
      (define (rabin-test n)
        (define (try-it a)
          (let ((result (expmod a (- n 1) n) ))
    	(if (or (= 1 result)  (= n 1) (= n 0))
    	#t
    	#f)))
        (if (not (= n 1)) (try-it (+ 1 (random (- n 1)))) #t))
      (define prime-test rabin-test)

    #<undef>

    (define (expmod base exp m)
      (cond ((= exp 0) 1)
    	((even? exp)
    	 (let* ((root (expmod base (/ exp 2) m))
    		(sq (square root)))
    	   (if (and (= (remainder sq m) 1) (not (or (= root 1) (= root (- m 1)))))
    	    0
    	    (remainder sq m))))
    	(else
    	 (remainder
    	  (* base (expmod base (- exp 1) m))
    	  m))))
    (define (random x)
      (random-integer x))
      (define (rabin-test n)
        (define (try-it a)
          (let ((result (expmod a (- n 1) n) ))
    	(if (or (= 1 result)  (= n 1) (= n 0))
    	#t
    	#f)))
        (if (not (= n 1)) (try-it (+ 1 (random (- n 1)))) #t))
      (define prime-test rabin-test)
    
    (define (fast-prime? n times)
      (cond ((= times 0) true)
    	((prime-test n) (fast-prime? n (- times 1)))
    	(else false)))
    (define true #t)
    (define false #f)
    (define (prime? x)
      (fast-prime? x 10))
    (define (runtime) (* 1000 (current-second)))
    
    (define (timed-prime-test n)
      (newline)
      (display n)
      (start-prime-test n (runtime)))
    
    (define (start-prime-test n start-time)
      (if (prime? n)
          (report-prime (- (runtime) start-time))))
    
    (define (report-prime elapsed-time)
      (display " *** ")
      (display elapsed-time))
    (define (search-for-primes start finish)
      (timed-prime-test start)
      (if (< (+ 1 start) finish)
          (if (even? start)
    	  (search-for-primes (+ start 1) finish)
    	  (search-for-primes (+ start 2) finish))))

    (define (expmod base exp m)
      (cond ((= exp 0) 1)
    	((even? exp)
    	 (let* ((root (expmod base (/ exp 2) m))
    		(sq (square root)))
    	   (if (and (= (remainder sq m) 1) (not (or (= root 1) (= root (- m 1)))))
    	    0
    	    (remainder sq m))))
    	(else
    	 (remainder
    	  (* base (expmod base (- exp 1) m))
    	  m))))
    (define (random x)
      (random-integer x))
      (define (rabin-test n)
        (define (try-it a)
          (let ((result (expmod a (- n 1) n) ))
    	(if (or (= 1 result)  (= n 1) (= n 0))
    	#t
    	#f)))
        (if (not (= n 1)) (try-it (+ 1 (random (- n 1)))) #t))
      (define prime-test rabin-test)
    
    (define (fast-prime? n times)
      (cond ((= times 0) true)
    	((prime-test n) (fast-prime? n (- times 1)))
    	(else false)))
    (define true #t)
    (define false #f)
    (define (prime? x)
      (fast-prime? x 10))
    (define (runtime) (* 1000 (current-second)))
    
    (define (timed-prime-test n)
      (newline)
      (display n)
      (start-prime-test n (runtime)))
    
    (define (start-prime-test n start-time)
      (if (prime? n)
          (report-prime (- (runtime) start-time))))
    
    (define (report-prime elapsed-time)
      (display " *** ")
      (display elapsed-time))
    (define (search-for-primes start finish)
      (timed-prime-test start)
      (if (< (+ 1 start) finish)
          (if (even? start)
    	  (search-for-primes (+ start 1) finish)
    	  (search-for-primes (+ start 2) finish))))
    (timed-prime-test 1009)
    (timed-prime-test 1013)
    (timed-prime-test 1019)
    (timed-prime-test 10007)
    (timed-prime-test 10009)
    (timed-prime-test 10037)
    (timed-prime-test 100003)
    (timed-prime-test 100019)
    (timed-prime-test 100043)
    (timed-prime-test 1000003)
    (timed-prime-test 1000033)
    (timed-prime-test 1000037)
    (timed-prime-test 1000)
    (timed-prime-test 6601)

    
    1009 *** 0.107177734375
    1013 *** 0.09716796875
    1019 *** 0.09716796875
    10007 *** 0.124755859375
    10009 *** 0.123046875
    10037 *** 0.123779296875
    100003 *** 0.14306640625
    100019 *** 0.153076171875
    100043 *** 0.137939453125
    1000003 *** 0.15576171875
    1000033 *** 0.159912109375
    1000037 *** 0.1611328125
    1000
    6601

I used the `(let)` construction introduced in the later chapters, because I
find bindings with nested procedures confusing.


<a id="orgdb26018"></a>

### DONE Exercise 1.29 Simpson's integral

Since at the end of the task we are told to compare the result of our
algorithm with the results of the `integral` procedure, let us first copy the
integral code.

    (define (sum term a next b)
      (if (> a b)
          0
          (+ (term a)
    	 (sum term (next a) next b))))
    (define (cube x)
      (* x x x))
    (define (next point)
      (+ point 1))

    #<undef>

    (define (sum term a next b)
      (if (> a b)
          0
          (+ (term a)
    	 (sum term (next a) next b))))
    (define (cube x)
      (* x x x))
    (define (next point)
      (+ point 1))
      (define (integral f a b dx)
        (define (add-dx x)
          (+ x dx))
        (* (sum f (+ a (/ dx 2.0)) add-dx b)
           dx))
      (list (integral cube 0 1 0.01) (integral cube 0 1 0.001))

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-right" />

<col  class="org-right" />
</colgroup>
<tbody>
<tr>
<td class="org-right">0.24998750000000053</td>
<td class="org-right">0.24999987500000106</td>
</tr>
</tbody>
</table>

    (define (sum term a next b)
      (if (> a b)
          0
          (+ (term a)
    	 (sum term (next a) next b))))
    (define (cube x)
      (* x x x))
    (define (next point)
      (+ point 1))
    (define (integral-simpson f a b npoints)
      (define h (/ (- b a) npoints))
      (define h/3 (/ h 3))
      (define (f_k k)
        (* (f (+ a (* k h))) (cond ((= k 0) 1)
    			       ((= k npoints) 1)
    			       ((odd? k) 4)
    			       ((even? k) 2))))
      (* h/3 (sum f_k 0 next npoints)))
    (display (integral-simpson cube 0 1 100))
    (newline)
    (display (integral-simpson cube 0 1 1000))

    1/4
    1/4

An impressive result. I don't know at which point of the computation the
interpreter switches to an exact representation, but meh, this result is good.


<a id="org38461cc"></a>

### DONE Exercise 1.30 Iterative sum

    (define (inc x) (+ x 1))
    (define (identity x) x)
    (define (sum term a next b)
      (define (iter a result)
        (if (= a b)
    	(+ a result)
    	(iter (next a) (+ a result))))
      (iter a 0))
    
    (sum identity 1 inc 10)


<a id="org9fc60ca"></a>

### DONE Exercise 1.31 Product

1.  DONE a. Defining product

        (define (inc x) (+ x 1))
        (define (identity x) x)
        (define (product term a next b)
          (define (iter a result)
            (if (= a b)
        	(* (term a) result)
        	(iter (next a) (* (term a) result))))
          (iter a 1.0))
        (define (factorial x) (product identity 1 inc 6))
        (factorial 6)
        (define (pi precision)
          (define (enumerator index)
            (cond ((odd?  index) (+ index 1.0))
        	  ((even? index) (+ index 2.0))
        	  (else (error "Error"))))
          (define (denominator index)
            (cond ((odd?  index) (+ index 2.0))
        	  ((even? index) (+ index 1.0))
        	  (else (error "Error"))))
          (define (fraction index)
            (/ (enumerator index) (denominator index)))
          (* 4.0 (product fraction 1 inc precision)))
          (pi 1280)
    
        3.142818162579486
    
    I can say that it converges very-very slowly.

2.  DONE b. A recursive version

        (define (inc x) (+ x 1))
        (define (identity x) x)
        (define (product term a next b)
          (define (iter a result)
            (if (= a b)
        	(* (term a) result)
        	(* (iter (next a) (term a)) result)))
          (iter a 1.0))
        (define (factorial x) (product identity 1 inc 6))
        (factorial 6)
    
        720.0
    
    Doesn't make too much sense to me, but here you are.


<a id="org93a1be0"></a>

### DONE Exercise 1.32 Accumulator

I will cheat a little bit in this exercise, I will run `sum` as an iterative
procedure and `product` as a recursive procedure, so at the end I will have
two implementations, not 4, but that should not be too much of a digression.

    (define (inc x) (+ x 1))
    (define (identity x) x)

    #<undef>

1.  DONE Implement `sum` in terms of an iterative accumulator

        (define (inc x) (+ x 1))
        (define (identity x) x)
          (define (accumulate combiner null-value term a next b)
               (define (iter a result)
        	 (if (>= a b)
        	     (combiner (term a) result)
        	     (combiner (iter (next a) (term a)) result)))
               (iter a null-value))
          (define (sum term a next b)
            (accumulate + 0 term a next b))
          (sum identity 1 inc 10)
    
        55

2.  DONE Implement `product` in terms of a recursive process

        (define (inc x) (+ x 1))
        (define (identity x) x)
          (define (accumulate combiner null-value term a next b)
               (define (iter a result)
        	 (if (= a b)
        	     (combiner (term a) result)
        	      (iter (next a) (combiner (term a) result) )))
               (iter a null-value))
          (define (product term a next b)
            (accumulate * 1 term a next b))
          (product identity 1 inc 10)
    
        3628800


<a id="orgc4cc60f"></a>

### DONE Exercise 1.33 filtered-accumulate

1.  DONE a. Sum-of-squares-of-primes

        (define (inc x) (+ x 1))
        (define (identity x) x)
        (define (expmod base exp m)
          (cond ((= exp 0) 1)
        	((even? exp)
        	 (let* ((root (expmod base (/ exp 2) m))
        		(sq (square root)))
        	   (if (and (= (remainder sq m) 1) (not (or (= root 1) (= root (- m 1)))))
        	    0
        	    (remainder sq m))))
        	(else
        	 (remainder
        	  (* base (expmod base (- exp 1) m))
        	  m))))
        (define (random x)
          (random-integer x))
          (define (rabin-test n)
            (define (try-it a)
              (let ((result (expmod a (- n 1) n) ))
        	(if (or (= 1 result)  (= n 1) (= n 0))
        	#t
        	#f)))
            (if (not (= n 1)) (try-it (+ 1 (random (- n 1)))) #t))
          (define prime-test rabin-test)
        
        (define (fast-prime? n times)
          (cond ((= times 0) true)
        	((prime-test n) (fast-prime? n (- times 1)))
        	(else false)))
        (define true #t)
        (define false #f)
        (define (prime? x)
          (fast-prime? x 10))
        (define (runtime) (* 1000 (current-second)))
        
        (define (timed-prime-test n)
          (newline)
          (display n)
          (start-prime-test n (runtime)))
        
        (define (start-prime-test n start-time)
          (if (prime? n)
              (report-prime (- (runtime) start-time))))
        
        (define (report-prime elapsed-time)
          (display " *** ")
          (display elapsed-time))
        (define (search-for-primes start finish)
          (timed-prime-test start)
          (if (< (+ 1 start) finish)
              (if (even? start)
        	  (search-for-primes (+ start 1) finish)
        	  (search-for-primes (+ start 2) finish))))
          (define (filtered-accumulate combiner filter null-value term a next b)
           (define (iter a result)
             (if (= a b)
        	 (combiner (if (filter a) (term a) null-value) result)
        	 (iter (next a) (combiner (if (filter a) (term a) null-value) result))))
           (iter a null-value))
    
        #<undef>
    
        (define (inc x) (+ x 1))
        (define (identity x) x)
        (define (expmod base exp m)
          (cond ((= exp 0) 1)
        	((even? exp)
        	 (let* ((root (expmod base (/ exp 2) m))
        		(sq (square root)))
        	   (if (and (= (remainder sq m) 1) (not (or (= root 1) (= root (- m 1)))))
        	    0
        	    (remainder sq m))))
        	(else
        	 (remainder
        	  (* base (expmod base (- exp 1) m))
        	  m))))
        (define (random x)
          (random-integer x))
          (define (rabin-test n)
            (define (try-it a)
              (let ((result (expmod a (- n 1) n) ))
        	(if (or (= 1 result)  (= n 1) (= n 0))
        	#t
        	#f)))
            (if (not (= n 1)) (try-it (+ 1 (random (- n 1)))) #t))
          (define prime-test rabin-test)
        
        (define (fast-prime? n times)
          (cond ((= times 0) true)
        	((prime-test n) (fast-prime? n (- times 1)))
        	(else false)))
        (define true #t)
        (define false #f)
        (define (prime? x)
          (fast-prime? x 10))
        (define (runtime) (* 1000 (current-second)))
        
        (define (timed-prime-test n)
          (newline)
          (display n)
          (start-prime-test n (runtime)))
        
        (define (start-prime-test n start-time)
          (if (prime? n)
              (report-prime (- (runtime) start-time))))
        
        (define (report-prime elapsed-time)
          (display " *** ")
          (display elapsed-time))
        (define (search-for-primes start finish)
          (timed-prime-test start)
          (if (< (+ 1 start) finish)
              (if (even? start)
        	  (search-for-primes (+ start 1) finish)
        	  (search-for-primes (+ start 2) finish))))
          (define (filtered-accumulate combiner filter null-value term a next b)
           (define (iter a result)
             (if (= a b)
        	 (combiner (if (filter a) (term a) null-value) result)
        	 (iter (next a) (combiner (if (filter a) (term a) null-value) result))))
           (iter a null-value))
        (define (sum-square-prime a next b)
          (filtered-accumulate + prime? 0 square a next b))
        (sum-square-prime 1 inc 10)
    
        88

2.  DONE b. Product of positive integers mutually prime with n

        (define (inc x) (+ x 1))
        (define (identity x) x)
        (define (expmod base exp m)
          (cond ((= exp 0) 1)
        	((even? exp)
        	 (let* ((root (expmod base (/ exp 2) m))
        		(sq (square root)))
        	   (if (and (= (remainder sq m) 1) (not (or (= root 1) (= root (- m 1)))))
        	    0
        	    (remainder sq m))))
        	(else
        	 (remainder
        	  (* base (expmod base (- exp 1) m))
        	  m))))
        (define (random x)
          (random-integer x))
          (define (rabin-test n)
            (define (try-it a)
              (let ((result (expmod a (- n 1) n) ))
        	(if (or (= 1 result)  (= n 1) (= n 0))
        	#t
        	#f)))
            (if (not (= n 1)) (try-it (+ 1 (random (- n 1)))) #t))
          (define prime-test rabin-test)
        
        (define (fast-prime? n times)
          (cond ((= times 0) true)
        	((prime-test n) (fast-prime? n (- times 1)))
        	(else false)))
        (define true #t)
        (define false #f)
        (define (prime? x)
          (fast-prime? x 10))
        (define (runtime) (* 1000 (current-second)))
        
        (define (timed-prime-test n)
          (newline)
          (display n)
          (start-prime-test n (runtime)))
        
        (define (start-prime-test n start-time)
          (if (prime? n)
              (report-prime (- (runtime) start-time))))
        
        (define (report-prime elapsed-time)
          (display " *** ")
          (display elapsed-time))
        (define (search-for-primes start finish)
          (timed-prime-test start)
          (if (< (+ 1 start) finish)
              (if (even? start)
        	  (search-for-primes (+ start 1) finish)
        	  (search-for-primes (+ start 2) finish))))
          (define (filtered-accumulate combiner filter null-value term a next b)
           (define (iter a result)
             (if (= a b)
        	 (combiner (if (filter a) (term a) null-value) result)
        	 (iter (next a) (combiner (if (filter a) (term a) null-value) result))))
           (iter a null-value))
        (define (product-mutually-prime n)
          (define (filter-gcd x)
            (if (= (gcd n x) 1)
        	#t
        	#f))
          (filtered-accumulate * filter-gcd 1 identity 1 inc n))
        (display (product-mutually-prime 10))
    
        189
    
    Here I used the `gcd` function from the standard library.


<a id="org969faa3"></a>

### DONE Exercise 1.34 lambda

    (define (f g) (g 2))

    #<undef>

    (define (f g) (g 2))
    (define (square x) (* x x))
    (f square)

    4

    (define (f g) (g 2))
    (f (lambda (z) (* z (+ z 1))))

    6

    (define (f g) (g 2))
    (f f)

    "{Exception #19 user \"non procedure application\" (2) #<procedure #f> (\"/usr/lib64/chibi/init-7.scm\" . 230)}"

Well, no wonder. The final combination reduces to `(2 2)`, which **IS** a
non-procedure application.


<a id="org4803ac6"></a>

### DONE Exercise 1.35 fixed-point

<img src="ltximg/index_43b385c780d7045afe1e04b40b129288cbf854c4.png" alt="index_43b385c780d7045afe1e04b40b129288cbf854c4.png" />
<img src="ltximg/index_29ca1e8c9870b3595ac37cc6f03c0e93bc3834e3.png" alt="index_29ca1e8c9870b3595ac37cc6f03c0e93bc3834e3.png" />
Let's substitute:
<img src="ltximg/index_e56b14ed63e273538ddb1229539e4ad3f864a773.png" alt="index_e56b14ed63e273538ddb1229539e4ad3f864a773.png" />
<img src="ltximg/index_05078b2ef016e383e38c09fc360296d6131265a6.png" alt="index_05078b2ef016e383e38c09fc360296d6131265a6.png" />
<img src="ltximg/index_571f23a6ee48e5af9b9b8014dbe221dd5f5d35b6.png" alt="index_571f23a6ee48e5af9b9b8014dbe221dd5f5d35b6.png" />
<img src="ltximg/index_2217fd3965618457ab386ab40a6bc1bef321a8b4.png" alt="index_2217fd3965618457ab386ab40a6bc1bef321a8b4.png" />

    (define tolerance 0.00001)
    (define (fixed-point f first-guess)
      (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
           tolerance))
      (define (try guess)
        (let ((next (f guess)))
          (if (close-enough? guess next)
    	  next
    	  (try next))))
    (try first-guess))

    #<undef>

    (define tolerance 0.00001)
    (define (fixed-point f first-guess)
      (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
           tolerance))
      (define (try guess)
        (let ((next (f guess)))
          (if (close-enough? guess next)
    	  next
    	  (try next))))
    (try first-guess))
    (fixed-point cos 1.0)

    0.7390822985224024

    (define tolerance 0.00001)
    (define (fixed-point f first-guess)
      (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
           tolerance))
      (define (try guess)
        (let ((next (f guess)))
          (if (close-enough? guess next)
    	  next
    	  (try next))))
    (try first-guess))
    (define (golden-transform x)
      (+ 1 (/ 1 x)))
    (fixed-point golden-transform 1.0)

    1.6180327868852458

    (/ (+ 1 (sqrt 5)) 2)

    1.618033988749895

The difference is not too big.


<a id="orgafc9691"></a>

### DONE Exercise 1.36 fixed-point-with-dampening

    (define tolerance 0.00001)
    (define (fixed-point f first-guess)
      (define (close-enough? v1 v2)
        (display "Guesses: ")
        (display v1)
        (display " ")
        (display v2)
        (newline)
        (< (abs (- v1 v2))
           tolerance))
      (define (try guess)
        (let ((next (f guess)))
          (if (close-enough? guess next)
    	  next
    	  (try next))))
    (try first-guess))

    #<undef>

To find a solution to <img src="ltximg/index_6779837ce31ef66242d6fda98b082722031a6b0b.png" alt="index_6779837ce31ef66242d6fda98b082722031a6b0b.png" />, let us rearrange: <img src="ltximg/index_aafb4bfe7bcf6804913dd1d9e17048d9d7f8f820.png" alt="index_aafb4bfe7bcf6804913dd1d9e17048d9d7f8f820.png" />.

    (define (log1000/logx x)
      (/ (log 1000) (log x)))

    #<undef>

    (define tolerance 0.00001)
    (define (fixed-point f first-guess)
      (define (close-enough? v1 v2)
        (display "Guesses: ")
        (display v1)
        (display " ")
        (display v2)
        (newline)
        (< (abs (- v1 v2))
           tolerance))
      (define (try guess)
        (let ((next (f guess)))
          (if (close-enough? guess next)
    	  next
    	  (try next))))
    (try first-guess))
    (define (log1000/logx x)
      (/ (log 1000) (log x)))
    (display (fixed-point log1000/logx 5))

    Guesses: 5 4.29202967422018
    Guesses: 4.29202967422018 4.741863119908242
    Guesses: 4.741863119908242 4.438204569837609
    Guesses: 4.438204569837609 4.635299887107611
    Guesses: 4.635299887107611 4.50397811613643
    Guesses: 4.50397811613643 4.589989462723705
    Guesses: 4.589989462723705 4.53301150767844
    Guesses: 4.53301150767844 4.570475672855484
    Guesses: 4.570475672855484 4.545720389670642
    Guesses: 4.545720389670642 4.562024936588171
    Guesses: 4.562024936588171 4.551263234080531
    Guesses: 4.551263234080531 4.55835638768598
    Guesses: 4.55835638768598 4.553676852183342
    Guesses: 4.553676852183342 4.55676216434628
    Guesses: 4.55676216434628 4.554727130670954
    Guesses: 4.554727130670954 4.556069054770006
    Guesses: 4.556069054770006 4.555184018843625
    Guesses: 4.555184018843625 4.5557676565438205
    Guesses: 4.5557676565438205 4.555382746639082
    Guesses: 4.555382746639082 4.55563658243586
    Guesses: 4.55563658243586 4.555469180245326
    Guesses: 4.555469180245326 4.555579577901
    Guesses: 4.555579577901 4.5555067722873686
    Guesses: 4.5555067722873686 4.5555547860484085
    Guesses: 4.5555547860484085 4.555523121789556
    Guesses: 4.555523121789556 4.555544003742869
    Guesses: 4.555544003742869 4.555530232469306
    Guesses: 4.555530232469306 4.555539314360711
    4.555539314360711

    (define tolerance 0.00001)
    (define (fixed-point f first-guess)
      (define (close-enough? v1 v2)
        (display "Guesses: ")
        (display v1)
        (display " ")
        (display v2)
        (newline)
        (< (abs (- v1 v2))
           tolerance))
      (define (try guess)
        (let ((next (f guess)))
          (if (close-enough? guess next)
    	  next
    	  (try (/ (+ guess next) 2)))))
    (try first-guess))

    #<undef>

    (define tolerance 0.00001)
    (define (fixed-point f first-guess)
      (define (close-enough? v1 v2)
        (display "Guesses: ")
        (display v1)
        (display " ")
        (display v2)
        (newline)
        (< (abs (- v1 v2))
           tolerance))
      (define (try guess)
        (let ((next (f guess)))
          (if (close-enough? guess next)
    	  next
    	  (try (/ (+ guess next) 2)))))
    (try first-guess))
    (define (log1000/logx x)
      (/ (log 1000) (log x)))
    (display (fixed-point log1000/logx 5))

    Guesses: 5 4.29202967422018
    Guesses: 4.64601483711009 4.49720773504196
    Guesses: 4.571611286076025 4.544977348996107
    Guesses: 4.558294317536066 4.553717728226165
    Guesses: 4.556006022881116 4.555225576581478
    Guesses: 4.555615799731297 4.555482885419889
    Guesses: 4.555549342575593 4.555526711628406
    Guesses: 4.555538027102 4.555534173941779
    4.555534173941779

Well, the amount of steps is visibly smaller. Works.


<a id="org484c53a"></a>

### DONE Exercise 1.37 cont-frac

1.  DONE a. recursive

        (define (cont-frac n d k)
          (define (next step)
            (if (< step k)
        	(/ (n step) (+ (d step) (next (+ step 1))) )
        	0))
          (next 1))
    
        #<undef>
    
        (define (cont-frac n d k)
          (define (next step)
            (if (< step k)
        	(/ (n step) (+ (d step) (next (+ step 1))) )
        	0))
          (next 1))
            (/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 14))
    
        1.6180257510729614
    
    Abelson and Sussman tell us to estimate <img src="ltximg/index_6e95eef27caa8cb7c5e0eef0c0c9c7c5d31f3d0f.png" alt="index_6e95eef27caa8cb7c5e0eef0c0c9c7c5d31f3d0f.png" /> needed to approximate the <img src="ltximg/index_a1d7796230428a162cb96a7f2cfbe952aa2d30d3.png" alt="index_a1d7796230428a162cb96a7f2cfbe952aa2d30d3.png" /> to a required
    degree (0.0001). I didn't manage to derive the formula myself, however, I can
    give a link to the book where this proof is given:
    
    Khinchin, Continued Fractions (1935), chapter 2, section 7, gives an upper
    bound on the speed of convergence as <img src="ltximg/index_6137f259a52114a1ff0c102180e8f9538d4945e6.png" alt="index_6137f259a52114a1ff0c102180e8f9538d4945e6.png" />. Therefore we should
    expect <img src="ltximg/index_861c68b59fb5d71b993fa5352b6252d6d09cf9f2.png" alt="index_861c68b59fb5d71b993fa5352b6252d6d09cf9f2.png" />. This holds for an arbitrary convergent
    continued fraction. In our case, however, when <img src="ltximg/index_0297e7ed16a839014ce8446024b58eea69ad42f0.png" alt="index_0297e7ed16a839014ce8446024b58eea69ad42f0.png" />, the constant in
    the rate is also known as <img src="ltximg/index_f09f2a92be5772b0048382a7f8f660a68bf3e761.png" alt="index_f09f2a92be5772b0048382a7f8f660a68bf3e761.png" />, so the equation we need to solve is
    in fact <img src="ltximg/index_c2a8506f6b6fba6935f6d08b7bb3993e2286c4c2.png" alt="index_c2a8506f6b6fba6935f6d08b7bb3993e2286c4c2.png" />, and in practice that is
    <img src="ltximg/index_6dbab901b117897ed6aedd2b6dc6f16694b094cd.png" alt="index_6dbab901b117897ed6aedd2b6dc6f16694b094cd.png" />. How exactly we managed to do it in 14
    steps, I don't know.

2.  DONE b. iterative

    We just start computing from the end.
    
        (define (cont-frac n d k)
          (define (next step accumulator)
            (if (> step 0)
        	(next (- step 1) (/ (n step) (+ (d step) accumulator)))
        	accumulator))
          (next k 0))
    
        #<undef>
    
        (define (cont-frac n d k)
          (define (next step accumulator)
            (if (> step 0)
        	(next (- step 1) (/ (n step) (+ (d step) accumulator)))
        	accumulator))
          (next k 0))
          (/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 14))
    
        1.6180371352785146
    
    Remark: this exercise took me 7 hours.


<a id="orgb7dd4b2"></a>

### DONE Exercise 1.38 euler constant

The only difficulty with this exercise is to derive the formula for the
second lambda.

    (define (cont-frac n d k)
      (define (next step accumulator)
        (if (> step 0)
    	(next (- step 1) (/ (n step) (+ (d step) accumulator)))
    	accumulator))
      (next k 0))
    (+ 2 
       (cont-frac 
        (lambda (i) 1.0)
        (lambda (i) (if (= (remainder i 3) 2) (+ (* (/ i 3) 2) 2) 1))
        14 ))

    2.794771662537


<a id="orga9246ec"></a>

### DONE Exercise 1.39 tan-cf

    (define (cont-frac n d k)
      (define (next step accumulator)
        (if (> step 0)
    	(next (- step 1) (/ (n step) (+ (d step) accumulator)))
    	accumulator))
      (next k 0))
    (define (tan-cf x k)
      (cont-frac
       (lambda (i)
         (if (= i 1) x (- (* x x))))
       (lambda (i)
         (- (* 2 i) 1))
       k))
    (display (tan 0.1))
    (newline)
    (display(tan-cf 0.1 300))

    0.10033467208545055
    0.10033467208545055


<a id="orgfcb2f0a"></a>

### DONE Exercise 1.40 newtons-method

    (define (deriv g)
      (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
    (define dx 0.00001)

    #<undef>

    (define (newton-transform g)
      (lambda (x) (- x (/ (g x) ((deriv g) x)))))
    (define (newtons-method g guess)
      (fixed-point (newton-transform g) guess))

    #<undef>

    (define (square x)
     (* x x))

    #<undef>

    (define (cube x)
      (* x x x))

    #<undef>

    (define (cubic a b c) 
      (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))x

    "{Exception #19 user \"undefined variable\" (x) #<procedure #f> (#f . 2)}"

    (define (inc x) (+ x 1))

    #<undef>

    (define tolerance 0.00001)
    (define (fixed-point f first-guess)
      (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
           tolerance))
      (define (try guess)
        (let ((next (f guess)))
          (if (close-enough? guess next)
    	  next
    	  (try next))))
    (try first-guess))
    (define (cubic a b c) 
      (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))x
    (define (cube x)
      (* x x x))
    (define (square x)
     (* x x))
    (define (deriv g)
      (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
    (define dx 0.00001)
    (define (newton-transform g)
      (lambda (x) (- x (/ (g x) ((deriv g) x)))))
    (define (newtons-method g guess)
      (fixed-point (newton-transform g) guess))
    
    (display (newtons-method (cubic 5 3 1) 1))

    -4.365230013403046

Theoretically, a cubic may have up to 3 roots, but to find all of them we
would need to try over all possible ones.


<a id="org0f069ed"></a>

### DONE Exercise 1.41 double-double

    (define (double fun)
      (lambda (x) (fun (fun x))))
    (define (inc x)
      (+ x 1))

    #<undef>

    (define (double fun)
      (lambda (x) (fun (fun x))))
    (define (inc x)
      (+ x 1))
    (((double double) inc) 5)

    9

    (define (double fun)
      (lambda (x) (fun (fun x))))
    (define (inc x)
      (+ x 1))
    (((double (double double)) inc) 5)

    21

<img src="ltximg/index_3dee7bcb7186cd9683b1db3e3995449db6243cc7.png" alt="index_3dee7bcb7186cd9683b1db3e3995449db6243cc7.png" />
Double really works as a power of a function. <img src="ltximg/index_c834d66bbed02048611895c9f5cf79a3436588c9.png" alt="index_c834d66bbed02048611895c9f5cf79a3436588c9.png" />


<a id="orgaa3c85b"></a>

### DONE Exercise 1.42 compose

    (define (compose f g)
      (lambda (x) (f (g x))))

    #<undef>

    (define (compose f g)
      (lambda (x) (f (g x))))
    (define (square x)
     (* x x))
    (define (inc x) (+ x 1))
    ((compose square inc) 6)

    49


<a id="orgb5b3275"></a>

### DONE Exercise 1.43 repeated

    
    (define (repeated fun n)
      (define (repeat-it n fun combinator)
        (if (= n 1)
    	combinator
    	(repeat-it  (- n 1) fun (lambda (x) (fun (combinator x))))))
        (repeat-it n fun fun))

    #<undef>

    
    (define (repeated fun n)
      (define (repeat-it n fun combinator)
        (if (= n 1)
    	combinator
    	(repeat-it  (- n 1) fun (lambda (x) (fun (combinator x))))))
        (repeat-it n fun fun))
    
    (define (square x)
     (* x x))
    
    ((repeated square 2) 5)

    625

Hm. Managed to do it without the `compose` form.


<a id="org022406b"></a>

### DONE Exercise 1.44 smoothing

    (define dx 0.1)
    (define (smooth f)
      (lambda (x) (/ (+ (f (- x dx))
    	       (f x)
    	       (f (+ x dx)))
    	    3)))

    #<undef>

    (define (n-smoothed fun n)
      ((repeated smooth n) fun))

    #<undef>

    (define dx 0.1)
    (define (smooth f)
      (lambda (x) (/ (+ (f (- x dx))
    	       (f x)
    	       (f (+ x dx)))
    	    3)))
    (define (n-smoothed fun n)
      ((repeated smooth n) fun))
    
    (define (repeated fun n)
      (define (repeat-it n fun combinator)
        (if (= n 1)
    	combinator
    	(repeat-it  (- n 1) fun (lambda (x) (fun (combinator x))))))
        (repeat-it n fun fun))
    (define (cube x)
      (* x x x))
    (define (ex144-answer x)
      ((n-smoothed cube 3) x))
    (display (ex144-answer 10))

    1000.6

Looks like what we wanted.


<a id="org1cb0d79"></a>

### DONE Exercise 1.45 nth-root

    (define (average x y)
       (/ (+ x y) 2))

    #<undef>

    (define (average-damp f)
      (lambda (x) (average x (f x))))

    #<undef>

    (define (n-average-damped f n)
       ((repeated average-damp n) f))

    #<undef>

    (define tolerance 0.0001)
    (define (fixed-point f first-guess)
      (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
           tolerance))
      (define (try guess)
         (let ((next (f guess)))
          (if (close-enough? guess next)
    	  next
    	  (try next))))
    (try first-guess))

    #<undef>

    (define (root n x initial-guess)
      (fixed-point
       (n-average-damped
        (lambda (y) (/ x (pow y (- n 1))))
        n) 
        initial-guess))

    #<undef>

    (define (pow x n)
     (if (= n 1)
       x
       (* x (pow x (- n 1)))))

    #<undef>

    (define (average x y)
       (/ (+ x y) 2))
    (define (average-damp f)
      (lambda (x) (average x (f x))))
    
    (define (repeated fun n)
      (define (repeat-it n fun combinator)
        (if (= n 1)
    	combinator
    	(repeat-it  (- n 1) fun (lambda (x) (fun (combinator x))))))
        (repeat-it n fun fun))
    (define tolerance 0.0001)
    (define (fixed-point f first-guess)
      (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
           tolerance))
      (define (try guess)
         (let ((next (f guess)))
          (if (close-enough? guess next)
    	  next
    	  (try next))))
    (try first-guess))
    (define (n-average-damped f n)
       ((repeated average-damp n) f))
    (define (pow x n)
     (if (= n 1)
       x
       (* x (pow x (- n 1)))))
    (define (root n x initial-guess)
      (fixed-point
       (n-average-damped
        (lambda (y) (/ x (pow y (- n 1))))
        n) 
        initial-guess))
    (display (root 4 4 3.0))

    1.4144444873765194

The true answer would require to actually estimate the dampening factor, but
we know that **n** is enough, and I am lazy.


<a id="org8ad7f67"></a>

### DONE Exercise 1.46 iterative-improve

    (define (iterative-improve good-enough? improve)
      (define (improver guess)
        (if (good-enough? guess)
    	guess
    	(improver (improve guess))))
    improver)

    #<undef>

1.  DONE a. sqrt

        (define (square x)
         (* x x))
        (define (iterative-improve good-enough? improve)
          (define (improver guess)
            (if (good-enough? guess)
        	guess
        	(improver (improve guess))))
        improver)
        (define (ex1.46sqrt x)
          (let (
        	(square-improver
        	 (iterative-improve
        	  (lambda (y) (< (abs (- (square y) x )) 0.01))
        	  (lambda (y) (/ (+ y (/ x y)) 2)))
        	 )
        	)
            (square-improver 1)))
        (ex1.46sqrt 2.0)
    
        1.4166666666666665

2.  DONE b. fixed-point

        (define (square x)
         (* x x))
        (define (iterative-improve good-enough? improve)
          (define (improver guess)
            (if (good-enough? guess)
        	guess
        	(improver (improve guess))))
        improver)
        (define (fixpoint f)
          (let (
        	(fixpoint-improver
        	 (iterative-improve
        	  (lambda (y) (< (abs (- (f y) y )) 0.01))
        	  (lambda (y) (/ (+ y (f y)) 2)))
        	 )
        	)
            (fixpoint-improver 1.0)))
        (fixpoint (lambda (x) (+ 1 (/ 1 x))))
    
        1.6147785476652068
    
    I have made it. At <span class="timestamp-wrapper"><span class="timestamp">[2019-09-04 Wed 22:25] </span></span> I still haven't implemented all the
    pictures, but I already can say that I have solved <span class="underline">all</span> problems of the
    first chapter of SICP. Some macros are wrong, I need to revise them, but that
    will be done on the second pass. (Yes, there will be a second [or, rather, third] pass!)


<a id="org875092d"></a>

## TODO Chapter 2: Building abstractions with Data <code>[0/97]</code>


<a id="org836038a"></a>

### TODO Exercise 2.1


<a id="orgc390bdc"></a>

### TODO Exercise 2.2


<a id="org3f1ae7e"></a>

### TODO Exercise 2.3


<a id="org9ac4702"></a>

### TODO Exercise 2.4


<a id="orge8eb8ef"></a>

### TODO Exercise 2.5


<a id="org65782b6"></a>

### TODO Exercise 2.6


<a id="org00daba1"></a>

### TODO Exercise 2.7


<a id="orgb2e30bf"></a>

### TODO Exercise 2.8


<a id="org48219d5"></a>

### TODO Exercise 2.9


<a id="orgaf1d726"></a>

### TODO Exercise 2.10


<a id="org47c382c"></a>

### TODO Exercise 2.11


<a id="org90ab116"></a>

### TODO Exercise 2.12


<a id="orgffffb70"></a>

### TODO Exercise 2.13


<a id="orgcbfb92e"></a>

### TODO Exercise 2.14


<a id="org36fcd2b"></a>

### TODO Exercise 2.15


<a id="org701616a"></a>

### TODO Exercise 2.16


<a id="org0a42477"></a>

### TODO Exercise 2.17


<a id="orgba35e97"></a>

### TODO Exercise 2.18


<a id="org8534dfb"></a>

### TODO Exercise 2.19


<a id="org7d68ee6"></a>

### TODO Exercise 2.20


<a id="org6ccb486"></a>

### TODO Exercise 2.21


<a id="orga788750"></a>

### TODO Exercise 2.22


<a id="org5badb0d"></a>

### TODO Exercise 2.23


<a id="org31cccc4"></a>

### TODO Exercise 2.24


<a id="org1ddc91c"></a>

### TODO Exercise 2.25


<a id="orgc2810fa"></a>

### TODO Exercise 2.26


<a id="orga912f1f"></a>

### TODO Exercise 2.27


<a id="org83e1f16"></a>

### TODO Exercise 2.28


<a id="org66e1aaa"></a>

### TODO Exercise 2.29


<a id="orgba0b53e"></a>

### TODO Exercise 2.30


<a id="org13b7148"></a>

### TODO Exercise 2.31


<a id="org8869325"></a>

### TODO Exercise 2.32


<a id="org08afee6"></a>

### TODO Exercise 2.33


<a id="org121ab24"></a>

### TODO Exercise 2.34


<a id="org6d591f8"></a>

### TODO Exercise 2.35


<a id="orgfa555fd"></a>

### TODO Exercise 2.36


<a id="orgfde0adc"></a>

### TODO Exercise 2.37


<a id="orgfe1009f"></a>

### TODO Exercise 2.38


<a id="org714a01b"></a>

### TODO Exercise 2.39


<a id="orgbccf5a7"></a>

### TODO Exercise 2.40


<a id="orgd662d0a"></a>

### TODO Exercise 2.41


<a id="orgfa85aca"></a>

### TODO Exercise 2.42


<a id="orgd77e327"></a>

### TODO Exercise 2.43


<a id="orgc6d6e8f"></a>

### TODO Exercise 2.44


<a id="org39097cb"></a>

### TODO Exercise 2.45


<a id="org9844b09"></a>

### TODO Exercise 2.46


<a id="org19d64c6"></a>

### TODO Exercise 2.47


<a id="org0a98f2d"></a>

### TODO Exercise 2.48


<a id="org630566a"></a>

### TODO Exercise 2.49


<a id="org84b06e7"></a>

### TODO Exercise 2.50


<a id="org0bf6788"></a>

### TODO Exercise 2.51


<a id="orgc0ce858"></a>

### TODO Exercise 2.52


<a id="orgd4f7a5f"></a>

### TODO Exercise 2.53


<a id="org6bb2e1b"></a>

### TODO Exercise 2.54


<a id="org7b21255"></a>

### TODO Exercise 2.55


<a id="org13ba3c8"></a>

### TODO Exercise 2.56


<a id="orga3ab72f"></a>

### TODO Exercise 2.57


<a id="org9adf575"></a>

### TODO Exercise 2.58


<a id="orge5f74f4"></a>

### TODO Exercise 2.59


<a id="orgeb69c40"></a>

### TODO Exercise 2.60


<a id="org6cc2714"></a>

### TODO Exercise 2.61


<a id="orgef94799"></a>

### TODO Exercise 2.62


<a id="orgcf8f30d"></a>

### TODO Exercise 2.63


<a id="org8bbf93c"></a>

### TODO Exercise 2.64


<a id="orgc647d4b"></a>

### TODO Exercise 2.65


<a id="orga4da822"></a>

### TODO Exercise 2.66


<a id="orgd5a09a9"></a>

### TODO Exercise 2.67


<a id="org011b2ff"></a>

### TODO Exercise 2.68


<a id="org306db0b"></a>

### TODO Exercise 2.69


<a id="orgfd0ca65"></a>

### TODO Exercise 2.70


<a id="orgdb2c1a0"></a>

### TODO Exercise 2.71


<a id="org50181fd"></a>

### TODO Exercise 2.72


<a id="org199f67e"></a>

### TODO Exercise 2.73


<a id="org59e1371"></a>

### TODO Exercise 2.74


<a id="org05a1c11"></a>

### TODO Exercise 2.75


<a id="orgee79d8b"></a>

### TODO Exercise 2.76


<a id="orgaa7314b"></a>

### TODO Exercise 2.77


<a id="orgc692e9d"></a>

### TODO Exercise 2.78


<a id="orge5a9dab"></a>

### TODO Exercise 2.79


<a id="org54e9f03"></a>

### TODO Exercise 2.80


<a id="orgf90b315"></a>

### TODO Exercise 2.81


<a id="orgb9150b3"></a>

### TODO Exercise 2.82


<a id="orgca607b9"></a>

### TODO Exercise 2.83


<a id="org861bc07"></a>

### TODO Exercise 2.84


<a id="orgb07f70f"></a>

### TODO Exercise 2.85


<a id="orgfcce34b"></a>

### TODO Exercise 2.86


<a id="orgeef9f0a"></a>

### TODO Exercise 2.87


<a id="orgdd86bf3"></a>

### TODO Exercise 2.88


<a id="org8d755bd"></a>

### TODO Exercise 2.89


<a id="org9f35103"></a>

### TODO Exercise 2.90


<a id="org312de71"></a>

### TODO Exercise 2.91


<a id="orgec364f7"></a>

### TODO Exercise 2.92


<a id="org2ec9bbb"></a>

### TODO Exercise 2.93


<a id="org6056cda"></a>

### TODO Exercise 2.94


<a id="org5a3f9e5"></a>

### TODO Exercise 2.95


<a id="org7845b6c"></a>

### TODO Exercise 2.96


<a id="orgf796354"></a>

### TODO Exercise 2.97


<a id="org29f1aa5"></a>

## TODO Chapter 3: Modularity, Objects and State <code>[0/82]</code>


<a id="orgf9ec929"></a>

### TODO Exercise 3.1


<a id="org51936cd"></a>

### TODO Exercise 3.2


<a id="org1a08d5c"></a>

### TODO Exercise 3.3


<a id="org83deca8"></a>

### TODO Exercise 3.4


<a id="orga917547"></a>

### TODO Exercise 3.5


<a id="orga64c3f5"></a>

### TODO Exercise 3.6


<a id="orgdeb88ce"></a>

### TODO Exercise 3.7


<a id="orga2484ff"></a>

### TODO Exercise 3.8


<a id="org9983f60"></a>

### TODO Exercise 3.9


<a id="orgfee24ff"></a>

### TODO Exercise 3.10


<a id="org0476769"></a>

### TODO Exercise 3.11


<a id="org816a6d4"></a>

### TODO Exercise 3.12


<a id="org6aa1fb8"></a>

### TODO Exercise 3.13


<a id="org52bc159"></a>

### TODO Exercise 3.14


<a id="org0e368c3"></a>

### TODO Exercise 3.15


<a id="org49a5e98"></a>

### TODO Exercise 3.16


<a id="orga766dbb"></a>

### TODO Exercise 3.17


<a id="orgd42cdf5"></a>

### TODO Exercise 3.18


<a id="org5d4c446"></a>

### TODO Exercise 3.19


<a id="org68647f4"></a>

### TODO Exercise 3.20


<a id="org0205e15"></a>

### TODO Exercise 3.21


<a id="org89fa519"></a>

### TODO Exercise 3.22


<a id="orgb1c94ed"></a>

### TODO Exercise 3.23


<a id="orga6591a8"></a>

### TODO Exercise 3.24


<a id="org88d3212"></a>

### TODO Exercise 3.25


<a id="org8394bc2"></a>

### TODO Exercise 3.26


<a id="org375b4b9"></a>

### TODO Exercise 3.27


<a id="org6b8af26"></a>

### TODO Exercise 3.28


<a id="orga61bd0c"></a>

### TODO Exercise 3.29


<a id="org651f885"></a>

### TODO Exercise 3.30


<a id="org86b61b8"></a>

### TODO Exercise 3.31


<a id="org89aa0fc"></a>

### TODO Exercise 3.32


<a id="org2767ef9"></a>

### TODO Exercise 3.33


<a id="org5e41f92"></a>

### TODO Exercise 3.34


<a id="org95d4e26"></a>

### TODO Exercise 3.35


<a id="org03d7ee4"></a>

### TODO Exercise 3.36


<a id="org28cf3de"></a>

### TODO Exercise 3.37


<a id="orgcca45b3"></a>

### TODO Exercise 3.38


<a id="org9440430"></a>

### TODO Exercise 3.39


<a id="org92f625d"></a>

### TODO Exercise 3.40


<a id="orgda5477b"></a>

### TODO Exercise 3.41


<a id="orga191fd9"></a>

### TODO Exercise 3.42


<a id="org3c92e97"></a>

### TODO Exercise 3.43


<a id="org463a5bd"></a>

### TODO Exercise 3.44


<a id="org2e0bd1b"></a>

### TODO Exercise 3.45


<a id="orgf2515fa"></a>

### TODO Exercise 3.46


<a id="orgcfdf1ee"></a>

### TODO Exercise 3.47


<a id="org978a78f"></a>

### TODO Exercise 3.48


<a id="orgb4c99f2"></a>

### TODO Exercise 3.49


<a id="orgc1f2855"></a>

### TODO Exercise 3.50


<a id="org977bfff"></a>

### TODO Exercise 3.51


<a id="org8f7def9"></a>

### TODO Exercise 3.52


<a id="org570d086"></a>

### TODO Exercise 3.53


<a id="org76c9e29"></a>

### TODO Exercise 3.54


<a id="org9fcd10a"></a>

### TODO Exercise 3.55


<a id="org37fdb13"></a>

### TODO Exercise 3.56


<a id="orgd718720"></a>

### TODO Exercise 3.57


<a id="org4d48828"></a>

### TODO Exercise 3.58


<a id="orgf6b34ff"></a>

### TODO Exercise 3.59


<a id="org302171d"></a>

### TODO Exercise 3.60


<a id="org7f9dbd3"></a>

### TODO Exercise 3.61


<a id="orge153a7f"></a>

### TODO Exercise 3.62


<a id="orgdd3d35b"></a>

### TODO Exercise 3.63


<a id="org67b48b5"></a>

### TODO Exercise 3.64


<a id="org528748c"></a>

### TODO Exercise 3.65


<a id="org122007e"></a>

### TODO Exercise 3.66


<a id="org27f5cf1"></a>

### TODO Exercise 3.67


<a id="org5410f30"></a>

### TODO Exercise 3.68


<a id="org901f901"></a>

### TODO Exercise 3.69


<a id="org78fa8e2"></a>

### TODO Exercise 3.70


<a id="org34d3fcd"></a>

### TODO Exercise 3.71


<a id="orgca8ea41"></a>

### TODO Exercise 3.72


<a id="orga010030"></a>

### TODO Exercise 3.73


<a id="orgbcd5c2d"></a>

### TODO Exercise 3.74


<a id="org1bc5385"></a>

### TODO Exercise 3.75


<a id="org75fd271"></a>

### TODO Exercise 3.76


<a id="org9b457ed"></a>

### TODO Exercise 3.77


<a id="orgc0e6d3d"></a>

### TODO Exercise 3.78


<a id="org0a7f9c0"></a>

### TODO Exercise 3.79


<a id="orgcacd0aa"></a>

### TODO Exercise 3.80


<a id="orgf87b228"></a>

### TODO Exercise 3.81


<a id="org620861e"></a>

### TODO Exercise 3.82


<a id="orgb251955"></a>

## TODO Chapter 4: Metalinguistic Abstraction <code>[0/79]</code>


<a id="orgc0b5bb9"></a>

### TODO Exercise 4.1


<a id="org67f2643"></a>

### TODO Exercise 4.2


<a id="orgd5c58f8"></a>

### TODO Exercise 4.3


<a id="org4d54e74"></a>

### TODO Exercise 4.4


<a id="org2668c5a"></a>

### TODO Exercise 4.5


<a id="org237fd06"></a>

### TODO Exercise 4.6


<a id="orgf165291"></a>

### TODO Exercise 4.7


<a id="orgfce28d1"></a>

### TODO Exercise 4.8


<a id="org024c976"></a>

### TODO Exercise 4.9


<a id="orgfb84074"></a>

### TODO Exercise 4.10


<a id="org549626b"></a>

### TODO Exercise 4.11


<a id="org3936d57"></a>

### TODO Exercise 4.12


<a id="orgbf5aed3"></a>

### TODO Exercise 4.13


<a id="org7614340"></a>

### TODO Exercise 4.14


<a id="org69b4f51"></a>

### TODO Exercise 4.15


<a id="orge5ef032"></a>

### TODO Exercise 4.16


<a id="orgb0bbd8a"></a>

### TODO Exercise 4.17


<a id="org9619fee"></a>

### TODO Exercise 4.18


<a id="org1e2f897"></a>

### TODO Exercise 4.19


<a id="org1165b7b"></a>

### TODO Exercise 4.20


<a id="org6480227"></a>

### TODO Exercise 4.21


<a id="orgf49e56b"></a>

### TODO Exercise 4.22


<a id="org4c5f2a8"></a>

### TODO Exercise 4.23


<a id="orgbf86f38"></a>

### TODO Exercise 4.24


<a id="orgd61e0d0"></a>

### TODO Exercise 4.25


<a id="org80a1801"></a>

### TODO Exercise 4.26


<a id="org03bce13"></a>

### TODO Exercise 4.27


<a id="org9d5fc4d"></a>

### TODO Exercise 4.28


<a id="orgfb02599"></a>

### TODO Exercise 4.29


<a id="orgc3586ca"></a>

### TODO Exercise 4.30


<a id="org3094077"></a>

### TODO Exercise 4.31


<a id="org8e29895"></a>

### TODO Exercise 4.32


<a id="org660815b"></a>

### TODO Exercise 4.33


<a id="org84200e3"></a>

### TODO Exercise 4.34


<a id="orgd33420c"></a>

### TODO Exercise 4.35


<a id="org5c8362f"></a>

### TODO Exercise 4.36


<a id="org847f5b3"></a>

### TODO Exercise 4.37


<a id="orgeb32931"></a>

### TODO Exercise 4.38


<a id="org08d1b7b"></a>

### TODO Exercise 4.39


<a id="org0393f30"></a>

### TODO Exercise 4.40


<a id="org6880dba"></a>

### TODO Exercise 4.41


<a id="org58fea77"></a>

### TODO Exercise 4.42


<a id="org3d87dee"></a>

### TODO Exercise 4.43


<a id="orgadc2519"></a>

### TODO Exercise 4.44


<a id="org9f9856b"></a>

### TODO Exercise 4.45


<a id="org5ff5065"></a>

### TODO Exercise 4.46


<a id="org9eaa58d"></a>

### TODO Exercise 4.47


<a id="org4e3b38e"></a>

### TODO Exercise 4.48


<a id="orgd50be9d"></a>

### TODO Exercise 4.49


<a id="org4de3fb8"></a>

### TODO Exercise 4.50


<a id="org5d14a2a"></a>

### TODO Exercise 4.51


<a id="org8c25da1"></a>

### TODO Exercise 4.52


<a id="org181b6cf"></a>

### TODO Exercise 4.53


<a id="orga835e6e"></a>

### TODO Exercise 4.54


<a id="orgd3bd0f6"></a>

### TODO Exercise 4.55


<a id="org69764f7"></a>

### TODO Exercise 4.56


<a id="org1cbb180"></a>

### TODO Exercise 4.57


<a id="org01038a8"></a>

### TODO Exercise 4.58


<a id="orge525706"></a>

### TODO Exercise 4.59


<a id="org1661bd4"></a>

### TODO Exercise 4.60


<a id="org76ec517"></a>

### TODO Exercise 4.61


<a id="orgf49f206"></a>

### TODO Exercise 4.62


<a id="org69a738b"></a>

### TODO Exercise 4.63


<a id="org4188521"></a>

### TODO Exercise 4.64


<a id="orgf41d14d"></a>

### TODO Exercise 4.65


<a id="org12686fb"></a>

### TODO Exercise 4.66


<a id="org66d9277"></a>

### TODO Exercise 4.67


<a id="org6a71074"></a>

### TODO Exercise 4.68


<a id="org7fa7b88"></a>

### TODO Exercise 4.69


<a id="orgde41c92"></a>

### TODO Exercise 4.70


<a id="org99f6ec8"></a>

### TODO Exercise 4.71


<a id="org400d645"></a>

### TODO Exercise 4.72


<a id="orgc52cc19"></a>

### TODO Exercise 4.73


<a id="org5de5d3e"></a>

### TODO Exercise 4.74


<a id="orgf556383"></a>

### TODO Exercise 4.75


<a id="org31bfef5"></a>

### TODO Exercise 4.76


<a id="org3488ada"></a>

### TODO Exercise 4.77


<a id="org252043e"></a>

### TODO Exercise 4.78


<a id="org0ab832b"></a>

### TODO Exercise 4.79


<a id="org9d679b3"></a>

## TODO Chapter 5: Computing with Register Machines <code>[0/52]</code>


<a id="org2ef12a5"></a>

### TODO Exercise 5.1


<a id="orgff8d8fb"></a>

### TODO Exercise 5.2


<a id="orgb6ee8cf"></a>

### TODO Exercise 5.3


<a id="org468c8f7"></a>

### TODO Exercise 5.4


<a id="org8300657"></a>

### TODO Exercise 5.5


<a id="org441baf8"></a>

### TODO Exercise 5.6


<a id="org27676a0"></a>

### TODO Exercise 5.7


<a id="orga65cbc1"></a>

### TODO Exercise 5.8


<a id="orgc5f4389"></a>

### TODO Exercise 5.9


<a id="org02a86bf"></a>

### TODO Exercise 5.10


<a id="orgc046a41"></a>

### TODO Exercise 5.11


<a id="org346c2ba"></a>

### TODO Exercise 5.12


<a id="org1a37ea9"></a>

### TODO Exercise 5.13


<a id="org158e312"></a>

### TODO Exercise 5.14


<a id="org6d1df44"></a>

### TODO Exercise 5.15


<a id="orgc3aa706"></a>

### TODO Exercise 5.16


<a id="org9b7360c"></a>

### TODO Exercise 5.17


<a id="org55ec814"></a>

### TODO Exercise 5.18


<a id="org0554626"></a>

### TODO Exercise 5.19


<a id="orgf2da27f"></a>

### TODO Exercise 5.20


<a id="orgb2877c0"></a>

### TODO Exercise 5.21


<a id="org9bf947c"></a>

### TODO Exercise 5.22


<a id="orgea8053e"></a>

### TODO Exercise 5.23


<a id="org97cc429"></a>

### TODO Exercise 5.24


<a id="orga13343f"></a>

### TODO Exercise 5.25


<a id="orgd6be7a7"></a>

### TODO Exercise 5.26


<a id="org8bb25a2"></a>

### TODO Exercise 5.27


<a id="org16c012c"></a>

### TODO Exercise 5.28


<a id="org8f3e64d"></a>

### TODO Exercise 5.29


<a id="orgac903d8"></a>

### TODO Exercise 5.30


<a id="orgdd0d89b"></a>

### TODO Exercise 5.31


<a id="org237bd7e"></a>

### TODO Exercise 5.32


<a id="orgd5c8d14"></a>

### TODO Exercise 5.33


<a id="org0255c4d"></a>

### TODO Exercise 5.34


<a id="org0df5504"></a>

### TODO Exercise 5.35


<a id="org5ee0681"></a>

### TODO Exercise 5.36


<a id="org2f25663"></a>

### TODO Exercise 5.37


<a id="org54bbc2c"></a>

### TODO Exercise 5.38


<a id="org9e1d0be"></a>

### TODO Exercise 5.39


<a id="orge138ea4"></a>

### TODO Exercise 5.40


<a id="orgd7b9aa1"></a>

### TODO Exercise 5.41


<a id="org187d781"></a>

### TODO Exercise 5.42


<a id="org1888ca3"></a>

### TODO Exercise 5.43


<a id="orgd586ddf"></a>

### TODO Exercise 5.44


<a id="org76136cd"></a>

### TODO Exercise 5.45


<a id="org3481fa3"></a>

### TODO Exercise 5.46


<a id="orgcb4c108"></a>

### TODO Exercise 5.47


<a id="org593bbbe"></a>

### TODO Exercise 5.48


<a id="org3dc09ec"></a>

### TODO Exercise 5.49


<a id="orgbb692c1"></a>

### TODO Exercise 5.50


<a id="orgc7e9fd8"></a>

### TODO Exercise 5.51


<a id="org9f7c91d"></a>

### TODO Exercise 5.52


# Footnotes

<sup><a id="fn.1" href="#fnr.1">1</a></sup> This exercise took me 7 hours.
