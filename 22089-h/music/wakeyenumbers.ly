\version "2.10"
\include "english.ly"

\header {
  title = "WAKE YE NUMBERS!"
  poet = "Words by Lewis."
  composer = "Air, \"Strike the Cymbals.\""
  source = "The Liberty Minstrel."
  tagline = ""
}

leftbrace = \markup {\override #'(font-encoding . fetaBraces) \lookup #"brace140" }

rightbrace = \markup {\rotate #180 \leftbrace }

lineOne = \lyricmode {
  Wake ye num -- bers! \skip 8 from your slum -- bers,
  Hear the song of  free -- dom  pour!
  By its shak -- ing, fierce -- ly  break -- ing,
  Eve -- ry  chain up -- on our shore.
}

lineTwo = \lyricmode {
  Flags are wav -- ing, all ty -- rants brav -- ing, 
  Proud -- ly, free -- ly, o'er our plains;
  Let no min -- ions check our  pin -- ions,
  While a sin -- gle grief re -- \markup{ "mains.  " \raise #3 \rightbrace }
  Proud ob -- lat -- ions, thou Queen of nat -- ions! Have been poured up --
  on thy wa -- ters; Af -- ric's  bleed -- ing sons and daught -- ers,
  Now be -- fore us, loud im -- plore us, Look -- ing to Je --
  ho -- vah's  throne, Chains are wear -- ing, hearts de -- spair -- ing,
  Will ye hear a na -- tion's moan? Soothe their sor -- row,
  ere the mor -- row Change their ach -- ing hearts to stone: Then the
  light of na -- ture's smile Free -- dom's realm shall bless the while; And the
  plea -- sure mer -- cy brings Flow from all her la -- tent springs; De --
  light shall spread, shall spread her shin -- ing wings, Re -- joic --
  ing, Re -- joic -- ing, Re -- joic -- ing.
}

treble =  \relative c' {
  \clef treble
  \time 2/4
  \key c \major
  \autoBeamOff
  
  \repeat volta 2 {
  c'4 b |
      c8 g r g |
      a8.[ c16] b8.[ d16] |
      c8 c r4 |
           
  \break
  d4 d |
      d16[ e d c] \stemUp b[ c b a] | 
      \stemNeutral g4 \grace b8 a4 |
      g r |
      <g c>^\markup { \bold "Chorus." } \stemUp <b d> |
      <c e>8 \stemNeutral <g c> r4 |
            
  \break
  <b d>4 <c e> |
      <d f>8 <b d> r4 |
      <c e> <d f> |
      <e g>4. <d f>8 |
     <c e>4 <b d> |
     << { \voiceOne c b\rest } \new Voice = "alt" { \voiceTwo c s4 } >>  
  }   
   
  \break
  \oneVoice \stemDown c4.^\markup { \bold "Solo 1mo." } b8 |
      \stemNeutral a a r a |
      d4. c8 |
      b b r4 |
      r d8^\markup { \bold "Solo 2d." } d |
      d4. d8 |
      
  \break
  d4. c8 |
      \stemUp b g r4 |
      \stemNeutral r d'8 d |
      d4. d8 |
      d4. c8 |
      \stemUp b g r4 |
      
  \break
  <g c>4^\markup { \bold "Chorus." } <b d> |
      <c e>8 <g c> r4 |
      <b d> <c e> |
      <d f>8 <b d> r4 |
      <c e> <d f> |
      <e g>4. <d f>8 |
      
  \break
  <c e>4 <b d> |
       << { \voiceOne c b\rest } \new Voice = "alt" { \voiceTwo c s4 } >> |
      \oneVoice \stemUp <c e>^\markup { \bold "Trio. Lento." } <c e> |
      <b f'> <c e>8 r |
      <c e>4 <c e> |
      <b f'> <c e>8 r |
      
  \break
  <c e>4 <cs e> |
      <d f> <d fs>16[ <e g> <fs a> <d fs>] |
      <c e>4 <b d> |
      <c e> r |
      <g c>^\markup { \bold "Chorus." } <b d> |
      <c e>8^\markup { \bold "Tempo." } <g c> r4 |
        
  \break    
  <b d>4 <c e>4 |
      <d f>8 <b d>8 r4 |
      <c e>4 <d f>4 |
      <e g>4. <d f>8 |
      <c e>4 <b d>4 |
      << { \voiceOne c4^\fermata  } \new Voice = "alt" { \voiceTwo c4 } >> \oneVoice c8.^\markup { \bold "Solo." } b16 |
      
  \break
  a8. g16 a8. f16 |
      \grace f8 e4 c'8. b16 |
      a8. g16 a8. f16 |
      \grace f8 e4 c'8 c8 |
      
  \break    
  c8 c8 c8 c8 |
      c4 <c e>8 <c e>8 |
      <c e>8 <c e>8 <c e>8 <c e>8 |
      <c e>4 \repeat volta 2 { c16[ b16 c16 d16] |
	      
  \break	      
  e4 << { \voiceOne c4 } \new Voice = "alt" { \voiceTwo c4 } >> |
      \oneVoice \stemDown <e g>4 <c e>4 |
      <d f>8 <d f>8 <b d>8 <b d>8 |
      <c e>4 } r8 <c e>8 |
      <b d g>2 |
      
  \break    
  <c e>4 r8 <c e>8 |
      <b d g>2 |
      <c e>4 r8 <c e>8 |
      <b d g>2 ~ |
      <b d g>2 |
      <c e>4 r4 \bar "|." 
}


bass = \relative c {
  \clef bass
  \time 2/4
  \key c \major
  \autoBeamOff

  \repeat volta 2 {
	  
  c2 | c | c | c |

  \break
  fs2 |
      g2 |
      g4 \stemUp d |
      \stemNeutral g, r |
      e' g |
      c8 c, r4 |

  \break
  g'4 c |
      g8 g r4 |
      c c |
      c4. f,8 |
      g4 g |
      c, r
  }

  \break
  c8[ e g] r |
      d4. r8 |
      fs2 |
      g |
      g4 fs |
      fs2 |
  
  \break
  fs2 | g | g4 fs | fs2 | fs | g4. r8 |

  \break
  e4 g |
      c8 c, r4 |
      g' c |
      g8 g r4 |
      c c |
      c4. f,8 |

  \break
  g4 g, |
      c r |
      c c |
      \stemUp d \stemNeutral c8 r |
      c4 c |
      \stemUp d \stemNeutral c8 r |

  \break
  a'4 g |
      f fs |
      g g, |
      c r |
      e g |
      c8 c,8 r4 |
  
  \break    
  g'4 c4 |
      g8 g8 r4 |
      c4 c4 |
      c4. f,8 |
      g4 g,4 |
      c4^\fermata r4 |

  \break    
  c2 |
      c2 |
      c2 |
      c4 r4 |

  \break    
  c'2 |
      c2 |
      c2 |
      c4 \repeat volta 2 { r4 |

  c2 |
      c4 a4 |
      f8 f8 g8 g8 |
      c,4 } r8 c'8 |
      g2 |
  
  c4 r8 c8 |
      g2 |
      c4 r8 c8 |
      g2 ~ |
      g2 |
      c,4 r4 \bar "|."
}

\score { 
  \new ChoirStaff \with{systemStartDelimiter = #'SystemStartBrace }	
   <<
     \new Staff = "upper"  \new Voice = "treble" { \treble }
     \new Lyrics \lyricsto "treble" { \lineOne }
     \new Lyrics \lyricsto "treble" { \lineTwo }
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
     \new Staff = "upper"  \new Voice = "treble" { \unfoldRepeats \treble }
     \new Staff = "lower"  \new Voice = "bass" {\unfoldRepeats \bass }
   >>
  	  
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 112 4)  }}    

}

%%Transcriber's Note:

%%8th system, treble staff, bar 2, 2d beat: changed Fs to F-sharps to match bass.