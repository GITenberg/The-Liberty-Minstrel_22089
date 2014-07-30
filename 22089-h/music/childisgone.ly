\version "2.10"
\include "english.ly"


\header {
  title = "MY CHILD IS GONE."
  composer = "Music by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  Hark! from the winds a  voice of woe, The
  wild At -- lan -- tic in its flow, Bears on its breast the
  mur -- mur low, My child is gone!
}

trebleOne =  \relative c' {
	\key bf \major
	\time 3/4
	\clef treble
	\autoBeamOff

  \partial 4 bf'8 ^\markup { \bold "Doloroso." } [ c8] |
      d8 d8 d4. c16[ bf16] |
      g8 g8 g4 a8[ bf8] |

  \break    
  c8 c8 c4 bf8[ c8] |
      d8 d8 d4. c8 |
      d8 d8 bf4. bf8 |

  \break    
  c8 bf8 g4\fermata c8[ d8] |
      g,2 f8.^\>[ a16] |
      \stemUp bf2\! \bar "|."
}

trebleTwo =  \relative c' {
  \key bf \major
  \time 3/4
  \clef treble
  \autoBeamOff

  \partial 4 g'8[ a8] |
  bf8 bf8 bf4. c16[ d16] |
  d8 d8 d4 c8[ bf8] |

  a8 a8 a4 g8[ a8] |
  \stemUp bf8 bf8 bf4. a8 |
  bf8 bf8 g4. g8 |

  a8 g8 bf4\fermata a8[ bf8] |
  d2 c4 |
  d2 \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "trebleOne" { \trebleOne }
     \new Lyrics \lyricsto "trebleOne" { \words }
     \new Staff = "lower"  \new Voice = "trebleTwo" { \trebleTwo }
   >>
   

\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4 ) }}    

}

