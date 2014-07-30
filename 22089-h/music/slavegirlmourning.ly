\version "2.10"
\include "english.ly"

\header {
  title = "SLAVE GIRL MOURNING HER FATHER."
  poet = "Parodied from Mrs. Sigourney by G. W. C."
  source = "The Liberty Minstrel."
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

lineOne = \lyricmode {
  They say I was but four years old
  When father was sold a -- way;
}

lineTwo = \lyricmode {
  Yet I have ne -- ver seen his face
  Since that sad part -- ing day.
  \once \override LyricText #'self-alignment-X = #0.6 
  \markup{ \raise #3 \rightbrace  "    He"}
     went where bright -- er flow -- rets grow
  Be -- neath the South -- ern skies;
  Oh who will show me on the map
  Where that far coun -- try lies? 
}

treble =  \relative c' {
  \clef treble
  \key d \major
  \time 6/8
  \autoBeamOff

  \repeat volta 2 {  \partial 8 d'8 |
      \stemUp b4 b8 b[ a] fs |
      fs4 a8 a4 \stemNeutral d8 |
      b8[ b] b b[ a] fs |

  \break
  fs4. } 
      a4. |
      d4 d8 e( d) e |
      fs4 fs8 e4 a,8 |
  
  \break
  d4 d8 e( d) e |
      fs4. r4 a,8 |
      d4 d8 e( d) e |

  \break    
  fs4 fs8 e4.\fermata |
      d8.( e16 fs8) e( d) b |
      \stemUp b4 a8 fs4.\fermata \bar "|." 
}

bass =  \relative c {
  \clef bass
  \key d \major
  \time 6/8
  \autoBeamOff

  \repeat volta 2 { \partial 8 d8 |
  d4 d8 d4 d8 |
      d4 d8 d4 d8 |
      g[( g]) g g4 a8 |

  d,4. } 
      d4. |
      d4 d8 a'4 a8 |
      cs4 cs8 a4 fs8 |

  d4 d8 a'4 a8 |
      cs4. r4 a8 |
      d,4 d8 a'4 a8 |

  cs4 cs8 a4.\fermata |
      d,4. g4 g8 |
      g4 a8 d,4.\fermata
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
  \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 4 ) }}
}


%%Transcriber's Notes:

%% 1st system, 4th measure, treble part, first beamed eighth notes--possibly missing a slur (present in the bass part in the original).

%% A second score block is provided to unfold the repeat and generate the midi.
