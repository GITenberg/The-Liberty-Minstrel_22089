\version "2.10"

\header {
  title = "NEGRO BOY SOLD FOR A WATCH."
  poet = "Words by Cowper."
  composer = "Arranged by G. W. C. from an old theme."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  When av -- a -- rice en -- slaves the mind, And self -- ish views a --
  lone bear sway Man turns a sav -- age to his kind, And
  blood and ra -- pine  mark his way. A  -- las! for this poor 
  sim -- ple toy, I sold the hap -- less Ne -- gro boy.
}

treble =  \relative c' {
  \clef treble
  \key f \major
  \time 3/4
  \autoBeamOff

  \partial 4  a'4 | bes8 bes a4 g8[ f] | 
    d8 d g4 a |
    bes8 bes a4 g8[ f] |

  \break    
  d8 e8 d4. a'8 |
    \stemUp bes bes a4 g8[ f] |
    d8 d g4 a |
  
  \break bes8 bes a4 g8[ f] |
    d8. e16 d4.\fermata \stemDown a'16[ c] |
    d8. d16 c4 \stemUp a8.[ g16] |

  \break f8 d g4. a8 |
    bes bes a4. g16[ f] |
    d8 e d4.\fermata \bar "|."
}

bass =  \relative c {
  \clef bass
  \key f \major
  \time 3/4
  \autoBeamOff

  \partial 4 f4 |
  g8 g f4 c |
    f8 f c4 f |
    e8 e d4 c8[ d] |

  \break  
  a8 c \stemUp d4. \stemDown f8 |
    g g f4 e8[ d] |
    f f \stemUp c4 d |

  \break  
  \stemNeutral f8 f f4 d |
    a8. a16 \stemUp d4.\fermata \stemDown f8 |
    d8. d16 f4 f |

  \break  
  \stemUp d8 d c4. \stemDown f8 |
    g8 g f4. e16[ d] |
    \stemUp a8 cis d4.\fermata \bar "|."
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
   
