\version "2.10"
\include "english.ly"

\header {
  title = "COMFORT FOR THE BONDMAN."
  composer = "Air--\"Indian Philosopher.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  Come on, my part -- ners in dis -- tress, My com -- rades in this
  wil -- der -- ness, Who groan be -- neath your chains; A
  while for -- get your griefs and fears, And look be -- yond this
  vale of tears, To yon ce -- les -- tial plains.
}

treble =  \relative c' {
  \key d \major
  \time 4/4
  \clef treble
  \autoBeamOff 
  \override Stem #'neutral-direction = #up
  \override Staff.TimeSignature #'style = #'()

  \partial 4 d4 |
      fs4 fs4 fs4. d8 |
      a'4 a4 a4. a8 |
      d4.a8 b4. a8 |

  \break
  b4 fs4 e4. d8 |
      fs4 b4 a4 cs4 |
      d2 r4 a4 |

  \break    
  d4 d4 d4. fs8 |
      e4 d4 e4. fs8 |
      d4. a8 b4. a8 |

  \break    
  b4 fs4 e4. d16[ e16] |
      fs4 b4 a4 cs4 |
      d2 r4 \bar "|."
}

bass =  \relative c {
  \key d \major
  \time 4/4
  \clef bass
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \stemUp d4 |
      d4 d4 d4. d8 |
      a4 a4 a4. a8 |
      \stemDown d4.d8 g4. fs8 |

  g4 d4 \stemNeutral a4. \stemUp d8 |
      \stemNeutral d4 g4 fs4 a4 |
      d,2 r4 a'4 |

  fs4 fs4 fs4. d8 |
      a'4 a4 a4. d,8 |
      \stemUp d4. d8 b4. d8 |

  d4 d4 a4. d8 |
      \stemDown d4 g4 fs4 a4 |
      d,2 r4 \bar "|."
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

