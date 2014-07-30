\version "2.10"
\include "english.ly"

\header {
   title = "ZAZA--THE FEMALE SLAVE."
   poet = "Words by Miss Ball."
   composer = "Music by G. W. C."
   source = "The Liberty Minstrel."
   tagline = ""
}

words = \lyricmode {
   \set stanza = "1."	
   O my coun -- try, my coun -- try! how
   long I for thee, Far o -- ver the
   moun -- tain, Far o -- ver the
   sea. Where the sweet Jo -- li -- ba,
   kiss -- es the shore, Say, shall I wan -- der by
   thee nev -- er more? Where the sweet Jo -- li -- ba Kiss -- es the
   shore, Say, shall I wan -- der by thee nev -- er more.
}

treble =  \relative c' {
  \key f \major
  \time 2/4
  \clef treble
  \autoBeamOff
  \stemUp

  \tag #'toFINE { <f a>4. <e g>8 |
      <e g>8 f4 f8 |
      <e g>8 <g bf>4\fermata <bf d>8 |

  \break
  <bf d>8[ <a c>8] <a c>8. <f a>16 |
      <a c>2\fermata |
      <a c>4.( <f a>8) |
      <g bf>8[ <a c>8] <bf d>8 <c e>8 |

  \break    
  <d f>4.( <a c>8) |
      <a c>2 ~ |
      <a c>4 <f a>8[ <a c>8] |
      <g bf>8[ <e g>8] <c f>8. <c e>16 |

  \break    
  <a f'>2\fermata ~ |
      <a f'>4 r4^\markup { \bold Fine. } } \bar "||"
      \tag #'toDC { <f' a> <g bf>8 <f a>8 |
      <e g>8 <d f>8 <d f>4 |

  \break    
  <g bf> <e g>8 <g bf>8 |
      <g bf>4( <f a>4\fermata) |
      <f a> <g bf>8 <f a>8 |
      <e g>8 <d f>8 <d f>4 |

  \break    
  <e g>8[ <g bf>8] <c, e>8 <c g'>8 |
      <a f'>2^\fermata \repeat volta 2 {
      <f' a>4 <g bf>8 <f a>8 |
      <a c>4 <f a>8 <f a>8 |
      <g bf>4 <e g>8 <g bf>8 |

  \break    
  <g bf>4( <f a>^\fermata) |
      <f a> <g bf>8 <f a> |
      <e g> f f4 |
      <e g>8[ <g bf>] <c, e>8. <c g'>16 |
      \once \override Script #'script-priority = #-100
      <a f'>2^\fermata^\markup { \hspace #4 \bold "D.C."} } }
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
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
   \new Staff = "upper"  \new Voice = "treble" { \unfoldRepeats { \treble }  %%% from begining, through repeats, to D.C.
                                                 \removeWithTag #'toDC \treble  }  %%% D. C. to FINE
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 4 ) }}    

}

