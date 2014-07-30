\version "2.10"
\include "english.ly"

\header {
  title =    "THE LITTLE SLAVE GIRL."
  poet =     "Words by a Lady."
  composer = "Air--Morgiana in Ireland."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  When bright morn -- ing lights the hills,
  Where free chil -- dren sing most cheer -- i -- ly, My young breast with
  sor -- row fills, While here I plod my
  way so wea -- ri -- ly: Sad my face, more sad my heart, From
  home, from all I had to part, A
  lov -- ing moth -- er, my \set ignoreMelismata = ##t sis -- \unset ignoreMelismata ter, my bro -- ther, For
  chains and lash in hope -- less mis -- e -- ry,
  Chil -- dren try it, could you try it;
  But one day to live in sla -- ve -- ry, Chil -- dren try it,
  try it, try it; Come, come, give me lib -- er -- ty.
}

treble = \relative c' {
  \clef treble
  \time 6/8
  \key g \major
  \autoBeamOff
  \stemUp

  \voiceOne << { d4 d8 g4 g8 } \context Voice="1" { \voiceTwo \autoBeamOff d4 d8 g4 g8 \oneVoice } >> \oneVoice |
  \stemUp <fs a>8[ <e g>] <fs a> <g b>4 r8 |

  \break
  \voiceOne << { d4 d8 g4 } \context Voice="1" { \voiceTwo \autoBeamOff d4 d8 g4 \oneVoice } >> \oneVoice \stemUp <fs a>8 |
  <g b>4 <a c>8 <g b> <e g> \voiceOne << { e^\fermata  } \context Voice="1" { \voiceTwo \autoBeamOff e \oneVoice } >> \oneVoice |
  \voiceOne << { d4 d8 g4 g8 } \context Voice="1" { \voiceTwo \autoBeamOff d4 d8 g4 g8 \oneVoice } >> \oneVoice |

  \break
  \stemUp <fs a>8[ <e g>] <fs a> <g b>4 <a c>8 |
  <b d>8[ <c e>] <b d> <a c>[ <g b>] <e g> |

  \break
  <e g>4 <fs a>8 <g b> <e g> e^\fermata |
  <b' d>4 <b d>8 <b d>[ <a c>] <g b> |
  <c e>4 <d fs>8 <e g>4_\fermata <b d>8 |

  \break
  <b d>4 <b d>8 <b d>[ <a c>] <g b> |
  <c e>4 <d fs>8 <e g>4_\fermata <b d>8 |

  \break
  <b d>8[ <c e>] <b d> <b d> <a c> <g b> |
  <c e>( <d fs>) <c e> <c e> <d fs> <e g> |

  \break
  <b d>( <c e>) <a c> <g b>[ <a c>] <fs a> |
  <e g>4 <fs a>8 <g b> <e g> e^\fermata |

  \break
  %[**NOTE: image shows <e g>4 <e g>8 <g b>16 <b d>4. r8 -- "4." should be "8."]
  <e g>4 <e g>8 <g b>16 <b d>8. r8 |
  %[**NOTE: image shows g4 g8 <a c>16 <c e>4. r8 -- "4." should be "8."]
  \voiceOne << { g4 g8 } \context Voice="1" { \voiceTwo \autoBeamOff g4 g8 \oneVoice } >> \oneVoice \stemUp <a c>16 <c e>8. r8 |

  \break
  <e, g>4 <e g>8 <e g>4 <fs a>8 |
  <g b>4 <a c>8 <g b> <e g> \voiceOne << { e^\fermata } \context Voice="1" { \voiceTwo \autoBeamOff e \oneVoice } >> \oneVoice \stemUp |
  <e g>4 <e g>8 <g b>16 <b d>8. r8 |

  \break
  <a c>16 <c e>8. r8 <g b>16 <b d>8. r8 |
  <c e>16[ <e g>8.] r8 <g, b>16[ <b d>8.] r8 |
  <e, g>4 <fs a>8 <g b> <e g> e^\fermata \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \words }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
        }
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 4 ) }}
}
