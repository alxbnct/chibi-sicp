
# Table of Contents

1.  [noweb + common](#org0e630ec)
    1.  [Setting chibi arguments. DANGEROUS](#orgedb44ff):dangerous:elisp:
    2.  [Some common code blocks](#orgf624b8a)
2.  [SICP <code>[15%]</code>](#orgc825e19)
    1.  [Chapter 1: Building abstractions with procedures <code>[57/61]</code>](#orgbda2593)
        1.  [Snippet](#orgb69851a)
        2.  [Thought](#org688db31)
        3.  [Figure 1.1 Tree representation, showing the value of each subcombination](#org7828f41)
        4.  [Snippet](#orgcdfd136)
        5.  [Exercise 1.1 Interpreter result](#orgb12dee6)
        6.  [Exercise 1.2 Prefix form](#org8c5bb39)
        7.  [Exercise 1.3 Sum of squares](#orgb8aeab4)
        8.  [Exercise 1.4 Compound expressions](#org6b0f818)
        9.  [Exercise 1.5 Ben's test](#org97ceb0e)
        10. [Exercise 1.6 If is a special form](#orgbf72541)
        11. [Exercise 1.7 Good enough?](#org661d591)
        12. [Exercise 1.8 Newton's method](#org2ecdf92)
        13. [Figure 1.2 Procedural decomposition of the sqrt program](#orgab413d7)
        14. [Figure 1.3 A linear recursive process for computing \(6!\).](#orgcd3f21b)
        15. [Figure 1.4 A linear iterative process for computing \(6!\).](#org51d624a)
        16. [Exercise 1.9 Iterative or recursive?](#orge5934c0):macro:er_macro_transformer:chicken:
        17. [Exercise 1.10 Ackermann's function](#orga042e2a)
        18. [Figure 1.5 The tree-recursive process generated in computing (fib 5)](#org92f5cc7)
        19. [Exercise 1.11 Recursive vs iterative](#org0876656)
        20. [Exercise 1.12 Recursive Pascal's triangle](#org6288a89)
        21. [Exercise 1.13 Fibonacci](#org4f36708)
        22. [Exercise 1.14 count-change](#org5c1ff48):macro:er_macro_transformer:
        23. [I found a bug in ob-scheme while doing this Exercise.](#orgce5ad2f)
        24. [Exercise 1.15 sine](#org0461d0f):macro:er_macro_transformer:
        25. [Exercise 1.16 Iterative exponentiation](#org059b365)
        26. [Exercise 1.17 Fast multiplication](#org0a60f18)
        27. [Exercise 1.18 Iterative multiplication](#org76b9af3)
        28. [Exercise 1.19 Logarithmic Fibonacci](#org10eb53d)
        29. [**Interjection** ir-macro-transformer.](#orgfa454b8)
        30. [Exercise 1.20 GCD applicative vs normal](#org961dec6):er_macro_transformer:macro:
        31. [Exercise 1.21 smallest-divisor](#org84e6ae7)
        32. [Exercise 1.22 timed-prime-test](#orgedc1c2e)
        33. [Exercise 1.23 (next test-divisor)](#org39c2911)
        34. [Exercise 1.24 Fermat method](#org8c4a12b)
        35. [Exercise 1.25 expmod](#org3d83e9a)
        36. [Exercise 1.26 square vs mul](#orgfb0e09d)
        37. [Exercise 1.27 Carmichael numbers](#org5c80963)
        38. [Exercise 1.28 Miller-Rabin](#org05117ca)
        39. [Exercise 1.29 Simpson's integral](#org9a19704)
        40. [Exercise 1.30 Iterative sum](#org25afc62)
        41. [Exercise 1.31 Product](#org9be1d0e)
        42. [Exercise 1.32 Accumulator](#orgdf386d5)
        43. [Exercise 1.33 filtered-accumulate](#org73b780f)
        44. [Exercise 1.34 lambda](#org5c950ec)
        45. [Exercise 1.35 fixed-point](#org645368a)
        46. [Exercise 1.36 fixed-point-with-dampening](#orgb0e6f79)
        47. [Exercise 1.37 cont-frac](#org5ccb678)
        48. [Exercise 1.38 euler constant](#org9750c2e)
        49. [Exercise 1.39 tan-cf](#org9f337f6)
        50. [Exercise 1.40 newtons-method](#org5198204)
        51. [Exercise 1.41 double-double](#org215d5b5)
        52. [Exercise 1.42 compose](#orgab1cc9f)
        53. [Exercise 1.43 repeated](#orgbb968b7)
        54. [Exercise 1.44 smoothing](#orgd46effc)
        55. [Exercise 1.45 nth-root](#orgad87e17)
        56. [Exercise 1.46 iterative-improve](#orgd904117)
    2.  [Chapter 2: Building abstractions with Data <code>[0/97]</code>](#orga7df096)
        1.  [Exercise 2.1](#orgf8d6a38)
        2.  [Exercise 2.2](#org7d6d0d4)
        3.  [Exercise 2.3](#org2a78b65)
        4.  [Exercise 2.4](#orgdb2c27e)
        5.  [Exercise 2.5](#orgaae2185)
        6.  [Exercise 2.6](#orgb0549b4)
        7.  [Exercise 2.7](#org2855294)
        8.  [Exercise 2.8](#org099b99a)
        9.  [Exercise 2.9](#orga7af83f)
        10. [Exercise 2.10](#org703d679)
        11. [Exercise 2.11](#org8e7279e)
        12. [Exercise 2.12](#orgb4710c8)
        13. [Exercise 2.13](#org4d09a43)
        14. [Exercise 2.14](#org49f03b9)
        15. [Exercise 2.15](#org74b106d)
        16. [Exercise 2.16](#org2a3b9b4)
        17. [Exercise 2.17](#orga17e0b8)
        18. [Exercise 2.18](#orgd99b5da)
        19. [Exercise 2.19](#org00c0e93)
        20. [Exercise 2.20](#org25690b7)
        21. [Exercise 2.21](#org39a8599)
        22. [Exercise 2.22](#orgbbb4e6f)
        23. [Exercise 2.23](#orgd181028)
        24. [Exercise 2.24](#org4a96186)
        25. [Exercise 2.25](#org395e24c)
        26. [Exercise 2.26](#org0ad14b6)
        27. [Exercise 2.27](#org2c4df3c)
        28. [Exercise 2.28](#orgefc8c4d)
        29. [Exercise 2.29](#org4ff0b32)
        30. [Exercise 2.30](#org34c398b)
        31. [Exercise 2.31](#org6c46c3f)
        32. [Exercise 2.32](#org189805c)
        33. [Exercise 2.33](#org1dd9af1)
        34. [Exercise 2.34](#orgfcd163c)
        35. [Exercise 2.35](#orgc3e2417)
        36. [Exercise 2.36](#orga2ebd50)
        37. [Exercise 2.37](#org3a56d7b)
        38. [Exercise 2.38](#org14c31dc)
        39. [Exercise 2.39](#org08bd32a)
        40. [Exercise 2.40](#org4e4b512)
        41. [Exercise 2.41](#orgb352789)
        42. [Exercise 2.42](#orgf47364c)
        43. [Exercise 2.43](#orgade970e)
        44. [Exercise 2.44](#org73c7d7e)
        45. [Exercise 2.45](#org78d1f3b)
        46. [Exercise 2.46](#orgd2b9f44)
        47. [Exercise 2.47](#org23124af)
        48. [Exercise 2.48](#orga3b7384)
        49. [Exercise 2.49](#orgba2e611)
        50. [Exercise 2.50](#org1d6547e)
        51. [Exercise 2.51](#orgee6e73e)
        52. [Exercise 2.52](#org0bf9d4c)
        53. [Exercise 2.53](#orgf76c024)
        54. [Exercise 2.54](#org71c2c90)
        55. [Exercise 2.55](#org68f76b0)
        56. [Exercise 2.56](#orga70c8fc)
        57. [Exercise 2.57](#orgb901e25)
        58. [Exercise 2.58](#orgea1949b)
        59. [Exercise 2.59](#org2eea9cb)
        60. [Exercise 2.60](#orge841d3d)
        61. [Exercise 2.61](#org9235380)
        62. [Exercise 2.62](#orgd055ba9)
        63. [Exercise 2.63](#orgf449329)
        64. [Exercise 2.64](#org56b0f27)
        65. [Exercise 2.65](#org46ebb9c)
        66. [Exercise 2.66](#org9ae4143)
        67. [Exercise 2.67](#orgb7711cf)
        68. [Exercise 2.68](#org20771dd)
        69. [Exercise 2.69](#org9c0e8aa)
        70. [Exercise 2.70](#orgde14e6c)
        71. [Exercise 2.71](#org5962aab)
        72. [Exercise 2.72](#org455f833)
        73. [Exercise 2.73](#orgb8a2328)
        74. [Exercise 2.74](#orgc4fd0a4)
        75. [Exercise 2.75](#org8f95474)
        76. [Exercise 2.76](#orgabfc978)
        77. [Exercise 2.77](#org7e448db)
        78. [Exercise 2.78](#orgfce6cdb)
        79. [Exercise 2.79](#org678f839)
        80. [Exercise 2.80](#org589009c)
        81. [Exercise 2.81](#org8ebb34a)
        82. [Exercise 2.82](#org75d623f)
        83. [Exercise 2.83](#org1e835f5)
        84. [Exercise 2.84](#orgd79b611)
        85. [Exercise 2.85](#org82a754a)
        86. [Exercise 2.86](#org95ceb50)
        87. [Exercise 2.87](#org3964a7c)
        88. [Exercise 2.88](#orgff63ef5)
        89. [Exercise 2.89](#orgdfcfd2c)
        90. [Exercise 2.90](#org49c2ad0)
        91. [Exercise 2.91](#org7a1fc96)
        92. [Exercise 2.92](#org1859a44)
        93. [Exercise 2.93](#org5dc2e3f)
        94. [Exercise 2.94](#org765ab4b)
        95. [Exercise 2.95](#orgbd24e55)
        96. [Exercise 2.96](#org218cfd7)
        97. [Exercise 2.97](#org4555862)
    3.  [Chapter 3: Modularity, Objects and State <code>[0/82]</code>](#org065b21d)
        1.  [Exercise 3.1](#orged05049)
        2.  [Exercise 3.2](#orgb45dbd2)
        3.  [Exercise 3.3](#org16e9279)
        4.  [Exercise 3.4](#orgb1e6fb6)
        5.  [Exercise 3.5](#org2d1902e)
        6.  [Exercise 3.6](#orga88271d)
        7.  [Exercise 3.7](#org7fb20e0)
        8.  [Exercise 3.8](#orgdd01252)
        9.  [Exercise 3.9](#org90fafdf)
        10. [Exercise 3.10](#orge13a3e2)
        11. [Exercise 3.11](#org07b96a0)
        12. [Exercise 3.12](#orgc3eceda)
        13. [Exercise 3.13](#org9ff51e9)
        14. [Exercise 3.14](#org35186bf)
        15. [Exercise 3.15](#org5176208)
        16. [Exercise 3.16](#org0bcf2c6)
        17. [Exercise 3.17](#orgd235e9f)
        18. [Exercise 3.18](#orgfd35d70)
        19. [Exercise 3.19](#org7112fcd)
        20. [Exercise 3.20](#orgc6ab890)
        21. [Exercise 3.21](#org759f8f2)
        22. [Exercise 3.22](#orgf22ecf6)
        23. [Exercise 3.23](#orgb85bf3a)
        24. [Exercise 3.24](#orgedbbe04)
        25. [Exercise 3.25](#orgd0dd77b)
        26. [Exercise 3.26](#orga5dcebc)
        27. [Exercise 3.27](#org598ca81)
        28. [Exercise 3.28](#orgb229668)
        29. [Exercise 3.29](#org48098b2)
        30. [Exercise 3.30](#orgbfac591)
        31. [Exercise 3.31](#orga5530f9)
        32. [Exercise 3.32](#org0ddac1c)
        33. [Exercise 3.33](#org1d14fa7)
        34. [Exercise 3.34](#org09fe536)
        35. [Exercise 3.35](#orge36e21e)
        36. [Exercise 3.36](#orga665fd1)
        37. [Exercise 3.37](#org3f26b12)
        38. [Exercise 3.38](#org774f518)
        39. [Exercise 3.39](#org856481a)
        40. [Exercise 3.40](#org55ebb15)
        41. [Exercise 3.41](#orgad2b1a6)
        42. [Exercise 3.42](#orge765835)
        43. [Exercise 3.43](#orgddb497e)
        44. [Exercise 3.44](#org81f3d7b)
        45. [Exercise 3.45](#orgb2fdbb0)
        46. [Exercise 3.46](#org87d8ada)
        47. [Exercise 3.47](#orgacd782d)
        48. [Exercise 3.48](#orgea804a5)
        49. [Exercise 3.49](#org1908a65)
        50. [Exercise 3.50](#orgf3dadac)
        51. [Exercise 3.51](#org6f876aa)
        52. [Exercise 3.52](#orgb5453ab)
        53. [Exercise 3.53](#org64c9e94)
        54. [Exercise 3.54](#org2820eb4)
        55. [Exercise 3.55](#org172aaed)
        56. [Exercise 3.56](#org06c91b4)
        57. [Exercise 3.57](#org30d3626)
        58. [Exercise 3.58](#org9b44321)
        59. [Exercise 3.59](#org150faee)
        60. [Exercise 3.60](#org76ac168)
        61. [Exercise 3.61](#org1e41368)
        62. [Exercise 3.62](#org15a7848)
        63. [Exercise 3.63](#orgd885033)
        64. [Exercise 3.64](#org587b8ab)
        65. [Exercise 3.65](#org5935368)
        66. [Exercise 3.66](#org3fb0356)
        67. [Exercise 3.67](#orgb2b82c1)
        68. [Exercise 3.68](#org3ece18f)
        69. [Exercise 3.69](#orgd35f918)
        70. [Exercise 3.70](#orgea1f7a3)
        71. [Exercise 3.71](#org3024128)
        72. [Exercise 3.72](#org0686eb1)
        73. [Exercise 3.73](#orgbdb6a6c)
        74. [Exercise 3.74](#orgdd365c6)
        75. [Exercise 3.75](#org6b550e2)
        76. [Exercise 3.76](#org396ac50)
        77. [Exercise 3.77](#org82b697d)
        78. [Exercise 3.78](#org21a9a7f)
        79. [Exercise 3.79](#org9da5864)
        80. [Exercise 3.80](#org4dc8e5e)
        81. [Exercise 3.81](#orgc1417db)
        82. [Exercise 3.82](#orgefc29ff)
    4.  [Chapter 4: Metalinguistic Abstraction <code>[0/79]</code>](#org15a582a)
        1.  [Exercise 4.1](#org022feb7)
        2.  [Exercise 4.2](#orgbed52d7)
        3.  [Exercise 4.3](#org7148377)
        4.  [Exercise 4.4](#orgd0d23f6)
        5.  [Exercise 4.5](#org7a49ecc)
        6.  [Exercise 4.6](#org610111b)
        7.  [Exercise 4.7](#org95247cd)
        8.  [Exercise 4.8](#orgca494f2)
        9.  [Exercise 4.9](#org4d68006)
        10. [Exercise 4.10](#orgb751da5)
        11. [Exercise 4.11](#orgabf1634)
        12. [Exercise 4.12](#orgca3fc46)
        13. [Exercise 4.13](#org1543b3d)
        14. [Exercise 4.14](#orgcf91c9f)
        15. [Exercise 4.15](#org7a34f14)
        16. [Exercise 4.16](#orge1ba9c3)
        17. [Exercise 4.17](#org3d780fa)
        18. [Exercise 4.18](#org68c992f)
        19. [Exercise 4.19](#orgc4f44ce)
        20. [Exercise 4.20](#orgf5de6bb)
        21. [Exercise 4.21](#org8e7b44b)
        22. [Exercise 4.22](#org5e91d06)
        23. [Exercise 4.23](#org0c8bc9c)
        24. [Exercise 4.24](#org6048b60)
        25. [Exercise 4.25](#org48b7562)
        26. [Exercise 4.26](#org87ce3e2)
        27. [Exercise 4.27](#org6949a45)
        28. [Exercise 4.28](#org729cd32)
        29. [Exercise 4.29](#org4afae7d)
        30. [Exercise 4.30](#orga68502c)
        31. [Exercise 4.31](#orgc344423)
        32. [Exercise 4.32](#org515ce98)
        33. [Exercise 4.33](#org544fdc9)
        34. [Exercise 4.34](#org8f2c3a4)
        35. [Exercise 4.35](#org51ab961)
        36. [Exercise 4.36](#org0ad5292)
        37. [Exercise 4.37](#org8b4afca)
        38. [Exercise 4.38](#orgd876492)
        39. [Exercise 4.39](#orgb9b9c52)
        40. [Exercise 4.40](#org7f30c29)
        41. [Exercise 4.41](#orgefb7672)
        42. [Exercise 4.42](#orgd3b1c38)
        43. [Exercise 4.43](#org1a99713)
        44. [Exercise 4.44](#orgfd5f632)
        45. [Exercise 4.45](#org61766d1)
        46. [Exercise 4.46](#org7fdf673)
        47. [Exercise 4.47](#orga0d65fa)
        48. [Exercise 4.48](#org69b7663)
        49. [Exercise 4.49](#org09ab996)
        50. [Exercise 4.50](#orgcced876)
        51. [Exercise 4.51](#orgff3e964)
        52. [Exercise 4.52](#org2e2fe87)
        53. [Exercise 4.53](#org9da9a35)
        54. [Exercise 4.54](#orgb6e0a04)
        55. [Exercise 4.55](#orgfe96b87)
        56. [Exercise 4.56](#org14d9d73)
        57. [Exercise 4.57](#orgb947789)
        58. [Exercise 4.58](#org1072ad9)
        59. [Exercise 4.59](#org24c7632)
        60. [Exercise 4.60](#org815f7c6)
        61. [Exercise 4.61](#orgc0e8d7e)
        62. [Exercise 4.62](#org3c54fb2)
        63. [Exercise 4.63](#orgd73ec2c)
        64. [Exercise 4.64](#orgd451fb1)
        65. [Exercise 4.65](#orgdcfbcbc)
        66. [Exercise 4.66](#orgb96b472)
        67. [Exercise 4.67](#orgb15c80f)
        68. [Exercise 4.68](#orge9cb62a)
        69. [Exercise 4.69](#org0b6b46e)
        70. [Exercise 4.70](#org0f298d4)
        71. [Exercise 4.71](#orgfbf4a14)
        72. [Exercise 4.72](#org3150c61)
        73. [Exercise 4.73](#org510bdce)
        74. [Exercise 4.74](#orge3e7c1e)
        75. [Exercise 4.75](#orgea534e0)
        76. [Exercise 4.76](#orgbda643b)
        77. [Exercise 4.77](#org90d886f)
        78. [Exercise 4.78](#org0b32bdd)
        79. [Exercise 4.79](#org9ab8f95)
    5.  [Chapter 5: Computing with Register Machines <code>[0/52]</code>](#org8b326ab)
        1.  [Exercise 5.1](#orgb2546cf)
        2.  [Exercise 5.2](#org67c9f93)
        3.  [Exercise 5.3](#org39ef6b3)
        4.  [Exercise 5.4](#orged6a3d8)
        5.  [Exercise 5.5](#orga0f36b8)
        6.  [Exercise 5.6](#orgd2723fd)
        7.  [Exercise 5.7](#org79d6fa0)
        8.  [Exercise 5.8](#org6c7d5f8)
        9.  [Exercise 5.9](#org405d64c)
        10. [Exercise 5.10](#orgd97402f)
        11. [Exercise 5.11](#orge2f11da)
        12. [Exercise 5.12](#org4c0aceb)
        13. [Exercise 5.13](#orgda6ccd0)
        14. [Exercise 5.14](#org56fecc8)
        15. [Exercise 5.15](#orge38a995)
        16. [Exercise 5.16](#orgf9f2926)
        17. [Exercise 5.17](#orgb2e51af)
        18. [Exercise 5.18](#org9a2a416)
        19. [Exercise 5.19](#orgebe182d)
        20. [Exercise 5.20](#org9b113a0)
        21. [Exercise 5.21](#org4f736b1)
        22. [Exercise 5.22](#org6528e98)
        23. [Exercise 5.23](#org0f9d89b)
        24. [Exercise 5.24](#org5b107d7)
        25. [Exercise 5.25](#orgc31fcee)
        26. [Exercise 5.26](#orga324803)
        27. [Exercise 5.27](#orga4826ec)
        28. [Exercise 5.28](#org91aa566)
        29. [Exercise 5.29](#org464df09)
        30. [Exercise 5.30](#orga284db9)
        31. [Exercise 5.31](#org2a92204)
        32. [Exercise 5.32](#org3287349)
        33. [Exercise 5.33](#orgd129467)
        34. [Exercise 5.34](#org1e81d4a)
        35. [Exercise 5.35](#org19638fd)
        36. [Exercise 5.36](#orga167a46)
        37. [Exercise 5.37](#org461eee0)
        38. [Exercise 5.38](#orgf44d3af)
        39. [Exercise 5.39](#orgc6bf3e5)
        40. [Exercise 5.40](#org95668c2)
        41. [Exercise 5.41](#orgc143f6f)
        42. [Exercise 5.42](#org6271bfd)
        43. [Exercise 5.43](#org8aee3a6)
        44. [Exercise 5.44](#org74fe54e)
        45. [Exercise 5.45](#org3f319fb)
        46. [Exercise 5.46](#org31f3222)
        47. [Exercise 5.47](#orge0b106b)
        48. [Exercise 5.48](#orgd18fd1f)
        49. [Exercise 5.49](#org3ab75aa)
        50. [Exercise 5.50](#orgd9a7088)
        51. [Exercise 5.51](#org4b986f2)
        52. [Exercise 5.52](#org47a3060)



<a id="org0e630ec"></a>

# noweb + common


<a id="orgedb44ff"></a>

## Setting chibi arguments. DANGEROUS     :dangerous:elisp:

    (setq geiser-chibi-extra-command-line-parameters
       '("-m" "chibi" "-m" "chibi show" "-m" "chibi show pretty"
         "-m" "chibi ast" "-m" "chibi time" "-m" "srfi 27"))


<a id="orgf624b8a"></a>

## Some common code blocks

    (import (chibi ast))
    (import (chibi show))
     (define (disp sexp)
       (display sexp)
       (newline))


<a id="orgc825e19"></a>

# SICP <code>[15%]</code>


<a id="orgbda2593"></a>

## TODO Chapter 1: Building abstractions with procedures <code>[57/61]</code>


<a id="orgb69851a"></a>

### Snippet

    (* (+ 2 (* 4 6))
       (+ 3 5 7))

    390


<a id="org688db31"></a>

### Thought

Tree accumulation is the process of computing a thing by traversing a tree.


<a id="org7828f41"></a>

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


<a id="orgcdfd136"></a>

### Snippet

\#+name square

    (define (square x) (* x x))
    (define (sum-of-squares x y)
      (+ (square x) (square y)))
    (sum-of-squares 3 4)

    25


<a id="orgb12dee6"></a>

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


<a id="org8c5bb39"></a>

### DONE Exercise 1.2 Prefix form

    (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

    -37/150


<a id="orgb8aeab4"></a>

### DONE Exercise 1.3 Sum of squares

    (define (sum-of-squares x y)
      (+ (square x) (square y)))
    (import (srfi 95))
    (define (sum-of-two-max a b c)
      (let ((num_list (sort (list a b c) (lambda (a b) (if (> a b) a b)))))
       (sum-of-squares (car num_list) (cadr num_list))))
    (sum-of-two-max 1 2 3)

    13


<a id="org6b0f818"></a>

### DONE Exercise 1.4 Compound expressions

    (define (a-plus-abs-b a b)
      ((if (> b 0) + -) a b))
    (disp (a-plus-abs-b  3 4))
    (disp (a-plus-abs-b  3 -4))

    7
    7


<a id="org97ceb0e"></a>

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


<a id="orgbf72541"></a>

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
    {Exception #19 user "divide by zero" () #<procedure #f> (#f . 529)}

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


<a id="org661d591"></a>

### DONE Exercise 1.7 Good enough?

This exercise is a very misleading one. On the first glance is seems
that this is just about formulating a good criterion. Make no mistake,
practically solving this task means really writing all this code
carefully.

The function we are interested in is:

\begin{equation}
\label{eq:5}
f(x) = \sqrt{x}
\end{equation}

The code given in the chapter before is equivalent to the following
Newton's method formula, where \(f_i\) denotes the next guess:

\begin{equation}
\label{eq:1} 
f_{i+1}_{} = \frac{f_i + \frac{x}{f_i}}{2}
\end{equation}

How on Earth does this formula even appear? Let's remember some
mathematics, namely, the Taylor series (variables unbound):

\begin{equation}
\label{eq:2}
 f(x) = f(x_{0}_{}) + f'(x_{0})(x-x_{0}) + o(x)
\end{equation}

Let us call \`true' value of \(\sqrt{x}=f\). Let us call our first guess
\(f_{0}\). What is the value of the difference (error) between them?
Clearly, \(f-f_0\). Well, the problem is — we don't know \(f\). But we do
know \(f^2\). Therefore \(f^2-f^2_0\) is a number we know. What will be the
error on the next step of the algorithm? Let's find \(f_1\) as
\(f_1=f_0+\delta\). If \(\delta\) is not too big, we can use the Taylor
expansion from ref:eq:1 \(\delta\).

\begin{equation}
\label{eq:8}
E = f^2 - f_0^2 = f^2 - (f_0 + \delta)^2 \approx f^2 - f_0^2 - 2f_0\delta
\end{equation}

Be careful. What I expanded here is not the function value. It is the
<span class="underline">error</span> value. Now, clearly we want our error to be as small as
possible, desirably as little as machine precision would allow. So
assuming \(E=0\), we get an equation to solve:

\begin{align}
\label{eq:9}
E=0 \leftrightarrow& f^2-f_0^2-2f_0\delta=0 \\
\delta =& \frac{f_0^2 -f^2 }{2f_0}
\end{align}

Remember though that we don't need just \(\delta\) here. We actually need
\(f_1\). But \(f_1\) is just \(f_0+\delta\).

\begin{align}
\label{eq:10}
f_1 = \frac{f^2 - f_0^2}{2f_0} + f_0
\end{align}

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


<a id="org2ecdf92"></a>

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


<a id="orgab413d7"></a>

### TODO Figure 1.2 Procedural decomposition of the sqrt program

TODO


<a id="orgcd3f21b"></a>

### TODO Figure 1.3 A linear recursive process for computing \(6!\).

TODO


<a id="org51d624a"></a>

### TODO Figure 1.4 A linear iterative process for computing \(6!\).

TODO


<a id="orge5934c0"></a>

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


<a id="orga042e2a"></a>

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

\begin{eqnarray}
\label{eq:3}
f(n) & = & 2y\\
g(n) & = & 2^y \\
h(n) & = & 2^{2^n}\\
k(n) & = & 5n^2\\
\end{eqnarray}

Actually this is not the Ackermann's function as it is most often
defined, for example, see
<http://mathworld.wolfram.com/AckermannFunction.html>. But the
recurrent relation is the same. This version of the Ackermann's
function seems to be equivalent to the powers tower.

I may have lied with the coefficients, but essentially, the
Ackermann's function with parameters \(n\) and \(m\) works by applying the
n-the hyperoperator m times to 2. A hyperoperator is a generalization
of the standard matematical operator sequence \`+', \`\*', \`^', see
<https://googology.wikia.org/wiki/Hyper_operator>


<a id="org92f5cc7"></a>

### TODO Figure 1.5 The tree-recursive process generated in computing (fib 5)


<a id="org0876656"></a>

### DONE Exercise 1.11 Recursive vs iterative

\begin{equation}
\label{eq:4}
f(n)=\left\{
\begin{array}{l@{\quad:\quad}l}
n & n<3\\
f(n-1) + 2f(n-2) + 3f(n-3) & \ge 3
\end{array}\right.
\end{equation}

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


<a id="org6288a89"></a>

### DONE Exercise 1.12 Recursive Pascal's triangle

\begin{tabular}{rcccccccccc}
 &    &    &    &    &  1\\\noalign{\smallskip\smallskip}
 &    &    &    &  1 &    &  1\\\noalign{\smallskip\smallskip}
 &    &    &  1 &    &  2 &    &  1\\\noalign{\smallskip\smallskip}
 &    &  1 &    &  3 &    &  3 &    &  1\\\noalign{\smallskip\smallskip}
 &  1 &    &  4 &    &  6 &    &  4 &    &  1\\\noalign{\smallskip\smallskip}
 &    &    &    &  . &  . &  . &    &    &   &   \\\noalign{\smallskip\smallskip}
\end{tabular}

    (define (pascal-number line-number column-number)
      (cond ((= line-number 1) 1)
    	((= line-number 2) 1)
    	((= column-number 1) 1)
    	((= column-number line-number) 1)
    	(else (+
    	       (pascal-number (- line-number 1) (- column-number 1))
    	       (pascal-number (- line-number 1) column-number)))))
    (pascal-number 5 3)


<a id="org4f36708"></a>

### DONE Exercise 1.13 Fibonacci

\begin{equation}
\label{eq:6}
\mbox{Fib}(n)=\left\{ 
\begin{array}{l@{\quad:\quad}l}
0 & n=0\\
1 & n=1\\
\mbox{Fib}(n-1) + \mbox{Fib}(n-2) & \mbox{otherwise}}
\end{array}\right.
\end{equation}

Abelson and Sussman define \(\varphi=(1+\sqrt{5})/2\) and \(\psi=(1-\sqrt{5})/2\).

Knowing that \( \mbox{Fib}(n) = (\varphi^{n} - \psi^n)/\sqrt{5}\) is almost all the
problem done, because \(\psi\) is clearly less than \(1\), so for large
\(n\) it will be exponentially close to \(0\), and this is where the
\`\`closest integer'' comes from.

Let us prove the rest by induction.

\begin{eqnarray}
\label{eq:13}
\frac{\varphi^{n-1} - \psi^{n-1} + \varphi^{n-2} - \psi^{n-2}}{\sqrt{5}} &=& \frac{\varphi^{n} - \psi^{n}}{\sqrt{5}}\\
\varphi^{n-1} - \psi^{n-1} + \varphi^{n-2} - \psi^{n-2} &=& \varphi^{n} - \psi^{n} \\
(\varphi + 1)\varphi^{n-2} - (\psi + 1)\psi^{n-2} &=&  \varphi^{n} - \psi^{n}\\
(\varphi + 1 - \varphi^2)\varphi^{n-2} &=&  (\psi + 1 - \psi^2)\psi^{n-2}\\
(\frac{1+\sqrt{5}}{2} + 1 - (\frac{1+\sqrt{5}}{2})^2)\varphi^{n-2} &=&
(\frac{1-\sqrt{5}}{2} + 1 - (\frac{1-\sqrt{5}}{2}))\psi^{n-2} \\
(\frac{2+2\sqrt{5}}{4} + \frac{4}{4} - \frac{1+2\sqrt{5}+5}{4})\varphi^{n-2} &=&
(\frac{2-2\sqrt{5}}{4} + \frac{4}{4} - \frac{1-2\sqrt{5}+5}{4})\psi^{n-2}\\
0&=&0
\end{eqnarray}

This proves that the recurrent relation for \(\frac{\varphi^n-\psi^n}{\sqrt{5}}\) is the
same as for the Fibonacci sequence. Then if we prove that there exist
such \(n\) and \(n-1\) so that \(\mbox{Fib}(n) =
\frac{\varphi^n-\psi^n}{\sqrt{5}}\), then we're done.

Indeed, let's have a look at \(n=1\): \(\frac{1+\sqrt{5}}{2
\sqrt{5}} - \frac{1-\sqrt{5}}{2 \sqrt{5}} = 1\); and \(n=0\): \(
\frac{1-1}{\sqrt{5}} = 0\).


<a id="org5c1ff48"></a>

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

\begin{equation}
\label{eq:14}
C = \Theta(n^a)
\end{equation}


<a id="orgce5ad2f"></a>

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


<a id="org0461d0f"></a>

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
sufficiently small, and that requires \(0.1 > 12.15\cdot(\frac{1}{3})^n \Rightarrow n
= O(\log_3 121.5)\) steps.

`(sine x)` is expandable in constant space and time, `(cube x)` is
expandable in constant space and time if multiplication is an
elementary operation. Therefore the only operation left is
`p`. Therefore, time and space are of equal order of magnitude.

-   \(\left\lceil \log_3 121.5 \right\rceil = 5\)
-   \(O(\ln(a\cdot b))\) where \(a\) is the angle and \(b\) is precision


<a id="org059b365"></a>

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


<a id="org0a60f18"></a>

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


<a id="org76b9af3"></a>

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


<a id="org10eb53d"></a>

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

The formula for \(T\) is the following:

\begin{eqnarray}
T_{pq} \begin{pmatrix} a\\ b \end{pmatrix} & = & \begin{pmatrix} aq+bq+ap \\ bp + aq \end{pmatrix} &\\ 
T_{pq} \left( T_{pq} \begin{pmatrix} a\\ b \end{pmatrix} \right) & = & \begin{pmatrix} (aq+bq+ap)q+(bp + aq)q+(aq+bq+ap)p \\ (bp + aq)p + (aq+bq+ap)q \end{pmatrix} &\\
T_{p'q'}\begin{pmatrix} a\\ b \end{pmatrix} & = & \begin{pmatrix}a(2pq + qq) + a(pp+qq) + b(2pq + qq)\\ a(2pq + qq) + b(pp + qq) \end{pmatrix}& \\
\end{eqnarray}

From here we can easily see the values for \(p\prime\) and \(q'\):

\(p'=pp+qq\), \(q' = 2pq+qq\)

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


<a id="orgfa454b8"></a>

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


<a id="org961dec6"></a>

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


<a id="org84e6ae7"></a>

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


<a id="orgedc1c2e"></a>

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
    1009 *** 0.0068359375
    1011
    1013 *** 0.006103515625
    1015
    1017
    1019 *** 0.00732421875
    
    10000
    10001
    10003
    10005
    10007 *** 0.019287109375
    10009 *** 0.019287109375
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
    10037 *** 0.018798828125
    
    100000
    100001
    100003 *** 0.066162109375
    100005
    100007
    100009
    100011
    100013
    100015
    100017
    100019 *** 0.056884765625
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
    100043 *** 0.055908203125
    
    1000000
    1000001
    1000003 *** 0.178955078125
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
    1000033 *** 0.18603515625
    1000035
    1000037 *** 0.176025390625

-   Write the procedure: done.
-   Find the smallest three primes greater than 1000   : found.
-   Find the smallest three primes greater than 10000  : found.
-   Find the smallest three primes greater than 100000 : found.
-   Find the smallest three primes greater than 1000000: found.
-   The timing data confirms the prediction. \(\sqrt{10}\approx3\), \(0.16 \approx 3\cdot1.05\).
-   The execution time per step for testing 1.000.000 is 1.63e-07. The
    execution time per step for testing 100.000 5.3199e-07. At least on
    my machine the claim doesn't seem to hold very well.


<a id="org39c2911"></a>

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

    
    1009 *** 0.0107421875
    1013 *** 0.0048828125
    1019 *** 0.004150390625
    10007 *** 0.010986328125
    10009 *** 0.010986328125
    10037 *** 0.01123046875
    100003 *** 0.032958984375
    100019 *** 0.032958984375
    100043 *** 0.032958984375
    1000003 *** 0.10107421875
    1000033 *** 0.10009765625
    1000037 *** 0.10009765625

We can see that the test does show a speed improvement, although not
as impressive as 2 times. We can observe that the number of steps is
not really halved, since `(+ a b)` requires one operation, and `(if (=
2 x) 3 else (+ 3 2))` requires three operations, so the speed should
improve by 3/2, which we can observe.


<a id="org8c4a12b"></a>

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

    
    1009 *** 0.053955078125
    1013 *** 0.0458984375
    1019 *** 0.0478515625
    10007 *** 0.05712890625
    10009 *** 0.06103515625
    10037 *** 0.056884765625
    100003 *** 0.065185546875
    100019 *** 0.067138671875
    100043 *** 0.06689453125
    1000003 *** 0.07470703125
    1000033 *** 0.076171875
    1000037 *** 0.0771484375
    1000
    6601 *** 0.052001953125

Firstly, observe that the interpreter seems to be doing some black magic, so
that the test for 1009 takes more time than the test for 1013.

Secondly, observe that indeed, the speed seems to have reduced its dependence
on the length of a number, and if we want to test even bigger numbers, the
dependency should become even smaller, as \(\log(n)\) grows very slowly. In
particular, comparing the range around 1000 and 1000.000, the ratio of
\(\frac{\log_{10}(1000000)}{\log_{10}(1000)} = \frac{6}{3} = 2\). This doesn't seem
to be completely the case, but hey, there may be some constants involved, as
well as some interpreter dark magic.


<a id="org3d83e9a"></a>

### DONE Exercise 1.25 expmod

Well, in principle, Alyssa's algorithm should work. The problem here really
is that we would have to store the number \(a^n\), which is a very big number,
especially because we are interested in testing primality of very large
numbers (e.g., 512-bit long cryptography keys), and \((2^{256-1})^{2^{256}}\)
is a very large number.


<a id="orgfb0e09d"></a>

### DONE Exercise 1.26 square vs mul

The hint here lies in the name of the person helping Louis. Eva Lu Ator
sounds similar to "evaluator", and the reason for Louis's problem really lies
in the optimization capabilities of the interpreter. That is, if the
evaluating algorithm uses applicative order, then the `expmod` is evaluated
twice per step, which makes `(/ exp 2)` useless. If, however, the interpreter
can memoize the results, his algorithm would be just as good.


<a id="org5c80963"></a>

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

We already have a procedure that computes \(a^n\mod n\), and a procedure that
computes \(a\mod n\) is even a scheme primitive. Moreover, we even have all
the code that does the comparison, with the single difference - our existing
code takes an initial guess uniformly at random, whereas we need to check all
\( a < n\).

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


<a id="org05117ca"></a>

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

    
    1009 *** 0.102783203125
    1013 *** 0.092041015625
    1019 *** 0.093017578125
    10007 *** 0.120849609375
    10009 *** 0.133056640625
    10037 *** 0.11181640625
    100003 *** 0.132080078125
    100019 *** 0.1337890625
    100043 *** 0.134033203125
    1000003 *** 0.153076171875
    1000033 *** 0.157958984375
    1000037 *** 0.163818359375
    1000
    6601

I used the `(let)` construction introduced in the later chapters, because I
find bindings with nested procedures confusing.


<a id="org9a19704"></a>

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


<a id="org25afc62"></a>

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


<a id="org9be1d0e"></a>

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


<a id="orgdf386d5"></a>

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


<a id="org73b780f"></a>

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


<a id="org5c950ec"></a>

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


<a id="org645368a"></a>

### DONE Exercise 1.35 fixed-point

\(\varphi = \frac{1+\sqrt{5}}{2}\)
\(x\mapsto 1+\frac{1}{x}\)
Let's substitute:
\( \frac{1+\sqrt{5}}{2} &=& 1+ \frac{2}{1+\sqrt{5}} \)
\( (1+\sqrt{5})^2 = 2(1+\sqrt{5})+ 4\)
\( 1 + 2 \sqrt{5} + 5 = 2 + 2 \sqrt{5} + 4 \)
\(6 = 6\)

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


<a id="orgb0e6f79"></a>

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

To find a solution to \(x^x=1000\), let us rearrange: \( x = \log_x1000 =
\frac{\log 1000}{\log x}\).

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


<a id="org5ccb678"></a>

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
    
    Abelson and Sussman tell us to estimate \(k\) needed to approximate the \(\varphi\) to a required
    degree (0.0001). I didn't manage to derive the formula myself, however, I can
    give a link to the book where this proof is given:
    
    Khinchin, Continued Fractions (1935), chapter 2, section 7, gives an upper
    bound on the speed of convergence as \(\frac{1}{k^2}\). Therefore we should
    expect \(k \approx \sqrt{1000} \approx 33\). This holds for an arbitrary convergent
    continued fraction. In our case, however, when \(N_k=D_k=1\), the constant in
    the rate is also known as \(\sqrt{5}\), so the equation we need to solve is
    in fact \(k^2 \sqrt{5} = 1000\), and in practice that is
    \(\sqrt{\frac{1000}{2.23}} = 21\). How exactly we managed to do it in 14
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


<a id="org9750c2e"></a>

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


<a id="org9f337f6"></a>

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


<a id="org5198204"></a>

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


<a id="org215d5b5"></a>

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

\(21 = 5 + 16\)
Double really works as a power of a function. \( 2 \Rightarrow 2^2 \Rightarrow2^{2^2} =
\mbox{inc}^{16} 5 \)


<a id="orgab1cc9f"></a>

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


<a id="orgbb968b7"></a>

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


<a id="orgd46effc"></a>

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


<a id="orgad87e17"></a>

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


<a id="orgd904117"></a>

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


<a id="orga7df096"></a>

## TODO Chapter 2: Building abstractions with Data <code>[0/97]</code>


<a id="orgf8d6a38"></a>

### TODO Exercise 2.1


<a id="org7d6d0d4"></a>

### TODO Exercise 2.2


<a id="org2a78b65"></a>

### TODO Exercise 2.3


<a id="orgdb2c27e"></a>

### TODO Exercise 2.4


<a id="orgaae2185"></a>

### TODO Exercise 2.5


<a id="orgb0549b4"></a>

### TODO Exercise 2.6


<a id="org2855294"></a>

### TODO Exercise 2.7


<a id="org099b99a"></a>

### TODO Exercise 2.8


<a id="orga7af83f"></a>

### TODO Exercise 2.9


<a id="org703d679"></a>

### TODO Exercise 2.10


<a id="org8e7279e"></a>

### TODO Exercise 2.11


<a id="orgb4710c8"></a>

### TODO Exercise 2.12


<a id="org4d09a43"></a>

### TODO Exercise 2.13


<a id="org49f03b9"></a>

### TODO Exercise 2.14


<a id="org74b106d"></a>

### TODO Exercise 2.15


<a id="org2a3b9b4"></a>

### TODO Exercise 2.16


<a id="orga17e0b8"></a>

### TODO Exercise 2.17


<a id="orgd99b5da"></a>

### TODO Exercise 2.18


<a id="org00c0e93"></a>

### TODO Exercise 2.19


<a id="org25690b7"></a>

### TODO Exercise 2.20


<a id="org39a8599"></a>

### TODO Exercise 2.21


<a id="orgbbb4e6f"></a>

### TODO Exercise 2.22


<a id="orgd181028"></a>

### TODO Exercise 2.23


<a id="org4a96186"></a>

### TODO Exercise 2.24


<a id="org395e24c"></a>

### TODO Exercise 2.25


<a id="org0ad14b6"></a>

### TODO Exercise 2.26


<a id="org2c4df3c"></a>

### TODO Exercise 2.27


<a id="orgefc8c4d"></a>

### TODO Exercise 2.28


<a id="org4ff0b32"></a>

### TODO Exercise 2.29


<a id="org34c398b"></a>

### TODO Exercise 2.30


<a id="org6c46c3f"></a>

### TODO Exercise 2.31


<a id="org189805c"></a>

### TODO Exercise 2.32


<a id="org1dd9af1"></a>

### TODO Exercise 2.33


<a id="orgfcd163c"></a>

### TODO Exercise 2.34


<a id="orgc3e2417"></a>

### TODO Exercise 2.35


<a id="orga2ebd50"></a>

### TODO Exercise 2.36


<a id="org3a56d7b"></a>

### TODO Exercise 2.37


<a id="org14c31dc"></a>

### TODO Exercise 2.38


<a id="org08bd32a"></a>

### TODO Exercise 2.39


<a id="org4e4b512"></a>

### TODO Exercise 2.40


<a id="orgb352789"></a>

### TODO Exercise 2.41


<a id="orgf47364c"></a>

### TODO Exercise 2.42


<a id="orgade970e"></a>

### TODO Exercise 2.43


<a id="org73c7d7e"></a>

### TODO Exercise 2.44


<a id="org78d1f3b"></a>

### TODO Exercise 2.45


<a id="orgd2b9f44"></a>

### TODO Exercise 2.46


<a id="org23124af"></a>

### TODO Exercise 2.47


<a id="orga3b7384"></a>

### TODO Exercise 2.48


<a id="orgba2e611"></a>

### TODO Exercise 2.49


<a id="org1d6547e"></a>

### TODO Exercise 2.50


<a id="orgee6e73e"></a>

### TODO Exercise 2.51


<a id="org0bf9d4c"></a>

### TODO Exercise 2.52


<a id="orgf76c024"></a>

### TODO Exercise 2.53


<a id="org71c2c90"></a>

### TODO Exercise 2.54


<a id="org68f76b0"></a>

### TODO Exercise 2.55


<a id="orga70c8fc"></a>

### TODO Exercise 2.56


<a id="orgb901e25"></a>

### TODO Exercise 2.57


<a id="orgea1949b"></a>

### TODO Exercise 2.58


<a id="org2eea9cb"></a>

### TODO Exercise 2.59


<a id="orge841d3d"></a>

### TODO Exercise 2.60


<a id="org9235380"></a>

### TODO Exercise 2.61


<a id="orgd055ba9"></a>

### TODO Exercise 2.62


<a id="orgf449329"></a>

### TODO Exercise 2.63


<a id="org56b0f27"></a>

### TODO Exercise 2.64


<a id="org46ebb9c"></a>

### TODO Exercise 2.65


<a id="org9ae4143"></a>

### TODO Exercise 2.66


<a id="orgb7711cf"></a>

### TODO Exercise 2.67


<a id="org20771dd"></a>

### TODO Exercise 2.68


<a id="org9c0e8aa"></a>

### TODO Exercise 2.69


<a id="orgde14e6c"></a>

### TODO Exercise 2.70


<a id="org5962aab"></a>

### TODO Exercise 2.71


<a id="org455f833"></a>

### TODO Exercise 2.72


<a id="orgb8a2328"></a>

### TODO Exercise 2.73


<a id="orgc4fd0a4"></a>

### TODO Exercise 2.74


<a id="org8f95474"></a>

### TODO Exercise 2.75


<a id="orgabfc978"></a>

### TODO Exercise 2.76


<a id="org7e448db"></a>

### TODO Exercise 2.77


<a id="orgfce6cdb"></a>

### TODO Exercise 2.78


<a id="org678f839"></a>

### TODO Exercise 2.79


<a id="org589009c"></a>

### TODO Exercise 2.80


<a id="org8ebb34a"></a>

### TODO Exercise 2.81


<a id="org75d623f"></a>

### TODO Exercise 2.82


<a id="org1e835f5"></a>

### TODO Exercise 2.83


<a id="orgd79b611"></a>

### TODO Exercise 2.84


<a id="org82a754a"></a>

### TODO Exercise 2.85


<a id="org95ceb50"></a>

### TODO Exercise 2.86


<a id="org3964a7c"></a>

### TODO Exercise 2.87


<a id="orgff63ef5"></a>

### TODO Exercise 2.88


<a id="orgdfcfd2c"></a>

### TODO Exercise 2.89


<a id="org49c2ad0"></a>

### TODO Exercise 2.90


<a id="org7a1fc96"></a>

### TODO Exercise 2.91


<a id="org1859a44"></a>

### TODO Exercise 2.92


<a id="org5dc2e3f"></a>

### TODO Exercise 2.93


<a id="org765ab4b"></a>

### TODO Exercise 2.94


<a id="orgbd24e55"></a>

### TODO Exercise 2.95


<a id="org218cfd7"></a>

### TODO Exercise 2.96


<a id="org4555862"></a>

### TODO Exercise 2.97


<a id="org065b21d"></a>

## TODO Chapter 3: Modularity, Objects and State <code>[0/82]</code>


<a id="orged05049"></a>

### TODO Exercise 3.1


<a id="orgb45dbd2"></a>

### TODO Exercise 3.2


<a id="org16e9279"></a>

### TODO Exercise 3.3


<a id="orgb1e6fb6"></a>

### TODO Exercise 3.4


<a id="org2d1902e"></a>

### TODO Exercise 3.5


<a id="orga88271d"></a>

### TODO Exercise 3.6


<a id="org7fb20e0"></a>

### TODO Exercise 3.7


<a id="orgdd01252"></a>

### TODO Exercise 3.8


<a id="org90fafdf"></a>

### TODO Exercise 3.9


<a id="orge13a3e2"></a>

### TODO Exercise 3.10


<a id="org07b96a0"></a>

### TODO Exercise 3.11


<a id="orgc3eceda"></a>

### TODO Exercise 3.12


<a id="org9ff51e9"></a>

### TODO Exercise 3.13


<a id="org35186bf"></a>

### TODO Exercise 3.14


<a id="org5176208"></a>

### TODO Exercise 3.15


<a id="org0bcf2c6"></a>

### TODO Exercise 3.16


<a id="orgd235e9f"></a>

### TODO Exercise 3.17


<a id="orgfd35d70"></a>

### TODO Exercise 3.18


<a id="org7112fcd"></a>

### TODO Exercise 3.19


<a id="orgc6ab890"></a>

### TODO Exercise 3.20


<a id="org759f8f2"></a>

### TODO Exercise 3.21


<a id="orgf22ecf6"></a>

### TODO Exercise 3.22


<a id="orgb85bf3a"></a>

### TODO Exercise 3.23


<a id="orgedbbe04"></a>

### TODO Exercise 3.24


<a id="orgd0dd77b"></a>

### TODO Exercise 3.25


<a id="orga5dcebc"></a>

### TODO Exercise 3.26


<a id="org598ca81"></a>

### TODO Exercise 3.27


<a id="orgb229668"></a>

### TODO Exercise 3.28


<a id="org48098b2"></a>

### TODO Exercise 3.29


<a id="orgbfac591"></a>

### TODO Exercise 3.30


<a id="orga5530f9"></a>

### TODO Exercise 3.31


<a id="org0ddac1c"></a>

### TODO Exercise 3.32


<a id="org1d14fa7"></a>

### TODO Exercise 3.33


<a id="org09fe536"></a>

### TODO Exercise 3.34


<a id="orge36e21e"></a>

### TODO Exercise 3.35


<a id="orga665fd1"></a>

### TODO Exercise 3.36


<a id="org3f26b12"></a>

### TODO Exercise 3.37


<a id="org774f518"></a>

### TODO Exercise 3.38


<a id="org856481a"></a>

### TODO Exercise 3.39


<a id="org55ebb15"></a>

### TODO Exercise 3.40


<a id="orgad2b1a6"></a>

### TODO Exercise 3.41


<a id="orge765835"></a>

### TODO Exercise 3.42


<a id="orgddb497e"></a>

### TODO Exercise 3.43


<a id="org81f3d7b"></a>

### TODO Exercise 3.44


<a id="orgb2fdbb0"></a>

### TODO Exercise 3.45


<a id="org87d8ada"></a>

### TODO Exercise 3.46


<a id="orgacd782d"></a>

### TODO Exercise 3.47


<a id="orgea804a5"></a>

### TODO Exercise 3.48


<a id="org1908a65"></a>

### TODO Exercise 3.49


<a id="orgf3dadac"></a>

### TODO Exercise 3.50


<a id="org6f876aa"></a>

### TODO Exercise 3.51


<a id="orgb5453ab"></a>

### TODO Exercise 3.52


<a id="org64c9e94"></a>

### TODO Exercise 3.53


<a id="org2820eb4"></a>

### TODO Exercise 3.54


<a id="org172aaed"></a>

### TODO Exercise 3.55


<a id="org06c91b4"></a>

### TODO Exercise 3.56


<a id="org30d3626"></a>

### TODO Exercise 3.57


<a id="org9b44321"></a>

### TODO Exercise 3.58


<a id="org150faee"></a>

### TODO Exercise 3.59


<a id="org76ac168"></a>

### TODO Exercise 3.60


<a id="org1e41368"></a>

### TODO Exercise 3.61


<a id="org15a7848"></a>

### TODO Exercise 3.62


<a id="orgd885033"></a>

### TODO Exercise 3.63


<a id="org587b8ab"></a>

### TODO Exercise 3.64


<a id="org5935368"></a>

### TODO Exercise 3.65


<a id="org3fb0356"></a>

### TODO Exercise 3.66


<a id="orgb2b82c1"></a>

### TODO Exercise 3.67


<a id="org3ece18f"></a>

### TODO Exercise 3.68


<a id="orgd35f918"></a>

### TODO Exercise 3.69


<a id="orgea1f7a3"></a>

### TODO Exercise 3.70


<a id="org3024128"></a>

### TODO Exercise 3.71


<a id="org0686eb1"></a>

### TODO Exercise 3.72


<a id="orgbdb6a6c"></a>

### TODO Exercise 3.73


<a id="orgdd365c6"></a>

### TODO Exercise 3.74


<a id="org6b550e2"></a>

### TODO Exercise 3.75


<a id="org396ac50"></a>

### TODO Exercise 3.76


<a id="org82b697d"></a>

### TODO Exercise 3.77


<a id="org21a9a7f"></a>

### TODO Exercise 3.78


<a id="org9da5864"></a>

### TODO Exercise 3.79


<a id="org4dc8e5e"></a>

### TODO Exercise 3.80


<a id="orgc1417db"></a>

### TODO Exercise 3.81


<a id="orgefc29ff"></a>

### TODO Exercise 3.82


<a id="org15a582a"></a>

## TODO Chapter 4: Metalinguistic Abstraction <code>[0/79]</code>


<a id="org022feb7"></a>

### TODO Exercise 4.1


<a id="orgbed52d7"></a>

### TODO Exercise 4.2


<a id="org7148377"></a>

### TODO Exercise 4.3


<a id="orgd0d23f6"></a>

### TODO Exercise 4.4


<a id="org7a49ecc"></a>

### TODO Exercise 4.5


<a id="org610111b"></a>

### TODO Exercise 4.6


<a id="org95247cd"></a>

### TODO Exercise 4.7


<a id="orgca494f2"></a>

### TODO Exercise 4.8


<a id="org4d68006"></a>

### TODO Exercise 4.9


<a id="orgb751da5"></a>

### TODO Exercise 4.10


<a id="orgabf1634"></a>

### TODO Exercise 4.11


<a id="orgca3fc46"></a>

### TODO Exercise 4.12


<a id="org1543b3d"></a>

### TODO Exercise 4.13


<a id="orgcf91c9f"></a>

### TODO Exercise 4.14


<a id="org7a34f14"></a>

### TODO Exercise 4.15


<a id="orge1ba9c3"></a>

### TODO Exercise 4.16


<a id="org3d780fa"></a>

### TODO Exercise 4.17


<a id="org68c992f"></a>

### TODO Exercise 4.18


<a id="orgc4f44ce"></a>

### TODO Exercise 4.19


<a id="orgf5de6bb"></a>

### TODO Exercise 4.20


<a id="org8e7b44b"></a>

### TODO Exercise 4.21


<a id="org5e91d06"></a>

### TODO Exercise 4.22


<a id="org0c8bc9c"></a>

### TODO Exercise 4.23


<a id="org6048b60"></a>

### TODO Exercise 4.24


<a id="org48b7562"></a>

### TODO Exercise 4.25


<a id="org87ce3e2"></a>

### TODO Exercise 4.26


<a id="org6949a45"></a>

### TODO Exercise 4.27


<a id="org729cd32"></a>

### TODO Exercise 4.28


<a id="org4afae7d"></a>

### TODO Exercise 4.29


<a id="orga68502c"></a>

### TODO Exercise 4.30


<a id="orgc344423"></a>

### TODO Exercise 4.31


<a id="org515ce98"></a>

### TODO Exercise 4.32


<a id="org544fdc9"></a>

### TODO Exercise 4.33


<a id="org8f2c3a4"></a>

### TODO Exercise 4.34


<a id="org51ab961"></a>

### TODO Exercise 4.35


<a id="org0ad5292"></a>

### TODO Exercise 4.36


<a id="org8b4afca"></a>

### TODO Exercise 4.37


<a id="orgd876492"></a>

### TODO Exercise 4.38


<a id="orgb9b9c52"></a>

### TODO Exercise 4.39


<a id="org7f30c29"></a>

### TODO Exercise 4.40


<a id="orgefb7672"></a>

### TODO Exercise 4.41


<a id="orgd3b1c38"></a>

### TODO Exercise 4.42


<a id="org1a99713"></a>

### TODO Exercise 4.43


<a id="orgfd5f632"></a>

### TODO Exercise 4.44


<a id="org61766d1"></a>

### TODO Exercise 4.45


<a id="org7fdf673"></a>

### TODO Exercise 4.46


<a id="orga0d65fa"></a>

### TODO Exercise 4.47


<a id="org69b7663"></a>

### TODO Exercise 4.48


<a id="org09ab996"></a>

### TODO Exercise 4.49


<a id="orgcced876"></a>

### TODO Exercise 4.50


<a id="orgff3e964"></a>

### TODO Exercise 4.51


<a id="org2e2fe87"></a>

### TODO Exercise 4.52


<a id="org9da9a35"></a>

### TODO Exercise 4.53


<a id="orgb6e0a04"></a>

### TODO Exercise 4.54


<a id="orgfe96b87"></a>

### TODO Exercise 4.55


<a id="org14d9d73"></a>

### TODO Exercise 4.56


<a id="orgb947789"></a>

### TODO Exercise 4.57


<a id="org1072ad9"></a>

### TODO Exercise 4.58


<a id="org24c7632"></a>

### TODO Exercise 4.59


<a id="org815f7c6"></a>

### TODO Exercise 4.60


<a id="orgc0e8d7e"></a>

### TODO Exercise 4.61


<a id="org3c54fb2"></a>

### TODO Exercise 4.62


<a id="orgd73ec2c"></a>

### TODO Exercise 4.63


<a id="orgd451fb1"></a>

### TODO Exercise 4.64


<a id="orgdcfbcbc"></a>

### TODO Exercise 4.65


<a id="orgb96b472"></a>

### TODO Exercise 4.66


<a id="orgb15c80f"></a>

### TODO Exercise 4.67


<a id="orge9cb62a"></a>

### TODO Exercise 4.68


<a id="org0b6b46e"></a>

### TODO Exercise 4.69


<a id="org0f298d4"></a>

### TODO Exercise 4.70


<a id="orgfbf4a14"></a>

### TODO Exercise 4.71


<a id="org3150c61"></a>

### TODO Exercise 4.72


<a id="org510bdce"></a>

### TODO Exercise 4.73


<a id="orge3e7c1e"></a>

### TODO Exercise 4.74


<a id="orgea534e0"></a>

### TODO Exercise 4.75


<a id="orgbda643b"></a>

### TODO Exercise 4.76


<a id="org90d886f"></a>

### TODO Exercise 4.77


<a id="org0b32bdd"></a>

### TODO Exercise 4.78


<a id="org9ab8f95"></a>

### TODO Exercise 4.79


<a id="org8b326ab"></a>

## TODO Chapter 5: Computing with Register Machines <code>[0/52]</code>


<a id="orgb2546cf"></a>

### TODO Exercise 5.1


<a id="org67c9f93"></a>

### TODO Exercise 5.2


<a id="org39ef6b3"></a>

### TODO Exercise 5.3


<a id="orged6a3d8"></a>

### TODO Exercise 5.4


<a id="orga0f36b8"></a>

### TODO Exercise 5.5


<a id="orgd2723fd"></a>

### TODO Exercise 5.6


<a id="org79d6fa0"></a>

### TODO Exercise 5.7


<a id="org6c7d5f8"></a>

### TODO Exercise 5.8


<a id="org405d64c"></a>

### TODO Exercise 5.9


<a id="orgd97402f"></a>

### TODO Exercise 5.10


<a id="orge2f11da"></a>

### TODO Exercise 5.11


<a id="org4c0aceb"></a>

### TODO Exercise 5.12


<a id="orgda6ccd0"></a>

### TODO Exercise 5.13


<a id="org56fecc8"></a>

### TODO Exercise 5.14


<a id="orge38a995"></a>

### TODO Exercise 5.15


<a id="orgf9f2926"></a>

### TODO Exercise 5.16


<a id="orgb2e51af"></a>

### TODO Exercise 5.17


<a id="org9a2a416"></a>

### TODO Exercise 5.18


<a id="orgebe182d"></a>

### TODO Exercise 5.19


<a id="org9b113a0"></a>

### TODO Exercise 5.20


<a id="org4f736b1"></a>

### TODO Exercise 5.21


<a id="org6528e98"></a>

### TODO Exercise 5.22


<a id="org0f9d89b"></a>

### TODO Exercise 5.23


<a id="org5b107d7"></a>

### TODO Exercise 5.24


<a id="orgc31fcee"></a>

### TODO Exercise 5.25


<a id="orga324803"></a>

### TODO Exercise 5.26


<a id="orga4826ec"></a>

### TODO Exercise 5.27


<a id="org91aa566"></a>

### TODO Exercise 5.28


<a id="org464df09"></a>

### TODO Exercise 5.29


<a id="orga284db9"></a>

### TODO Exercise 5.30


<a id="org2a92204"></a>

### TODO Exercise 5.31


<a id="org3287349"></a>

### TODO Exercise 5.32


<a id="orgd129467"></a>

### TODO Exercise 5.33


<a id="org1e81d4a"></a>

### TODO Exercise 5.34


<a id="org19638fd"></a>

### TODO Exercise 5.35


<a id="orga167a46"></a>

### TODO Exercise 5.36


<a id="org461eee0"></a>

### TODO Exercise 5.37


<a id="orgf44d3af"></a>

### TODO Exercise 5.38


<a id="orgc6bf3e5"></a>

### TODO Exercise 5.39


<a id="org95668c2"></a>

### TODO Exercise 5.40


<a id="orgc143f6f"></a>

### TODO Exercise 5.41


<a id="org6271bfd"></a>

### TODO Exercise 5.42


<a id="org8aee3a6"></a>

### TODO Exercise 5.43


<a id="org74fe54e"></a>

### TODO Exercise 5.44


<a id="org3f319fb"></a>

### TODO Exercise 5.45


<a id="org31f3222"></a>

### TODO Exercise 5.46


<a id="orge0b106b"></a>

### TODO Exercise 5.47


<a id="orgd18fd1f"></a>

### TODO Exercise 5.48


<a id="org3ab75aa"></a>

### TODO Exercise 5.49


<a id="orgd9a7088"></a>

### TODO Exercise 5.50


<a id="org4b986f2"></a>

### TODO Exercise 5.51


<a id="org47a3060"></a>

### TODO Exercise 5.52


# Footnotes

<sup><a id="fn.1" href="#fnr.1">1</a></sup> This exercise took me 7 hours.
