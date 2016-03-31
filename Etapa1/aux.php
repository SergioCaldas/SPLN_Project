<?php

function otherSections($a,$jbXML){

	$html = file_get_contents($a);
	$jbBR = new DOMDocument();
	$i=-1;

	libxml_use_internal_errors(TRUE); //disable libxml errors

	if(!empty($html)){
	  $jbBR->loadHTML($html);
	  libxml_clear_errors(); //remove errors from html
	  $jbBR_xpath = new DOMXPath($jbBR);
	  $jbBR_row = $jbBR_xpath->query("//section[@class='listanoticias']//ol//h1//a//@href");
	  $titulos = $jbBR_xpath->query("//section[@class='listanoticias']//ol//h1");

	  if($jbBR_row->length > 0){
	      foreach($jbBR_row as $row){
	          $i++;
	          $new = $row->nodeValue;
	          $htmlNovo = file_get_contents("http://www.jb.com.br".$new);
	          $jbBRNovo = new DOMDocument();

	          if(!empty($htmlNovo)){
	              $jbBRNovo->loadHTML($htmlNovo);
	              libxml_clear_errors();
	              $jbBR_xpathNovo = new DOMXPath($jbBRNovo);
	              $titulosNovo = $jbBR_xpathNovo->query("//div[@id='HOTWordsTxt']//p");

	              if($titulosNovo->length > 0){
	              	echo "titulos -> ".$titulos[$i]->nodeValue."<br/>";
	                $noticia = $jbXML->addChild('n');
	                $noticia->addChild('t', $titulos[$i]->nodeValue);
	                foreach($titulosNovo as $rowNovo){
	                    $noticia->addChild('p', $rowNovo->nodeValue);
	                }
	              } 
	          }
	      }
	  }
	}
}

?>