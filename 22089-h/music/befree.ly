\version "2.10"
\include "english.ly"

\header {
  title =    "BE FREE, O MAN, BE FREE."
  poet =     "Words by Mary H. Maxwell."
  composer = "Music by G.W.C."
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

lineOne = \lyricmode {
  The storm -- winds wild -- ly \set ignoreMelismata = ##t blow -- \unset ignoreMelismata ing, The burst -- ing bill -- ows
  mock,
}

lineTwo = \lyricmode {
  As, with their foam -- crests \set ignoreMelismata = ##t glow -- \unset ignoreMelismata ing, They dash the sea -- girt
  \markup{ "rock;" \hspace #2.0 \raise #3 \rightbrace }
  A -- mid the wild com -- \set ignoreMelismata = ##t mo -- \unset ignoreMelismata tion, The
  rev -- el of the sea, A voice is on the
  \set ignoreMelismata = ##t o -- \unset ignoreMelismata cean, Be free, O man, be free.
}

treble = \relative c' {
  \clef treble
  \time 2/4
  \key ef \major
  \autoBeamOff
  \stemUp

  \repeat volta 2 {
  \partial 8*1 <g' bf>8 |
  <bf ef>8. <g bf>16 <g bf>8 <ef g> |
  <f af>8( <g bf>4) <ef g>8 |
  <f af>8. <d f>16 \voiceOne << { ef8 d } \context Voice="1" { \voiceTwo \autoBeamOff ef8 d \oneVoice } >> \oneVoice |

  \break
  \partial 8*2 \stemUp ef4^\fermata
  }
  \partial 8*1 <ef g>8 |
  <g bf> <ef g> <g bf> <ef g> |
  <f af>16( <af c>4.) <g bf>16 |

  \break
  <g bf>4. <ef g>8 |
  <g ef'>4. <ef g>8 |
  <f bf>4.^\fermata <g bf>8 |
  <bf ef>8. <g bf>16 <g bf>8 <ef g> |

  \break
  <ef af>16( <g bf>4.^\fermata) <ef g>16 |
  <f af>8 <d f> <bf ef>8. <bf d>16
  \partial 8*3 <bf ef>4.^\fermata \bar "|."
}

bass = \relative c {
  \clef bass
  \time 2/4
  \key ef \major
  \autoBeamOff

  \repeat volta 2 {
  \partial 8*1 ef8 |
  ef8. ef16 ef8 ef |
  bf8 ~ bf4 ef8 |
  bf8. bf16 bf8 bf

  \break
  \partial 8*2 ef4^\fermata
  }

  \partial 8*1 ef8 |
  ef ef ef ef |
  af,16 ~ af4. ef'16 |

  \break
  ef4. ef8 |
  ef4. ef8 |
  bf4.^\fermata ef8 |
  ef8. ef16 ef8 ef |

  \break
  bf16 ~ bf4.^\fermata ef16 |
  af,8 af bf8. bf16
  \partial 8*3 ef4.^\fermata
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \lineOne }
     \new Lyrics \lyricsto "treble" { \lineTwo }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
}

\score {
  \unfoldRepeats {
     <<
      \context Staff = upper <<
         \context Voice = upper \treble
      >>
      \context Staff = lower <<
         \context Voice = lower \bass
      >>
    >>
  }  
  \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4 ) }}
}

%%Transcriber's Note:

%%A second score block is provided to unfold the repeat and generate the midi.