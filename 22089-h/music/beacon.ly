\version "2.10"
\include "english.ly"

\header {
  title = "A BEACON HAS BEEN LIGHTED."
  poet = "Parody by G.W.C."
  composer = "Air, \"Blue-eyed Mary.\""
  source = "The Liberty Minstrel."
  tagline = ""
}


leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

verseone = \lyricmode {
  A bea -- con has been light -- ed, Bright as the noon -- day
  sun; On worlds of mind be -- night -- ed, Its
  rays are pour -- ing down; 
}

versetwo = \lyricmode {
  Full many a shrine of er -- ror, And many a deed of
  shame, Dis -- mayed, has shrunk in ter -- ror, Be --
  fore the light -- ed flame.
  
  \once \override LyricText #'self-alignment-X = #0.6
  \markup{ \raise #3 \rightbrace  "    Vic"} -- to -- rious, on, vic --
  to -- rious! Proud bea -- con on -- ward haste; Till
  floods of light all glo -- rious, Il -- lume the mor -- al
  waste, Il -- lume the mor -- al waste.
  


}


treble = \relative c' {
  \key f \major
  \time 6/8
  \clef treble
  \autoBeamOff
  \stemUp

  \repeat volta 2 { \partial 8 <f a>16[ <g bf>] |
      <a c>4 <a c>8 <a c>[ <c f> ] <bf d> |
      <a c>4. <f a>4 <a c>8 |
      <a c>8[ <g bf>] <g bf> <e g>[ <f a>] <g bf> |
  
  \break    
  <bf d>4.( <a c>8) r <f a>16[ <g bf>] |
      <a c>4 <a c>8 <a c>[ <c f>] <bf d> |
      <a c>4. <f a>4 <f a>8 |

  \break
  <g bf>4 <g bf>8 <e g>4 <e g>8 |
      f4. ~ f4 }
      \repeat volta 2 { \override TextScript #'padding = #1.0 <f a>8^\markup{\bold "Chorus." } |
      <e g>[ <f a>] <g bf> <e g>[ <f a>] <g bf> |

  \break
  <a c>4. <f a>4 <f a>8 |
      <e g>[ <f a>] <g bf> <e g>[ <f a>] <g bf> |
      <a c>4. r4 <f a>16[ <g bf>] |
  
  \break
  <a c>4 <a c>8 <a c>[ <c f>] <bf d> |
      <a c>4. <f a>4 \override Score.VoltaBracket #'stencil = ##f  } 
          \alternative {{ <f a>8 |
                            <g bf>4 <g bf>8 <e g>4 <e g>8 |                        
			    \break    
                            f4. ~ f4 }  
			   
                        { <a f'>8^\markup{ \bold "Last time." } |
                            <bf g'>4 <bf g'>8 <g e'>4 <g e'>8 |
                            <a f'>4. ~ <a f'>4 }} \bar "|."  
}

bass = \relative c {
  \key f \major
  \time 6/8
  \clef bass
  \autoBeamOff
 
  
  \repeat volta 2 { \partial 8 f8 |
      f4 f8 f4 f8 |
      f4. f4 f8 |
      c4 c8 c4 c8 |

  f4. ~ f8 r f |
      f4 f8 f4 f8 |
      f4. f4 f8 |

  c4 c8 c4 c8 |
      f4. ~ f4    }
      \repeat volta 2 { f8 |
      c4 c8 c4 c8 |
      
  f4. f4 f8 |
      c4 c8 c4 c8 |
      f4. r4 f8 |
      
  f4 f8 f4 f8 |
      f4. f4  } 
          \alternative { {  f8 |
	                    c4 c8 c4 c8 | 
	                    f4. ~ f4 } 
			    
		       { f8 |
                         c4 c8 c4 c8 |
                         f4. ~ f4 } } \bar "|."
}



\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \verseone }
     \new Lyrics \lyricsto "treble" { \versetwo }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
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
    \new Staff = "upper"  \new Voice = "treble" { \unfoldRepeats \treble  }
    \new Staff = "lower"  \new Voice = "bass" { \unfoldRepeats \bass  }
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}    

}

%%Transcriber's Notes:

%%Standard volta style repeats with alternative endings are used; however, the printing of the volta brackets has been suppressed to create an effect matching the original image. 

%%A separate score block has been added to unfold the repeats and alternatives, and to generate the midi.