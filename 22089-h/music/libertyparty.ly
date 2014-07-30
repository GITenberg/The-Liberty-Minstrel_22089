\version "2.10"
\include "english.ly"

\header {
  title =    "THE LIBERTY PARTY."
  poet =     "Words by E. Wright, jr."
  composer = "Tune--\"'Tis Dawn, the Lark is Singing.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

verseone = \lyricmode {
  Will ye des -- pise the a -- corn, Just thrust -- ing out its
  shoot, Ye gi -- ants of the for -- est, That
  strike the deep -- est root? Will ye des -- pise the
  stream -- lets Up -- on the moun -- tain side; Ye
  broad and migh -- ty riv -- ers,
  On sweep -- ing to the tide?
}

versetwo = \lyricmode {
  Wilt thou des -- pise the cres -- cent, That trem -- bles, new -- ly
  born, Thou bright and peer -- less plan -- et, Whose
  reign shall reach the morn? Time now his scythe is
  whet -- ting, Ye gi -- ant oaks, for you; Ye
  floods, the sea is thirst -- ing, To drink you like the dew.
}

treble = \relative c' {
  \clef treble
  \time 4/4
  \key bf \major
  \autoBeamOff
  \stemUp

  \partial 4*1 \voiceOne << { f4 } \context Voice="1" { \voiceTwo f4 \oneVoice } >> \oneVoice |
  <f bf>4. <f bf>8 \stemUp <bf d>4 <g bf>4 |
  <g bf>2 <ef g>4 <g bf>4 |
  \voiceOne << { f4 } \context Voice="1" { \voiceTwo f4 \oneVoice } >> \oneVoice <f bf>4 <f c'>4 \stemUp <bf d>4 |

  \break
  <a c>2 r4 \voiceOne << { f4 } \context Voice="1" { \voiceTwo f4 \oneVoice } >> \oneVoice |
  <f bf> <f bf> \stemUp <bf d> <g bf> |
  <g bf>2 <ef g>4 <g bf> |

  \break
  \voiceOne << { f4. } \context Voice="1" { \voiceTwo f4. \oneVoice } >> \oneVoice <f bf>8 <f d'>4 <ef c'> |
  <d bf'>2 r4 \voiceOne << { f4 } \context Voice="1" { \voiceTwo f4 \oneVoice } >> \oneVoice |
  \stemUp <a c>4. <a c>8 <g bf>4 <a c> |

  \break
  <bf d>2 <bf d>4 <bf d>4 |
  <c ef>4 <bf d>4 \voiceOne << { g4 } \context Voice="1" { \voiceTwo g4 \oneVoice } >> \oneVoice \stemUp <a c>4 |
  \voiceOne << { bf2( a4) } \context Voice="1" { \voiceTwo ef2. \oneVoice } >> \oneVoice <d f>4 |

  \break
  <f bf>4. <f bf>8 \stemUp <bf d>4 <g bf> |
  <g bf>2 <ef g>4 <g bf> |
  \voiceOne << { f4. } \context Voice="1" { \voiceTwo f4. \oneVoice } >> \oneVoice <f bf>8 <f bf d>4 <ef a c>
  \partial 4*3 <d f bf>2 r4 \bar "|."
}

bass = \relative c {
  \clef bass
  \time 4/4
  \key bf \major
  \autoBeamOff

  \partial 4*1 f4 |
  bf,4. bf8 bf4 bf |
  ef2 ef4 ef |
  \stemUp d d \stemNeutral c bf |

  \break
  f'2 r4 f4 |
  bf, bf bf bf |
  ef2 ef4 ef |

  \break
  \stemUp d4. \stemNeutral bf8 f'4 f |
  bf,2 r4 f' |
  f4. f8 f4 f |

  \break
  bf2 bf4 bf |
  g f ef c |
  f2. f4 |

  \break
  bf,4. bf8 bf4 bf |
  ef2 ef4 ef |
  \stemUp d4. \stemNeutral bf8 f'4 f
  \partial 4*3 bf,2 r4 |
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \verseone }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
     \new Lyrics \lyricsto "treble" { \versetwo }
   >>

\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 108 4 ) }}    	   
}
