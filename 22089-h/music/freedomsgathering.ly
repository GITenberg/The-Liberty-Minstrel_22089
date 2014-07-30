\version "2.10"
\include "english.ly"

\header {
  title =    "FREEDOM'S GATHERING."
  poet =     "Words from the Pennsylvania Freeman."
  composer = "Music by G.W.C."
  source = "The Liberty Minstrel."
  tagline = ""
}

verseone = \lyricmode {
  A voice has gone forth, and_the land is a -- wake! Our
  free -- men shall ga -- ther from o -- cean to lake, Our
  cause is as pure as the earth ev -- er saw, And_our
  faith we will pledge in the thrill -- ing huz -- za.
  Then huz -- za, then huz -- za, Truth's
  glit -- ter -- ing fal -- chion for free -- dom we draw.
}

trebleOne =  \relative c' {
  \clef treble
  \time 6/8
  \key bf \major
  \autoBeamOff

  \partial 4 f8 ~ f |
  \stemUp bf f f f4 bf16 ~ bf |
  bf8 bf bf bf4_\fermata bf16 ~ bf |

  \break
  bf8 a a a16 bf8. a8 |
  \stemNeutral bf d d d4^\fermata f16 ~ f |

  \break
  d8 f f f16 d8. d16( bf) |
  \stemUp bf8 \stemNeutral a c c4^\fermata f16 ~ f |

  \break
  \stemUp bf,8 a a bf16 \stemNeutral d8. d16 ~ d |
  ef8 c c d4^\fermata \bar "||"

  \break
  d16. d32 |
  d4. r8 bf8. d16 |
  d4. r8 f4 |

  \break
  d16 f8 f d16 d4 d8 |
  ef8 c c d4. \bar "|."
}

trebleTwo =  \relative c' {
  \clef treble
  \time 6/8
  \key bf \major
  \autoBeamOff

  \partial 4 <d f>8 ~ <d f> |
  <f d'>8 <d bf'> <d bf'> <d bf'>4 <d f>16 ~ <d f> |
  <ef g>8 <d f> <d f> <d f>4^\fermata <d f>16 ~ <d f> |

  \break
  <ef ef'>8 <f c'> <f c'> <f c'>16 <g bf>8. <f c'>8 |
  <f d'> <f bf> <f bf> <f bf>4 <d d'>16 ~ <d d'> |

  \break
  <d f'>8 <d d'> <d d'> <d d'>16 <g bf>8. \stemUp <g bf>16(  <g d'>) |
  \stemNeutral <ef ef'>8 <f c'> \voiceOne << { d'16[ e] } \context Voice="1" { \voiceTwo \autoBeamOff f,8 \oneVoice } >> \oneVoice \stemUp <f f'>4^\fermata \stemNeutral <d d'>16 ~ <d d'> |

  \break
  <d f'>8 <f c'> <f c'> \stemUp <g d'>16 \stemNeutral <g bf>8. <g bf>16 ~ <g bf> |
  <ef g>8 \voiceOne << { f f } \context Voice="1" { \voiceTwo \autoBeamOff f f \oneVoice } >> \oneVoice <d bf'>4^\fermata \bar "||"

  \break
  <f d'>16. \stemUp <f f'>32 |
  <f f'>4. \stemNeutral r8 <f d'>8. <d f'>16 |
  <d f'>4. r8 <f d'>4 |

  \break
  <d f'>16 \stemUp <a' c>8 <a c> <g d'>16 \stemNeutral <g bf>4 <g bf>8 |
  <ef g> \voiceOne << { f f } \context Voice="1" { \voiceTwo \autoBeamOff f f \oneVoice } >> \oneVoice <d bf'>4. \bar "|."
}

bass = \relative c {
  \clef bass
  \time 6/8
  \key bf \major
  \autoBeamOff

  \partial 4 f8 ~ f |
  bf, bf bf bf4 bf16 ~ bf |
  ef8 bf bf bf4^\fermata bf16 ~ bf |

  \break
  ef8 f f f16 g8. f8 |
  bf, bf bf bf4^\fermata bf'16 ~ bf |

  \break
  bf8 bf bf g16 g8. g16 ~ g |
  ef8 f f f4 bf16( bf) |

  \break
  bf8 f f g16 g8. g16 ~ g |
  ef8 f f bf,4^\fermata \bar "||"

  \break
  bf'16. bf32 |
  bf4. r8 bf8. bf16 |
  bf4. r8 bf4 |

  \break
  bf16 f8 f g16 g4 g8 |
  ef8 f f bf,4. \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "trebleOne" { \trebleOne }
     \new Staff = "upperTwo" \new Voice = "trebleTwo" { \trebleTwo }
     \new Lyrics \lyricsto "trebleTwo" { \verseone }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}   
}

%%Transcriber's Notes:

%%Added missing ties 1st system, 1st bar, trebleOne part, and 2d system, 2d bar, trebleTwo part.