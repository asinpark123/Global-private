import psycopg

# Connect to an existing database
# globalcore_local public schema connection
with psycopg.connect("dbname=globalcore_local user=postgres password='an!mat10N' host='localhost' port= '5432'") as conn:

    new_glEntity_gfContacts = [(2626,154),(2627,155),(2628,156),(2629,157),(2630,158),(2631,159),(2632,160),(2633,161),(2634,162),(2635,163),(2636,164),(2637,165),(2638,167),(2639,168),(2640,169),(2641,170),(2642,171),(2643,172),(2644,173),(2645,174),(2646,175),(2647,176),(2648,177),(2649,178),(2650,179),(2651,180),(2652,181),(2653,182),(2654,183),(2655,184),(2656,185),(2657,200),(2658,201),(2659,202),(2660,203),(2661,204),(2662,205),(2663,206),(2664,207),(2665,443),(2666,444),(2667,445),(2668,446),(2669,447),(2670,448),(2671,449),(2672,450),(2673,451),(2674,452),(2675,453),(2676,454),(2677,455),(2678,456),(2679,457),(2680,458),(2681,459),(2682,460),(2683,461),(2684,462),(2685,463),(2686,464),(2687,465),(2688,466),(2689,467),(2690,468),(2691,469),(2692,470),(2693,471),(2694,472),(2695,473),(2696,474),(2697,475),(2698,476),(2699,477),(2700,478),(2701,479),(2702,480),(2703,481),(2704,482),(2705,483),(2706,484),(2707,485),(2708,486),(2709,487),(2710,488),(2711,489),(2712,490),(2713,491),(2714,492),(2715,493),(2716,494),(2717,495),(2718,496),(2719,497),(2720,498),(2721,499),(2722,500),(2723,501),(2724,502),(2725,503),(2726,504),(2727,505),(2728,506),(2729,507),(2730,508),(2731,509),(2732,510),(2733,511),(2734,512),(2735,513),(2736,514),(2737,515),(2738,516),(2739,517),(2740,518),(2741,519),(2742,520),(2743,521),(2744,522),(2745,523),(2746,524),(2747,525),(2748,526),(2749,527),(2750,528),(2751,529),(2752,530),(2753,531),(2754,532),(2755,533),(2756,534),(2757,535),(2758,536),(2759,537),(2760,538),(2761,539),(2762,540),(2763,541),(2764,542),(2765,543),(2766,544),(2767,545),(2768,546),(2769,547),(2770,548),(2771,549),(2772,550),(2773,551),(2774,552),(2775,553),(2776,554),(2777,555),(2778,556),(2779,557),(2780,558),(2781,559),(2782,560),(2783,561),(2784,562),(2785,563),(2786,564),(2787,565),(2788,566),(2789,567),(2790,568),(2791,569),(2792,570),(2793,571),(2794,572),(2795,573),(2796,574),(2797,575),(2798,576),(2799,577),(2800,578),(2801,579),(2802,580),(2803,581),(2804,582),(2805,583),(2806,584),(2807,585),(2808,586),(2809,587),(2810,588),(2811,589),(2812,590),(2813,591),(2814,592),(2815,593),(2816,594),(2817,595),(2818,596),(2819,597),(2820,598),(2821,599),(2822,600),(2823,601),(2824,602),(2825,603),(2826,604),(2827,605),(2828,606),(2829,607),(2830,608),(2831,609),(2832,610),(2833,611),(2834,612),(2835,613),(2836,614),(2837,615),(2838,616),(2839,617),(2840,618),(2841,619),(2842,620),(2843,621),(2844,622),(2845,623),(2846,624),(2847,625),(2848,626),(2849,627),(2850,628),(2851,629),(2852,630),(2853,631),(2854,632),(2855,633),(2856,634),(2857,635),(2858,636),(2859,637),(2860,638),(2861,639),(2862,640),(2863,641),(2864,642),(2865,643),(2866,644),(2867,645),(2868,646),(2869,647),(2870,648),(2871,649),(2872,650),(2873,651),(2874,652),(2875,653),(2876,654),(2877,655),(2878,656),(2879,657),(2880,658),(2881,659),(2882,660),(2883,661),(2884,662),(2885,663),(2886,664),(2887,665),(2888,666),(2889,667),(2890,668),(2891,669),(2892,670),(2893,671),(2894,672),(2895,673),(2896,674),(2897,675),(2898,676),(2899,677),(2900,678),(2901,679),(2902,680),(2903,681),(2904,682),(2905,683),(2906,684),(2907,685),(2908,686),(2909,687),(2910,688),(2911,689),(2912,690),(2913,691),(2914,692),(2915,693),(2916,694),(2917,695),(2918,696),(2919,697),(2920,698),(2921,699),(2922,700),(2923,701),(2924,702),(2925,703),(2926,704),(2927,705),(2928,706),(2929,708),(2930,709),(2931,710),(2932,711),(2933,712),(2934,713),(2935,714),(2936,715),(2937,716),(2938,717),(2939,718),(2940,719),(2941,720),(2942,721),(2943,722),(2944,723),(2945,724),(2946,725),(2947,726),(2948,727),(2949,728),(2950,729),(2951,730),(2952,731),(2953,732),(2954,733),(2955,734),(2956,735),(2957,736),(2958,737),(2959,738),(2960,739),(2961,740),(2962,741),(2963,742),(2964,743),(2965,744),(2966,745),(2967,746),(2968,747),(2969,748),(2970,749),(2971,750),(2972,751),(2973,752),(2974,753),(2975,754),(2976,755),(2977,756),(2978,757),(2979,758),(2980,759),(2981,760),(2982,761),(2983,762),(2984,763),(2985,764),(2986,765),(2987,766),(2988,767),(2989,768),(2990,769),(2991,770),(2992,771),(2993,772),(2994,773),(2995,774),(2996,775),(2997,776),(2998,777),(2999,778),(3000,779),(3001,780),(3002,781),(3003,782),(3004,783),(3005,784),(3006,785),(3007,786),(3008,787),(3009,788),(3010,789),(3011,790),(3012,791),(3013,792),(3014,793),(3015,794),(3016,795),(3017,796),(3018,797),(3019,798),(3020,799),(3021,800),(3022,801),(3023,802),(3024,803),(3025,804),(3026,805),(3027,806),(3028,807),(3029,808),(3030,809),(3031,810),(3032,811),(3033,812),(3034,813),(3035,814),(3036,815),(3037,816),(3038,817),(3039,818),(3040,819),(3041,820),(3042,821),(3043,822),(3044,823),(3045,824),(3046,825),(3047,826),(3048,827),(3049,828),(3050,829),(3051,830),(3052,831),(3053,832),(3054,833),(3055,834),(3056,835),(3057,836),(3058,837),(3059,838),(3060,839),(3061,840),(3062,841),(3063,842),(3064,843),(3065,844),(3066,845),(3067,846),(3068,847),(3069,848),(3070,849),(3071,850),(3072,851),(3073,852),(3074,853),(3075,854),(3076,855),(3077,856),(3078,857),(3079,858),(3080,859),(3081,860),(3082,861),(3083,862),(3084,863),(3085,864),(3086,865),(3087,866),(3088,867),(3089,868),(3090,869),(3091,870),(3092,871),(3093,872),(3094,873),(3095,874),(3096,875),(3097,876),(3098,877),(3099,878),(3100,879),(3101,880),(3102,881),(3103,882),(3104,883),(3105,884),(3106,885),(3107,886),(3108,887),(3109,888),(3110,889),(3111,890),(3112,891),(3113,892),(3114,893),(3115,894),(3116,895),(3117,896),(3118,897),(3119,898),(3120,899),(3121,900),(3122,901),(3123,902),(3124,903),(3125,904),(3126,905),(3127,906),(3128,907),(3129,908),(3130,909),(3131,910),(3132,911),(3133,912),(3134,913),(3135,914),(3136,915),(3137,916),(3138,917),(3139,918),(3140,919),(3141,920),(3142,921),(3143,922),(3144,923),(3145,924),(3146,925),(3147,926),(3148,927),(3149,928),(3150,929),(3151,930),(3152,931),(3153,932),(3154,933),(3155,934),(3156,935),(3157,936),(3158,937),(3159,938),(3160,939),(3161,940),(3162,941),(3163,942),(3164,943),(3165,944),(3166,945),(3167,946),(3168,947),(3169,948),(3170,949),(3171,950),(3172,951),(3173,952),(3174,953),(3175,954),(3176,955),(3177,956),(3178,957),(3179,958),(3180,959),(3181,960),(3182,961),(3183,962),(3184,963),(3185,964),(3186,965),(3187,966),(3188,967),(3189,968),(3190,969),(3191,970),(3192,971),(3193,972),(3194,973),(3195,974),(3196,975),(3197,976),(3198,977),(3199,978),(3200,979),(3201,980),(3202,981),(3203,982),(3204,983),(3205,984),(3206,985),(3207,986),(3208,987),(3209,988),(3210,989),(3211,990),(3212,991),(3213,992),(3214,993),(3215,994),(3216,995),(3217,996),(3218,997),(3219,998),(3220,999),(3221,1000),(3222,1001),(3223,1002),(3224,1003),(3225,1004),(3226,1005),(3227,1006),(3228,1007),(3229,1008),(3230,1009),(3231,1010),(3232,1011),(3233,1012),(3234,1013),(3235,1014),(3236,1015),(3237,1016),(3238,1017),(3239,1018),(3240,1019),(3241,1020),(3242,1021),(3243,1022),(3244,1023),(3245,1024),(3246,1025),(3247,1026),(3248,1027),(3249,1028),(3250,1029),(3251,1030),(3252,1031),(3253,1032),(3254,1033),(3255,1034),(3256,1035),(3257,1036),(3258,1037),(3259,1038),(3260,1039),(3261,1040),(3262,1041),(3263,1042),(3264,1043),(3265,1044),(3266,1045),(3267,1046),(3268,1047),(3269,1048),(3270,1049),(3271,1050),(3272,1051),(3273,1052),(3274,1053),(3275,1054),(3276,1055),(3277,1056),(3278,1057),(3279,1058),(3280,1059),(3281,1060),(3282,1061),(3283,1062),(3284,1063),(3285,1064),(3286,1065),(3287,1066),(3288,1067),(3289,1068),(3290,1069),(3291,1070),(3292,1071),(3293,1072),(3294,1073),(3295,1074),(3296,1075),(3297,1076),(3298,1077),(3299,1078),(3300,1079),(3301,1080),(3302,1081),(3303,1082),(3304,1083),(3305,1084),(3306,1085),(3307,1086),(3308,1087),(3309,1088),(3310,1089),(3311,1090),(3312,1091),(3313,1092),(3314,1093),(3315,1094),(3316,1095),(3317,1096),(3318,1097),(3319,1098),(3320,1099),(3321,1100),(3322,1101),(3323,1102),(3324,1103),(3325,1104),(3326,1105),(3327,1106),(3328,1107),(3329,1108),(3330,1109),(3331,1110),(3332,1111),(3333,1112),(3334,1113),(3335,1114),(3336,1115),(3337,1116),(3338,1117),(3339,1118),(3340,1119),(3341,1120),(3342,1121),(3343,1122),(3344,1123),(3345,1124),(3346,1125),(3347,1126),(3348,1127),(3349,1128),(3350,1129),(3351,1130),(3352,1131),(3353,1132),(3354,1133),(3355,1134),(3356,1135),(3357,1136),(3358,1137),(3359,1138),(3360,1139),(3361,1140),(3362,1141),(3363,1142),(3364,1143),(3365,1144),(3366,1145),(3367,1146),(3368,1147),(3369,1148),(3370,1149),(3371,1150),(3372,1151),(3373,1152),(3374,1153),(3375,1154),(3376,1155),(3377,1156),(3378,1157),(3379,1158),(3380,1159),(3381,1160),(3382,1161),(3383,1162),(3384,1163),(3385,1164),(3386,1165),(3387,1166),(3388,1167),(3389,1168),(3390,1169),(3391,1170),(3392,1171),(3393,1172),(3394,1173),(3395,1174),(3396,1175),(3397,1176),(3398,1177),(3399,1178),(3400,1179),(3401,1180),(3402,1181),(3403,1182),(3404,1183),(3405,1184),(3406,1185),(3407,1186),(3408,1187),(3409,1188),(3410,1189),(3411,1190),(3412,1191),(3413,1192),(3414,1193),(3415,1194),(3416,1195),(3417,1196),(3418,1197),(3419,1198),(3420,1199),(3421,1200),(3422,1201),(3423,1202),(3424,1203),(3425,1204),(3426,1205),(3427,1206),(3428,1207),(3429,1208),(3430,1209),(3431,1210),(3432,1211),(3433,1212),(3434,1213),(3435,1214),(3436,1215),(3437,1216),(3438,1217),(3439,1218),(3440,1219),(3441,1220),(3442,1221),(3443,1222),(3444,1223),(3445,1224),(3446,1225),(3447,1226),(3448,1227),(3449,1228),(3450,1229),(3451,1230),(3452,1231),(3453,1232),(3454,1233),(3455,1234),(3456,1235),(3457,1236),(3458,1237),(3459,1238),(3460,1239),(3461,1240),(3462,1241),(3463,1242),(3464,1243),(3465,1244),(3466,1245),(3467,1246),(3468,1247),(3469,1248),(3470,1249),(3471,1250),(3472,1251),(3473,1252),(3474,1253),(3475,1254),(3476,1255),(3477,1256),(3478,1257),(3479,1258),(3480,1259),(3481,1260),(3482,1261),(3483,1262),(3484,1263),(3485,1264),(3486,1265),(3487,1266),(3488,1267),(3489,1268),(3490,1269),(3491,1270),(3492,1271),(3493,1272),(3494,1273),(3495,1274),(3496,1275),(3497,1276),(3498,1277),(3499,1278),(3500,1279),(3501,1280),(3502,1281),(3503,1282),(3504,1283),(3505,1284),(3506,1285),(3507,1286),(3508,1287),(3509,1288),(3510,1289),(3511,1290),(3512,1291),(3513,1292),(3514,1293),(3515,1294),(3516,1295),(3517,1296),(3518,1297),(3519,1298),(3520,1299),(3521,1300),(3522,1301),(3523,1302),(3524,1303),(3525,1304),(3526,1305),(3527,1306),(3528,1307),(3529,1308),(3530,1309),(3531,1310),(3532,1311),(3533,1312),(3534,1313),(3535,1314),(3536,1315),(3537,1316),(3538,1317),(3539,1318),(3540,1319),(3541,1320),(3542,1321),(3543,1322),(3544,1323),(3545,1324),(3546,1325),(3547,1326),(3548,1327),(3549,1328),(3550,1329),(3551,1330),(3552,1331),(3553,1332),(3554,1333),(3555,1334),(3556,1335),(3557,1336),(3558,1337),(3559,1338),(3560,1339),(3561,1340),(3562,1341),(3563,1342),(3564,1343),(3565,1344),(3566,1345),(3567,1346),(3568,1347),(3569,1348),(3570,1349),(3571,1350),(3572,1351),(3573,1352),(3574,1353),(3575,1354),(3576,1355),(3577,1356),(3578,1357),(3579,1358),(3580,1359),(3581,1360),(3582,1361),(3583,1362),(3584,1363),(3585,1364),(3586,1365),(3587,1366),(3588,1367),(3589,1368),(3590,1369),(3591,1370),(3592,1371),(3593,1372),(3594,1373),(3595,1374),(3596,1375),(3597,1376),(3598,1377),(3599,1378),(3600,1379),(3601,1380),(3602,1381),(3603,1382),(3604,1383),(3605,1384),(3606,1385),(3607,1386),(3608,1387),(3609,1388),(3610,1389),(3611,1390),(3612,1391),(3613,1392),(3614,1393),(3615,1394),(3616,1395),(3617,1396),(3618,1397),(3619,1398),(3620,1399),(3621,1400),(3622,1401),(3623,1402),(3624,1403),(3625,1404),(3626,1405),(3627,1406),(3628,1407),(3629,1408),(3630,1409),(3631,1410),(3632,1411),(3633,1412),(3634,1413),(3635,1414),(3636,1415),(3637,1416),(3638,1417),(3639,1418),(3640,1419),(3641,1420),(3642,1421),(3643,1422),(3644,1423),(3645,1424),(3646,1425),(3647,1426),(3648,1427),(3649,1428),(3650,1429),(3651,1430),(3652,1431),(3653,1432),(3654,1433),(3655,1434),(3656,1435),(3657,1436),(3658,1437),(3659,1438),(3660,1439),(3661,1440),(3662,1441),(3663,1442),(3664,1443),(3665,1444),(3666,1445),(3667,1446),(3668,1447),(3669,1448),(3670,1449),(3671,1450),(3672,1451),(3673,1452),(3674,1453),(3675,1454),(3676,1455),(3677,1456),(3678,1457),(3679,1458),(3680,1459),(3681,1460),(3682,1461),(3683,1462),(3684,1463),(3685,1464),(3686,1465),(3687,1466),(3688,1467),(3689,1468),(3690,1469),(3691,1470),(3692,1471),(3693,1472),(3694,1473),(3695,1474),(3696,1475),(3697,1476),(3698,1477),(3699,1478),(3700,1479),(3701,1480),(3702,1481),(3703,1482),(3704,1483),(3705,1484),(3706,1485),(3707,1486),(3708,1487),(3709,1488),(3710,1489),(3711,1490),(3712,1491),(3713,1492),(3714,1493),(3715,1494),(3716,1495),(3717,1496),(3718,1497),(3719,1498),(3720,1499),(3721,1500),(3722,1501),(3723,1502),(3724,1503),(3725,1504),(3726,1505),(3727,1506),(3728,1507),(3729,1508),(3730,1509),(3731,1510),(3732,1511),(3733,1512),(3734,1513),(3735,1514),(3736,1515),(3737,1516),(3738,1517),(3739,1518),(3740,1519),(3741,1520),(3742,1521),(3743,1522),(3744,1523),(3745,1524),(3746,1525),(3747,1526),(3748,1527),(3749,1528),(3750,1529),(3751,1530),(3752,1531),(3753,1532),(3754,1533),(3755,1534),(3756,1535),(3757,1536),(3758,1537),(3759,1538),(3760,1539),(3761,1540),(3762,1541),(3763,1542),(3764,1543),(3765,1544),(3766,1545),(3767,1546),(3768,1547),(3769,1548),(3770,1549),(3771,1550),(3772,1551),(3773,1552),(3774,1553),(3775,1554),(3776,1555),(3777,1556),(3778,1557),(3779,1558),(3780,1559),(3781,1560),(3782,1561),(3783,1562),(3784,1563),(3785,1564),(3786,1565),(3787,1566),(3788,1567),(3789,1568),(3790,1569),(3791,1570),(3792,1571),(3793,1572),(3794,1573),(3795,1574),(3796,1575),(3797,1576),(3798,1577),(3799,1578),(3800,1579),(3801,1580),(3802,1581),(3803,1582),(3804,1583),(3805,1584),(3806,1585),(3807,1586),(3808,1587),(3809,1588),(3810,1589),(3811,1590),(3812,1591),(3813,1592),(3814,1593),(3815,1594),(3816,1595),(3817,1596),(3818,1597),(3819,1598),(3820,1599),(3821,1600),(3822,1601),(3823,1602),(3824,1603),(3825,1604),(3826,1605),(3827,1606),(3828,1607),(3829,1608),(3830,1609),(3831,1610),(3832,1611),(3833,1612),(3834,1613),(3835,1614),(3836,1615),(3837,1616),(3838,1617),(3839,1618),(3840,1619),(3841,1620),(3842,1621),(3843,1622),(3844,1623),(3845,1624),(3846,1625),(3847,1626),(3848,1627),(3849,1628),(3850,1629),(3851,1630),(3852,1631),(3853,1632),(3854,1633),(3855,1634),(3856,1635),(3857,1636),(3858,1637),(3859,1638),(3860,1639),(3861,1640),(3862,1641),(3863,1642),(3864,1643),(3865,1644),(3866,1645),(3867,1646),(3868,1647),(3869,1648),(3870,1649),(3871,1650),(3872,1651),(3873,1652),(3874,1653),(3875,1654),(3876,1655),(3877,1656),(3878,1657),(3879,1658),(3880,1659),(3881,1660),(3882,1661),(3883,1662),(3884,1663),(3885,1664),(3886,1665),(3887,1666),(3888,1667),(3889,1668),(3890,1669),(3891,1670),(3892,1671),(3893,1672),(3894,1673),(3895,1674),(3896,1675),(3897,1676),(3898,1677),(3899,1678),(3900,1679),(3901,1680),(3902,1681),(3903,1682),(3904,1683),(3905,1684),(3906,1685),(3907,1686),(3908,1687),(3909,1688),(3910,1689),(3911,1690),(3912,1691),(3913,1692),(3914,1693),(3915,1694),(3916,1695),(3917,1696),(3918,1697),(3919,1698),(3920,1699),(3921,1700),(3922,1701),(3923,1702),(3924,1703),(3925,1704),(3926,1705),(3927,1706),(3928,1707),(3929,1708),(3930,1709),(3931,1710),(3932,1711),(3933,1712),(3934,1713),(3935,1714),(3936,1715),(3937,1716),(3938,1717),(3939,1718),(3940,1719),(3941,1720),(3942,1721),(3943,1722),(3944,1723),(3945,1724),(3946,1725),(3947,1726),(3948,1727),(3949,1728),(3950,1729),(3951,1730),(3952,1731),(3953,1732),(3954,1733),(3955,1734),(3956,1735),(3957,1736),(3958,1737),(3959,1738),(3960,1739),(3961,1740),(3962,1741),(3963,1742),(3964,1743),(3965,1744),(3966,1745),(3967,1746),(3968,1747),(3969,1748),(3970,1749),(3971,1750),(3972,1751),(3973,1752),(3974,1753),(3975,1754),(3976,1755),(3977,1756),(3978,1757),(3979,1758),(3980,1759),(3981,1760),(3982,1761),(3983,1762),(3984,1763),(3985,1764),(3986,1765),(3987,1766),(3988,1767),(3989,1768),(3990,1769),(3991,1770),(3992,1771),(3993,1772),(3994,1773),(3995,1774),(3996,1775),(3997,1776),(3998,1777),(3999,1778),(4000,1779),(4001,1780),(4002,1781),(4003,1782),(4004,1783),(4005,1784),(4006,1785),(4007,1786),(4008,1787),(4009,1788),(4010,1789),(4011,1790),(4012,1791),(4013,1792),(4014,1793),(4015,1794),(4016,1795),(4017,1796),(4018,1797),(4019,1798),(4020,1799),(4021,1800),(4022,1801),(4023,1802),(4024,1803),(4025,1804),(4026,1805),(4027,1806),(4028,1807),(4029,1808),(4030,1809),(4031,1810),(4032,1811),(4033,1812),(4034,1813),(4035,1814),(4036,1815),(4037,1816),(4038,1817),(4039,1818),(4040,1819),(4041,1820),(4042,1821),(4043,1822),(4044,1823),(4045,1824),(4046,1825),(4047,1826),(4048,1827),(4049,1828),(4050,1829),(4051,1830),(4052,1831),(4053,1832),(4054,1833),(4055,1834),(4056,1835),(4057,1836),(4058,1837),(4059,1838),(4060,1839),(4061,1840),(4062,1841),(4063,1842),(4064,1843),(4065,1844),(4066,1845),(4067,1846),(4068,1847),(4069,1848),(4070,1849),(4071,1850),(4072,1851),(4073,1852),(4074,1853),(4075,1854),(4076,1855),(4077,1856),(4078,1857),(4079,1858),(4080,1859),(4081,1860),(4082,1861),(4083,1862),(4084,1863),(4085,1864),(4086,1865),(4087,1866),(4088,1867),(4089,1868),(4090,1869),(4091,1870),(4092,1871),(4093,1872),(4094,1873),(4095,1874),(4096,1875),(4097,1876),(4098,1877),(4099,1878),(4100,1879),(4101,1880),(4102,1881),(4103,1882),(4104,1883),(4105,1884),(4106,1885),(4107,1886),(4108,1887),(4109,1888),(4110,1889),(4111,1890),(4112,1891),(4113,1892),(4114,1893),(4115,1894),(4116,1895),(4117,1896),(4118,1897),(4119,1898),(4120,1899),(4121,1900),(4122,1901),(4123,1902),(4124,1903),(4125,1904),(4126,1905),(4127,1906),(4128,1907),(4129,1908),(4130,1909),(4131,1910),(4132,1911),(4133,1912),(4134,1913),(4135,1914),(4136,1915),(4137,1916),(4138,1917),(4139,1918),(4140,1919),(4141,1920),(4142,1921),(4143,1922),(4144,1923),(4145,1924),(4146,1925),(4147,1926),(4148,1927),(4149,1928),(4150,1929),(4151,1930),(4152,1931),(4153,1932),(4154,1933),(4155,1934),(4156,1935),(4157,1936),(4158,1937),(4159,1938),(4160,1939),(4161,1940)]
    
    # Open a cursor to perform database operations
    gfContact_info = []
    entityemailaddress_id_contacttype_id = []
    entityphonenumber_id_contacttype_id = []
    with conn.cursor() as cur:
        new_gfContacts_glEntity = dict([(pairs[1],pairs[0]) for pairs in new_glEntity_gfContacts])

        # Extracting contact email and phone number of migrated contacts into gfContact_info for migration
        for pairs in new_glEntity_gfContacts:
            cur.execute("SELECT id, email_address, phone_number FROM temp.resources_contact WHERE CONCAT(first_name, ' ', last_name) NOT LIKE '%Default Contact%' ORDER BY id ASC")
            gfContact_info = cur.fetchall()
        
        # Migrate Entity email address and Entity phone number from gfContact, also updates crm_gl_entityphonenumber_contact_types and crm_gl_entityemailaddress_contact_types with new entity ids, which all will be assigned with contacttype 1 (General) 
        for items in gfContact_info:
            if items[0] in new_gfContacts_glEntity.keys():
                item_1 = items[1].replace("'","''")
                cur.execute("INSERT INTO public.crm_gl_entityemailaddress(email_address, current, entity_id) VALUES('%s', true, %s) RETURNING id" % (item_1, new_gfContacts_glEntity[items[0]]))
                entityemailaddress_id_contacttype_id = cur.fetchone()[0]
                cur.execute("INSERT INTO public.crm_gl_entityemailaddress_contact_types (entityemailaddress_id, contacttype_id) VALUES(%s,1)" % entityemailaddress_id_contacttype_id)

                cur.execute("INSERT INTO public.crm_gl_entityphonenumber(phone_number, current, entity_id) VALUES('%s', true, %s) RETURNING id" % (items[2], new_gfContacts_glEntity[items[0]]))
                entityphonenumber_id_contacttype_id = cur.fetchone()[0]
                cur.execute("INSERT INTO public.crm_gl_entityphonenumber_contact_types (entityphonenumber_id, contacttype_id) VALUES(%s,1)" % entityphonenumber_id_contacttype_id)



        print(entityemailaddress_id_contacttype_id, '\n', entityphonenumber_id_contacttype_id)
        # Make the changes to the database persistent
        # conn.commit()