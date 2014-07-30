\version "2.10"
\include "english.ly"

\header {
  title =    "WE'RE FOR FREEDOM THROUGH THE LAND."
  poet =     "Words by J.E. Robinson."
  composer = "Music arranged from the \"Old Granite State.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

verseone = \lyricmode {
  We are com -- ing, we are com -- ing! free -- dom's
  bat -- tle is be -- gun! No hand shall furl her
  ban -- ner ere her vic -- to -- ry be won! Our
  shields are locked for lib -- er -- ty, and mer -- cy goes be --
  fore: Ty -- rants trem -- ble in your cit -- a -- del! op --
  pres -- sion shall be o'er. We will vote for
  Bir -- ney, We will vote for Bir -- ney, We're for
  Mor -- ris and for Bir -- ney, and for Free -- dom through the land.
}

trebleOne =  \relative c' {
  \clef treble
  \time 2/4
  \key d \major
  \autoBeamOff

  \partial 4 fs8 a |
  g g g g |
  g fs fs d |

  \break
  e8 e fs fs |
  e4^\fermata fs8( a) |
  d d d d |

  \break
  d8 d fs, a |
  a a a a |
  a4_\fermata fs8( g) |

  \break
  a8 a a a |
  fs a a a |
  a a a a |

  \break
  a8( a) a a |
  a a a a |
  fs a a a |

  \break
  e8. e16 e8. e16 |
  e4^\fermata r |
  a8 a a a |

  \break
  a8 a r4 |
  a8 a a a |
  a a a a |

  \break
  a8 a a a |
  fs a a a |
  d8. d16 d8. d16 |
  d4^\fermata \bar "|."
}

trebleTwo =  \relative c' {
  \clef treble
  \time 2/4
  \key d \major
  \autoBeamOff

  \partial 4 d'8 cs |
  b b b b |
  b a d, fs |

  \break
  a a a a |
  a4^\fermata d8( cs) |
  b b b b |

  \break
  \stemUp b \stemNeutral a d, fs |
  e e e e |
  e4^\fermata d8( e) |

  \break
  fs8 fs fs fs |
  a fs fs d |
  e e e e |

  \break
  fs8( e) d e |
  fs fs fs fs |
  a fs e d |

  \break
  a'8. a16 a8. a16 |
  a4^\fermata d,8 e |
  fs4. fs8 |

  \break
  a8 fs e d |
  e4. e8 |
  fs e d e |

  \break
  fs8 fs fs fs |
  a fs e d |
  b'8. b16 b8. b16
  b4^\fermata \bar "|."
}

bass = \relative c {
  \clef bass
  \time 2/4
  \key d \major
  \autoBeamOff

  \partial 4 \stemUp d8 d |
  \stemNeutral g g g g |
  \stemUp d d d d |

  \break
  a8 a d d |
  a4^\fermata d8 ~ d |
  \stemNeutral g g g g |

  \break
  \stemUp d8 d d d |
  a a a a |
  a4^\fermata d8( cs) |

  \break
  d8 d d d |
  d d d d |
  a a a a |

  \break
  d8( \stemNeutral a') fs e |
  \stemUp d d d d |
  d d d d |

  \break
  a8. a16 a8. a16 |
  a4^\fermata r |
  d8 d d d |

  \break
  d8 d r4 |
  a8 a a a |
  d \stemNeutral a' fs e |

  \break
  \stemUp d8 d d d |
  d d d d |
  b8. b16 b8. b16
  b4^\fermata \bar "|."
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
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 112 4 ) }}   
}

