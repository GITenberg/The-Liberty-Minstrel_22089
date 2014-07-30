\version "2.10"
\include "english.ly"

\header {
  title =    "YE SONS OF FREEMEN."
  poet =     "Words by Mrs. J.G. Carter."
  composer = "Air, \"Marseilles Hymn.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

verseOne = \lyricmode {
  Ye sons of free -- men wake to sad -- ness, Hark! hark, what 
  my -- riads bid you rise; Three mil -- lions of our race in 
  mad -- ness Break out in wails, in bit -- ter cries, Break out in 
  wails, in bit -- ter cries; Must men whose hearts now bleed with 
  an -- guish, Yes, tremb -- ling slaves, in free -- dom's land En -- 
  dure the lash, nor raise a hand? Must
  na -- ture 'neath the whip -- cord lan -- guish? Have 
  Pi -- ty on the slave, Take cour -- age from God's 
  word; Pray on, pray on, all hearts re --
  solved, These cap -- tives shall be free, 
  Pray on, Pray on, all hearts re -- 
  solved these cap -- tives shall be free.  
}

soprano =  \relative c' {
  \clef treble
  \time 4/4
  \key a \major
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'()

  \partial 8*3 e8 e e |
      a4 a a gs |
      a2 a8 a a a |

  \break
  a4 d2 e8. d16 |
      cs2 r8 cs cs d |
      e4. a,8 a4 b8.[ a16] |

  \break
  a4 gs r8 gs gs gs |
      \stemUp b4 b b cs8.[ b16] |
      b4( a) r8 \stemNeutral e' e8. e16 |
  
  %%% systems 4-6    
  \break
  e4 cs8.[ a16] e'4 cs8.[ a16] |
      e2 r8 gs gs gs |
      fs4 b8.[ as16] b4 d |

  \break
  cs4 cs r8 a a a |
      a4. a8 a4 d8[ cs8] |
  %%[**NOTE: image has "e2 r4 r8 e4" which is an eighth too long!]
      e2 r4 e4 |

  \break
  e4. e8 e e e e |
      e2 r4 gs,4 |
  
  %%% systems 7 - 9    
  \break
  a4. gs8 a a \stemUp b \stemNeutral c |
      cs4 b r4 r8. e16 |

  \break
  e2 ~ e8. b16 c8. a16 |
  %%[**NOTE: image is one-eighth shy, presumably on the second rest]
      b2 r4 r8. e16 |
      e2 ~ e8. b16 c8. a16 |

  \break
  b2 r4 cs |
      cs2. cs4 |
      e1 |
      d2 cs4 a |
  
  %%% systems 10 - 12    
  \break
  gs2 r4 b |
      cs2 ~ cs8. a16 \stemUp b8. \stemNeutral d16 |
      cs2 r4 b |

  \break
  cs2. cs4 |
      a1 |
      d2 cs4 a |

  \break
  gs2 r4 \stemUp b |
     \stemNeutral cs2 ~ cs8. a16 \stemUp b8. \stemDown d16
      cs2^\fermata r8 \bar "|."
}

alto =  \relative c' {
  \clef treble
  \time 4/4
  \key a \major
  \autoBeamOff
  \stemUp
  \override Staff.TimeSignature #'style = #'()

  \partial 8*3 e8 e e |
      <cs a'>4 <cs a'> <fs b> <e b'> |
      e'4.( cs8) <e, a>8 <e a> <e a> <e a> |

  \break
  <d fs>4 <fs d'>2 <e b'>8. <e gs>16 |
      <e a>2 r8 <e a>8 <e a> <e b'> |
      <e cs'>4. <e cs'>8 <e cs'>4 d'8.[ cs16] |

  \break
  d8.[ cs16] <e, b'>4 r8 <e b'> <e b'> <e cs'> |
      <gs d'>4 <gs d'> <gs d'> e'8.[ d16]  |
      d4( cs) r8^\markup { \bold "Unisons." } \stemDown e e8. e16 |

  %%% systems 4-6    
  \break
  e4 cs8.[ a16] e'4 cs8.[ a16] |
      \stemUp e2 r8 e e e |
      <fs b>4 <fs b> <fs d'> b8[ gs] |

  \break
  b8.[ a16] <e a>4 r8 <e a>8 <e a> <e g> |
      <d fs>4. <e a>8 <e a>4 gs8[ a] |
  %%[**NOTE: image has "<gs b>2 r4 r8 <gs b>4" which is an eighth too long!]
      <gs b>2 r4 <gs b>4 |

  \break
  <a c>4. <a c>8 <gs b> <a c> <b d> <a c> |
      \grace c4 <gs b>2 r4 <e b'> |
  
  %%% systems 7-9    
  \break
  <e c'>4. <e b'>8 <e a> <e c'> <f b> <f a> |
      a8.[ gs16] <e gs>4 r4^\markup { \bold "Unisons." } r8. \stemDown e'16 |

  \break
  e2 ~ e8. b16 c8. \stemUp a16 |
  %%[**NOTE: image is one-eighth shy, presumably on the second rest]
      <e b'>2 r4 r8. \stemDown e'16 |
      e2 ~ e8. b16 c8. \stemUp a16 |

  \break
  <gs b>2 r4 e |
      <e a>2. <e a>4 |
      <a cs>1 |
      <a d>2 <a e'>4 <fs fs'> |
  
   %%% systems 10-12   
  \break
  <e b'>2 r4 <gs fs'>4 |
      <a e'>2 ~ <a e'>8. <e cs'>16 <e d'>8. <e b'>16 |
      <e a>2 r4 e |

  \break
  <e a>2. <e a>4 |
      <a cs>1 |
      <fs d'>2 <a e'>4 <fs fs'> |

  \break
  <e b'>2 r4 <a fs'> |
       <a e'>2 ~ <a e'>8. <e cs'>16 <e d'>8. <e b'>16
       <e a>2^\fermata r8 \bar "|."
}


