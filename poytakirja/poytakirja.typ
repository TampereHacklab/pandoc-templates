#set page(
  paper: "a4",
  margin: 2.5cm,
  header: [
    #grid(
      columns: (1fr, auto, 1fr),
      align(left)[*Tampere Hacklab ry*],
      align(center)[$if(type)$$type$$else$Pöytäkirja$endif$ --- $if(name)$$name$$else$Kokous$endif$],
      align(right)[$date$]
    )
    #v(-0.5em)
    #line(length: 100%, stroke: 0.4pt)
  ],
  footer: context [
    // Uses context to evaluate the total page count dynamically
    #align(center)[Sivu #counter(page).display("1/1", both: true)]
  ]
)

// Set global text properties (Finnish hyphenation, 11pt size)
#set text(lang: "fi", size: 11pt)
#set par(justify: true)

// --- FIRST PAGE HEADER SECTION ---
*Tampere Hacklab ry* \
Ahlmanintie 56, 33800 Tampere \
Y-tunnus: 2419748-5

#v(1cm)
#align(center)[#text(size: 17pt)[*$if(name)$$name$$else$Kokous$endif$*]]
#v(1cm)

// --- MEETING DETAILS ---
#grid(
  columns: (3cm, 1fr),
  row-gutter: 0.8em,
  [*Aika:*], [$date$ klo $start_time$],
  [*Paikka:*], [$place$],
  [*Läsnä:*], [$for(attendees)$$attendees$$sep$, $endfor$],
  $if(absent)$
  [*Poissa:*], [$for(absent)$$absent$$sep$, $endfor$]
  $endif$
)

#v(1cm)

$if(agenda)$
*Asialista:*
#set enum(numbering: "1.")
$for(agenda)$
+ $agenda$
$endfor$
#v(1cm)
$endif$

#line(length: 100%, stroke: 0.4pt)
#v(1cm)

// --- MAIN CONTENT (Markdown text is injected here) ---
$body$

// --- END MATTER ---
$if(end_time)$
#v(1.5cm)
*Kokouksen päättäminen:* \
$if(end_note)$$end_note$$endif$
Kokous päätettiin klo $end_time$.
$endif$

// --- SIGNATURES ---
$if(proofreaders)$
#v(1.5cm)
*Pöytäkirjan vakuudeksi:*

#v(0.5cm)
#grid(
  columns: 2, // Creates a 2-column grid. Signatures will automatically wrap to the next row if there are more than 2.
  column-gutter: 2cm,
  row-gutter: 2cm,
  $for(proofreaders)$
  [
    #v(1.5cm)
    #line(length: 100%, stroke: 0.5pt)
    #v(0.2cm)
    $proofreaders$ \
    Pöytäkirjantarkastaja
  ]$sep$,
  $endfor$
)
$endif$
