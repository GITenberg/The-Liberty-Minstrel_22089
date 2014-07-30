\version "2.10"
\include "english.ly"

\header {
  title = "O PITY THE SLAVE MOTHER."
  poet = "Words from the Liberator."
  composer = "Air, Araby's Daughter."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

lineOne = \lyricmode {
  I pi -- ty the slave moth -- er, care -- worn and wear -- y, Who
  sighs as she pres -- ses her babe to her breast;
}

lineTwo = \lyricmode {
  \set ignoreMelismata = ##t I la -- ment her sad fate, all so hope -- less and drear -- y, I la --
  ment for her woes, and her wrongs un -- re -- dressed.
  \once \override LyricText #'self-alignment-X = #0.6 
  \markup{ \raise #3 \rightbrace  "    O"}
  who can im -- a -- gine her heart's deep e -- mo -- tion, As_she
  thinks of her chil -- dren a -- bout to be sold;
}

lineThree = \lyricmode {
  \set ignoreMelismata = ##t You may pic -- ture the bounds of the rock -- gir -- dled o -- cean, But the	
  grief of that moth -- er can nev -- er be known.
}	

treble =  \relative c' {
  \clef treble
  \key bf \major
  \time 6/8
  \autoBeamOff
  \stemUp

  \tag #'main { \repeat volta 2 {  \partial 8 f16[ f] |
      <f d'>8. <ef c'>16 <d bf'>8 <f d'>8. <ef c'>16 <d bf'>8 |
      <ef c'>8. <d bf'>16 <ef c'>8 <f d'> <d bf'> <d bf'>16[ <d bf'>] | 

  \break
  <g bf>8. <f a>16 <ef g>8 <d f> <d bf'> <f d'> |
      <ef c'>8. <d bf'>16 <ef c'>8 <d bf'>4 \mark \markup { \fontsize #-2 \musicglyph #"scripts.ufermata" }} } 
      \tag #'toDC { <d f>8 |

  \break
   <d f>8 <d f> <d f> <ef g> <d f> <d f> |
      <d f> <d f> <d f> <g bf> <d f> <d f> |

  \break   
  <d f> <d f> <d f> <bf' d>8. <a c>16 <g bf>8 |
      <f a>8 <f c'>4 <ef g>4. | <d f>4.^\markup { \bold "D.C." } r4 \bar "|." }
}


bass =  \relative c {
  \clef bass
  \key bf \major
  \time 6/8
  \autoBeamOff

  \tag #'main { \repeat volta 2 { \partial 8 bf16[ bf] |
  bf8. bf16 bf8 bf8. bf16 bf8 |
      f'8. f16 f8 bf,8 bf8 bf16[ bf] |
  
  ef8. ef16 ef8 bf8 bf bf | 
      f'8. f16 f8 bf,4 \mark \markup { \fontsize #-2 \musicglyph #"scripts.ufermata" } } } 
      \tag #'toDC {  r8
  
  R2*3/2 | R2*3/2 |
  
  R2*3/2 | R2*3/2 | r4 r8 r4 \bar "|." }
}


\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \lineOne }
     \new Lyrics \lyricsto "treble" { \lineTwo }
     \new Staff = "lower"  \new Voice = "bass" { \bass }
     \new Lyrics \lyricsto "treble" { \lineThree }
   >>
   
\layout {
	indent=0
	\context { \Staff \override Rest #'style = #'classical }
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Score \remove "Mark_engraver" }
        \context { \Staff \consists "Mark_engraver" }
	  }
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
    \new Staff = "upper"  \new Voice = "treble" { \unfoldRepeats \treble \keepWithTag #'main \treble }
    \new Staff = "lower"  \new Voice = "bass" { \unfoldRepeats \bass  \keepWithTag #'main \bass }
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 4 ) }}    

}


%%Transcriber's Notes:

%% A second score block is provided to unfold the repeat and generate the midi.

%% 2nd system just after repeat sign, lower staff - corrected typo, should be eighth rest. 

