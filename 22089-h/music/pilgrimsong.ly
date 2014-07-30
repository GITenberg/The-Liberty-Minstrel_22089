\version "2.10"
\include "english.ly"

\header {
  title = "PILGRIM SONG."
  poet = "Words by Geo. Lunt."
  composer = "Air \"Troubadour.\""
  source = "The Liberty Minstrel."
  tagline = ""
}


%% music function to allow lyrics to skip a given number of note-syllables
%% skips #7 will skip over 7 music note-syllables.
skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})

       fermataBar = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
       \mark \markup { \musicglyph #"scripts.ufermata" }       }

lineOne = \lyricmode {
  O -- ver the moun -- tain wave  See where they come; 
  Storm -- cloud and win -- try wind  Wel -- come them home; 
    
  Yet where the soun -- ding gale 
  Howls to the sea,  There their song peals a -- long, 
  Deep toned and free.
}

lineTwo = \lyricmode {
  \skips #20 Pil -- grims and wan -- der -- ers, 
  Hith -- er we come;  Where the free dare to be, 
    This is our home.
}

treble =  \relative c' {
  \clef treble
  \time 4/4
  \key f \major
  \autoBeamOff
  \stemUp

  <f a>4 <f c'>8 <f a> <c f> <c f> <c f>4 |
      <e g> <d f>8 <e g> <f a>2 |

  \break
  <f a>4 <f c'>8 <f a> <c f> <c f> <c f>4 |
  <e g> <e a>8 <e g> << { f2 } \new Voice = alto { \voiceTwo f2 } >> |

  \repeat volta 2 {
       <a f'>4 <f e'>8 <f d'> <e c'>8. <e a>16 <c f>4 |

  \break
  <f d'>4 <f c'>8 <f bf> <f a>2 |
      << { f8. } \new Voice = alto { \voiceTwo f8. } >> 
          g16 <f a>4 <d bf'>8. <d c'>16 <d d'>4 \mark \markup { \fontsize #-2 \musicglyph #"scripts.ufermata" }  |
      <f d'>8 <e c'>4 << { e8 f2 } \new Voice = alto { \voiceTwo e8 f2 } >> |
  } 
}

bass = \relative c {
  \clef bass
  \time 4/4
  \key f \major
  \autoBeamOff
  
  f4 f8 f a f f4 | c c8 c f2 |

  \break
  f4 f8 f a f f4 | c c8 c f2 |

  \repeat volta 2 {
  c'4 a8 f c8. c16 c4 |

  \break
  bf'4 a8 g f2 | f8. f16 f4 bf8. bf16 bf4  \mark \markup { \fontsize #-2 \musicglyph #"scripts.ufermata" }   | bf8 c4 c,8 f2 |
  }
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper" \new Voice = "treble" { \treble }
         \new Lyrics \lyricsto "treble" { \lineOne }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
	 \new Lyrics \lyricsto "treble" { \lineTwo }
   >>
   
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
        %% move mark engraver to staff context to allow fermata to be placed over bars as a rehearsal mark
	\context { \Score \remove "Mark_engraver" }
        \context { \Staff \consists "Mark_engraver" }
	  } 
}


\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
   \new Voice = "treble" { \unfoldRepeats { \treble }  }
 
   \new Staff = "lower" { \unfoldRepeats { \bass }  }
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4)  }}    

}

%%Transcriber's Notes:

%%A separate score is provided to unfold the repeats and generate the midi.

%%Last system, second bar, treble staff: A note with a reversed stem in the original is assumed to be a typo and is not reproduced here.
