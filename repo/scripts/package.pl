sub {
    use File::Basename;

    my @bin_files = map { +{source => $_, dest => "~/.bin/@{[basename $_]}"} } glob './files/*';
    my @desktop_files = map { +{source => $_, dest => "~/.local/share/applications/@{[basename $_]}"} } glob './starter/*'; 
            
    return {        
        files => [@bin_files, @desktop_files]
    };
}
