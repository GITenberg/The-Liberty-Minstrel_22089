\version "2.10"
\include "english.ly"

\header {
  title = "COMFORT IN AFFLICTION."
  poet = "Words by William Leggett."
  composer = "Music by G.W.C."
  source = "The Liberty Minstrel."
}

words = \lyricmode {
  If yon bright stars which gem the night, Be
  each a bliss -- ful dwell -- ing -- sphere, Where kin -- dred spir -- its
  re -- u -- nite Whom death has torn a -- sun -- der here,
}


soprano =  \relative c' {
  \key f \major
  \time 3/4
  \autoBeamOff

  \partial 4 a'4 |
      c8 c8 c4 c4 |
      d8 d8 d4 d4 |

  \break
  c8 c8 c4 a4 |
      c8 c8 c4\fermata a4 |
      c8 c8 c4 a4 |

  \break    
  d8 c8 f4\fermata f4 |
      a,8 a8 a4 c4 |
      g8 bf8 a4 \bar "|."
}

alto =  \relative c' {
  \key f \major
  \time 3/4
  \autoBeamOff

  \partial 4 \voiceOne << { f4 } \context Voice="1" { \voiceTwo f4 \oneVoice } >> |
  <f a>8 <f a>8 <f a>4 \voiceOne << { f4 } \context Voice="1" { \voiceTwo f4 \oneVoice } >> |
  <g bf>8 <g bf>8 <g bf>4 <g bf>4 |

  <f a>8 <f a>8 <f a>4 \voiceOne << { f4 } \context Voice="1" { \voiceTwo f4 \oneVoice } >> |
  <e g>8 <e g>8 <e g>4\fermata \voiceOne << { f4 } \context Voice="1" { \voiceTwo f4 \oneVoice } >> |
  <f a>8 <f a>8 <f a>4 \voiceOne << { f4 } \context Voice="1" { \voiceTwo f4 \oneVoice } >> |

  <g bf>8 <g c>8 <f d'>4\fermata <f d'>4 |
  <f f'>8 <f d'>8 <f c'>4 <f a>4 |
  <g bf>8 <e g>8 <c f>4 \bar "|."
}

bass =  \relative c {
  \key f \major
  \time 3/4
  \clef bass
  \autoBeamOff

  \partial 4 f4 |
  f8 f8 f4 f4 |
  g8 g8 g4 g4 |

  f8 f8 f4 f4 |
  c8 c8 c4\fermata f4 |
  f8 f8 f4 f4 |

  bf8 bf8 bf4\fermata bf4 |
  f8 f8 f4 f4 |
  c8 c8 f4 \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "trebleOne" { \soprano }
     \new Staff = "upperTwo"  \new Voice = "trebleTwo" { \alto }
     \new Lyrics \lyricsto "trebleTwo" { \words }
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}   

}
