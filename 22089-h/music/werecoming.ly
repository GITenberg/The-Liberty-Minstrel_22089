\version "2.10"
\include "english.ly"

\header {
  title = "WE'RE COMING! WE'RE COMING!"
  composer = "Air, \"Kinloch of Kinloch.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

lineOne = \lyricmode {
  We're com -- ing, we're com -- ing, the fear -- less and free, Like the
  winds of the des -- ert, the waves of the sea! 
}

lineTwo = \lyricmode {
  True sons of brave sires _ who bat -- tled of yore, When _
  En -- gland's proud li -- on ran wild on our shore! 
     \once \override LyricText #'self-alignment-X = #0.6 
     \markup{ \raise #3 \rightbrace   "    We're"}
  com -- ing, we're com -- ing, from moun -- tain and glen, With
  hearts to do bat -- tle for free -- dom a -- gain; Op --
  pres -- sion is trem -- bling as trem -- bled be -- fore, The
  Slav -- ery which fled from our fa -- thers of yore.
}

treble =  \relative c' {
  \key a \major
  \time 6/8
  \clef treble
  \autoBeamOff

  \repeat volta 2 { \partial 8 a'16[ b] |
      cs8. \stemUp b16 \stemNeutral a8 e16 cs8. e8 |
      fs d fs e16[ cs8.] e16 e |

  \break    
  cs'8. \stemUp b16 \stemNeutral a8 e cs e |
       fs8. a16 gs8 a4 } e'8 |

  \break
  cs cs e b b e |
       a,8. gs16 a8 a16( gs8.) e'8 |

  \break     
  cs cs e b4 e16 e |
       ds8. cs16 ds8 e4 e8 |
  
  \break
  fs8 fs fs e4 e16 e
       d8. cs16 d8 d16( cs8.) a16[ b] |

  \break
  cs8. b16 a8 e cs e |
       fs8. a16 gs8 a4 r8 \bar "|."
}


bass = \relative c {
  \key a \major
  \time 6/8
  \clef bass
  \autoBeamOff
  
  \repeat volta 2 { \partial 8 a8 |
       a8. a16 a8 a16 a8. a8 |
       a a a a4 a16 a |

  a8. a16 a8 a a a |
       d8. d16 e8 a,4 } a'8 |

  a a a gs gs gs |
       fs8. fs16 fs8 e16 ~ e8. a8 |

  a a a gs4 gs16 gs |
       fs8. fs16 fs8 e4 cs8 |
  
  \stemUp d8 d d cs4 cs16 cs
       b8. b16 b8 a16 ~ a8. a8 |

  a8. a16 a8 a a a |
       \stemNeutral d8. d16 e8 a,4 r8 \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper" \new Voice = "treble" { \treble }
         \new Lyrics \lyricsto "treble" { \lineOne }
	 \new Lyrics \lyricsto "treble" { \lineTwo }
      \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  } 
}


\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
   \new Voice = "treble" { \unfoldRepeats \treble } 
   \new Staff = "lower" { \unfoldRepeats  \bass }  
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4)  }}    

}

%%Transcriber's Note:

%%Separate score provided to unfold repeat and generate midi.