\version "2.10"
\include "english.ly"

\header {
  title =    "THE LIBERTY VOTER'S SONG."
  poet =     "Words by E. Wright, jr."
  composer = "Air, from \"Niel Gow's Farewell.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  The vote, the vote, the migh -- ty vote, Though once we used a
  hum -- bler note, And prayed our ser -- vants to be just, We
  tell them now they must, they must. The ty -- rant's grap -- ple
  by our vote, We'll loos -- en from our bro -- ther's throat, With
  Wash -- ing -- ton we here a -- gree, The
  vote's the wea -- pon of the free.
}

treble = \relative c' {
  \clef treble
  \time 4/4
  \key g \major
  \autoBeamOff
  \stemUp
  \override Staff.TimeSignature #'style = #'()

  \partial 4 <d g>4 |
  <b d> <d g> <d g> <e b'> |
  <d a'> <b e> <b e> <e g> |
  d <b g'> <b g'> <d b'> |

  \break
  <b d'>4 <d b'> <d b'>^\fermata <b' d> |
  <c e> <c g'> <b d> <g b> |
  <a c>8[ <g b>] <fs a>[ <e g>] <fs a>4. <g b>8 |

  \break
  <b, d>4 <e g> <g b>8[ <fs a>] <e g>[ <d a'>] |
  <d b'>4 <b g'> <b g'>4.^\fermata <g' b>8^\markup { \bold "Chorus." } |
  <b d>4 <g b> <b g'> <b d> |

  \break
  <a c>8[ <g b>] <fs a>[ <e g>] <fs a>4. <g b>8 |
  <b d>4 <g b> <b g'> <b d> |
  <c e> <b d> <g g'>4. <b d>8 |

  \break
  <c e>4 <c g'> <b d> <g b> |
  <a c>8[ <g b>] <fs a>[ <e g>] <d a'>4.^\fermata <d b'>8 |

  \break
  d4. <e g>8 <g b>[ <fs a>] <fs a>[ <e g>] |
  <d b'>4 <b g'> <b g'>^\fermata \bar "|."
}

bass = \relative c {
  \clef bass
  \time 4/4
  \key g \major
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \partial 4 g'4 |
  d g g g |
  d e e e |
  d e g g |

  \break
  g4 g g^\fermata g |
  c, c \stemUp d \stemNeutral g |
  \stemUp d d d4. \stemNeutral b8 |

  \break
  d4 e d d |
  g g g4.^\fermata g8 |
  g4 g g g |

  \break
  d4 d d4. g8 |
  g4 g g g |
  c, c c4. \stemUp d8 |

  \break
  \stemNeutral g4 g g g |
  d d d4.^\fermata g8 |

  \break
  d4. d8 d4 d
  g g \stemDown <g, g'>^\fermata \bar "|."
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
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 140 4 ) }}    
}

