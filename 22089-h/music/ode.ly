\version "2.10"
\include "english.ly"

\header {
  title =    "ODE TO JAMES G. BIRNEY."
  poet =     "Words by Elizur Wright."
  composer = "Music by G.W.C."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  We hail thee, Bir -- ney, just and true, the calm and fear -- less,
  staunch and tried, The bra -- vest of the
  val -- iant few, Our coun -- try's hope, our
  coun -- try's pride! In Free -- dom's bat -- tle take the van;
  We hail thee as an hon -- est man.
}

treble = \relative c' {
  \clef treble
  \time 2/4
  \key bf \major
  \autoBeamOff
  \stemUp

  \partial 8 <d f>8 |
  <d bf'> <d bf'> <d bf'> <f d'> |
  <a c>8. <f bf>16 <d f>8. <f a>16 |
  <d bf'>8 <d bf'> <d bf'> <f d'> |

  \break
  <bf f'>4. <a ef'>8 |
  <a c>4._\fermata <g ef'>8 |
  <f d'> <d f'> <ef bf'>8. <g d'>16 |

  \break
  <a c>8 <g bf> <d f>4 ~
  <d f> r8 <f a> |
  <g bf>16[ <f c'>] <g d'>[ <a ef'>] <bf f'>8.^\fermata <a ef'>16 |

  \break
  <a c>8 <f a> <f bf>4 ~
  <f bf> r8 <bf d> |
  <a c> <a c> <a c>8. <f bf>16 |
  <ef g>8 <f a> \voiceOne << { f4 ~ } \context Voice="1" { \voiceTwo \autoBeamOff f4 \oneVoice } >> \oneVoice |

  \break
  \voiceOne << { f4 } \context Voice="1" { \voiceTwo \autoBeamOff f4 \oneVoice } >> \oneVoice r8 \stemUp <d f> |
  <ef g> <g bf>4 \stemDown <c ef>16 <c ef>16 |
  \stemUp <a c>4 <f a> |
  <d f bf>4.^\fermata r8 \bar "|."
}

bass = \relative c {
  \clef bass
  \time 2/4
  \key bf \major
  \autoBeamOff

  \partial 8 f8 |
  bf, bf bf bf |
  f'8. f16 bf,8. f'16 |
  bf,8 bf bf bf |

  \break
  f'4. f8 |
  f4.^\fermata a8 |
  bf bf g8. bf16 |

  \break
  f8 f bf,4 ~
  bf r8 f' |
  bf16[ a] bf[ c] d8. c16 |

  \break
  f,8 f bf,4 ~
  bf r8 bf |
  f' f f8. bf,16 |
  c8 c f4 ~

  \break
  f4 r8 bf, |
  ef ef4 c16 c |
  f4 f |
  bf,4.^\fermata r8 |
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
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4 ) }}    
}

