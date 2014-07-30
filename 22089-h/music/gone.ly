\version "2.10"
\include "english.ly"

\header {
  title = "GONE, SOLD AND GONE."
  poet = "Words by Whittier."
  composer = "Music by G.W. Clark."
  source = "The Liberty Minstrel."
  tagline = ""
}

verseone = \lyricmode {
  Gone,  "gone----"  sold and gone, To the
  \override LyricHyphen #'minimum-distance = #1.0
  rice -- swamp dank and
  lone, Where the slave -- whip cease -- less swings, Where the
  noi -- some in -- sect stings, Where the fe -- ver de -- mon
  strews Poi -- son with the fall -- ing dews, Where the
  sick -- ly sun -- beams glare Through the hot and mis -- ty
  air,  Gone,  "gone----"  sold and gone, To the
  rice -- swamp dank and lone, From Vir -- gin -- ia's hills and
  wa -- "ters,----" Woe is me  my sto -- len daugh -- ters! 
}

versetwo = \lyricmode {
  Gone, "gone----" sold and gone, To the rice -- swamp dank and
  lone, There no moth -- er's eye is near_them, There no
  moth -- er's ear can hear_them; Nev -- er when the torturing _
  lash Seams  their back  with many a gash, Shall  a
  mother's  kind -- ness bless them, Or a moth -- er's arms caress
  them.  Gone,  "gone----"  sold and gone, To  the
  rice -- swamp dank  and lone, From  Vir -- gin -- ia's hills  and
  wa -- "ters,----" Woe is me   my sto -- len daugh -- ters!   
}

treble = \relative c' {
  \clef treble
  \key a \minor
  \time 3/4
  \autoBeamOff
  \stemDown
  
  <a' c>2\fermata r4 | 
    <gs b>2\fermata r4 | 
    <c e>2^\decr <b d>4\enddecr | 
    <a c>2\fermata <a c>8 <b d> | 
    <c e> <d f> <gs, b>4. <b d>8 |

  \break
  <a c>2\fermata <a c>8. <b d>16 |
    <c e>4. <e g>8 <c a> <gs b> |
    \grace b8\turn a2 <a c>8. <b d>16 |

  \break
  <c e>4. <e g>8 <c a> <gs b> |
    \grace b8 a2\fermata <a c>8. <a c>16 |
    <a c>4. <a c>8 <c e> <b d> |
    
   \break
  <gs b>2 <gs b>8. <gs b>16 |
    <g b>4. <g b>8 <b d> <a c> |
    a2 <a c>8. <a c>16 |

  \break
  <c e>4. <b d>8 <d f> <b d> |
    <b d>( <c e>4.) <b d>8 <c e> |
    <b d>4. <a c>8 a <gs b> |

  \break
  a8~ a2 r8 |
    <a c>2\fermata r4 |
    <gs b>2\fermata r4 |
    <c e>2^\decr <b d>4\enddecr |
    <a c>2\fermata <a c>8. <b d>16 |

  \break
  <c e>8 <d f> <gs, b>4. <b d>8 |
    <a c>2\fermata <a c>8. <b d>16 |
    <c e>[ <b d>] <a c>8 <b d>4. <b d>8 |  
    
  \break
  <b d>8 <c e>2 r8 | <d f>2-> <b d>4 |
    <c e>2 r8 <d f> | <gs, b e>2-> <gs b d>4 |
    <a c>8 a4.\fermata r8 \bar "|." 
}

bass =  \relative c {
  \clef bass
  \key a \minor
  \time 3/4
  \autoBeamOff
  
  <a a'>2\fermata r4 |
    e'2\fermata r4 |
    c2^\decr e4\enddecr |
    a,2\fermata r4 |
    R2. |

  \break
  r2 e'8. e16 |
    e4. e8 e e |
    \grace a,8\turn a2 e'8. e16 |

  \break
  e4. e8 e e |
    \grace a,8 a2\fermata a8. a16 |
    a4. a8 a \stemUp d \stemNeutral |
    e2 e8. e16 | e4. e8 e e | a,2 c8. c16 |
    c4. g'8 g g |
    g( c,4.) g'8 g |
    g4. e8 e e |

  \break
  a,8~ a2 r8 |
    a2\fermata r4 |
    e'2 r4 |
    e2 e4 |
    a,2\fermata r4 |

  \break
  R2. | R2. | R2. |
  
  \break
  R2. | g'2-> g4 |
    c,2 r8 d8 | e2 e4 |
    a,8 a4.\fermata r8
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}    	   

   }
