library ieee;
use ieee.std_logic_1164.all;

package fftpackage is

    type array_of_integer is array(natural range <>) of integer;

    constant SIZE : integer := 8;
    constant rom_shift_amount : integer := -4;
    signal sin_rom, cos_rom : array_of_integer(360 downto 0);
    procedure rom_generator(signal enable : in std_logic; signal s_rom, c_rom : inout array_of_integer(360 downto 0));

    component fft is
        generic (size : integer := SIZE);
        port (clk :in std_logic;
            input_array : in array_of_integer(size - 1 downto 0);
            input_array_imag : in array_of_integer(size-1 downto 0);
            output_real_array, output_imag_array : out array_of_integer(size - 1 downto 0)
        );
    end component fft;

    component dft is
        generic (size : integer := SIZE/2);
        port (clk :in std_logic;
            input_array_real : in array_of_integer(size - 1 downto 0);
            input_array_imag : in array_of_integer(size - 1 downto 0);
            output_real_array, output_imag_array : out array_of_integer(size - 1 downto 0)
        );
    end component dft;
    

end package fftpackage;

package body fftpackage is

    procedure rom_generator (signal enable : in std_logic; 
        signal s_rom, c_rom : inout array_of_integer(360 downto 0)) is
        begin
            if rising_edge(enable) then
                s_rom(0) <= 0;
                s_rom(1) <= 1;
                s_rom(2) <= 3;
                s_rom(3) <= 5;
                s_rom(4) <= 6;
                s_rom(5) <= 8;
                s_rom(6) <= 10;
                s_rom(7) <= 12;
                s_rom(8) <= 13;
                s_rom(9) <= 15;
                s_rom(10) <= 17;
                s_rom(11) <= 19;
                s_rom(12) <= 20;
                s_rom(13) <= 22;
                s_rom(14) <= 24;
                s_rom(15) <= 25;
                s_rom(16) <= 27;
                s_rom(17) <= 29;
                s_rom(18) <= 30;
                s_rom(19) <= 32;
                s_rom(20) <= 34;
                s_rom(21) <= 35;
                s_rom(22) <= 37;
                s_rom(23) <= 39;
                s_rom(24) <= 40;
                s_rom(25) <= 42;
                s_rom(26) <= 43;
                s_rom(27) <= 45;
                s_rom(28) <= 46;
                s_rom(29) <= 48;
                s_rom(30) <= 49;
                s_rom(31) <= 51;
                s_rom(32) <= 52;
                s_rom(33) <= 54;
                s_rom(34) <= 55;
                s_rom(35) <= 57;
                s_rom(36) <= 58;
                s_rom(37) <= 60;
                s_rom(38) <= 61;
                s_rom(39) <= 62;
                s_rom(40) <= 64;
                s_rom(41) <= 65;
                s_rom(42) <= 66;
                s_rom(43) <= 68;
                s_rom(44) <= 69;
                s_rom(45) <= 70;
                s_rom(46) <= 71;
                s_rom(47) <= 73;
                s_rom(48) <= 74;
                s_rom(49) <= 75;
                s_rom(50) <= 76;
                s_rom(51) <= 77;
                s_rom(52) <= 78;
                s_rom(53) <= 79;
                s_rom(54) <= 80;
                s_rom(55) <= 81;
                s_rom(56) <= 82;
                s_rom(57) <= 83;
                s_rom(58) <= 84;
                s_rom(59) <= 85;
                s_rom(60) <= 86;
                s_rom(61) <= 87;
                s_rom(62) <= 88;
                s_rom(63) <= 89;
                s_rom(64) <= 89;
                s_rom(65) <= 90;
                s_rom(66) <= 91;
                s_rom(67) <= 92;
                s_rom(68) <= 92;
                s_rom(69) <= 93;
                s_rom(70) <= 93;
                s_rom(71) <= 94;
                s_rom(72) <= 95;
                s_rom(73) <= 95;
                s_rom(74) <= 96;
                s_rom(75) <= 96;
                s_rom(76) <= 97;
                s_rom(77) <= 97;
                s_rom(78) <= 97;
                s_rom(79) <= 98;
                s_rom(80) <= 98;
                s_rom(81) <= 98;
                s_rom(82) <= 99;
                s_rom(83) <= 99;
                s_rom(84) <= 99;
                s_rom(85) <= 99;
                s_rom(86) <= 99;
                s_rom(87) <= 99;
                s_rom(88) <= 99;
                s_rom(89) <= 99;
                s_rom(90) <= 100;
                s_rom(91) <= 99;
                s_rom(92) <= 99;
                s_rom(93) <= 99;
                s_rom(94) <= 99;
                s_rom(95) <= 99;
                s_rom(96) <= 99;
                s_rom(97) <= 99;
                s_rom(98) <= 99;
                s_rom(99) <= 98;
                s_rom(100) <= 98;
                s_rom(101) <= 98;
                s_rom(102) <= 97;
                s_rom(103) <= 97;
                s_rom(104) <= 97;
                s_rom(105) <= 96;
                s_rom(106) <= 96;
                s_rom(107) <= 95;
                s_rom(108) <= 95;
                s_rom(109) <= 94;
                s_rom(110) <= 93;
                s_rom(111) <= 93;
                s_rom(112) <= 92;
                s_rom(113) <= 92;
                s_rom(114) <= 91;
                s_rom(115) <= 90;
                s_rom(116) <= 89;
                s_rom(117) <= 89;
                s_rom(118) <= 88;
                s_rom(119) <= 87;
                s_rom(120) <= 86;
                s_rom(121) <= 85;
                s_rom(122) <= 84;
                s_rom(123) <= 83;
                s_rom(124) <= 82;
                s_rom(125) <= 81;
                s_rom(126) <= 80;
                s_rom(127) <= 79;
                s_rom(128) <= 78;
                s_rom(129) <= 77;
                s_rom(130) <= 76;
                s_rom(131) <= 75;
                s_rom(132) <= 74;
                s_rom(133) <= 73;
                s_rom(134) <= 71;
                s_rom(135) <= 70;
                s_rom(136) <= 69;
                s_rom(137) <= 68;
                s_rom(138) <= 66;
                s_rom(139) <= 65;
                s_rom(140) <= 64;
                s_rom(141) <= 62;
                s_rom(142) <= 61;
                s_rom(143) <= 60;
                s_rom(144) <= 58;
                s_rom(145) <= 57;
                s_rom(146) <= 55;
                s_rom(147) <= 54;
                s_rom(148) <= 52;
                s_rom(149) <= 51;
                s_rom(150) <= 49;
                s_rom(151) <= 48;
                s_rom(152) <= 46;
                s_rom(153) <= 45;
                s_rom(154) <= 43;
                s_rom(155) <= 42;
                s_rom(156) <= 40;
                s_rom(157) <= 39;
                s_rom(158) <= 37;
                s_rom(159) <= 35;
                s_rom(160) <= 34;
                s_rom(161) <= 32;
                s_rom(162) <= 30;
                s_rom(163) <= 29;
                s_rom(164) <= 27;
                s_rom(165) <= 25;
                s_rom(166) <= 24;
                s_rom(167) <= 22;
                s_rom(168) <= 20;
                s_rom(169) <= 19;
                s_rom(170) <= 17;
                s_rom(171) <= 15;
                s_rom(172) <= 13;
                s_rom(173) <= 12;
                s_rom(174) <= 10;
                s_rom(175) <= 8;
                s_rom(176) <= 6;
                s_rom(177) <= 5;
                s_rom(178) <= 3;
                s_rom(179) <= 1;
                s_rom(180) <= 0;
                s_rom(181) <= -1;
                s_rom(182) <= -3;
                s_rom(183) <= -5;
                s_rom(184) <= -6;
                s_rom(185) <= -8;
                s_rom(186) <= -10;
                s_rom(187) <= -12;
                s_rom(188) <= -13;
                s_rom(189) <= -15;
                s_rom(190) <= -17;
                s_rom(191) <= -19;
                s_rom(192) <= -20;
                s_rom(193) <= -22;
                s_rom(194) <= -24;
                s_rom(195) <= -25;
                s_rom(196) <= -27;
                s_rom(197) <= -29;
                s_rom(198) <= -30;
                s_rom(199) <= -32;
                s_rom(200) <= -34;
                s_rom(201) <= -35;
                s_rom(202) <= -37;
                s_rom(203) <= -39;
                s_rom(204) <= -40;
                s_rom(205) <= -42;
                s_rom(206) <= -43;
                s_rom(207) <= -45;
                s_rom(208) <= -46;
                s_rom(209) <= -48;
                s_rom(210) <= -50;
                s_rom(211) <= -51;
                s_rom(212) <= -52;
                s_rom(213) <= -54;
                s_rom(214) <= -55;
                s_rom(215) <= -57;
                s_rom(216) <= -58;
                s_rom(217) <= -60;
                s_rom(218) <= -61;
                s_rom(219) <= -62;
                s_rom(220) <= -64;
                s_rom(221) <= -65;
                s_rom(222) <= -66;
                s_rom(223) <= -68;
                s_rom(224) <= -69;
                s_rom(225) <= -70;
                s_rom(226) <= -71;
                s_rom(227) <= -73;
                s_rom(228) <= -74;
                s_rom(229) <= -75;
                s_rom(230) <= -76;
                s_rom(231) <= -77;
                s_rom(232) <= -78;
                s_rom(233) <= -79;
                s_rom(234) <= -80;
                s_rom(235) <= -81;
                s_rom(236) <= -82;
                s_rom(237) <= -83;
                s_rom(238) <= -84;
                s_rom(239) <= -85;
                s_rom(240) <= -86;
                s_rom(241) <= -87;
                s_rom(242) <= -88;
                s_rom(243) <= -89;
                s_rom(244) <= -89;
                s_rom(245) <= -90;
                s_rom(246) <= -91;
                s_rom(247) <= -92;
                s_rom(248) <= -92;
                s_rom(249) <= -93;
                s_rom(250) <= -93;
                s_rom(251) <= -94;
                s_rom(252) <= -95;
                s_rom(253) <= -95;
                s_rom(254) <= -96;
                s_rom(255) <= -96;
                s_rom(256) <= -97;
                s_rom(257) <= -97;
                s_rom(258) <= -97;
                s_rom(259) <= -98;
                s_rom(260) <= -98;
                s_rom(261) <= -98;
                s_rom(262) <= -99;
                s_rom(263) <= -99;
                s_rom(264) <= -99;
                s_rom(265) <= -99;
                s_rom(266) <= -99;
                s_rom(267) <= -99;
                s_rom(268) <= -99;
                s_rom(269) <= -99;
                s_rom(270) <= -100;
                s_rom(271) <= -99;
                s_rom(272) <= -99;
                s_rom(273) <= -99;
                s_rom(274) <= -99;
                s_rom(275) <= -99;
                s_rom(276) <= -99;
                s_rom(277) <= -99;
                s_rom(278) <= -99;
                s_rom(279) <= -98;
                s_rom(280) <= -98;
                s_rom(281) <= -98;
                s_rom(282) <= -97;
                s_rom(283) <= -97;
                s_rom(284) <= -97;
                s_rom(285) <= -96;
                s_rom(286) <= -96;
                s_rom(287) <= -95;
                s_rom(288) <= -95;
                s_rom(289) <= -94;
                s_rom(290) <= -93;
                s_rom(291) <= -93;
                s_rom(292) <= -92;
                s_rom(293) <= -92;
                s_rom(294) <= -91;
                s_rom(295) <= -90;
                s_rom(296) <= -89;
                s_rom(297) <= -89;
                s_rom(298) <= -88;
                s_rom(299) <= -87;
                s_rom(300) <= -86;
                s_rom(301) <= -85;
                s_rom(302) <= -84;
                s_rom(303) <= -83;
                s_rom(304) <= -82;
                s_rom(305) <= -81;
                s_rom(306) <= -80;
                s_rom(307) <= -79;
                s_rom(308) <= -78;
                s_rom(309) <= -77;
                s_rom(310) <= -76;
                s_rom(311) <= -75;
                s_rom(312) <= -74;
                s_rom(313) <= -73;
                s_rom(314) <= -71;
                s_rom(315) <= -70;
                s_rom(316) <= -69;
                s_rom(317) <= -68;
                s_rom(318) <= -66;
                s_rom(319) <= -65;
                s_rom(320) <= -64;
                s_rom(321) <= -62;
                s_rom(322) <= -61;
                s_rom(323) <= -60;
                s_rom(324) <= -58;
                s_rom(325) <= -57;
                s_rom(326) <= -55;
                s_rom(327) <= -54;
                s_rom(328) <= -52;
                s_rom(329) <= -51;
                s_rom(330) <= -50;
                s_rom(331) <= -48;
                s_rom(332) <= -46;
                s_rom(333) <= -45;
                s_rom(334) <= -43;
                s_rom(335) <= -42;
                s_rom(336) <= -40;
                s_rom(337) <= -39;
                s_rom(338) <= -37;
                s_rom(339) <= -35;
                s_rom(340) <= -34;
                s_rom(341) <= -32;
                s_rom(342) <= -30;
                s_rom(343) <= -29;
                s_rom(344) <= -27;
                s_rom(345) <= -25;
                s_rom(346) <= -24;
                s_rom(347) <= -22;
                s_rom(348) <= -20;
                s_rom(349) <= -19;
                s_rom(350) <= -17;
                s_rom(351) <= -15;
                s_rom(352) <= -13;
                s_rom(353) <= -12;
                s_rom(354) <= -10;
                s_rom(355) <= -8;
                s_rom(356) <= -6;
                s_rom(357) <= -5;
                s_rom(358) <= -3;
                s_rom(359) <= -1;
                s_rom(360) <= 0;

                c_rom(0) <= 100;
                c_rom(1) <= 99;
                c_rom(2) <= 99;
                c_rom(3) <= 99;
                c_rom(4) <= 99;
                c_rom(5) <= 99;
                c_rom(6) <= 99;
                c_rom(7) <= 99;
                c_rom(8) <= 99;
                c_rom(9) <= 98;
                c_rom(10) <= 98;
                c_rom(11) <= 98;
                c_rom(12) <= 97;
                c_rom(13) <= 97;
                c_rom(14) <= 97;
                c_rom(15) <= 96;
                c_rom(16) <= 96;
                c_rom(17) <= 95;
                c_rom(18) <= 95;
                c_rom(19) <= 94;
                c_rom(20) <= 93;
                c_rom(21) <= 93;
                c_rom(22) <= 92;
                c_rom(23) <= 92;
                c_rom(24) <= 91;
                c_rom(25) <= 90;
                c_rom(26) <= 89;
                c_rom(27) <= 89;
                c_rom(28) <= 88;
                c_rom(29) <= 87;
                c_rom(30) <= 86;
                c_rom(31) <= 85;
                c_rom(32) <= 84;
                c_rom(33) <= 83;
                c_rom(34) <= 82;
                c_rom(35) <= 81;
                c_rom(36) <= 80;
                c_rom(37) <= 79;
                c_rom(38) <= 78;
                c_rom(39) <= 77;
                c_rom(40) <= 76;
                c_rom(41) <= 75;
                c_rom(42) <= 74;
                c_rom(43) <= 73;
                c_rom(44) <= 71;
                c_rom(45) <= 70;
                c_rom(46) <= 69;
                c_rom(47) <= 68;
                c_rom(48) <= 66;
                c_rom(49) <= 65;
                c_rom(50) <= 64;
                c_rom(51) <= 62;
                c_rom(52) <= 61;
                c_rom(53) <= 60;
                c_rom(54) <= 58;
                c_rom(55) <= 57;
                c_rom(56) <= 55;
                c_rom(57) <= 54;
                c_rom(58) <= 52;
                c_rom(59) <= 51;
                c_rom(60) <= 50;
                c_rom(61) <= 48;
                c_rom(62) <= 46;
                c_rom(63) <= 45;
                c_rom(64) <= 43;
                c_rom(65) <= 42;
                c_rom(66) <= 40;
                c_rom(67) <= 39;
                c_rom(68) <= 37;
                c_rom(69) <= 35;
                c_rom(70) <= 34;
                c_rom(71) <= 32;
                c_rom(72) <= 30;
                c_rom(73) <= 29;
                c_rom(74) <= 27;
                c_rom(75) <= 25;
                c_rom(76) <= 24;
                c_rom(77) <= 22;
                c_rom(78) <= 20;
                c_rom(79) <= 19;
                c_rom(80) <= 17;
                c_rom(81) <= 15;
                c_rom(82) <= 13;
                c_rom(83) <= 12;
                c_rom(84) <= 10;
                c_rom(85) <= 8;
                c_rom(86) <= 6;
                c_rom(87) <= 5;
                c_rom(88) <= 3;
                c_rom(89) <= 1;
                c_rom(90) <= 0;
                c_rom(91) <= -1;
                c_rom(92) <= -3;
                c_rom(93) <= -5;
                c_rom(94) <= -6;
                c_rom(95) <= -8;
                c_rom(96) <= -10;
                c_rom(97) <= -12;
                c_rom(98) <= -13;
                c_rom(99) <= -15;
                c_rom(100) <= -17;
                c_rom(101) <= -19;
                c_rom(102) <= -20;
                c_rom(103) <= -22;
                c_rom(104) <= -24;
                c_rom(105) <= -25;
                c_rom(106) <= -27;
                c_rom(107) <= -29;
                c_rom(108) <= -30;
                c_rom(109) <= -32;
                c_rom(110) <= -34;
                c_rom(111) <= -35;
                c_rom(112) <= -37;
                c_rom(113) <= -39;
                c_rom(114) <= -40;
                c_rom(115) <= -42;
                c_rom(116) <= -43;
                c_rom(117) <= -45;
                c_rom(118) <= -46;
                c_rom(119) <= -48;
                c_rom(120) <= -49;
                c_rom(121) <= -51;
                c_rom(122) <= -52;
                c_rom(123) <= -54;
                c_rom(124) <= -55;
                c_rom(125) <= -57;
                c_rom(126) <= -58;
                c_rom(127) <= -60;
                c_rom(128) <= -61;
                c_rom(129) <= -62;
                c_rom(130) <= -64;
                c_rom(131) <= -65;
                c_rom(132) <= -66;
                c_rom(133) <= -68;
                c_rom(134) <= -69;
                c_rom(135) <= -70;
                c_rom(136) <= -71;
                c_rom(137) <= -73;
                c_rom(138) <= -74;
                c_rom(139) <= -75;
                c_rom(140) <= -76;
                c_rom(141) <= -77;
                c_rom(142) <= -78;
                c_rom(143) <= -79;
                c_rom(144) <= -80;
                c_rom(145) <= -81;
                c_rom(146) <= -82;
                c_rom(147) <= -83;
                c_rom(148) <= -84;
                c_rom(149) <= -85;
                c_rom(150) <= -86;
                c_rom(151) <= -87;
                c_rom(152) <= -88;
                c_rom(153) <= -89;
                c_rom(154) <= -89;
                c_rom(155) <= -90;
                c_rom(156) <= -91;
                c_rom(157) <= -92;
                c_rom(158) <= -92;
                c_rom(159) <= -93;
                c_rom(160) <= -93;
                c_rom(161) <= -94;
                c_rom(162) <= -95;
                c_rom(163) <= -95;
                c_rom(164) <= -96;
                c_rom(165) <= -96;
                c_rom(166) <= -97;
                c_rom(167) <= -97;
                c_rom(168) <= -97;
                c_rom(169) <= -98;
                c_rom(170) <= -98;
                c_rom(171) <= -98;
                c_rom(172) <= -99;
                c_rom(173) <= -99;
                c_rom(174) <= -99;
                c_rom(175) <= -99;
                c_rom(176) <= -99;
                c_rom(177) <= -99;
                c_rom(178) <= -99;
                c_rom(179) <= -99;
                c_rom(180) <= -100;
                c_rom(181) <= -99;
                c_rom(182) <= -99;
                c_rom(183) <= -99;
                c_rom(184) <= -99;
                c_rom(185) <= -99;
                c_rom(186) <= -99;
                c_rom(187) <= -99;
                c_rom(188) <= -99;
                c_rom(189) <= -98;
                c_rom(190) <= -98;
                c_rom(191) <= -98;
                c_rom(192) <= -97;
                c_rom(193) <= -97;
                c_rom(194) <= -97;
                c_rom(195) <= -96;
                c_rom(196) <= -96;
                c_rom(197) <= -95;
                c_rom(198) <= -95;
                c_rom(199) <= -94;
                c_rom(200) <= -93;
                c_rom(201) <= -93;
                c_rom(202) <= -92;
                c_rom(203) <= -92;
                c_rom(204) <= -91;
                c_rom(205) <= -90;
                c_rom(206) <= -89;
                c_rom(207) <= -89;
                c_rom(208) <= -88;
                c_rom(209) <= -87;
                c_rom(210) <= -86;
                c_rom(211) <= -85;
                c_rom(212) <= -84;
                c_rom(213) <= -83;
                c_rom(214) <= -82;
                c_rom(215) <= -81;
                c_rom(216) <= -80;
                c_rom(217) <= -79;
                c_rom(218) <= -78;
                c_rom(219) <= -77;
                c_rom(220) <= -76;
                c_rom(221) <= -75;
                c_rom(222) <= -74;
                c_rom(223) <= -73;
                c_rom(224) <= -71;
                c_rom(225) <= -70;
                c_rom(226) <= -69;
                c_rom(227) <= -68;
                c_rom(228) <= -66;
                c_rom(229) <= -65;
                c_rom(230) <= -64;
                c_rom(231) <= -62;
                c_rom(232) <= -61;
                c_rom(233) <= -60;
                c_rom(234) <= -58;
                c_rom(235) <= -57;
                c_rom(236) <= -55;
                c_rom(237) <= -54;
                c_rom(238) <= -52;
                c_rom(239) <= -51;
                c_rom(240) <= -50;
                c_rom(241) <= -48;
                c_rom(242) <= -46;
                c_rom(243) <= -45;
                c_rom(244) <= -43;
                c_rom(245) <= -42;
                c_rom(246) <= -40;
                c_rom(247) <= -39;
                c_rom(248) <= -37;
                c_rom(249) <= -35;
                c_rom(250) <= -34;
                c_rom(251) <= -32;
                c_rom(252) <= -30;
                c_rom(253) <= -29;
                c_rom(254) <= -27;
                c_rom(255) <= -25;
                c_rom(256) <= -24;
                c_rom(257) <= -22;
                c_rom(258) <= -20;
                c_rom(259) <= -19;
                c_rom(260) <= -17;
                c_rom(261) <= -15;
                c_rom(262) <= -13;
                c_rom(263) <= -12;
                c_rom(264) <= -10;
                c_rom(265) <= -8;
                c_rom(266) <= -6;
                c_rom(267) <= -5;
                c_rom(268) <= -3;
                c_rom(269) <= -1;
                c_rom(270) <= 0;
                c_rom(271) <= 1;
                c_rom(272) <= 3;
                c_rom(273) <= 5;
                c_rom(274) <= 6;
                c_rom(275) <= 8;
                c_rom(276) <= 10;
                c_rom(277) <= 12;
                c_rom(278) <= 13;
                c_rom(279) <= 15;
                c_rom(280) <= 17;
                c_rom(281) <= 19;
                c_rom(282) <= 20;
                c_rom(283) <= 22;
                c_rom(284) <= 24;
                c_rom(285) <= 25;
                c_rom(286) <= 27;
                c_rom(287) <= 29;
                c_rom(288) <= 30;
                c_rom(289) <= 32;
                c_rom(290) <= 34;
                c_rom(291) <= 35;
                c_rom(292) <= 37;
                c_rom(293) <= 39;
                c_rom(294) <= 40;
                c_rom(295) <= 42;
                c_rom(296) <= 43;
                c_rom(297) <= 45;
                c_rom(298) <= 46;
                c_rom(299) <= 48;
                c_rom(300) <= 50;
                c_rom(301) <= 51;
                c_rom(302) <= 52;
                c_rom(303) <= 54;
                c_rom(304) <= 55;
                c_rom(305) <= 57;
                c_rom(306) <= 58;
                c_rom(307) <= 60;
                c_rom(308) <= 61;
                c_rom(309) <= 62;
                c_rom(310) <= 64;
                c_rom(311) <= 65;
                c_rom(312) <= 66;
                c_rom(313) <= 68;
                c_rom(314) <= 69;
                c_rom(315) <= 70;
                c_rom(316) <= 71;
                c_rom(317) <= 73;
                c_rom(318) <= 74;
                c_rom(319) <= 75;
                c_rom(320) <= 76;
                c_rom(321) <= 77;
                c_rom(322) <= 78;
                c_rom(323) <= 79;
                c_rom(324) <= 80;
                c_rom(325) <= 81;
                c_rom(326) <= 82;
                c_rom(327) <= 83;
                c_rom(328) <= 84;
                c_rom(329) <= 85;
                c_rom(330) <= 86;
                c_rom(331) <= 87;
                c_rom(332) <= 88;
                c_rom(333) <= 89;
                c_rom(334) <= 89;
                c_rom(335) <= 90;
                c_rom(336) <= 91;
                c_rom(337) <= 92;
                c_rom(338) <= 92;
                c_rom(339) <= 93;
                c_rom(340) <= 93;
                c_rom(341) <= 94;
                c_rom(342) <= 95;
                c_rom(343) <= 95;
                c_rom(344) <= 96;
                c_rom(345) <= 96;
                c_rom(346) <= 97;
                c_rom(347) <= 97;
                c_rom(348) <= 97;
                c_rom(349) <= 98;
                c_rom(350) <= 98;
                c_rom(351) <= 98;
                c_rom(352) <= 99;
                c_rom(353) <= 99;
                c_rom(354) <= 99;
                c_rom(355) <= 99;
                c_rom(356) <= 99;
                c_rom(357) <= 99;
                c_rom(358) <= 99;
                c_rom(359) <= 99;
                c_rom(360) <= 100;

            end if;
        end procedure rom_generator;
end package body fftpackage;