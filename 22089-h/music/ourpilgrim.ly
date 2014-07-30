\version "2.10"
\include "english.ly"

\header {
  title = "OUR PILGRIM FATHERS."
  poet = "Words by Pierpont."
  composer = "Music from \"Minstrel Boy,\" by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }


verseOne = \lyricmode {
  Our Pil -- grim Fath -- ers where are they? The
  \set ignoreMelismata = ##t waves that \unset ignoreMelismata brought them o'er,
}

verseTwo = \lyricmode {
  Still roll \set ignoreMelismata = ##t in the bay, and _ throw their _ spray As they
  break a -- long the \markup{ "shore;" \hspace #3 \raise #3 \rightbrace } Still _ 
  roll in the bay, as they rolled that _ day, When the
  May -- flower moored be -- low; _  When the
  sea a -- round was _ black with storms, And _
  \unset ignoreMelismata white the shore with snow.
}

trebleOne =  \relative c' {
  \key f \major
  \time 4/4
  \clef treble
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \repeat volta 2 { 
  \partial 4 c'8 ~ c |
      c4 c8 ~ c c4 c8 ~ c |
      c4 a8 ~ a a4^\fermata c8. ~ c16 
      |

  \break    
  a2 a8 g4^\fermata c8 |
      c2 } 
      r4 a8 ~ a |

  \break    
  a4 c8 ~ c f4 e8( d) |
      c4 f8. ~ f16 e4 f8. ~ f16 |
  
  \break    
   bf,4. c8 c4. a8 |
   \stemDown a2 ( \stemNeutral d4) ^\fermata a8 ~ a |
  
  \break    
  c4. c8 c4 c8 ~ c |
      d4 g, a^\fermata c8 ~ c |

  \break    
  f4 f8 ~ f c4.\fermata c8 |
      c2( a4) r4 \bar "|."
}

trebleTwo =  \relative c' {
  \key f \major
  \time 4/4
  \clef treble
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \repeat volta 2 {
  \partial 4 \tieUp c8 ~ c |
      f4 \tieDown g8 ~ g bf[ a] g( f) |
      a4 \tieUp c8 ~ c f4^\fermata e8.( f16) |

  \break    
  d4( c) c8 \stemUp a32[bf c8.]_\fermata a8 |
      \slurDown g4( f) }
      r \tieDown f8 ~ f |

  \break    
   \tieUp \stemNeutral f'4 e8 ~ e d4 \slurUp e8( f) |
      e4 d8 ~ d cs4 cs8. ~ cs16 |
  
  \break    
  d4. a8 a4. cs8 |
      d4.( e8 f4^\fermata) f8 ~ f |

  \break    
  f,4. g8 bf[ a] \slurDown g( f) |
      a4 c f^\fermata \slurUp e8( f) |

  \break    
  d4 c8 ~ c c \stemUp a32[ bf c8._\fermata] a8 |
      \slurDown g2( f4) r \bar "|."
}

bass =  \relative c {
   \key f \major
   \time 4/4
   \clef bass
   \autoBeamOff
   \override Staff.TimeSignature #'style = #'()

  \repeat volta 2 {
  \partial 4 f8 ~ f |
      f4 c8 ~ c c4 c8 ~ c |
      f4 f8 ~ f d4^\fermata c8 ~ c |

  \break    
  f4 ~ f f8 c4^\fermata c8 |
      c4( f) }
      r4 f8 ~ f |

  \break    
  f4 c8 ~ c \stemUp d4 \stemNeutral e8( d) |
      a'4 a8 ~ a a4 a8. ~ a16 |
  
  \break    
  g4. f8 f4. e8 |
      d2 ~ d4^\fermata f8 ~ f |

  \break    
  a4. g8 g[ f] e( d) |
  d4 c f^\fermata c8 ~ c |

  \break
  d4 f8 ~ f f4.\fermata f8 |
      c2( f4) r \bar "|."
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
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4 ) }}    

}

%%Transcriber's Notes:

%%Added missing fermatas at system 1, trebleOne staff, bar 3; and at system 5, trebleOne staff, bar 2.

%%5th system, bass staff, last bar: added slur to match other staffs.

%%Last system, trebleTwo staff, bar 1: added eighth note to correct beat count.

