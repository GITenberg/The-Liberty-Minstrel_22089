\version "2.10"
\include "english.ly"

\header {
  title = "MARCH TO THE BATTLEFIELD."
  poet = "Parody by G. W. C."
  composer = "Air \"Oft in the stilly night.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

verseOne = \lyricmode {
  March to the bat -- tle -- field, The foe is now be --
  fore us; Each heart is free -- dom's shield, And
  heaven is smil -- ing o'er us The
  woes and pains of slave -- ry's chains, That
  bind three mill -- ions un -- der; In proud dis -- dain we'll
  burst their chain, And tear each link a -- sun -- der.
}

soprano =  \relative c' {
  \key c \major
  \time 2/4
  \clef treble
  \autoBeamOff

  g'4 g8. g16 |
      c16 c8. c8 c8 |
      g8. g16 g8 c8 |

  \break    
  b8[ c16 d16] c4 |
      g4 g8. g16 |
      c8. c16 c8 c8 |

  \break    
  c8 c8 c8. c16 |
      b4^\fermata c8 \bar "||" r16 c16 |
  
  \break    
  c8. g16 g8. c16 |
      \stemUp b8. \stemNeutral g16 g8 r16 g16 |

  \break    
  g8. g16 g8. g16 |
      \stemUp b4 \stemNeutral g8 r16 c16 |
      c8. g16 g8. g16 |

  \break    
  \stemUp b8. \stemNeutral g16 g8 r16 g16 |
      c8. g16 g8 g8 |
      b8[ c16 d16] c4 \bar "|."
}

alto =  \relative c' {
  \key c \major
  \time 2/4
  \clef treble
  \autoBeamOff
  \stemUp

  <c' e>4 <c e>8. <b d>16 |
      <a c>16 <f a>8. <f a>8 <a c>8 |
      <e g>8. <e g>16 <e c'>8 <g e'>8 |

  d'8[ e16 f16] <g, e'>4 |
      <c e>4 <c e>8. <b d>16 |
      <a c>8. <f a>16 <f a>8 <a c>8 |

  <e g>8 <e g>8 <g e'>8. <e c'>16 |
      <f d'>4_\fermata <e c'>8 \bar "||" r16 <e g>16 |
  
  <e g>8. <e c'>16 <e c'>8. <e c'>16 |
      <f d'>8. <e c'>16 <e c'>8 r16 <e c'>16 |

  <c e'>8. <c c'>16 <e c'>8. <e c'>16 |
      <f d'>4 <e c'>8 r16 <e g>16 |
      <e g>8. <e c'>16 <e c'>8. <e c'>16 |

  <f d'>8. <e c'>16 <e c'>8 r16 <e c'>16 |
      <g e'>8. <e c'>16 <e c'>8 <e c'>8 |
      d'8[ e16 f16] <g, e'>4^\markup { \bold "D.C." } \bar "|."
}

tenor = \relative c' {
  \key c \major
  \time 2/4
  \clef treble
  \autoBeamOff
  \stemDown

  s2 | s2 | s2 |

  g'4 s4 | s2 | s2 |
  
  s2 | s4 s8 \bar "||" s8 |
  
  s2 | s2 |
  
  s2 | s2 | s2 |
  
  s2 | s2 | g4 s4 \bar "|."  
}  
  
bass =  \relative c {
  \key c \major
  \time 2/4
  \clef bass
  \autoBeamOff	
  \override Stem #'neutral-direction = #up

  c4 c8. c16 |
      c16 c8. c8 c8 |
      c8. c16 c8 c8 |

  g'4 c,4 |
      c4 c8. c16 |
      f8. f16 f8 f8 |

  c8 c8 c8. c16 |
      g'4^\fermata c,8 \bar "||" r16 c16 |
  
  c8. c16 c8. g'16 |
      g8. c,16 c8 r16 c16 |

  c8. c16 c8. c16 |
      g'4 c,8 r16 c16 |
      c8. c16 c8. c16 |

  g'8. c,16 c8 r16 c16 |
      c8. c16 c8 c8 |
      g'4 c,4 \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "soprano" { \soprano }
     \new Staff = "upperTwo" 
               <<
     \new Voice = "alto" { \alto }
     \new Voice = "tenor" { \tenor }
               >> 
     \new Lyrics \lyricsto "alto" { \verseOne }
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4 ) }}   

}

%%Transcriber's Note:

%%Repeat not generated in the midi, as the song is complete without it.
