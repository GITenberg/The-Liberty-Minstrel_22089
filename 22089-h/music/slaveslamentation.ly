\version "2.10"
\include "english.ly"

\header {
  title =    "THE SLAVE'S LAMENTATION."
  poet =     "A Parody by Tucker."
  composer = "Air, \"Long, long ago.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

lineOne = \lyricmode {
  Where are the friends that to me were so
  dear, Long, long a -- go, long, long a --
  go!
}

lineTwo = \lyricmode {
  Where are the hopes that my heart used to
  cheer? Long, long a -- go, long, long a --
  \markup{ "go!" \hspace #0.5 \raise #3 \rightbrace } Friends that I loved in the
  grave are laid low, All hope of
  free -- dom hath fled from me now.
}

lineThree = \lyricmode {
  I am de -- gra -- ded, for man was my
  foe, Long, long a -- go, long, long a --
  go!
}

treble = \relative c' {
  \clef treble
  \time 2/4
  \key f \major
  \autoBeamOff
  \stemUp

  \tag #'main { \repeat volta 2 {
    \voiceOne << { f4 f8 } \context Voice="1" { \voiceTwo f4 f8 \oneVoice } >> \oneVoice \stemUp <e g> |
    <f a>4 <f a>8 <g bf> |
    <a c>4 <bf d>8 <a c> |

    \break
    <f a>4.^\fermata r8 |
    <a c>4 <g bf>8 <f a> |
    <e g>4. r8 |
    <g bf>4 <f a>8 <e g> |

    \break
    \voiceOne << { f4.^\fermata } \context Voice="1" { \voiceTwo f4. \oneVoice } >> \oneVoice \stemUp r8
  } }
  \tag #'toDC {
  <a c>8[ <g bf>] <g bf>8 <f a> |
  <e g>4 c8 c |

  \break
  <g' bf>8[ <f a>] <f a>8 <e g> |
  \voiceOne << { f4. } \context Voice="1" { \voiceTwo f4. \oneVoice } >> \oneVoice \stemUp r8 |
  <a c>8[ <g bf>] <g bf>8 <f a> |

  \break
  <e g>4 c8 c |
  <g' bf>8[ <f a>] <f a>8 <e g> |
  \voiceOne << { f4.^\fermata } \context Voice="1" { \voiceTwo f4. \oneVoice } >> \oneVoice r8^\markup { \bold "D.C." } \bar "|."
  }
}

bass = \relative c {
  \clef bass
  \time 2/4
  \key f \major
  \autoBeamOff

  \tag #'main { \repeat volta 2 {
    f4 f8 c |
    f4 f8 e |
    f4 g8 c, |

    \break
    f4.^\fermata r8 |
    f4 e8 f |
    c4. r8 |
    c4 c8 c |

    \break
    f4.^\fermata r8
  } }
  \tag #'toDC {
  c4 c8 c |
  c4 c8 c |

  \break
  c4 c8 c |
  f4. r8 |
  c4 c8 c |

  \break
  c4 c8 c |
  c4 c8 c |
  f4.^\fermata r8 \bar "|."
  }
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \lineOne }
     \new Lyrics \lyricsto "treble" { \lineTwo }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
     \new Lyrics \lyricsto "treble" { \lineThree }
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
    \new Staff = "upper"  \new Voice = "treble" { \unfoldRepeats \treble  \keepWithTag #'main \treble }
    \new Staff = "lower"  \new Voice = "bass" { \unfoldRepeats \bass \keepWithTag #'main \bass }
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}    
}

%%Transcriber's Notes:

%%Added missing fermata last system, last bar, treble part.

%%A second score is provided to unfold the repeats and generate the midi.

