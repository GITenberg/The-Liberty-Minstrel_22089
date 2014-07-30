\version "2.10"
\include "english.ly"

\header {
  title = "THE MERCY SEAT."
  poet = "Words by Mrs. Sigourney."
  composer = "Music by G. W. C."
  source = "The Liberty Minstrel."
  tagline = ""
}

verseOne = \lyricmode {
  From eve -- ry stor -- my wind that blows, 
  From eve -- ry swell -- ing tide of 
  woes, There is a calm a sure re --
  treat-- Our re -- fuge is the Mer -- cy -- seat.
}

verseTwo = \lyricmode {
 There is a place where Je -- sus sheds 
 The oil of glad -- ness on our 
 heads, A place than all be -- side more 
 sweet-- We seek the blood -- bought Mer -- cy -- seat.
}

soprano =  \relative c' {
  \clef treble
  \time 2/4
  \key d \major
  \autoBeamOff
  \override Stem #'neutral-direction = #up

  \partial 4 fs4 |
      fs8[ a] b[ g] |
      fs4 a8[ fs] |
      fs[ e] g[ b] |
      b4( a)

  \break
  r4. a8 |
      g[ fs] g[ a] |
      b[ cs] d[ b] |
      b[ a] e'[ d] |

  \break
  d4^\fermata( cs8) r8 |
      r4 a |
      a8[ fs] fs[ a] |
      d4. a8 |
      d[ e] fs[ g] |
  
  \break
  fs4( e8) e |
      fs8( d4) \stemNeutral b8 |
      a8( d4) fs16[ e16] |
      d4 cs4 |
      d2 \bar "|."  
}

alto =  \relative c' {
  \clef treble
  \time 2/4
  \key d \major
  \autoBeamOff
  \stemUp

  <fs a>4 |
      <fs a>8[ <d fs>] <b' d>[ <g b>] |
      <fs a>4 <d fs>8[ <fs a>] |
      <fs a>[ <e g>] <cs e>[ <e g>] |
      << { \voiceOne g4( fs4) } \\{ \voiceThree d2 } >> \oneVoice |

  \break
  r4. <d fs>8 |
      <cs e>[ d] <cs e>[ <d fs>] |
      <e g>[ <fs a>] <g b>[ <fs d'>] |
      <g d'>[ <e cs'>] <e cs'>[ <d b'>] |

  \break
  \slurUp <d b'>4^\fermata( <cs as'>8) r8 |
      r4 <fs d'> |
      <fs d'>8[ <d a'>] <fs a>[ <d fs>] |
      <fs a>4. <d fs>8 |
      <fs b>[ <g cs>] <fs d'>[ <e e'>] |
  
  \break
  <d d'>4( <cs cs'>8) <e cs'> |
      \stemUp <a d>8( <fs a>4) <e g>8 |
      <d fs>8( <fs a>4) <fs d'>16[ <g e'>] |
      <a fs'>4 <g e'>4 | 
      <fs d'>2 \bar "|."
}

bass =  \relative c {
  \clef bass
  \time 2/4
  \key d \major
  \autoBeamOff	
  \override Stem #'neutral-direction = #up
	
  d4 |
      d d |
      d d |
      a a |
      d2 |

  \break
  r4. d8 |
      a4 a |
      d8[ fs] g4 |
      e es |

  \break
  fs4^\fermata ~ fs8 r8 |
      r4 d |
      d d |
      d4. d8 |
      g[ e] fs[ g] |
  
  \break
  a4. a8 |
      d,4. d8 |
      d4. fs16[ g16] |
      a4 a,4 |
      d2 \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "soprano" { \soprano }
     \new Lyrics \lyricsto "soprano" { \verseOne }
     \new Staff = "upperTwo" \new Voice = "alto" { \alto }
     \new Lyrics \lyricsto "soprano" { \verseTwo }
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4 ) }}   

}

%%Transcriber's Notes:

%%Dissonances are retained as in the original, as there are so many it is not clear whether they were intended.