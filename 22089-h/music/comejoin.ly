\version "2.10"
\include "english.ly"

\header {
  title = "COME, JOIN THE ABOLITIONISTS."
  composer = "Air--\"When I can read my title clear.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

verseOne = \lyricmode {
  \set stanza = "1. "  Come, join the Ab -- o -- li -- tion -- ists, Ye
  young men bold and strong, And with a warm and
  cheer -- ful zeal, Come, help the cause a -- long: Come
  help the cause a -- long, Come
  help the cause a -- long; And with a warm and
  cheer -- ful zeal, Come help the cause a -- long.
  Oh that will be  joy -- ful,  joy -- ful,  joy -- ful,
  Oh that will be  joy -- ful, When Sla -- v'ry is no
  more, When Sla -- v'ry is no more, When 
  Sla -- v'ry is no more: 'Tis then we'll sing, and
  of -- "f 'rings" bring, When Sla -- v'ry is no more.
}

verseTwo = \lyricmode {
  \set stanza = "2. " Come, 
  join the Ab -- o -- li -- tion -- ists, Ye 
  men of ri -- per years, And save your wives and 
  child -- ren dear, From grief and bit -- ter tears: From 
  grief and bit -- ter tears, From 
  grief and bit -- ter tears; And save your wives and 
  chil -- dren dear, From grief and bit -- ter tears. 
  Oh that will be joy -- ful, joy -- ful, joy -- ful, 
  Oh that will be joy -- ful, When Sla -- v'ry is no 
  more, When Sla -- v'ry is no more, When 
  Sla -- v'ry is no more: 'Tis then we'll sing, and 
  of -- "f 'rings" bring, When Sla -- v'ry is no more. 
}

treble =  \relative c' {
  \clef treble
  \time 6/8
  \key bf \major
  \autoBeamOff
  \stemUp  

  \partial 8 <d f>8 |
      <d f>4 <f bf>8 { bf8[ a] } <d, bf'>8 |
      <f d'>4 <f bf>8 { bf8[ a] } <g bf>8 |

  \break
  <a c>4 <a c>8 <d, f>[ <ef g>] <f a> |
      <d bf'>4. ~ <d bf'>4 <d f>8 |
      <d f>4 <d bf'>8 <d bf'>[ <c a'>] <d bf'> |

  \break
  <f d'>4 <d bf'>8 bf'8[ a] <f bf>8 |
      <f c'>4 <f c'>8 <d f>[ <ef g>] <f a> |
      <d bf'>4. ~ <d bf'>4 <f bf>8 |

  \break
  <a c>4 <g bf>8 <a c>4 <f bf>8 |
      \slurUp c'4( d8)[ ef8 d] <a c>8 |
  
  \break
  <bf d>4 <a c>8 <bf d>4 <c ef>8 |
      <d f>4. ~ <d f>4 <c ef>8 |
      <bf d>4 <a c>8 <g bf>4 <c ef>8 |

  \break
  <bf d>4 <a c>8 <g bf>4 <g bf>8 |
      <a c>4 <a c>8 <d, f>8[ <ef g>8] <f a>8 |
      \set Score.measurePosition = #(ly:make-moment 1 8) <d bf'>4. ~ <d bf'>4 \bar "|."

  \break
  <f bf>4. <f bf>8 <f a> <f bf> |
      <f d'>4. <d bf'> |
      <f c'>4. <a c>8[ <bf d>8 <c ef>] |
      <d f>4( <bf d>8) <f bf>4 r8 |

  \break
  <d bf'>4. <d bf'>8 <f a> <d bf'> |
      <f d'>4. <d bf'>4 <d bf'>8 |
      <f c'>4 <f c'>8 <d f>8[ <ef g>8] <f a> |
  
  \break
  <d bf'>4. ~ <d bf'>4 <a' c>8 |
      <a c>4 <a c>8 <a c>4 <a c>8 |
      \slurDown <a c>4( <bf d>8 <c ef>8)[ <bf d>8] <a c>8 |

  \break
  <bf d>4 <a c>8 <bf d>4 <c e>8 |
      <a c f>4. ~ <a c f>4 <c ef>8 |
      <bf d>4 <a c>8 <d, g bf>4 <c' ef>8 |

  \break
  <bf d>4 <a c>8 <g bf>4 <g bf>8 |
      <d bf>4 <d bf>8 <d f>8[ <ef g>8] <f a>8 |
      <d bf'>4. ~ <d bf'>4 \bar "|."
}

alto =  \relative c' {
  \clef treble
  \time 6/8
  \key bf \major
  \autoBeamOff
  \stemDown  
 
  \partial 8 s8 | s4. f4 s8 | s4. f4 s8 |
  
  \break
  s2. | s2. | s2. |
  
  \break
  s4. d4 s8 | s2. | s2. |
  
  \break
  s2. | \tieDown a'4. ~ a4 s8 | 
  
  \break
  s2. | s2. | s2. |

  \break
  s2. | s2. \bar "|" s4. s4  \bar "|."

  \break
  s2. | s2. | s2. | s2. |
  
  \break
  s2. | s2. | s2. |
  
  \break
  s2. | s2. | s2. |

  \break
  s2. | s2. | s2. |
  
  \break
  s2. | s2. | s4. s4 \bar "|."
}


bass =  \relative c {
 \clef bass
  \time 6/8
  \key bf \major
  \autoBeamOff

  \partial 8 bf8 |
  bf4 bf8 bf4 bf8 |
  bf4 bf8 bf4 bf8 |

  \break
  f'4 f8 f4 f8 |
  bf,4. ~ bf4 bf8 |
  bf4 bf8 bf4 bf8 |

  \break
  bf'4 bf8 bf4 bf8 |
  f4 f8 f4 f8 |
  bf,4. ~ bf4 d8 |

  \break
  f4 f8 f4 f8 |
  f4. ~ f4 f8 |
  
  \break
  bf4 f8 bf4 f8 |
  bf4. ~ bf4 f8 |
  f4 f8 g4 f8 |

  \break
  f4 f8 g4 g8 |
  f4 f8 f4 f8
  \set Score.measurePosition = #(ly:make-moment 1 8) bf,4. ~ bf4 \bar "|."

  \break
  bf4. bf8 bf bf |
  bf4. bf |
  f' f |
  bf, bf4 r8 |

  \break
  bf4. bf8 bf bf |
  bf4. bf4 bf8 |
  f'4 f8 f4 f8 |
  
    \break
  bf,4. ~ bf4 f'8 |
  f4 f8 f4 f8 |
  f4. ~ f4 f8 |

  \break
  bf4 f8 bf4 g8 |
  f4. ~ f4 f8 |
  bf4 f8 g4 a8 |

  \break
  bf4 f8 g4 g8 |
  f4 f8 f4 f8
  \partial 8*5 bf,4. ~ bf4
} 

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  
         <<
     \new Voice = "treble" { \treble }
     \new Voice = "alto" { \alto }
         >>
     \new Lyrics \lyricsto "treble" { \verseOne }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
     \new Lyrics \lyricsto "treble" { \verseTwo }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Lyrics \override LyricSpace #'minimum-distance = #3 }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    
   }

%%Transcriber's Note:

%%Last system, treble staff, second bar: top note of first two chords corrected to B-flat.
