\version "2.10"
\include "english.ly"


\header {
  title = "THE NEGRO'S APPEAL."
  poet = "Words by Cowper."
  composer = "Tune--\"Isle of Beauty.\""
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }


lineOne= \lyricmode {
  Forced from home and all its plea -- sures, Af -- ric's coast I  
  left _ for -- _ lorn;  
}

lineTwo = \lyricmode {
  To in -- crease a  stran -- ger's trea -- sures, 
  O'er the rag -- ing \skip8 \skip8 \skip8 \skip8 \skip2 bil -- lows borne. 
    \once \override LyricText #'self-alignment-X = #0.6 
  \markup{ \raise #3 \rightbrace  "   Chris"} -- tian peo -- ple 
  bought and sold me, Paid my price in pal -- try gold:
}

lineFine = \lyricmode {
  But though slave they  have en -- rolled me, \markup { \italic Minds } 
  are ne -- ver to _ be _ sold. 
}

trebleOne =  \relative c' {
  \clef treble
  \time 4/4
  \key ef \major
  \override Staff.TimeSignature #'style = #'()

  \tag #'first { \stemUp bf'4. af8 g4 g |
      g4. f8 f4 ef |
      bf'4. g8 af4 \stemNeutral c  | \break } 
      
  \tag #'fine { \override TextScript #'staff-padding = #3
      bf8[ ^\markup { \bold "1st time." }  af] g[ f] 
      \once \override Script #'script-priority = #-100 g2^\fermata ^\markup { \bold "FINE."} \bar ":|" }
      \tag #'toDC { \stemUp bf4 ^\markup { \bold "2d time."} f g2 \bar "||" 
      \stemNeutral af4. g8 f4 f |
    
  \break
  f4. ef8 ef4 d |
      bf'4. bf8 bf4 bf |
      c4. c8^\markup {\bold "D.C."} bf2 \bar "|." }
} 
  
trebleTwo =  \relative c' {
  \clef treble
  \time 4/4
  \key ef \major
  \override Staff.TimeSignature #'style = #'()

  \tag #'first { g'4. f8 ef4 ef |
      \stemUp bf'4. \stemNeutral af8 af4 g |
      ef'4. bf8 d8[ c8] bf8[ af8] | }
  
  \tag #'fine { g8[ f8] ef8[ d8] ef2^\fermata | }
      \tag #'toDC { g8[ f8] bf8.[ d,16] ef2 | 
      f4. ef8 d4 d |
  
  af'4. g8 g4 f4 |
      f4. f8 g4 g |
      a4. a8 \stemUp bf2 }
}

bass =  \relative c {
  \clef bass
  \time 4/4
  \key ef \major
  \override Staff.TimeSignature #'style = #'()

  \tag #'first { ef4. ef8 ef4 ef |
      ef4. ef8 ef4 ef |
      g4. ef8 af4 af | }
  
  \tag #'fine { bf4 bf, ef2^\fermata | }
      \tag #'toDC { bf'4 bf, ef2 | 
      bf4. bf8 bf4 bf |
  
  bf4. bf8 bf4 bf |
      bf4. bf8 ef4 ef |
      f4. f8 bf,2 }
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upperOne"  \new Voice = "trebleOne" { \trebleOne }
          \new Lyrics \lyricsto "trebleOne" { \lineOne }
	  \new Lyrics \lyricsto "trebleOne" { \lineTwo }
     \new Staff = "upperTwo" \new Voice = "trebleTwo" { \trebleTwo }
     	  \new Lyrics \lyricsto "trebleOne" { \lineFine }
     \new Staff = "bass"  \new Voice = "bass" { \bass }
   >>
      
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	  }

}

%%%Separate score block to unfold the repeats and generate the midi

\score {
<<	
\new Staff = "miditrebleOne"   
    <<
    \new Voice = "midiUpperOne" { \removeWithTag #'toDC \trebleOne  %% first time, through first alternative
	                          \removeWithTag #'fine \trebleOne  %% second time, through 2nd alternative to D.C.
				  \removeWithTag #'toDC \trebleOne  %% D. C. to Fine
                               }	 
    \new Voice = "midiUpperTwo" { \removeWithTag #'toDC \trebleTwo  %% first time, through first alternative
	                          \removeWithTag #'fine \trebleTwo  %% second time, through 2nd alternative to D.C.
				  \removeWithTag #'toDC \trebleTwo  %% D. C. to Fine
                               }
     >>
     \new Staff = "midiBass"
     \new Voice = "midiLower" { \removeWithTag #'toDC \bass  %% first time, through first alternative
	                        \removeWithTag #'fine \bass  %% second time, through 2nd alternative to D.C.
				\removeWithTag #'toDC \bass  %% D. C. to Fine
                               }	 
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) }}   
}
