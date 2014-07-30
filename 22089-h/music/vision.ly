\version "2.10"
\include "english.ly"

\header {
  title =    "A VISION."
  poet =     "Words by Crary."
  composer = "Music by G.W.C."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  At dead of night, when oth -- ers sleep, Near
  Hell I took my sta -- tion; And from that dun -- geon,
  dark and deep, O'er -- heard this con -- ver --
  sa -- tion: "\"Hail," Prince of Dark -- ness, ev -- er hail, A --
  dored by each in -- fer -- nal, I come a -- mong your
  gang to wail, And taste of death e -- ter -- "nal.\""
}

treble = \relative c' {
  \clef treble
  \time 2/4
  \key bf \major
  \autoBeamOff
  \stemUp

  \partial 8*1 <d f>8 |
  <f bf>8. <f bf>16 <f bf>8 <f bf> |
  <a c>8. <g bf>16 <f a>8. \voiceOne << { f16 } \context Voice="1" { \voiceTwo \autoBeamOff f16 \oneVoice } >> \oneVoice |

  \break
  \stemUp <ef g>8 <g bf> <bf d> <g bf> |
  <f a>16 <a c>4. \voiceOne << { f16 } \context Voice="1" { \voiceTwo \autoBeamOff f16 \oneVoice } >> \oneVoice |
  \stemUp <f bf>8. <f bf>16 <f bf>8 <f bf> |

  \break
  <a c>8. <g bf>16 <f a>8. \voiceOne << { f16 } \context Voice="1" { \voiceTwo \autoBeamOff f16 \oneVoice } >> \oneVoice |
  \stemUp <ef g>8 <g bf> <bf d>8. <a c>16 |

  \break
  <f c'>8 <f bf>4^\fermata \bar "||" <f a>16[ <g bf>] |
  <a c>8 <a c> <a c>8. <a c>16 |
  <bf d>8 <g bf> <f a>8.^\fermata <a c>16 |

  \break
  <a c>8 <a c> <bf d> <g bf> |
  <bf d>16 <a c>4. \voiceOne << { f16 } \context Voice="1" { \voiceTwo \autoBeamOff f16 \oneVoice } >> \oneVoice |
  \stemUp <f bf>8 <f bf> <f bf> <f bf> |

  \break
  <a c>8. <g bf>16 <f a>8 <d f>16 ~ <d f> |
  <ef g>8 <g bf> <bf d>8. <a c>16 |
  <f a c>8 <f bf>4^\fermata r8 \bar "|."
}

bass = \relative c {
  \clef bass
  \time 2/4
  \key bf \major
  \autoBeamOff

  \partial 8*1 bf8 |
  bf8. bf16 bf8 bf |
  f'8. f16 f8. d16 |

  \break
  ef8 ef bf bf |
  f'16 f4. bf,16 |
  bf8. bf16 bf8 bf |

  \break
  f'8. f16 f8. d16 |
  ef8 ef bf8. f'16 |

  \break
  f8 bf,4^\fermata f'8 |
  f f f8. f16 |
  bf,8 bf f'8.^\fermata f16 |

  \break
  f8 f bf, \stemUp d |
  \stemNeutral d16 f4. f16 |
  bf,8 bf bf bf |

  \break
  f'8. f16 f8 bf,16 ~ bf |
  ef8 ef f8. f16 |
  f8 bf,4^\fermata r8 |
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
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 4 ) }}    
   
}
