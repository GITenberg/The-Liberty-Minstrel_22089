\version "2.10"
\include "english.ly"

\header {
  title = "FOURTH OF JULY."
  poet = "Words by Mrs. Sigourney."
  composer = "Music by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  We have a  good -- ly  clime,  Broad 
  vales and  streams we  boast;  Our 
  moun -- tain  fron -- tiers  frown sub -- lime, 
  Old  O -- cean  guards our coast. 
}

treble =  \relative c' {
  \clef treble
  \time 2/4
  \key d \major
  \autoBeamOff
  \stemUp  

  \partial 4 <fs a>4 |
      <fs a> <fs a> |
      <a d> <fs a> |
      <e a>2( fs4) r8 <fs a> |

  \break
      <fs a>4 <fs a> |
      <a cs> <fs d'> |
      <fs d'>2( <e cs'>4) r8 <fs a> |

  \break
  <fs a>4 <fs a> |
      <fs a d> <g b> |
      <g b> <fs a> |
      <d fs>2^\fermata |

  \break
  r4 r8 <fs a> |
      <fs d'>4 <fs a> |
      <fs a>4. <e g>8 |
      <d fs>2 \bar "|."
}

bass =  \relative c {
  \clef bass
  \time 2/4
  \key d \major
  \autoBeamOff
  \override Stem #'neutral-direction = #up

  d4 |
      d4 d |
      d d |
      a2( d4) r8 d8 |

  \break
  \stemDown d4 d |
      \stemUp cs \stemDown d |
      a'2( a4) r8 d,8 |

  \break
  d4 d |
      d e |
      e d |
      d2^\fermata |

  \break
  r4 r8 d8 |
      d4 fs |
      a4. \stemUp a,8 |
      d2
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
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    
   }

