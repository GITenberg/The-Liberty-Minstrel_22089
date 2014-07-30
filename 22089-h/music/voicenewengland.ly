\version "2.10"
\include "english.ly"

\header {
  title = "VOICE OF NEW ENGLAND AGAINST SLAVERY."
  poet = "Words by Whittier."
  composer = "Music by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyricmode {
  Up the hill side, down the glen, Rouse the slee -- ping
  cit -- i -- zen; Sum -- mon out the might of men!
  Like a li -- on growl -- ing low, Like a night -- storm
  ris -- ing slow, Like the tread of un -- seen foe.
}


trebleOne =  \relative c' {
  \key a \major
  \time 2/4
  \clef treble
  \autoBeamOff

  a'8. a16 cs8 cs8 |
      e8. e16 e4 |
      b8. e16 e8 cs8 |

  \break    
  b8. e16 e4 ~ |
      e4 r4 |
      cs8. d16 e8 fs8 |
      d8 cs8 b4 ~ |
      b4 r4 |

  \break    
  cs8. cs16  cs8 cs8 |
      e8 e8 b4 ~ |
      b4 r4 |
      e8. e16 e8 e8 |
  
  \break    
  b8 cs8 b4 ~ |
      b4 r4 |
      e8. e16 b8 b8 |
      a8 b8 cs4 ~ |
      cs4 \bar "|."
}

trebleTwo =  \relative c' {
  \key a \major
  \time 2/4
  \clef treble
  \autoBeamOff

  e8. e16 a8 a8 |
      cs8. b16 b4 |
      d8. cs16 b8 a8 |

  e'8. b16 b4 ~ |
      b4 r4 |
      e8. d16 cs8 d8 |
      \stemUp b8 a8 e4 ~ |
      e4 r4 |

  a8. a16  a8 a8 |
      \stemNeutral b8 cs8 e,4 ~ |
      e4 r4 |
      b'8. b16 b8 b8 |
  
  d8 e8 e,4 ~ |
      e4 r4 |
      cs'8. cs16 d8 d8 |
      fs,8 e8 a4 ~ |
      a4 \bar "|."
}

bass =  \relative c {
  \key a \major
  \time 2/4
  \clef bass
  \autoBeamOff

  e8. e16 a8 a8 |
      e8. e16 e4 |
      e8. e16 e8 fs8 |

  e8. e16 e4 ~ |
      e4 r4 |
      a8. a16 a8 a8 |
      e8 e8 e4 ~ |
      e4 r4 |

  a,8. a16  a8 a8 |
      e'8 e8 e4 ~ |
      e4 r4 |
      e8. e16 e8 e8 |     
            
  e8 e8 e4 ~ |
      e4 r4 |
      a8. a16 d,8 d8 |
      d8 e8 a4 ~ |
      a4 \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "trebleOne" { \trebleOne }
     \new Staff = "upperTwo"  \new Voice = "trebleTwo" { \trebleTwo }
     \new Lyrics \lyricsto "trebleOne" { \words }
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}   

}