tenor = \relative c' {
  \clef treble
  \time 4/4
  \key a \major
  \autoBeamOff
  \stemDown
  \override Staff.TimeSignature #'style = #'()

  s8 * 3 | s1 | e2 s2 |

  s1 | s1  | s2. e4 |

  e4 s2. | s2. e4 | e2 s2 |
  
  %%% systems 4-6 
  s1 | e2 s8 e8 e8 e8 | s2. e4 |
  
  e4 s2. | s2. e4 | s1 |

  s1 | s1 |
  
  %%% systems 7-9 
  s1 | e4 s2. |
  
  s1 | s1 | s1 |
  
  s2. e4 | s1 | s1 | s1 |
  
  %%% systems 10-12
  s1 | s1 | s2. e4 |
  
  s1 * 3 |
  
  s1 * 2 | s2 s8 \bar "|."
}

bass =  \relative c {
  \clef bass
  \time 4/4
  \key a \major
  \autoBeamOff	
  \override Staff.TimeSignature #'style = #'()

  e8 e e |
      a4 fs d e |
      cs2 cs8 cs cs cs |

  \break
  \stemUp d4 \stemNeutral b2 e8. e16 |
      a,2 r8 a'8 a a |
      a4. a8 a4 gs8.[ a16] |

  \break
  e4 e r8 e e e |
      e4 e e e |
      a2 r8 e'8 e8. e16 |
  
  %%% systems 4-6 
  \break
  e4 cs8.[ a16] e'4 cs8.[ a16] |
      e2 r8 e e e |
      \stemUp d4 d8.[ cs16] \stemNeutral b4 e4 |

  \break
  fs4 fs r8 cs cs cs |
     \stemUp d4. \stemNeutral cs8 cs4 b8 a8 |
     %%[**NOTE: image has "e2 r4 r8 e4" which is an eighth too long!]
     e'2 r4 e4 |

  \break
  a4. e8 e e e e |
     e2 r4 e |
  
  %%% systems 7-9
  \break
  a,4. b8 c c \stemUp d d |
      \stemNeutral e4 e r4 r8. e'16 |

  \break
  e2 ~ e8. b16 c8. a16 |
      %%[**NOTE: image is one-eighth shy, presumably on the second rest]
      e2 r4 r8. e'16 |
      e2 ~ e8. b16 c8. a16 |

  \break
  e2 r4 gs |
      a2. a4 |
      a1 |
      fs2 e4 d |
  
  %%% systems 10-12
  \break
  e2 r4 d |
      e2 ~ e8. e16 e8. e16 |
      a,2 r4 a'4 |

  \break
  a2. a4 |
      a1 |
      fs2 e4 d |

  \break
  e2 r4 d |
      e2 ~ e8. e16 e8. e16
      <a, a'>2^\fermata r8 \bar "|."
}

\score { 
<<	
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "soprano" { \soprano }
     \new Staff = "upperTwo" 
               <<
     \new Voice = "alto" { \alto }
     \new Voice = "tenor" { \tenor }
               >> 
     \context Lyrics = "lyrics" \lyricsto "soprano" \verseOne
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
   
>>

\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }} 	  
	  
}

%%Transcriber's Notes:

%%5th system, last measure: all parts are too long by an eighth, removed eighth rest to correct timing.

%%8th system, 2nd measure: all parts are short by a sixteenth, added dot to eighth rest to correct timing.

%%See also notes in the body of the code at these places.

%%Original dissonances have been retained, as they may have been intentional.

