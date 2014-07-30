\version "2.10"
\include "english.ly"

\header {
  title =    "THE STRANGER AND HIS FRIEND."
  poet =     "Montgomery and Denison."
  composer = "Tune, \"Duane Street.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  A poor way -- far -- ing man of grief, Hath
  of -- ten crossed me on my way, Who sued so hum -- bly
  for re -- lief, That I could nev -- er an -- swer nay; I
  had not power to ask his name, Whi -- ther he went or
  whence he came; Yet there was some -- thing in his eye, Which
  won my love, I knew not why.
}

treble = \relative c' {
  \clef treble
  \time 4/4
  \key a \major
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \partial 4 \voiceOne << { e4 } \context Voice="1" { \voiceTwo \autoBeamOff e4 \oneVoice } >> \oneVoice |
  \voiceOne << { a4 } \context Voice="1" { \voiceTwo \autoBeamOff a4 \oneVoice } >> \oneVoice \stemUp <a cs> <a cs> \voiceOne << { a } \context Voice="1" { \voiceTwo \autoBeamOff a \oneVoice } >> \oneVoice |
  \stemNeutral <gs b> <b d> <b d>^\fermata <gs b> |

  \break
  \stemUp <a cs>4 \voiceOne << { a gs a } \context Voice="1" { \voiceTwo \autoBeamOff a gs a \oneVoice } >> \oneVoice |
  \stemNeutral <gs b> \voiceOne << { e e^\fermata e } \context Voice="1" { \voiceTwo \autoBeamOff e e e \oneVoice } >> \oneVoice |
  <e a> <e a> \stemUp <a cs> \voiceOne << { a } \context Voice="1" { \voiceTwo \autoBeamOff a \oneVoice } >> \oneVoice |

  \break
  \stemNeutral <gs b>4 <gs b> <b d>^\fermata <gs b> |
  \stemUp <a cs> \voiceOne << { a } \context Voice="1" { \voiceTwo \autoBeamOff a \oneVoice } >> \oneVoice \stemNeutral <gs b>8[ <a cs>] \stemUp <b d>[ <gs b>] |
  \stemNeutral <e a>4 <e gs> <cs a'>4.^\fermata \stemUp <a' cs>8 |

  \break
  \stemNeutral <cs e>4 <a cs> <a cs> <cs e> |
  <b d> <gs b> <gs b> <b d> |
  \stemUp <a cs> \voiceOne << { a gs a } \context Voice="1" { \voiceTwo \autoBeamOff a gs a \oneVoice } >> \oneVoice |

  \break
  \stemNeutral <e b'>4 \voiceOne << { e e^\fermata e } \context Voice="1" { \voiceTwo \autoBeamOff e e e \oneVoice } >> \oneVoice |
  <cs a'> <cs a'> <e cs'> <cs a'> |
  <gs' b> <gs b> <b d>^\fermata <gs b> |

  \break
  \stemUp <a cs>4 \voiceOne << { a } \context Voice="1" { \voiceTwo \autoBeamOff a \oneVoice } >> \oneVoice <gs b>8[ <a cs>] \stemUp <b d>[ <gs b>]
  \stemNeutral <e a>4 <e gs> <cs a'>^\fermata \bar "|."
}

bass = \relative c {
  \clef bass
  \time 4/4
  \key a \major
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \partial 4 e4 |
  a a a a |
  e e e^\fermata e |

  \break
  a4 a e fs |
  e e e^\fermata cs8[ b] |
  a4 a a a |

  \break
  e'4 e e^\fermata e |
  cs cs \stemUp d d |
  \stemNeutral e e a,4.^\fermata a'8 |

  \break
  a4 a a a |
  e e e e |
  a a e fs |

  \break
  e4 e e^\fermata cs8[ b] |
  a4 a a a |
  e' e e^\fermata e |

  \break
  cs4 cs \stemUp d d |
  \stemNeutral e e a,^\fermata \bar "|."
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
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}    
   
}

