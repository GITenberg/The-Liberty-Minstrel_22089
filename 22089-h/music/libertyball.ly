\version "2.10"
\include "english.ly"

\header {
  title =    "THE LIBERTY BALL."
  poet =     "G.W.C."
  composer = "Air, \"Rosin the Bow.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

verseone = \lyricmode {
  Come all ye true friends of the na -- tion, At -- tend to hu -- man -- i -- ty's
  call; Come aid the poor slave's lib -- e -- ra -- tion, And
  roll on the lib -- er -- ty ball-- And roll on the lib -- er -- ty
  ball-- And roll on the lib -- er -- ty ball, Come aid the poor slave's lib -- e --
  ra -- tion, and roll on the lib -- er -- ty ball.
}

trebleOne =  \relative c' {
  \clef treble
  \time 6/8
  \key g \major
  \autoBeamOff

  \partial 4 g'4 |
  b8 b b d c b |
  g b4. c4 |
  a8 d d d d d |

  \break
  c4.^\fermata a4. |
  b8 b b d c b |
  g b4. c4 |

  \break
  a8 d d d d d |
  b4. r8 b4 |
  b8 c b b c d |

  \break
  e4. r8 c4 |
  a8 d d d d d |
  c4. a4. |
  b8 b b d c b |

  \break
  g8 b4. c4 |
  a8 d d d d c |
  b4.^\fermata \bar "|."
}

trebleTwo =  \relative c' {
  \clef treble
  \time 6/8
  \key g \major
  \autoBeamOff

  \partial 4 d4 |
  g8 g g \stemUp b \stemNeutral a g |
  b d4. e4 |
  d8 b g g a b |

  \break
  e,4.^\fermata d4. |
  g8 g g \stemUp b \stemNeutral a g |
  b d4. e4 |

  \break
  d8 \stemUp b \stemNeutral g a \stemUp b \stemNeutral a |
  g4. r8 d'4 |
  d8 e d d e fs |

  \break
  g4. r8 e4 |
  d8 \stemUp b \stemNeutral g g a b |
  e,4. d4. |
  g8 g g \stemUp b \stemNeutral a g |

  \break
  b8 d4. e4 |
  d8 \stemUp b \stemNeutral g a \stemUp b \stemNeutral a
  g4.^\fermata \bar "|."
}

bass = \relative c {
  \clef bass
  \time 6/8
  \key g \major
  \autoBeamOff

  \partial 4 \stemUp d4 |
  \stemNeutral g8 g g g g g |
  g g4. c,4 |
  d8 d d d d d |

  \break
  c4.^\fermata \stemUp d4. |
  \stemNeutral g8 g g g g g |
  g g4. c,4 |

  \break
  \stemUp d8 d d d d d |
  \stemNeutral g4. r8 g4 |
  g8 g g g g g |

  \break
  g4. r8 c,4 |
  \stemUp d8 d d d d d |
  c4. d4. |
  \stemNeutral g8 g g g g g |

  \break
  g8 g4. c,4 |
  \stemUp d8 d d d d d
  \stemNeutral g4.^\fermata
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "trebleOne" { \trebleOne }
     \new Staff = "upperTwo" \new Voice = "trebleTwo" { \trebleTwo }
     \new Lyrics \lyricsto "trebleTwo" { \verseone }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 140 4 ) }}   
}

%%Transcriber's Notes:

%%Added missing fermata last system, last bar, bass part. 