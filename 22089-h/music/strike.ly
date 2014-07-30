\version "2.10"
\include "english.ly"

\header {
  title = "STRIKE FOR LIBERTY."
  poet = "Words from the Christian Freeman."
  composer = "Air, \"Scots wha hae.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  Sons of Free -- dom's hon -- ored sires, Light a -- new your
  bea -- con fires, Fight till eve -- ry foe re -- tires
  From your hal -- lowed soil. Sons of Pil -- grim
  Fa -- thers blest, Pil -- grim Mo -- thers gone to rest,
  Lis -- ten to their high be -- hest, Strike for Lib -- er -- ty.

}

treble =  \relative c' {
  \key c \major
  \time 2/4
  \clef treble
  \autoBeamOff
  \stemUp  

  <e g>8. <e g>16 <e g>8. <c e>16 |
     <e g>8. <f b>16 <e c'>4 |
     <c a'>8. <c a'>16 <c a'>8. <c g'>16 |

  \break   
  <c a'>8. <f b>16 <e c'>4 |
      <g e'>8.<g e'>16 <g d'>8. <g d'>16 |
      <a c>8. <b d>16 <c e>4 |
      
  \break
  <a c>8. <fs a>16 <fs a>8. << { g16 | g2 | } 
      \new Voice = "alto" { \voiceTwo g16 | g2 | } >>
      <c e>8. <c e>16 <c e>8. <b d>16 |

  \break    
  <c e>8. <d f>16 <e g>4 |
      <b d>8. <b d>16 <b d>8. <a c>16 |
      <b d>8. <c e>16 <d f>4 |

  \break    
  <e g>8. <c e>16 <b d>8. <c e>16 | << { c8. }
      \new Voice = "alto" { \voiceTwo c8. } >>
      <b d>16 <c e>4 |
      <a c>8. <f a>16 <f a>8. <e g>16 | <e g>4 r4 \bar "|."
}

bass =  \relative c {
  \key c \major
  \time 2/4
  \clef bass
  \autoBeamOff
  \override Stem #'neutral-direction = #up

  c8. c16 c8. c16 |
      c8. c16 c4 |
      f8. f16 f8. e16 |

  f8. d16 c4 |
      c'8. c16 b8. b16 |
      a8. g16 c,4 |

  d8. d16 d8. d16 |
      g2 |
      c,8. c16 c8. g16 |

  c8. g'16 c4 |
      g8. g16 g8. g16 |
      g8. g16 g4 |
  
   c8. c16 g8. c,16 | 
      e8. g16 a4 | 
      f8. f16 f8. c16 | 
      c4 r4

} 

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \words }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}    
   }

