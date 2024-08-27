#!/bin/sh
pdfseparate ddca_summary.pdf page_%02d.pdf
pdfjam --nup 1x2 --a4paper page_01.pdf page_02.pdf -o combined_01.pdf
pdfjam --nup 1x2 --a4paper page_03.pdf page_04.pdf -o combined_02.pdf
pdfjam --nup 1x2 --a4paper page_05.pdf page_06.pdf -o combined_03.pdf
pdfjam --nup 1x2 --a4paper page_07.pdf page_08.pdf -o combined_04.pdf
pdfjam --nup 1x2 --a4paper page_09.pdf page_10.pdf -o combined_05.pdf
pdfjam --nup 1x2 --a4paper page_11.pdf page_12.pdf -o combined_06.pdf
pdfunite combined_01.pdf combined_02.pdf combined_03.pdf combined_04.pdf combined_05.pdf combined_06.pdf final_output.pdf
