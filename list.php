<?php
	$symbol= $_GET["symbol"];
	$file=fopen("http://finance.yahoo.com/d/quotes.csv?s=EBAY+STX+DELL+BRCM+NVDA+SNDK+WIN+HPQ+ZNGA+SWKS+EA+CTXS+ORCL+FB+YHOO+MSFT+AAPL+GOOG+AMZN+CSCO+RIMM+QCOM+INTC&f=sj1","r")
	or exit("Unable to open file!");
	while(!feof($file)) {
		$value = fgets($file);
		$va1 = str_replace("\"", "", $value);
		$va2 = str_replace("B", "", $va1);
		$va3 = str_replace(",", "\n", $va2);
		$va4 = str_replace(" ", "", $va3);
		$va5 = str_replace("F\n", "Facebook\n", $va4);
		$va6 = str_replace("EAY", "Ebay", $va5);
		$va7 = str_replace("STX", "Seagate", $va6);
		$va8 = str_replace("DELL", "Dell", $va7);
		$va9 = str_replace("BRCM", "Broadcom", $va8);
		$va10 = str_replace("NVDA", "Nvidia", $va9);
		$va11 = str_replace("SNDK", "Sandisk", $va10);
		$va12 = str_replace("WIN", "Winstream", $va11);
		$va13 = str_replace("HPQ", "HP", $va12);
		$va14 = str_replace("ZNGA", "Zynga", $va13);
		$va15 = str_replace("SWKS", "Skyworks", $va14);
		$va16 = str_replace("EA\n", "EA\n", $va15);
		$va17 = str_replace("CTXS", "Citrix", $va16);
		$va18 = str_replace("ORCL", "Oracle", $va17);
		$va19 = str_replace("YHOO", "Yahoo", $va18);
		$va20 = str_replace("MSFT", "Microsoft", $va19);
		$va21 = str_replace("AAPL", "Apple", $va20);
		$va22 = str_replace("GOOG", "Google", $va21);
		$va23 = str_replace("AMZN", "Amazon", $va22);
		$va24 = str_replace("CSCO", "Cisco", $va23);
		$va25 = str_replace("RIMM", "Blackberry", $va24);
		$va26 = str_replace("QCOM", "Qualcom", $va25);
		$va27 = str_replace("INTC", "Intel", $va26);
		$va28 = str_replace("N/A", "0", $va27);
		echo $va28;
	}
	fclose($file);
?>