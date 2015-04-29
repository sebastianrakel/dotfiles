$pdflatex = 'lualatex --recorder --shell-escape %O %S';
$pdf_mode = 1;
$out_dir = "out";
$pdf_previewer = "zathura %O %S";
push @generated_exts, qw/thm/;
add_cus_dep( "svg", "pdf", 1, 'svg2pdf');
sub svg2pdf {
	system("inkscape -D -z -f $_[0].svg -A $_[0].pdf");
}
