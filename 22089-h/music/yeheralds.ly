\version "2.10"
\include "english.ly"

\header {
  title = "YE HERALDS OF FREEDOM."
  composer = "Music by Kingsley."
  source = "The Liberty Minstrel."
  tagline = ""
}

words = \lyrics {
  Ye her -- alds of free -- dom, ye no -- ble and brave,
  Who dare to in -- sist on the rights of the slave;
  go on -- ward, go on -- ward, your cause is of God,
  And he will soon sev --  er "the op" -- pres -- sor's strong rod.
}

trebleOne = \relative c' {
  \key f \major
  \time 3/4
  \clef treble
  \autoBeamOff
  \stemUp
 
  \partial 4 c4 |
      f f <e g> |
      <f a> <bf d> <a c>8[ <f a>] |
      <e g>4. <d f>8 <e g>4 |
      <f a>2 \bar "|"
  
  \break    
  c4 |
      f f <e g> |
      <f a> <bf d> <a c>8[ <f a>] |
      <e g>4  <c' e> <b d> |
      <g c>2 \bar "|"

  \break
  <a c>4  |
      <d f>4. <c e>8 <bf d>4 |
      <a c> <f a> <a c> |
      <d f>4. <c e>8 <bf d>4 |
      <a c>2 \bar "|"
  
  \break    
  c,4 |
      f f <e g> |
      <f a> <bf d> <a c>8[ <f a>] |
      <e g>4. <d f>8 <e g>4  |
      <c f>2 \bar "|."
}

trebleTwo = \relative c' {
  \key f \major
  \time 3/4
  \clef treble
  \autoBeamOff
  \stemDown
 
  \partial 4 s4 |
      f f s4 |
      s2. |
      s2. |
      s2 \bar "|"
  
  \break    
  s4 |
     s2. |
      s2. |
      s2. |
      s2 \bar "|"

  \break
   s4  |
      s2. |
      s2. |
      s2. |
      s2 \bar "|"
  
  \break    
  s4 |
      f f s4 |
      s2. |
      s2. |
      s2 \bar "|."
}
  
bass =  \relative c {
  \key f \major
  \time 3/4
  \clef bass
  \autoBeamOff
  \override Stem #'neutral-direction = #up

 \partial 4 f4 |
      f d c |
      f g f |
      c4. c8 c4 |
      f2 \bar "|"

  f4 |
      f d c |
      f g f |
      g g g |
      c,2 \bar "|"

  f4 |
      f4. f8 f4 |
      f f f |
      f4. f8 f4 |
      f2 \bar "|"

  f4 |
      f d c |
      f g f |
      c4. c8 c4 |
      f2 \bar "|."
}


\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  
        << 
     \new Voice = "trebleOne" { \trebleOne }
     \new Voice = "trebleTwo" { \trebleTwo }
        >>
     \new Lyrics \lyricsto "trebleOne" { \words }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
   >>
   

\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }
	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    
   }
   
   
%%Transcriber's Note:

%%Fixed harmonic errors in 2nd system, treble part:
%%In bar 4: B-flat changed to B-natural
%%In bar 5: A changed to G

   
