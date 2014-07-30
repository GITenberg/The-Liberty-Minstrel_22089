\version "2.10"
\include "english.ly"

\header {
  title = "THE PLEASANT LAND WE LOVE."
  poet = "Words by N. P. Willis."
  composer = "Air, Carrier Dove."
  source = "The Liberty Minstrel."
  tagline = ""
}

verseOne = \lyricmode {
  Joy to the plea -- sant land we love, The
  land our fa -- thers trod! Joy to the land for
  which they won "\"Free" -- dom to wor -- ship "God.\"" For
    peace on all its sun -- ny hills, On
  eve -- ry moun -- tain broods, And sleeps by all its
  gush -- ing rills, And all its migh -- ty floods.
}

verseTwo = \lyricmode {
  The wife sits meek -- ly by the hearth, Her
  in -- fant child be -- side; The fa -- ther on his
  no -- ble boy Looks with a fear -- less pride. The
  grey old man, be -- neath the tree, Tales
  of his child -- hood tells; And sweet -- ly in the
  hush of morn Peal out the Sab -- bath bells.
}

soprano =  \relative c' {
  \key a \major
  \time 6/8
  \clef treble
  \autoBeamOff
  \override Stem #'neutral-direction = #up

  \partial 8 cs'16 ~ cs16 |
      a4 a8 a4 a16 ~ a16  |
      a4 d8 cs4 a16 ~ a16 |

  \break    
  a8.( fs16) a8 a4 cs8 |
      b2 r8 gs8 |
      a8. ~ a16  a8 fs4 a8 |

  \break    
  a4 d8 cs4 a16 ~ a16 |
      a8[ gs8] a8 gs4 gs8 |
      a2 r8 r8 |
  
  \break    
  R2. | R2. |

  \break
  R2. |
      r4 r8 r4 gs8 |
      \tieUp a8. ~ a16 a8 a4 \tieDown a16 ~ a16 |

  \break    
  a4 d8 cs4 cs8 |
      cs4 a16 ~ a16 a4 a16^\fermata( gs16) |
      a4. ~ a4 \bar "|."
}

alto =  \relative c' {
  \key a \major
  \time 6/8
  \clef treble
  \autoBeamOff
  \stemUp

  \partial 8 e16 ~ e16  |
      cs'8.[ b16] <e, cs'>8 <fs d'>4 <e cs'>16 ~ <e cs'>16 |
      <e cs'>4 <gs b>8 a4 <cs, e>16 ~ <cs e>16 |

  <e a>8.( <fs a>16) <e a>8 a8[ gs8] <e a>8 |
      <gs b>2 r8 e8 |
      <e cs'>8.( <e b'>16) <e cs'>8 <a d>4 <a cs>8 |

  <e cs'>4 <gs b>8 a4 <cs, e>16 ~ <cs e>16 |
      cs'8[ b8] <e, a>8 b'[ cs8] <d, b'>8 |
      <cs a'>2 r8 <cs e>8 |
  
  <d fs>8( <cs e>8) <cs e>8 <cs e>8[ <d fs>8] <cs e>8 |
      <cs e>8.( <d fs>16) gs8 <cs, a'>4 <cs e>8 |

  <e a>8.( <e gs>16) <e a>8 <gs b>8[ <fs a>8] <ds fs>8 |
      e4 r8 r4 <b e>8 |
      <e cs'>8.( <e b'>16) <e cs'>8 <fs d'>4 <e cs'>16 ~ <e cs'>16 |

  <e cs'>4 b'8 <e, a>4 e8 |
      <e e'>4 <e cs'>16( <e a>16) <cs e>4 <e cs'>16^\fermata( <d b'>16) |
      <cs a'>4. ~ <cs a'>4 \bar "|."
}

tenor = \relative c' {
  \key a \major
  \time 6/8
  \clef treble
  \autoBeamOff
  \stemDown

  \partial 8 s8 |
      e4 s2 |
      s4 s8 a4 s8 |

  s4 s8 e4 s8 |
      s2 s8 e8 |
      s2. |

  s4 s8 a4 s8 |
      e4 s8 e4 s8 |
      s2. |
  
  s2. |
      s8 s8 e16[ d16] s4 s8 |

  s2. | s2. | s2. |

  s4 gs16[ fs16] s4 e8 |
      s2. |
      s4. s4 \bar "|."  
}  
  
bass =  \relative c {
\key a \major
  \time 6/8
  \clef bass
  \autoBeamOff	
  \override Stem #'neutral-direction = #up
	
  a'16 ~ a16 |
      a4 e8 \stemDown d4 \stemNeutral e16 ~ e16 |
      e4 e8 a,4 a16 ~ a16 |

  cs8.( d16) cs8 cs8[ b8] a8 |
      e'2 r8 e8 |
      a,8. ~ a16 a8 d4 e8 |

  e4 e8 a,4 a16 ~ a16 |
      a8[ b8] cs16[ d16] e4 e8 |
      a,2 r8 r8 |
  
  R2. | R2.
  
  R2. |
      r4 r8 r4 e'8 |
      a8. ~ a16 a8 \stemDown d,4 e16 ~ e16 |

  e4 e8 \stemNeutral a,4 a'8 |
      a4 e16 ~ e16 e4 e16^\fermata ~ e16 |
      a,4. ~ a4 \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "soprano" { \soprano }
     \new Staff = "upperTwo" 
               <<
     \new Voice = "alto" { \alto }
     \new Voice = "tenor" { \tenor }
               >> 
     \new Lyrics \with {alignAboveContext=upperTwo} \lyricsto "alto" \verseOne
     \new Lyrics \lyricsto "alto" { \verseTwo }
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4 ) }}   

}
