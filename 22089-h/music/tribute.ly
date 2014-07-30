\version "2.10"
\include "english.ly"

\header {
  title =    "A TRIBUTE TO DEPARTED WORTH."
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

verseOne = \lyricmode {
  Oh, it is not the tear at this mo -- ment shed, When the
  cold turf has just been laid o'er him,
}

verseTwo = \lyricmode {
  That can tell how be -- loved was the soul that's fled, Or how
  deep in our hearts we de -- plore \markup{ "him:" \hspace #1.0 \raise #3 \rightbrace }  'Tis the
  tear through ma -- ny_a long day wept, \set ignoreMelismata = ##t Through \unset ignoreMelismata a life by his loss all
  sha -- ded, 'Tis the sad re -- mem -- brance
  fond -- ly kept, When all oth -- er griefs have fa -- ded.
}

trebleOne =  \relative c' {
  \clef treble
  \time 4/4
  \key d \minor
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \repeat volta 2 {
    \partial 4 a'8 a |
    a4 a8 a d4 e8 d |
    a4 a a^\fermata a8 c |

    \break
    \stemUp c8[ a] \stemNeutral a a g4 d'8 c |
    \partial 4*3 a2 a8 r |
  }
  \partial 4 a8 \stemUp bf |

  \break
  \stemNeutral a4 a a4. c8 |
  c4 c a^\fermata a8( g) |
  f[ a] \stemDown a \stemNeutral cs d4 cs |

  \break
  a2 a8 r c a |
  a4 a f g8( f) |

  \break
  a4 a a^\fermata a8 \stemUp bf |
  \stemNeutral c4 a8( c) c[ d] c8.( bf16) |
  a2 a8 r \bar "|."
}

trebleTwo =  \relative c' {
  \clef treble
  \time 4/4
  \key d \minor
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \repeat volta 2 {
    \partial 4 \stemDown a'8 \stemNeutral cs |
    d[ f] d c a4 g8 a |
    c4 c d,^\fermata f8 g |

    \break
    \stemDown a8[ c] \stemNeutral c a g[ bf] a g
    \partial 4*3 f2 f8 r
  }
  \partial 4 f8 g |

  \break
  a4 c f4. e16[ f] |
  g8[ f] e[ f] d4^\fermata c8( bf) |
  \stemDown a[ c] \stemNeutral d e f4 e |

  \break
  d2 cs8 r a cs |
  d[ ef] d[ c] a4 g8( a) |

  \break
  c4 c d,^\fermata f8 g |
  a8.[ c16] \slurDown c8( a) \slurUp g8[( bf] a8.) g16 |
  f2 f8 r \bar "|."
}

bass =  \relative c {
  \clef bass
  \time 4/4
  \key d \minor
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \repeat volta 2 {
    \partial 4 d8 d |
    d4 d8 d d4 e8 d |
    a4 a \stemUp d^\fermata d8 \stemNeutral c |

    \break
    f4 f8 f c4 a8 c
    \partial 4*3 d2 d8 r
  }
  \partial 4 f8 e |

  \break
  d4 d f4. g8 |
  c,4 c \stemUp d^\fermata \stemNeutral f8( e) |
  d4 f8 g a4 <a, a'> |

  \break
  \stemUp d2 \stemNeutral f8 r \stemUp d d |
  d4 d d c8( d) |

  \break
  a4 a d^\fermata \stemNeutral d8 e |
  f4 f8( d) c4 a8.( c16) |
  \stemUp d2 d8 r \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "trebleOne" { \trebleOne }
     \new Staff = "upperTwo" \new Voice = "trebleTwo" { \trebleTwo }
     \new Lyrics \lyricsto "trebleOne" { \verseOne }
     \new Lyrics \lyricsto "trebleOne" { \verseTwo }
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Score \override PaperColumn #'keep-inside-line = ##t }

	  }

}


\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
    \new Staff = "upper"  
          <<
    \new Voice = "trebleOne" { \unfoldRepeats \trebleOne  }
    \new Voice = "trebleTwo" { \unfoldRepeats \trebleTwo }
           >>
    \new Staff = "lower"  \new Voice = "bass" { \unfoldRepeats \bass  }
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 4 ) }}    
}

%%Transcriber's Notes:

%%Added missing fermata, 1st system, trebleOne part, 3rd bar, 3rd beat.

%%Dissonances have been preserved as in original.