\version "2.10"
\include "english.ly"

\header {
  title = "HARK! A VOICE FROM HEAVEN."
  poet = "Words by Oliver Johnson."
  composer = "Music--\"Zion.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  Hark! a voice from heaven pro -- claim -- ing, Com -- fort
  to the mourn -- ing slave; God has heard him long com --
  plain -- ing, And ex -- tends his arm to save; Proud op --
  pres -- sion Soon shall find a shame -- ful grave; Proud op --
  pres -- sion, Soon shall find a shame -- ful end.
}

treble =  \relative c' {
  \key ef \major
  \time 3/4
  \clef treble
  \autoBeamOff 
  \stemUp

  \partial 4 <g' bf>8. <g bf>16 |
      <g bf>4 <ef g>4 <g ef'>8. <g bf>16 |
      <af c>4 <g bf>4 <bf ef>8. <bf ef>16 |

  \break    
  <c f>8. <c f>16 <bf ef>4 <bf d>4 |
      <g ef'>2 <g bf>8. <g bf>16 |
      <g bf>4 <ef g>4 <g ef'>8. <g bf>16 |

  \break    
  <af c>4 <g bf>4 <bf ef>8. <bf ef>16 |
      <c f>8. <c f>16 <bf ef>4 <bf d>4 |
      <bf ef>2 <g bf>8. <g bf>16 |

  \break    
  <g bf>4 <ef g>4 <g bf>8. <g bf>16 |
      <f af>8. <f af>16 <ef g>4 <d f>4 |
      <ef g>2 <g bf>8. <g bf>16 |

  \break    
  <g bf>4 <ef g>4 <g bf>8. <g bf>16 |
      <f af>8. <f af>16 <ef g>4 <d f>4 |
      <ef g>2 \bar "|."
}

bass =  \relative c {
  \key ef \major
  \time 3/4
  \clef bass
  \autoBeamOff

  ef8. ef16 |
      ef4 ef4 ef8. ef16 |
      af4 ef4 g8. g16 |

  af8. af16 bf4 bf,4 |
      ef2 ef8. ef16 |
      ef4 ef4 ef8. ef16 |

  af4 ef4 g8. g16 |
      af8. af16 bf4 bf,4 |
      ef2 r4 |

  R2.*2 |
      r2 ef8. ef16 |
  
  ef4 ef4 g8. g16 |
      af8. af16 bf4 bf,4 |
      ef2 \bar "|."
} 

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper" \new Voice = "treble" { \treble } 
     \new Lyrics \lyricsto "treble" { \words }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Lyrics \override LyricSpace #'minimum-distance = #2 }	
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    
   
}

