\version "2.10"
\include "english.ly"

\header {
  title = "BROTHERS BE BRAVE FOR THE PINING SLAVE."
  composer = "Air--\"Sparkling and Bright.\""
  source = "The Liberty Minstrel."
  tagline = ""
}


words = \lyricmode {
  \set  stanza = "1."
  Hea -- vy and cold in his dun -- geon hold,
  Is the yoke of the op -- pres -- sor;
  Dark o'er the soul \set ignoreMelismata = ##t is \unset ignoreMelismata the 
  fell con -- trol \set ignoreMelismata = ##t Of \unset ignoreMelismata the 
      stern and dread trans -- gres -- sor.
  Oh then come all to bring the thrall
  Up from his deep de -- spair -- ing, And
  out of the jaw of the ban -- dit's law,
  Re -- take the prey he's tear -- ing:
  O then come all to bring the thrall
  Up from his deep de -- spair -- ing,
  And out of the jaw of the
  ban -- dit's law, Re -- take the _ prey he's tear -- ing.
}


treble =  \relative c' {
	\clef treble 
	\key bf \major 
	\time 4/4
	\autoBeamOff
	\override Staff.TimeSignature #'style = #'()

%%%%% solo part	
  \once \override TextScript #'padding = #1.0 bf'4^\markup { \bold "Solo." } bf8. bf16 bf4 c8 bf | 
      a4 f f f8 f | 
  
  \break
  g4 c a f | 
      bf4.( c8) bf4 a8[ bf] | 
      c4 c c d8.[ c16] | 
  
  \break
  bf4 bf bf ef8( d) | 
      c4 a f g8[ a] | 
      bf4.( c8) bf4 r \bar "||"

%%%%% chorus
  \break
  \set Score.measurePosition = #(ly:make-moment 3 4 )  \once \override TextScript #'padding = #1.0 <a f>8[^\markup { \bold "Chorus." } <g bf>] |
      <a c>4 <a c> <a c> r8 <a c>8 |
      <f d'>4 <f d'> <f d'> r8 <f d'>8 |

  \break
  \stemUp <g ef'>4 <g ef'> <a d> <a c> |
      <bf d>4.( <c ef>16[ <bf d>]) <a c>4 r8 <c, f>8 |

  \break    
  <d bf'>4 <d bf'>8 <d bf'>8 <d bf'>4 <ef a>8 <f bf>8 |
      <a c>4 <a c> <a c> r8 <a c> |

  \break    
  <bf d>4 <bf ef>8( <a c>) <bf d>4 <a c>4 |
      <bf d>4.( <c ef>8) <bf d>4 <c ef>8[ <bf d>] |

  \break    
  <a c>4 <a c> <a c> r8 <a c> |
      <f d'>4. <f d'>8 <f d'>4 r8 <f d'> |
      <g ef'>4 <g ef'> <a d> <a c> |

  \break   
  <bf d>4.( <c ef>16[ <bf d>]) <a c>4 r8 <c, f> |
      <d bf'>4 <d bf'>8. <d bf'>16 <d bf'>4 <ef a>8 <f bf> |

  \break    
  <a c>4 <a c> <a c> r8 <a c> |
    <bf d>4 <bf ef>8 <a c>8 <bf d>4 <a c> |
    <d, bf'>2 <d bf'>4 \bar "|."
}

bass =  \relative c {
	\clef bass 
	\key bf \major 
	\time 4/4
	\autoBeamOff
	\override Staff.TimeSignature #'style = #'()


  s1*8 \bar "||"	
	
  \set Score.measurePosition = #(ly:make-moment 3 4 ) f4 |
      f f f g8[ a] |
      bf4 bf bf r8 bf |

  ef,4 ef f f |
      f2 f8[ ef] \stemUp d[ c] \stemNeutral |

  bf4 bf8 bf bf4 bf8 \stemUp d \stemNeutral |
      f4 f f g8[ a] |

  bf4 ef,8 ~ ef f4 f |
      bf,2 bf4 bf |

  f'4 f f g8[ a] |
      bf4. bf8 bf4 r8 f |
      ef4 ef f f |

  f2 f8[ ef] d[ c] |
      bf4 bf8. bf16 bf4 bf8 \stemUp d \stemNeutral |

  f4 f f g8[ a] |
      bf4 ef,8 ~ ef f4 f |
      bf,2 bf4 \bar "|."

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
	\context { \RemoveEmptyStaffContext }
	\context { \Score \override VerticalAxisGroup #'remove-first = ##t }
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }} 

}

