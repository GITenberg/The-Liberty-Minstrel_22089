\version "2.10"
\include "english.ly"

\header {
  title = "WAKE, SONS OF THE PILGRIMS."
  composer = "Air--\"M'Gregor's Gathering.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  Wake, sons of the Pil -- grims, and look to your right! The
  des -- pots of Slav -- 'ry are up in their might: In --
  dulge not in sleep, it's like dig -- ging the graves Of
  blood -- pur -- chased free -- dom-- 'tis yield -- ing like slaves. Then
  hal -- loo, hal -- loo hal -- loo to the con -- test, A --
  wake from your slum -- bers, no long -- er de -- lay, But
  strug -- gle for free -- dom, while strug -- gle you may-- Then
  ral -- ly, ral -- ly, ral -- ly,
  ral -- ly, ral -- ly, ral -- ly, While our
  for -- ests shall wave or while rush -- es a riv -- er, Oh,
  yield not your birth -- right! main -- tain it for ev -- er!
}

treble =  \relative c' {
  \key c \major
  \time 6/8
  \clef treble
  \autoBeamOff
  \stemUp  

  \partial 8 <e g>8 |
      <e c'>8 <f d'>8 <e c'>8 <e c'>8 <g e'>8 <f d'>8 |
      <e c'>8 <f a>8 <f a>8 <f a>8 <e g>8( <f a>8) |

  \break    
  <a c>8 <g b>8 <f a>8 <f a>8 <e g>8 <c e>8 |
      c8 <c e>8 <e g>8 <e g>4 <f a>16( <g b>16) |

  \break    
  <e c'>8 <f d'>8 <e c'>8 <e c'>8 <g e'>8 <g d'>8 |
      <f d'>8 <e c'>8 <f a>8 <f a>8 <e g>8( <c e>8) |

  \break     
  <e c'>8 <d b'>8 <f a>8 <e g>8 <d f>8 <c e>8 |
      <b d>8. <c e>16 <e gs>8 <f a>4^\fermata <e gs>8 |

  \break
  <e g>8 <e a c>4 <e g>8 <e c'>4 |
      <e g>8 <g e'>8 <f d'>8 <e c'>8 <f a>8 <e g>8 |
      r4 r8 r8 <e g>8( <f a>8) |

  \break    
  <e c'>8. <f d'>16 <e c'>8 <e c'>8 <g e'>8 <f d'>8 |
      <f d'>8 <e c'>8 <f a>8 <f a>8( <e g>8^\fermata) \override TieColumn #'tie-configuration = #'((5.0 . 1) (5.0 . 1)) <c e>16 ~ <c e>16 |

  \break    
  <f a>4 <c e>16 <f a>16 <e c'>4 <g b>16 <f a>16 |
      <c' e>4 <c e>8 <b d>8 <a c>8( <f a>16) <e g>16 |
  
  \break    
  <e g>8 <c e>4 <c e>8 <e g>4 |
      <f a>8 <a c>4. r8 r8 |

  \break    
  <e g>8 <c e>4 <c e>8 <e g>4 |
      <e g>8 <f d'>4.^\fermata <a c>8 <b d>8 |

  \break    
  <c e>8 <b d>8 <a c>8 <b d>8( <e, g>8^\fermata) <b' d>16 <b d>16 |
      <c e>8. <b d>16 <a c>8 <b d>16 <e, g>8. <e g>8 |

  \break    
  <c' e>8 <b d>8 <a c>8 <a c>8 <f a>8 <e g>8 |
      <e g>16 <c' g'>8._\fermata <a f'>8 <g e'>8 <e c'>4 \bar "|."
}


\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \words }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 160 8 ) }}    
   }
