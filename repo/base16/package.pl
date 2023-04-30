sub {
    use File::Basename;

    my @template_files = map { +{source => $_, dest => "~/.base-16/templates/@{[basename $_]}"} } glob './templates/*';
    my @scheme_dirs = map { +{source => $_, dest => "~/.base-16/schemes/@{[basename $_]}"} } glob './schemes/*';

    return {
        files => [@template_files, @scheme_dirs]
    };
}
