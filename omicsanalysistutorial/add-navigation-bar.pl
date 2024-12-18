## script to automate adding navigation bar to each file in the tutorial
## Note that include or import or javascript methods to do this did not work, hence
## navigation bar is added to each file
## edit the navigation bar and header here only.
## script assumes that all html files in this directory should have this navigation bar added

use IO::File;

my $navigation_bar = <<'END_NAVIGATION';
<!-- BEGIN navigation bar and head. do not edit here, use perl script to add to all html files -->
<head>
<link rel="stylesheet" type="text/css" href="stylesheets/main.css">
</head>

 <nav id="primary_nav_wrap">
    <ul>
    <li class="current-menu-item"><a href="index.html">Start here</a></li>

    <li><a href="#">ReadMes</a>
    <ul>
    <li><a href="ms-data-peak-list-formats.html">MS peak list files</a></li>
    <li><a href="using-search-engines.html">Using MS search engines</a></li>
    <li><a href="quantitation.html">Spectral counts and quantitation</a></li>
    <li><a href="gene-expression-omnibus.html">Gene Expression Omnibus</a></li>
    <li><a href="biological-interpretation.html">Network and functional analyses</a>
    <li><a href="repositories-and-tools.html">Links to online resources and tools</a>
    </ul>



    <li><a href="#">Proteomics case studies</a>
    <ul>
    <li><a href="ms-study-1.html">DNA Methyltransferase I (DNMT1) interactions</a></li>
    <li><a href="ms-study-7.html">DNMT1 mutant vs wild-type comparison</a></li>
    <li><a href="ms-study-5.html">Proteasome and EIF complexes</a></li>
    <li><a href="ms-study-3.html">A DNA-damage protein complex</a></li>
    <li><a href="label-free-studies.html">Label-free quantification</a></li>
    <li><a href="label-free-using-Scaffold.html">Label-free quant using Scaffold 1</a></li>
    <li><a href="label-free-using-Scaffold-2.html">Label-free quant using Scaffold 2</a></li>
    </ul>
    </li>


    <li><a href="#">Transcriptomics case studies</a>
    <ul>
    <li><a href="geo-case-studies.html">Gene Expression Omnibus (GEO) case studies</a></li>
    </ul>
         
       
    </ul>
    </li>



    </ul>

    </nav>
    <br>
    <br>

<!-- navigation bar and head END-->
END_NAVIGATION


    opendir(DIR, ".");
@files = grep /^\w+.+?\.html$/, readdir(DIR);


for my $file(@files){

    undef $/;
    open $out, ">", "temp";
    print $file, "\n";
    open FILE, $file or die "Cannot open file $! \n"; 

    
    my $string = <FILE>;

    
    ## remove the existing head and navigation bar html code
    $string =~ s/\<\!\-\-\s+BEGIN.+?END\-\-\>//s;
    #$string =~ s/\<head.+?nav>//s;



    print $out $navigation_bar, "\n", $string, "\n";
    close $out;
    close FILE;

    $cp = "cp $file old/";
    $mv = "mv temp $file";
    system($cp);
    system($mv);
    
}

#print $navigation_bar, "\n";
