\version "2.10"
\include "english.ly"

\header {
  title =    "THE YANKEE GIRL."
  poet =     "Words by Whittier."
  composer = "Music by G.W.C."
  source = "The Liberty Minstrel."
  tagline = ""
}

verseone = \lyricmode {
  She sings by her wheel at that low cot -- tage
  door, Which the long eve -- ning sha -- dow is stretch -- ing be --
  fore; With a mu -- sic as sweet as the mu -- sic which
  seems Breathed soft -- ly and faint in the ear of our
  dreams! How bril -- liant and mirth -- ful the light of her
  eye, Like a star glan -- cing out from the
  blue of the sky! And light -- ly and
  free -- ly her dark tres -- ses play O'er a
  brow and a bo -- som as love -- ly as they!
}

trebleOne =  \relative c' {
  \clef treble
  \time 2/4
  \key bf \major
  \autoBeamOff

  \partial 4 \stemUp bf'4 |
  \stemNeutral f f8 f |
  f4 a8 \stemUp bf |
  \stemNeutral d[ bf] bf8. bf16 |

  \break
  \stemUp bf4 bf8. bf16 |
  bf8[ g] \stemNeutral g8. g16 |
  c4 c8. c16 |
  c4 d8 ef |

  \break
  d4^\fermata c8 bf |
  a4 a8. a16 |
  a4 \stemUp bf8. \stemNeutral a16 |
  f4 f8. f16 |

  \break
  f4 c'8( bf) |
  a8.[ g16] f8 \stemUp bf |
  \stemNeutral bf4 bf8. bf16 |
  d4 c16[ d] ef8 |

  \break
  d4^\fermata c8( bf) |
  a4 a8 a |
  a4 a8 a |
  \stemUp bf4 bf8 bf |

  \break
  \stemUp bf4 bf8. bf16 |
  bf4 bf8. bf16 |
  bf4 \stemNeutral a8. a16 |

  \break
  bf8[ d] c8. bf16 |
  a4 \stemUp bf |
  \stemNeutral f f8 f |

  \break
  g4 c8 d |
  ef8[ d] c8. bf16 |
  a4 a8 a |

  \break
  bf4 c8 a |
  \stemUp bf4 \stemNeutral a8 a |
  <g bf>4 \voiceOne << { c16[ d] } \context Voice="1" { \voiceTwo \autoBeamOff f,8 \oneVoice } >> \oneVoice \stemUp <f c' ef>8
  \stemNeutral <f bf d>4 \bar "|."
}

trebleTwo =  \relative c' {
  \clef treble
  \time 2/4
  \key bf \major
  \autoBeamOff

  \partial 4 f8[ g16 a] |
  bf4 bf8 bf |
  bf4 c8 d |
  \stemUp bf8[ g] \stemNeutral f8. f16 |

  \break
  f4 f8. f16 |
  g8[ bf] c8. bf16 |
  a4 f8. f16 |
  g8.[ a16] bf8 c |

  \break
  \stemUp bf4^\fermata a8 bf |
  \stemNeutral c4 c8. c16 |
  c4 d8. c16 |
  bf4 bf8. bf16 |

  \break
  bf4 ef8( d) |
  c8.[ bf16] a8 g |
  f4 f8. f16 |
  bf4 a16[ bf] c[ d] |

  \break
  \stemUp bf4^\fermata a8( bf) |
  \stemNeutral c4 c8 c |
  c4 c8 c |
  d4 d8 d |

  \break
  d4 d8. d16 |
  ef4 ef8. ef16 |
  d4 c8. c16 |

  \break
  d8[ f] ef8. d16 |
  c4 f,8[ g16 a] |
  bf4 bf8 bf |

  \break
  \stemUp bf4 a8 bf |
  \stemNeutral c4 c8 c |
  c4 c8 c |

  \break
  d4 ef8 c |
  d4 c8 d16[ c] |
  bf4 c16[ bf] a8
  \stemUp bf4 \bar "|."
}

bass = \relative c {
  \clef bass
  \time 2/4
  \key bf \major
  \autoBeamOff

  \partial 4 bf4 |
  bf bf8 bf |
  bf4 f'8 f |
  ef4 bf8. bf16 |

  \break
  bf4 bf8. bf16 |
  ef4 c8. ef16 |
  f4 f8. f16 |
  f4 f8 f |

  \break
  bf,4^\fermata f'8 f |
  f4 f8. f16 |
  f4 f8. f16 |
  bf,4 bf8. bf16 |

  \break
  bf4 ef8 ~ ef |
  ef4 ef8 ef |
  bf4 bf8. bf16 |
  f'4 f8 f |

  \break
  bf,4^\fermata f'8 ~ f |
  f4 f8 f |
  f4 f8 f |
  d4 d8 d |

  \break
  bf4 bf8. bf16 |
  ef4 ef8. ef16 |
  f4 f8. f16 |

  \break
  f4 f8. f16 |
  f4 bf, |
  bf bf8 bf |

  \break
  ef4 f8 f |
  f4 f8 f |
  f4 f8 f |

  \break
  g4 ef8 ef |
  f4 f8 f |
  f4 f8 f
  bf,4 \bar "|."
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
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 4 ) }}   
}
