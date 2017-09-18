// Copyright (c) 2007+, http://www.ideanaren.com.
// All rights reversed :-) 
// Kannada Transliteration Keelimane, Javascript sahayogadhondhige...

var TYPE_VYANJANA = 1; // consonant
var TYPE_SWARA    = 2; // vowel
var TYPE_SANKHYE  = 3; // number

var VIRAMA = 0x0CCD; // halant 
var PATCH = 0x200D;

var hindhinaKey = 0; // key pressed previously
var hindheA     = false; // last one was A
var twoKeyMatch = false; // current key is the second char of 2 key sequence like 'bh'
var textJaaga; // obj for textarea

// complex implementation for simple data! to store the info on prev two key's consonant status
// binary: 00, 01, 10, 11
var haleVyanjanaKathe = 00; 

// nimage idhu odhoke bandhare naanu yaake tippani bareyali...
function Thorisu(deleteCnt, code, needVirama) {
  var madhyeText  = needVirama ? String.fromCharCode(code, VIRAMA) :
                                 String.fromCharCode(code);
								 
  if (navigator.appName.indexOf("Microsoft") > -1) {
    textJaaga.focus();
    var yaavaJaaga = document.selection.createRange();
	yaavaJaaga.moveStart('character', -deleteCnt);
	yaavaJaaga.text = (code == 0) ? "" : madhyeText;
	yaavaJaaga.select();
	
  } else if (navigator.appName.indexOf("Netscape") > -1) {
    var idxStart = textJaaga.selectionStart;
    var idxEnd   = textJaaga.selectionEnd;
    var mundhinaPos = idxStart - deleteCnt + ((code == 0) ? 0 : 1) + (needVirama ? 1 : 0);
    var scrollElli = textJaaga.scrollTop;
    var modhaluText = textJaaga.value.substring(0, idxStart-deleteCnt);
    var koneText    = textJaaga.value.substring(idxEnd, textJaaga.value.length);

    textJaaga.value = (code == 0) ? (modhaluText + koneText) :
                                    (modhaluText + madhyeText + koneText);
    textJaaga.scrollTop = scrollElli;
    textJaaga.focus();
    textJaaga.setSelectionRange(mundhinaPos, mundhinaPos);
	
  } else {
    var idxStart = textJaaga.value.length;
    var idxEnd   = textJaaga.value.length;
    var modhaluText = textJaaga.value.substring(0, idxStart-deleteCnt);
    var koneText    = textJaaga.value.substring(idxEnd, textJaaga.value.length);

    textJaaga.value = (code == 0) ? (modhaluText + koneText) :
                                    (modhaluText + madhyeText + koneText);
    textJaaga.focus();
  }  
}  
  
// idhu devara kaarya... naane devaru :-)
function PunyaKaarya() {
  switch (this.type){
    case TYPE_VYANJANA:
      if (twoKeyMatch) {
	Thorisu(((haleVyanjanaKathe % 2) == 1) ? 2 : (hindheA ? 0 : 1), this.unicode, true);
	haleVyanjanaKathe = 01;
      } else {
        // add codepoint + halant
	Thorisu(0, this.unicode, true);
	haleVyanjanaKathe = (2*haleVyanjanaKathe + 1) % 4;
      }
      break;

    case TYPE_SANKHYE:
      // add the codepoint
      Thorisu(0, this.unicode, false);
      haleVyanjanaKathe = (2*haleVyanjanaKathe) % 4;
      break;

    case TYPE_SWARA:
      if (this.matra == 1) {
        // 'RR' or 'R' match
        Thorisu(twoKeyMatch ? 1 : 0, this.unicode, false);
	hindheA = false;
	haleVyanjanaKathe = (2*haleVyanjanaKathe) % 4;
	break;
      }
	  
      if (twoKeyMatch) {
	 Thorisu((haleVyanjanaKathe > 1) ? (hindheA ? 0 : 1) : 1, 
	         (haleVyanjanaKathe > 1) ? this.matra : this.unicode, false);
	 haleVyanjanaKathe = 00;
      } else {
	Thorisu(((haleVyanjanaKathe % 2) == 1) ? 1 : 0,
	        ((haleVyanjanaKathe % 2) == 1) ? this.matra : this.unicode, false);
	haleVyanjanaKathe = (2*haleVyanjanaKathe) % 4;
      }
	  
      hindheA = (this.matra == 0) ? true : false;
      break;
  } 
}


