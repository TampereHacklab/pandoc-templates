#set page(
  paper: "a4",
  margin: 2.5cm,
  header: [
    #grid(
      columns: (1fr, auto, 1fr),
      align(left)[*Tampere Hacklab ry*],
      align(center)[$if(tyyppi)$$tyyppi$$else$Pöytäkirja$endif$ --- $if(nimi)$$nimi$$else$Kokous$endif$],
      align(right)[$päivä$]
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
#set heading(numbering: "1.")

// --- FIRST PAGE HEADER SECTION ---
*Tampere Hacklab ry* \
Ahlmanintie 56, 33800 Tampere \
Y-tunnus: 2419748-5

#v(0.5cm)
#align(center)[#text(size: 17pt)[*$if(nimi)$$nimi$$else$Kokous$endif$*]]
#v(0.5cm)

// --- MEETING DETAILS ---
#grid(
  columns: (3cm, 1fr),
  row-gutter: 0.8em,
  [*Aika:*], [$päivä$ klo $aloitus$],
  [*Paikka:*], [$paikka$],
  [*Läsnä:*], [$for(paikalla)$$paikalla$$sep$, $endfor$],
  $if(poissa)$
  [*Poissa:*], [$for(poissa)$$poissa$$sep$, $endfor$]
  $endif$
)

#v(0.5cm)

$if(asialista)$
*Asialista:*
#set enum(numbering: "1.")
$for(asialista)$
+ $asialista$
$endfor$
#v(0.5cm)
$endif$

#line(length: 100%, stroke: 0.4pt)
#v(0.5cm)

// --- MAIN CONTENT (Markdown text is injected here) ---
$body$

// --- END MATTER ---
$if(lopetus)$
#v(1cm)
#block(breakable: false)[
  *Kokouksen päättäminen:* \
  Kokous päätettiin klo $lopetus$.
]
$endif$

// --- SIGNATURES ---
$if(tarkastajat)$
#v(1cm)
#block(breakable: false)[
  *Pöytäkirjan vakuudeksi:*

  #v(0.5cm)
  #grid(
    columns: 2, // Creates a 2-column grid. Signatures will automatically wrap to the next row if there are more than 2.
    column-gutter: 2cm,
    row-gutter: 2cm,
    $for(tarkastajat)$
    [
      #v(1.5cm)
      #line(length: 100%, stroke: 0.5pt)
      #v(0.2cm)
      $tarkastajat$ \
      Pöytäkirjantarkastaja
    ]$sep$,
    $endfor$
  )
]
$endif$
