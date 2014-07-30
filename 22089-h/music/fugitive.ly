\version "2.10"
\include "english.ly"

\header {
  title = "THE FUGITIVE."
  poet = "Words by L. M. C."
  composer = "Air \"Bonny Doon.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

lineone = \lyricmode {
  A no -- ble man of sa -- ble brow Came
  to my hum -- ble cot -- tage door,
}

linetwo = \lyricmode {
  With cau -- tious, wea -- ry step and slow, And
  asked if I could feed the poor;
  \skip 4 He begged if I had ought to give, To
  help the pant -- ing fu -- gi -- tive. 
}

linethree = \lyricmode {
  He begged if I had ought to give, To
  help the pant -- ing fu -- gi -- _ tive.
}

treble =  \relative c' {
  \key g \major
  \time 6/8
  \clef treble
  \autoBeamOff
  \stemUp

  \tag #'repeated { \repeat volta 2 { \partial 8 <d b'>16[ <c a'> ] |
      <b g'>4 <b g'>8 a'8.[ g16] <c, a'>8 |
      b'16[ d8.] <d, b'>8 a'8.[ g16] <d a'>8 |

  \break    
  b'8.[ a16] <d, g>8 <e g>16[ <c e>8.] <b d>8 |
      <b d> [ <c e> ] <b g'> \tag #'firsttime { \grace b'8 <d, a'>4 } } }
      \tag #'fine { \set Score.measurePosition = #(ly:make-moment 4 8) <d g>4 \bar "||" }
    
  \break    
  \tag #'toDC {  \set Score.measurePosition = #(ly:make-moment 5 8) g16[ b16] |
      <g d'>4 <g e'>8 d'16[ b8.] <d, g>8 |
      <g d'>4 <g e'>8 d'16[ b8.] g8 |

  \break    
  d'8.[ b16] g8 d'8.[ b16] g8 |
  e'8.[ d16] c[ b] \grace b8 <d, a'>4^\fermata \bar "||" }
}

trebleTwo = \relative c' {
  \key g \major
  \time 6/8
  \clef treble
  \autoBeamOff
  \stemDown

  \tag #'repeated { \repeat volta 2 { \partial 8 s8 |
      s4 s8 d4 s8 |
      d4 s8 d4 s8 |

  \break    
  d4 s4 s4 |
     s4 s8 \tag #'firsttime { s4 } } }
      \tag #'fine { \set Score.measurePosition = #(ly:make-moment 4 8) s4 \bar "||" }
    
  \break    
  \tag #'toDC {  \set Score.measurePosition = #(ly:make-moment 5 8) d8 |
      s4 s8 g4 s8 |
      s4 s8 g4 g8 |

  \break    
  g4 g8 g4 g8 |
  g4 g8 s4 \bar "||" }
}	

bass = \relative c {
  \key g \major
  \time 6/8
  \clef bass
  \autoBeamOff

  \tag #'repeated { \repeat volta 2 {  \partial 8 g8 |
      g4 g8 \stemUp d'4 d8 |
      \stemNeutral g4 g8 d4 d8 |

  \break    
  g,8.[ a16] b8 c4 g8 | |
     g4 g8  \tag #'firsttime { \stemUp d'4 } } }
      \tag #'fine { \set Score.measurePosition = #(ly:make-moment 4 8) \stemNeutral g4 \bar "||" }
    
  \break    
  \tag #'toDC {  \set Score.measurePosition = #(ly:make-moment 5 8) g8 |
      g4 g8 g4 g8 |
      g4 c,8 g'4 g8 |

  \break    
  g4 g8 g4 g8 |
  c,4 c8 \stemUp d4^\markup { \bold "D.C." } \bar "||" }
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  
            <<
         \new Voice = "treble" { \treble }
         \new Voice = "treble" { \trebleTwo }
	    >>
         \new Lyrics \lyricsto "treble" { \lineone }
	 \new Lyrics \lyricsto "treble" { \linetwo }
         \new Staff = "lower"  \new Voice = "bass" { \bass }
	 \new Lyrics \lyricsto "bass" { \linethree }
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
   \new Staff = "upper"  
              <<
   \new Voice = "treble" { \unfoldRepeats { \removeWithTag #'fine \treble }  %%% from begining, through repeats, to D.C., without Final bar
                                                 \removeWithTag #'firsttime \removeWithTag #'toDC \treble  }  %%% D. C. to FINE
   \new Voice = "trebleTwo" { \unfoldRepeats { \removeWithTag #'fine \trebleTwo }  %%% from begining, through repeats, to D.C., without Final bar
                                                 \removeWithTag #'firsttime \removeWithTag #'toDC \trebleTwo  }  %%% D. C. to FINE						 
              >>
   \new Staff = "lower" { \unfoldRepeats { \removeWithTag #'fine \bass }  %%% from begining, through repeats, to D.C., without Final bar
                                                 \removeWithTag #'firsttime \removeWithTag #'toDC \bass  }  %%% D. C. to FINE		
   
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 4)  }}    

}