function Akshara(charcode, matracode, typecode) {
  this.unicode = charcode;  // unicode codepoint of the char
  this.matra   = matracode; // codepoint of matra if this obj is a swara
  this.type    = typecode;  // indicates whether this is vyanjana(1) or swara(2) or sankhye(3)
  this.Kaarya  = PunyaKaarya; // processing the character
}

var states = new Array(128);
for (i=0; i<128; ++i) {
  states[i] = new Array(128);
}

// state table
// states[0][n] points to the unicode character info denoted by ascii char with dec value n
// states[m][n] points to the unicode character info denoted by ascii char sequence of dec values m,n
// other states are undefined

// swaragalu
// a, A(aa), i, I(ee), u, U(oo), R, RR, e, E, ai, o, O, ou, M, H
states[  0][ 97] = new Akshara(0x0C85, 0, TYPE_SWARA); // a
states[  0][ 65] = new Akshara(0x0C86, 0x0CBE, TYPE_SWARA); // A
states[ 97][ 97] = states[0][65]; // aa
states[  0][105] = new Akshara(0x0C87, 0x0CBF, TYPE_SWARA); // i
states[  0][ 73] = new Akshara(0x0C88, 0x0CC0, TYPE_SWARA); // I
states[101][101] = states[0][73]; // ee
states[  0][117] = new Akshara(0x0C89, 0x0CC1, TYPE_SWARA); // u
states[  0][ 85] = new Akshara(0x0C8A, 0x0CC2, TYPE_SWARA); // U
states[111][111] = states[0][85]; // oo
states[  0][ 82] = new Akshara(0x0C8B, 0x0CC3, TYPE_SWARA); // R
states[ 82][ 82] = new Akshara(0x0CE0, 1, TYPE_SWARA); // RR
states[  0][101] = new Akshara(0x0C8E, 0x0CC6, TYPE_SWARA); // e
states[  0][ 69] = new Akshara(0x0C8F, 0x0CC7, TYPE_SWARA); // E
states[ 97][105] = new Akshara(0x0C90, 0x0CC8, TYPE_SWARA); // ai
states[  0][111] = new Akshara(0x0C92, 0x0CCA, TYPE_SWARA); // o
states[  0][ 79] = new Akshara(0x0C93, 0x0CCB, TYPE_SWARA); // O
states[111][117] = new Akshara(0x0C94, 0x0CCC, TYPE_SWARA); // ou
states[  0][ 77] = new Akshara(0x0C82, 0x0C82, TYPE_SWARA); // M
states[  0][ 72] = new Akshara(0x0C83, 0x0C83, TYPE_SWARA); // H

