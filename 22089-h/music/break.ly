\version "2.10"
\include "english.ly"

\header {
  title =    "BREAK EVERY YOKE."
  composer = "Tune--\"O no, we never mention her.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

lineOne = \lyricmode {
  Break eve -- ry yoke, the Gos -- pel cries, And
  let th'op -- pressed go free,
}

lineTwo = \lyricmode {
  Let eve -- ry cap -- tive taste the joys Of
  peace and lib -- er -- \markup{ "ty." \hspace #2.5 \raise #3 \rightbrace } Lord, when shall man thy
  voice o -- bey, And rend each i -- ron chain, Oh
  when shall love its gol -- den sway, O'er all the earth main -- tain.
}

lineThree = \lyricmode {
  Send thy good Spir -- it from a -- bove, And
  melt th'op -- pres -- sor's heart,
}

lineFour = \lyricmode {
  Send sweet de -- liv -- 'rance to the slave, And
  bid his woes de -- \markup{ "part." \hspace #1.5 \raise #3 \rightbrace } With free -- dom's bless -- ings
  crown his day-- O'er -- flow his heart with love, Teach
  him that straight and nar -- row way, Which leads to rest a -- bove.
}

treble = \relative c' {
  \clef treble
  \time 4/4
  \key bf \major
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \repeat volta 2 {
    \partial 4 f4 |
    \stemUp bf4. \stemNeutral a8 bf4. c8 |
    d4. d8 f4. d8 |

    \break
    c4. bf8 c4. d8
    bf2 r4
  }
  f'4 |
  f4. a,8 a4. c8 |

  \break
  c4. bf8 bf4. g8 |
  f4. \stemUp bf8 \stemNeutral bf4. d8 |
  c2 r4 f, |

  \break
  \stemUp bf4. \stemNeutral a8 bf4. c8 |
  d4. ef8 f4.^\fermata d8 |
  c4. c8 f4.^\fermata a,8
  bf2 r4 \bar "|."
}

bass = \relative c {
  \clef bass
  \time 4/4
  \key bf \major
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \repeat volta 2 {
    \partial 4 bf'4 |
    bf4. f8 d4. f8 |
    bf4. g8 d4. f8 |

    \break
    f4. f8 f4. f8
    bf,2 r4
  }
  f'4 |
  f4. f8 f4. f8 |

  \break
  ef4. ef8 ef4. ef8 |
  d4. bf8 bf'4. e,8 |
  f2 r4 bf4 |

  \break
  bf4. f8 d4. f8 |
  bf4. f8 \stemUp d4.^\fermata \stemNeutral bf8 |
  f'4. f8 f4.^\fermata f8
  bf,2 r4 \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \lineOne }
     \new Lyrics \lyricsto "treble" { \lineTwo }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
     \new Lyrics \lyricsto "treble" { \lineThree }
     \new Lyrics \lyricsto "treble" { \lineFour }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Score \remove "Mark_engraver" }
        \context { \Staff \consists "Mark_engraver" }
        }
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
    \new Staff = "upper"  \new Voice = "treble" { \unfoldRepeats \treble }
    \new Staff = "lower"  \new Voice = "bass" { \unfoldRepeats \bass }
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 116 4 ) }}    
}

%%Transcriber's Notes:

%%A second score is provided to unfold the repeats and generate the midi. The repeat for the verse under the bass line is omitted.