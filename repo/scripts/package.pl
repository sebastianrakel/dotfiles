sub {
    use File::Basename;

    return {
        files => [map { +{source => $_, dest => "~/.bin/@{[basename $_]}"} } glob './files/*']
    };
}