// vyanjanagalu
// k, K(kh), g, G(gh), NG
// c, C(ch), j, J(jh), NY
// T, Th, D, Dh, N
// t, th, d, dh, n
// p, P(ph), b, B(bh), m
// y, r, l, v, S(sh), Sh, s, h, L
states[  0][107] = new Akshara(0x0C95, 0, TYPE_VYANJANA); // k
states[  0][ 75] = new Akshara(0x0C96, 0, TYPE_VYANJANA); // K
states[107][104] = states[0][75] // kh
states[  0][103] = new Akshara(0x0C97, 0, TYPE_VYANJANA); // g
states[  0][ 71] = new Akshara(0x0C98, 0, TYPE_VYANJANA); // G
states[103][104] = states[0][71]; // gh
states[ 78][ 71] = new Akshara(0x0C99, 0, TYPE_VYANJANA); // NG
states[  0][ 99] = new Akshara(0x0C9A, 0, TYPE_VYANJANA); // c
states[  0][ 67] = new Akshara(0x0C9B, 0, TYPE_VYANJANA); // C
states[ 99][104] = states[0][67]; // ch
states[  0][106] = new Akshara(0x0C9C, 0, TYPE_VYANJANA); // j
states[  0][ 74] = new Akshara(0x0C9D, 0, TYPE_VYANJANA); // J
states[106][104] = states[0][74]; // jh
states[ 78][ 89] = new Akshara(0x0C9E, 0, TYPE_VYANJANA); // NY
states[  0][ 84] = new Akshara(0x0C9F, 0, TYPE_VYANJANA); // T
states[ 84][104] = new Akshara(0x0CA0, 0, TYPE_VYANJANA); // Th
states[  0][ 68] = new Akshara(0x0CA1, 0, TYPE_VYANJANA); // D
states[ 68][104] = new Akshara(0x0CA2, 0, TYPE_VYANJANA); // Dh
states[  0][ 78] = new Akshara(0x0CA3, 0, TYPE_VYANJANA); // N
states[  0][116] = new Akshara(0x0CA4, 0, TYPE_VYANJANA); // t
states[116][104] = new Akshara(0x0CA5, 0, TYPE_VYANJANA); // th
states[  0][100] = new Akshara(0x0CA6, 0, TYPE_VYANJANA); // d
states[100][104] = new Akshara(0x0CA7, 0, TYPE_VYANJANA); // dh
states[  0][110] = new Akshara(0x0CA8, 0, TYPE_VYANJANA); // n
states[  0][112] = new Akshara(0x0CAA, 0, TYPE_VYANJANA); // p
states[  0][ 80] = new Akshara(0x0CAB, 0, TYPE_VYANJANA); // P
states[112][104] = states[0][80]; // ph
states[  0][ 98] = new Akshara(0x0CAC, 0, TYPE_VYANJANA); // b
states[  0][ 66] = new Akshara(0x0CAD, 0, TYPE_VYANJANA); // B
states[ 98][104] = states[0][66]; // bh
states[  0][109] = new Akshara(0x0CAE, 0, TYPE_VYANJANA); // m
states[  0][121] = new Akshara(0x0CAF, 0, TYPE_VYANJANA); // y
states[  0][114] = new Akshara(0x0CB0, 0, TYPE_VYANJANA); // r
states[  0][108] = new Akshara(0x0CB2, 0, TYPE_VYANJANA); // l
states[  0][118] = new Akshara(0x0CB5, 0, TYPE_VYANJANA); // v
states[  0][ 83] = new Akshara(0x0CB6, 0, TYPE_VYANJANA); // S
states[115][104] = states[0][83] // sh
states[ 83][104] = new Akshara(0x0CB7, 0, TYPE_VYANJANA); // Sh
states[  0][115] = new Akshara(0x0CB8, 0, TYPE_VYANJANA); // s
states[  0][104] = new Akshara(0x0CB9, 0, TYPE_VYANJANA); // h
states[  0][ 76] = new Akshara(0x0CB3, 0, TYPE_VYANJANA); // L

// sankhyegalu
states[  0][ 48] = new Akshara(0x0CE6, 0, TYPE_SANKHYE); // 0
states[  0][ 49] = new Akshara(0x0CE7, 0, TYPE_SANKHYE); // 1
states[  0][ 50] = new Akshara(0x0CE8, 0, TYPE_SANKHYE); // 2
states[  0][ 51] = new Akshara(0x0CE9, 0, TYPE_SANKHYE); // 3
states[  0][ 52] = new Akshara(0x0CEA, 0, TYPE_SANKHYE); // 4
states[  0][ 53] = new Akshara(0x0CEB, 0, TYPE_SANKHYE); // 5
states[  0][ 54] = new Akshara(0x0CEC, 0, TYPE_SANKHYE); // 6
states[  0][ 55] = new Akshara(0x0CED, 0, TYPE_SANKHYE); // 7
states[  0][ 56] = new Akshara(0x0CEE, 0, TYPE_SANKHYE); // 8
states[  0][ 57] = new Akshara(0x0CEF, 0, TYPE_SANKHYE); // 9

function kelasaMaadi(tarea, tevent) {
  textJaaga = tarea;
  var altCtrl = false;
  //yaava key press maadidhdhu?
  var eeginaKey;
  if (navigator.appName.indexOf("Microsoft") > -1) {
    eeginaKey = window.event.keyCode;
    altCtrl = (window.event.altKey || window.event.ctrlKey);
  } else if (navigator.appName.indexOf("Netscape") > -1) {
    eeginaKey = tevent.charCode;
    altCtrl = (tevent.altKey || tevent.ctrlKey);
  } else {
    eeginaKey = tevent.which;
    altCtrl = (tevent.altKey || tevent.ctrlKey);
  }
  
  if (altCtrl) {
    return true;
  }

  // 'x' ge ardha form bareyalu
  if (eeginaKey == 120) {
    haleVyanjanaKathe = 00;
    hindhinaKey = 0;
    Thorisu(0, PATCH, false);
    return false;
  }

  // allow ascii only without control chars
  if ((eeginaKey < 32) && (eeginaKey > 127) && // ascii - ctrl chars
      (eeginaKey != 08) && // allow backspace
      (eeginaKey != 10) && // allow linefeed
      (eeginaKey != 13)) { // carriage return
    return false; // dont allow to enter
  }
  
  var mundhinaAkshara; // next akshara (unicode char)
  twoKeyMatch = false; 
  		                                 
  if (states[hindhinaKey][eeginaKey] != undefined) {
    // hindhinaKey is 0 since prev match was for 2 keys like 'aa'
    // or its a two key match now like 'kh' with eeginaKey = h
    mundhinaAkshara = states[hindhinaKey][eeginaKey];
    if (hindhinaKey != 0) {
      twoKeyMatch = true;
    }
  } else if ((hindhinaKey != 0) && (states[0][eeginaKey] != undefined)) {
    // single key match now with 2 key match previously or it is the first char now
    mundhinaAkshara = states[0][eeginaKey];
  } else {
    // char is one of:
    // 8 (backspace), 10 (linefeed), 13 (carriage return), 
    // 32-47 (Space ! " # $ % & ' ( ) * + , - . /), 
    // 58-64 (: ; < = > ? @), 
    // 70 (F), 81 (Q), 86 (V), 87 (W), 88 (X), 90 (Z), 
    // 91-96 ([ \ ] ^ _ `), 
    // 102 (f), 113 (q), 119 (w), 120 (x), 122 (z), 
    // 123-127 ({ | } ~ DEL)
    // so just allow to enter as is since there is not valid state defined in the states table
    if ((eeginaKey >= 70 && eeginaKey <= 90) ||
       (eeginaKey >= 102 && eeginaKey <= 122)) {
      return false; // avoid unused alphabets
    }
	
    hindhinaKey = eeginaKey;
    haleVyanjanaKathe = (2*haleVyanjanaKathe) % 4; // very tricky :-)
    return true; // allow to enter
  }

  mundhinaAkshara.Kaarya(); // process          
  hindhinaKey = twoKeyMatch ? 0 : eeginaKey;
  return false; // dont allow to enter this char since we hv already set the textarea with kannada char
}

var type_kannada = true;

function Geechi(tarea, tevt) {
  if (type_kannada == true) {
    return kelasaMaadi(tarea, tevt);
  } else {
    return true;
  }
}


function processFnn(tarea, tevt) {
  if (navigator.appName.indexOf("Microsoft") > -1) {
    if (window.event.keyCode == 123) {
      type_kannada = !type_kannada;
      return false;
    }
  } else {
    if ((tevt.which == 123) && (tevt.charCode == 0)) {
      type_kannada = !type_kannada;
      return false;
    }
  }
}

// Copyright (c), http://www.ideanaren.com.
// All rights are reserved with Supreme Consciousness, nimma kainallenu *********** aagalla...
// ee comment keelonu mentlaagthaane... aaam, booom, bhussss!!!
